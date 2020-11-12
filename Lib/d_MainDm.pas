unit d_MainDm;

interface

uses
  Windows, SysUtils, Classes, DB, ADODB, Messages, Dialogs, Inifiles,
  ComObj, StdCtrls, h_MainLib, Variants, DBGrids, Graphics, DBGridEh,
  DBGridEhImpExp, h_ReferLib;

type

  TMainDm = class(TDataModule)
    MainDatabase: TADOConnection;
    qrySearch: TADOQuery;
    saveDlg: TSaveDialog;
    PD_INS_PGM_HIST: TADOStoredProc;
    procedure MainDatabaseAfterDisconnect(Sender: TObject);
    procedure MainDatabaseAfterConnect(Sender: TObject);
  private
    { Private declarations }

  public
    M_Info : Main_Info;
    F_Info : Form_Info;
    pVersion : String;
    MACH_TBM : Array [1.. 50] of Mach_Info;
    MACH_CUR : Array [1..200] of Mach_Info;
    procedure SearchCodeList(var ComboBox: TComboBox; Table, Field: String);
    procedure SearchCodeList2(var ComboBox: TComboBox; Table, Field: String);
    function  fnTableDataGet(frmNo, Table, Field, FieldType, WhereStr: String): String;
    { Public declarations }
  end;
  procedure fnWmMsgSend   ( const WMsg, LMsg : LongWord );
  function  fnFileFilter(var FileName: String; Const FilterName: String) : Boolean ;
  function  IniRead(IniRoot, KeyName, FieldName, ReadStr: String ): String;
  function  IniWrite(IniRoot, KeyName, FieldName, WriteStr: String ): Boolean ;
  function  ADOConnection(MsgUsed:String): Boolean;
  function  hlbEhgridListExcel( RvGrid : TDBGridEh ; FileName : String ; bSel : Boolean = True ): Boolean ;

  function  fnNameGetRecord(WRHS, frmNo: String; Lang_Type: integer): TLANG_INFO ;
  function  fnMenuNameGetRecord(WRHS: String; Lang_Type: integer): TLANG_PGM ;
  function  getLangString(FormID, FieldName, Default : String; LangNo: Integer; AddField: String = ''): String;
  function  getLangMenuString(FormID, Default: String; LangNo: Integer; AddField: String = ''): String;
  function  fnGetFileVersionInfo(FileName: String): String;
  function  fnGetFileAttr(sFile: String; var FName, FSize, FPath, CDate, ADate, UDate:String): Boolean;
  procedure InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);

Const
  INI_PATH: String = 'AWHOUSE.INI';

var
  MainDm: TMainDm;
  m : Main_Info;

implementation

{$R *.dfm}

{ TMainDm }

//==============================================================================
// IniRead -> INI 파일에서 Key Field 의 값을 읽음
//==============================================================================
function IniRead(IniRoot, KeyName, FieldName, ReadStr: String ): String;
var
  Ini_File : TIniFile;
begin
  try
    Ini_File := TIniFile.Create( ExpandFileName ( IniRoot )  );
    try
      Result := PChar ( Ini_File.ReadString ( KeyName ,FieldName , ReadStr ) );
    finally
      Ini_File := nil;
      Ini_File.Free;
    end;
  except
    Result := ReadStr;
  end;
end;

//==============================================================================
// IniWrite -> INI 파일에서 Key Field의 값을 기록
//==============================================================================
function IniWrite(IniRoot, KeyName, FieldName, WriteStr: String ): Boolean ;
var
  Ini_File : TIniFile;
begin
  try
    Ini_File := TIniFile.Create( ExpandFileName ( IniRoot )  );
    try
      Ini_File.WriteString( KeyName, FieldName, WriteStr  );
      Result := True;
    finally
      Ini_File := nil;
      Ini_File.Free;
    end;
  except
    Result := False;
  end;
end;

//==============================================================================
// hlbEhgridListExcel
//==============================================================================
function hlbEhgridListExcel( RvGrid : TDBGridEh ; FileName : String ; bSel : Boolean = True ): Boolean;
var
  Save_Dlg : TSaveDialog;
begin
  Result := False;
  if RvGrid.DataSource.DataSet.Active and not RvGrid.DataSource.DataSet.IsEmpty then
  begin
    Save_Dlg := TSaveDialog.Create(nil);
    try
      Save_Dlg.FileName := ChangeFileExt ( FileName , '.xlsx'  );
      Save_Dlg.Title    := '엑셀로 저장';
      Save_Dlg.Filter   := '엑셀문서[ *.xlsx ]|*.xlsx';
      if Save_Dlg.Execute then
      begin
        ExportDBGridEhToXlsx(RvGrid,Save_Dlg.FileName,[]);
        Result := True;
      end;
    finally
      FreeAndNil( Save_Dlg );
    end;
  end;
end;

//==============================================================================
// ADOConnection -> Database Connect
//==============================================================================
function ADOConnection(MsgUsed:String): Boolean;
begin
  Result := False;

  if UpperCase(MainDm.M_Info.DbType) = 'MSSQL' then
  begin
    try
      With MainDm Do
      begin
        MainDatabase.Close;
        MainDatabase.ConnectionString :='';
        MainDatabase.ConnectionString := 'Provider=' +  MainDm.M_Info.DbOle +
                                         ';Persist Security Info=True;User ID=' +
                                         MainDm.M_Info.DbUser  +
                                         ';Data Source=' + MainDm.M_Info.DbAlais +
                                         ';Password=' + MainDm.M_Info.DbPswd +
                                         ';Initial Catalog=' + MainDm.M_Info.DbFile ;
        MainDatabase.Connected := True;
        Result:= True ;
        m.ConChk := True;
      end;
    except
      on E: Exception do
      begin
        Result := False ;
        m.ConChk := False;
        ShowMessage('커넥션 실패 관리자에게 문의 하시기 바랍니다....?');
      end ;
    end;
  end else
  if UpperCase(MainDm.M_Info.DbType) = 'ORACLE' then
  begin
    try
      With MainDm Do
      begin
        MainDatabase.Close;
        MainDatabase.ConnectionString :='';
        MainDatabase.ConnectionString := 'Provider=' + MainDm.M_Info.DbOle +
                                         ';Data Source=' + MainDm.M_Info.DbAlais+
                                         ';Persist Security Info=True' +
                                         ';Password=' + MainDm.M_Info.DbPswd +
                                         ';User ID =' + MainDm.M_Info.DbUser ;
        MainDatabase.Connected := True;
        Result:= True ;
        m.ConChk := True;
      end;
    except
      on E: Exception do
      begin
        Result := False ;
        m.ConChk := False;
        if MsgUsed = 'Y' then
        begin
          MessageDlg('Database connection failed.' + #13#10 +
                     'Please contact your administrator.', mtWarning, [mbYes], 0);
        end;
      end;
    end;
  end;
end;

//==============================================================================
// fnWmMsgSend
//==============================================================================
procedure fnWmMsgSend(const WMsg, LMsg: LongWord);
begin
  SendMessage(m.MainHd, WM_USER, WMsg, LMsg);
end;

//==============================================================================
// fnFileFilter -> 파일명을 받아 뒤의 확장자를 붙여넣어준다.
//==============================================================================
function fnFileFilter(var FileName: String; Const FilterName: String) : Boolean ;
var
  PosCheck : Integer;
begin
  Result := False;
  if  Trim ( FileName ) = '' then Exit;
  PosCheck := Pos ( '.' , FileName  );
  if  PosCheck = 0 then FileName := FileName + '.' + FilterName
  else FileName := Copy ( FileName, 1 , PosCheck - 1 ) + '.' + FilterName;
  Result := True;
end;

//==============================================================================
// fnNameGetRecord
//==============================================================================
function fnNameGetRecord(WRHS, frmNo: String; Lang_Type: integer): TLANG_INFO ;
var
  i : integer;
  LangStr : TLANG_INFO;
  StrSQL : String ;
  TmpfrmNo : integer;
begin
  try
    i := 0;
    TmpfrmNo := 0;
    with MainDM.qrySearch do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT WRHS, ' +
                '        MENU_ID, ' +
                '        FIELD_NM, ' +       // 영어   -> 일반
                '        FIELD_NM_ENG, ' +   // 영어   -> 일반
                '        FIELD_NM_KOR, ' +   // 한국어 -> Unicode
                '        FIELD_NM_CHI, ' +   // 중국어 -> Unicode
                '        MEMO_1, MEMO_2, MEMO_3, ' +
                '        UP_DATE, CR_DATE ' +
                '   FROM C_LANG_I ' +
                '  WHERE WRHS = ' + QuotedStr(WRHS) +
                '  ORDER BY MENU_ID, FIELD_NM ' ;
      SQL.Text := StrSQL;
      Open;
      First ;
      while not eof do
      begin
        if TmpfrmNo <> StrToIntDef(Copy(FieldByName('MENU_ID').AsString, 1, 2), 0) then i := 0;
        TmpfrmNo := StrToIntDef(Copy(FieldByName('MENU_ID').AsString, 1, 2), 0);
        LangStr.LANG[TmpfrmNo][i].FORMID     := FieldByName('MENU_ID'     ).AsString;
        LangStr.LANG[TmpfrmNo][i].FIELD_NAME := FieldByName('FIELD_NM'    ).AsString;
        LangStr.LANG[TmpfrmNo][i].DESC[1]    := FieldByName('FIELD_NM_KOR').AsString;
        LangStr.LANG[TmpfrmNo][i].DESC[2]    := FieldByName('FIELD_NM_ENG').AsString;
        LangStr.LANG[TmpfrmNo][i].DESC[3]    := FieldByName('FIELD_NM_CHI').AsString;

        // 배열보다 크면 읽기 않는다.
        if High(LangStr.LANG)-2 <= i then Break;
        inc(i);
        Next ;
      end;
      Close ;
    end;
  except
    on E : Exception do
    begin
      MainDM.qrySearch.Close;
      InsertPGMHist('[MainDm]', 'E', 'fnNameGetRecord', 'Language', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[MainDm] function fnNameGetRecord Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
  Result := LangStr;
end;

//==============================================================================
// fnMenuNameGetRecord
//==============================================================================
function fnMenuNameGetRecord(WRHS: String; Lang_Type: integer): TLANG_PGM ;
var
  i : integer;
  LangStr : TLANG_PGM;
  StrSQL : String ;
begin
  try
    i := 0 ;
    with MainDM.qrySearch do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT WRHS, MENU_ID, MENU_LVL, MENU_USED, ' +
                '        MENU_NM_ENG, ' +   // 영어   -> 일반
                '        MENU_NM_KOR, ' +   // 한국어 -> Unicode
                '        MENU_NM_CHI, ' +   // 중국어 -> Unicode
                '        UP_DATE, CR_DATE ' +
                '   FROM C_MENU_I ' +
                '  WHERE WRHS = ' + QuotedStr(WRHS) +
                '  ORDER BY MENU_ID ' ;

      SQL.Text := StrSQL;
      Open;

      First ;
      while not eof do
      begin
        LangStr.LANG[i].FORMID     := FieldByName('MENU_ID'    ).AsString ;
        LangStr.LANG[i].FIELD_TYPE := FieldByName('MENU_LVL'   ).AsString ;
        LangStr.LANG[i].DESC[1]    := FieldByName('MENU_NM_KOR').AsString ;
        LangStr.LANG[i].DESC[2]    := FieldByName('MENU_NM_ENG').AsString ;
        LangStr.LANG[i].DESC[3]    := FieldByName('MENU_NM_CHI').AsString ;
        inc(i);
        Next ;
      end;
      Close ;
    end;
  except
    on E : Exception do
    begin
      MainDM.qrySearch.Close;
      InsertPGMHist('[MainDm]', 'E', 'fnMenuNameGetRecord', 'Language', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[MainDm] function fnMenuNameGetRecord Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
  Result := LangStr;
end;

//==============================================================================
// getLangString
//==============================================================================
function getLangString(FormID, FieldName, Default: String; LangNo: Integer; AddField: String = ''): String;
var
  i, TmpfrmNo : Integer;
begin
  Result := Default;
  try
    TmpfrmNo := StrToIntDef(Copy(FormID, 1, 2), 0);
    for i := Low(MainDM.M_Info.LANG_FORM.LANG[TmpfrmNo]) to High(MainDM.M_Info.LANG_FORM.LANG[TmpfrmNo]) do
    begin
      if Trim(MainDM.M_Info.LANG_FORM.LANG[TmpfrmNo][i].FIELD_NAME) = '' then Break;
      if Trim(MainDM.M_Info.LANG_FORM.LANG[TmpfrmNo][i].FORMID) <> FormID then Continue;

      if UpperCase(FieldName) = UpperCase(MainDM.M_Info.LANG_FORM.LANG[TmpfrmNo][i].FIELD_NAME) then
      begin
        Result := MainDM.M_Info.LANG_FORM.LANG[TmpfrmNo][i].DESC[MainDM.M_Info.LANG_TYPE];
        if AddField = 'Y' then Result := '[ ' + Result + ' ]';
        Break;
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[MainDm]', 'E', 'getLangString', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[MainDm] function getLangString Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// getLangMenuString
//==============================================================================
function getLangMenuString(FormID, Default: String; LangNo: Integer; AddField: String = ''): String;
var
  i : Integer;
begin
  Result := Default;
  try
    for i := Low(MainDm.M_Info.LANG_PGM.LANG) to High(MainDm.M_Info.LANG_PGM.LANG) do
    begin
      if Trim(MainDm.M_Info.LANG_PGM.LANG[i].FORMID) = '' then Break;
      if FormId = MainDm.M_Info.LANG_PGM.LANG[i].FORMID then
      begin
        Result := MainDm.M_Info.LANG_PGM.LANG[i].DESC[LangNo];
        MainDm.M_Info.ActiveFormID   := FormId; //실행시킨 Menu-ID
        MainDm.M_Info.ActiveFormName := FormId + '. ' + MainDm.M_Info.LANG_PGM.LANG[i].DESC[LangNo];
        Break;
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[MainDm]', 'E', 'getLangMenuString', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[MainDm] function getLangMenuString Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnGetFileVersionInfo                                                       //
//==============================================================================
function fnGetFileVersionInfo(FileName: String): String;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Result := '';
  try
    Size := GetFileVersionInfoSize(pChar(FileName), Size2);
    if Size > 0 then
    begin
      GetMem(Pt, Size);
      try
        GetFileVersionInfo(pChar(FileName), 0, Size, Pt);
        VerQueryValue (Pt, '\', Pt2, Size2);
        with TVSFixedFileInfo(Pt2^) do
        begin
{
          Result := Format('%d.%d.%d.%d', [HiWord(dwFileVersionMS),
                                           LoWord(dwFileVersionMS),
                                           HiWord(dwFileVersionLS),
                                           LoWord(dwFileVersionLS)]);
}

          Result := Format('%d.%d', [HiWord(dwFileVersionMS),
                                     LoWord(dwFileVersionLS)]);
        end;
      finally
        FreeMem(Pt);
      end;
    end;
  except
    on E: Exception do
    begin
      InsertPGMHist('[MainDm]', 'E', 'fnGetFileVersionInfo', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[MainDm] function fnGetFileVersionInfo Fail || ERR['+E.Message+'], STR['+FileName+']');
    end;
  end;
end;

//==============================================================================
// fnGetFileAttr                                                       //
//==============================================================================
function fnGetFileAttr(sFile: String; var FName, FSize, FPath, CDate, ADate, UDate:String): Boolean;
var
  i : THandle;
  inf : TWin32FindData;
  SystimeCreate, SysTimeAccess, SystimeReWrite: TSystemTime;
  FileTimeCreate, FileTimeAccess, FileTimeReWrite: TFileTime;
  CreateTime, AccessTime, ReWriteTime: string;
begin
  Result := False;
  try
    i := FindFirstFile(PChar(sFile), inf); // 파일의 정보를 읽는다
    try
      FName := inf.cFileName;                                                                              // File Name
      FSize := FormatFloat('###,###,##0.#',((inf.nFileSizeHigh * MAXDWORD) + inf.nFileSizeLow)/1024/1024); // File Size(MB)
      FPath := ExtractFilePath(sFile);                                                                     // File Path

      FileTimeToLocalFileTime(inf.ftCreationTime, FileTimeCreate);
      FileTimeToSystemTime(FileTimeCreate, SystimeCreate);
      FileTimeToLocalFileTime(inf.ftLastAccessTime, FileTimeAccess);
      FileTimeToSystemTime(FileTimeAccess, SysTimeAccess);
      FileTimeToLocalFileTime(inf.ftLastWriteTime, FileTimeReWrite);
      FileTimeToSystemTime(FileTimeReWrite, SystimeReWrite);

      with SystimeCreate  do CreateTime   := Format('%.4d-%.2d-%.2d %.2d:%.2d:%.2d', [wYear,wMonth,wDay,wHour,wMinute,wSecond]);
      with SysTimeAccess  do AccessTime   := Format('%.4d-%.2d-%.2d', [wYear,wMonth,wDay]);
      with SystimeReWrite do ReWriteTime  := Format('%.4d-%.2d-%.2d %.2d:%.2d:%.2d', [wYear,wMonth,wDay,wHour,wMinute,wSecond]);

      CDate := CreateTime;   // 파일 생성시간
      ADate := AccessTime;   // 파일 접근시간
      UDate := ReWriteTime;  // 파일 변경시간(빌드일자)
      Result := True;
    except
      on E: Exception do
      begin
        InsertPGMHist('[MainDm]', 'E', 'fnGetFileAttr', '', 'Exception Error', 'PGM', '', '', E.Message);
        TraceLogWrite('[MainDm] function fnGetFileAttr Fail || ERR['+E.Message+'], STR['+sFile+']');
      end;
    end;
  finally
    Windows.FindClose(i);
  end;
end;

//==============================================================================
// SearchCodeList
//==============================================================================
procedure TMainDm.SearchCodeList(var ComboBox: TComboBox; Table, Field: String);
begin
  with qrySearch do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT  DISTINCT ' + Field + ' FROM ' + Table + ' ORDER BY ' + Field + ' ';
    Open;
    First;
    ComboBox.Items.Clear;
    ComboBox.Items.Add('전체');

    while Not Eof do
    begin
      if (FieldByName(Field).AsString <> '') then
        ComboBox.Items.Add(fieldByName(Field).AsString);
      Next;
    end;
    Close;
  end;
  ComboBox.ItemIndex := 0;
end;

//==============================================================================
// fnFileFilter -> 파일명을 받아 뒤의 확장자를 붙여넣어준다.
//==============================================================================
procedure TMainDm.SearchCodeList2(var ComboBox: TComboBox; Table, Field: String);
begin
  with qrySearch do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT  DISTINCT ' + Field + ' FROM ' + Table + ' ORDER BY ' + Field + ' ';
    Open;
    First;
    ComboBox.Items.Clear;

    while Not Eof do
    begin
      if (FieldByName(Field).AsString <> '') then
        ComboBox.Items.Add(fieldByName(Field).AsString);
      Next;
    end;
    Close;
  end;
  ComboBox.ItemIndex := -1;
end;

//==============================================================================
// fnTableDataGet
//==============================================================================
function TMainDm.fnTableDataGet(frmNo, Table, Field, FieldType, WhereStr: String): String;
var
  StrSQL : String;
begin
  Result := '';
  try
    with qrySearch do
    begin
      Close;
      SQL.Clear;
      StrSQL := 'SELECT ' + Field + ' as DATA FROM ' + Table +
                ' WHERE ' + WhereStr ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        if FieldType = 'S' then
        begin
          Result := FieldByName('DATA').AsString
        end else
        if FieldType = 'I' then
        begin
          Result := IntToStr(FieldByName('DATA').asInteger);
        end;
      end;
      Close;
    end;
  except
    on E: Exception do
    begin
      TraceLogWrite('[MainDm] function fnTableDataGet Fail || ERR['+E.Message+'], FORM['+frmNo+'] SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// InsertPGMHist ( W_PROGRAM_HIST 테이블에 이력을 넣음)
//==============================================================================
procedure InsertPGMHist(MENU_ID, HIST_TYPE, FUNC_NAME, EVENT_NAME, EVENT_DESC, COMMAND_TYPE, COMMAND_TEXT, PARAM, ERROR_MSG: String);
begin
  try
    with MainDm.PD_INS_PGM_HIST do
    begin
      Close;
      ProcedureName := 'PD_INS_PGM_HIST';
      Parameters.ParamByName('i_MENU_ID'     ).Value := MENU_ID;
      Parameters.ParamByName('i_HIST_TYPE'   ).Value := HIST_TYPE;
      Parameters.ParamByName('i_PGM_FUNCTION').Value := FUNC_NAME;
      Parameters.ParamByName('i_EVENT_NAME'  ).Value := EVENT_NAME;
      Parameters.ParamByName('i_EVENT_DESC'  ).Value := EVENT_DESC;
      Parameters.ParamByName('i_COMMAND_TYPE').Value := COMMAND_TYPE;
      Parameters.ParamByName('i_COMMAND_TEXT').Value := COMMAND_TEXT;
      Parameters.ParamByName('i_PARAM'       ).Value := PARAM;
      Parameters.ParamByName('i_ERROR_MSG'   ).Value := ERROR_MSG;
      Parameters.ParamByName('i_USER_ID'     ).Value := MainDm.M_Info.UserCode + ' ['+MainDm.M_Info.ActivePCAddr+']';
      ExecProc;
      Close;
    end;
  except
    on E : Exception do
    begin
      MainDm.PD_INS_PGM_HIST.Close;
      TraceLogWrite('procedure InsertPGMHist || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// MainDatabaseAfterConnect
//==============================================================================
procedure TMainDm.MainDatabaseAfterConnect(Sender: TObject);
begin
  m.ConChk := True;
end;

//==============================================================================
// MainDatabaseAfterDisconnect
//==============================================================================
procedure TMainDm.MainDatabaseAfterDisconnect(Sender: TObject);
begin
  m.ConChk := False;
end;

end.
