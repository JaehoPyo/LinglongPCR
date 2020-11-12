unit U110;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls ;

type
  TfrmU110 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    pmControl: TPopupMenu;
    mnCodeDel: TMenuItem;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    dgInfo: TDBGridEh;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    PnlCode: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    edtCode: TEdit;
    PnlSpec: TPanel;
    edtName: TEdit;
    mnCodeReg: TMenuItem;
    mnCodeUdt: TMenuItem;
    lblSearch: TLabel;
    lblCnt: TLabel;
    PnlRowHeight: TPanel;
    PnlFontSize: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure mnClick(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fnCommandStart;
    procedure fnCommandOrder ;
    procedure fnCommandAdd  ;
    procedure fnCommandDelete;
    procedure fnCommandUpdate;
    procedure fnCommandExcel;
    procedure fnCommandPrint;
    procedure fnCommandQuery;
    procedure fnCommandLang;
    procedure fnCommandClose;
    procedure fnWmMsgRecv(var MSG: TMessage); message WM_USER;
    procedure ProcDeleteCode(Code: String);
  end;
  procedure U110Create();

Const
  FormNo ='110';
  FIdx   = 1;
  SIdx   = 1;

var
  frmU110: TfrmU110;
  SrtFlag : integer = 0 ;

implementation

uses Main, U110_Pop ;

{$R *.dfm}

//==============================================================================
// U110Create
//==============================================================================
procedure U110Create();
begin
  if not Assigned(frmU110) then
  begin
    frmU110 := TfrmU110.Create(Application);
    with frmU110 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU110.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU110.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ORDER   : begin fnCommandOrder   ; end;           // MSG_MDI_WIN_ORDER   = 11 ; // 지시
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;           // MSG_MDI_WIN_ADD     = 12 ; // 신규
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;           // MSG_MDI_WIN_DELETE  = 13 ; // 삭제
    MSG_MDI_WIN_UPDATE  : begin fnCommandUpdate  ; end;           // MSG_MDI_WIN_UPDATE  = 14 ; // 수정
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;           // MSG_MDI_WIN_EXCEL   = 15 ; // 엑셀
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;           // MSG_MDI_WIN_PRINT   = 16 ; // 인쇄
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;           // MSG_MDI_WIN_QUERY   = 17 ; // 조회
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;    // MSG_MDI_WIN_CLOSE   = 20 ; // 닫기
    MSG_MDI_WIN_LANG    : begin fnCommandLang    ; end;           // MSG_MDI_WIN_LANG    = 21 ; // 언어
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU110.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU110.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU110.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '110';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU110.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU110, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU110.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU110.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;
  qryTemp.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU110), tsDelete);
    frmU110 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU110.fnCommandStart;
begin
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU110.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU110.fnCommandAdd  ;
begin
  try
    frmU110_Pop := TfrmU110_Pop.Create(Application);
    frmU110_Pop.Caption := frmU110.Caption;
    frmU110_Pop.PnlFormName.Caption := 'MAT ' + getLangString(FormNo, 'pCODE_R', 'Code Regist', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.btnSave.Caption  := getLangString(FormNo, 'bREGIST', 'Regist', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.btnClose.Caption := getLangString(FormNo, 'bCLOSE', 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.btnSave.Tag      := 1; // 등록

    // 코드
    frmU110_Pop.PnlCode.Caption := getLangString(FormNo, 'MAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtCode.Text  := '';
    frmU110_Pop.edtCode.Color := clWhite;
    frmU110_Pop.edtCode.ReadOnly := False;

    // 사양
    frmU110_Pop.PnlSpec.Caption := getLangString(FormNo, 'MAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtSpec.Text  := '';
    frmU110_Pop.edtSpec.Color := clWhite;
    frmU110_Pop.edtSpec.ReadOnly := False;

    // 무게
    frmU110_Pop.PnlWeight.Caption := getLangString(FormNo, 'WEIGHT', 'Weight', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtWeight.Text  := '';
    frmU110_Pop.edtWeight.Color := clWhite;
    frmU110_Pop.edtWeight.ReadOnly := False;

    // 높이
    frmU110_Pop.PnlHeight.Caption := getLangString(FormNo, 'HEIGHT', 'Height', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtHeight.Text  := '';
    frmU110_Pop.edtHeight.Color := clWhite;
    frmU110_Pop.edtHeight.ReadOnly := False;

    // 외부직경
    frmU110_Pop.PnlEdiameter.Caption := getLangString(FormNo, 'OT_DIAMETER', 'External Diameter', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtEdiameter.Text  := '';
    frmU110_Pop.edtEdiameter.Color := clWhite;
    frmU110_Pop.edtEdiameter.ReadOnly := False;

    // 내부직경
    frmU110_Pop.PnlIdiameter.Caption := getLangString(FormNo, 'IN_DIAMETER', 'Internal Diameter', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtIdiameter.Text  := '';
    frmU110_Pop.edtIdiameter.Color := clWhite;
    frmU110_Pop.edtIdiameter.ReadOnly := False;

    frmU110_Pop.ShowModal ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandAdd', 'Regist', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure fnCommandAdd Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU110.fnCommandDelete;
var
  i : Integer;
  tmpCode : String;
begin
  try
    if (not qryInfo.Active) or
       (dgInfo.SelectedRows.Count < 1) then
    begin
      MessageDlg('Please select a row. (Delete)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    if dgInfo.SelectedRows.Count = 1 then
    begin
      tmpCode := UpperCase(qryInfo.FieldByName('MAT_CODE').AsString);
      if MessageDlg('Are you want to delete the selected code?' + #13#10 + #13#10 +
                    '['+tmpCode+']', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end else
    begin
      if MessageDlg('Are you want to delete the selected code?' + #13#10 + #13#10 +
                    'Row Count='+IntToStr(dgInfo.SelectedRows.Count), mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end;

    for i := 0 to (dgInfo.SelectedRows.Count-1) do
    begin
      with dgInfo.DataSource.DataSet do
      begin
        GotoBookmark(Pointer(dgInfo.SelectedRows.Items[i]));
        ProcDeleteCode(UpperCase(qryInfo.FieldByName('MAT_CODE').AsString));
      end;
    end;
    fnCommandQuery;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandDelete', 'Delete', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure fnCommandDelete Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU110.fnCommandUpdate;
begin
  try
    if (not qryInfo.Active) or
       (dgInfo.SelectedRows.Count < 1) then
    begin
      MessageDlg('Please select a row. (Update)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    frmU110_Pop := TfrmU110_Pop.Create(Application);
    frmU110_Pop.Caption := frmU110.Caption;
    frmU110_Pop.PnlFormName.Caption := 'MAT ' + getLangString(FormNo, 'pCODE_U', 'Code Update', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.btnSave.Caption  := getLangString(FormNo, 'bUPDATE', 'Update', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.btnClose.Caption := getLangString(FormNo, 'bCLOSE', 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.btnSave.Tag      := 2; // 수정

    // 코드
    frmU110_Pop.PnlCode.Caption := getLangString(FormNo, 'MAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtCode.Text  := qryInfo.FieldByName('MAT_CODE').AsString;
    frmU110_Pop.edtCode.Color := $00DDDDDD;
    frmU110_Pop.edtCode.ReadOnly := True;

    // 사양
    frmU110_Pop.PnlSpec.Caption := getLangString(FormNo, 'MAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtSpec.Text  := qryInfo.FieldByName('MAT_SPEC').AsString;
    frmU110_Pop.edtSpec.Color := clWhite;
    frmU110_Pop.edtSpec.ReadOnly := False;

    // 무게
    frmU110_Pop.PnlWeight.Caption := getLangString(FormNo, 'WEIGHT', 'Weight', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtWeight.Text  := qryInfo.FieldByName('WEIGHT').AsString;
    frmU110_Pop.edtWeight.Color := clWhite;
    frmU110_Pop.edtWeight.ReadOnly := False;

    // 높이
    frmU110_Pop.PnlHeight.Caption := getLangString(FormNo, 'HEIGHT', 'Height', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtHeight.Text  := qryInfo.FieldByName('HEIGHT').AsString;
    frmU110_Pop.edtHeight.Color := clWhite;
    frmU110_Pop.edtHeight.ReadOnly := False;

    // 외부직경
    frmU110_Pop.PnlEdiameter.Caption := getLangString(FormNo, 'OT_DIAMETER', 'External Diameter', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtEdiameter.Text  := qryInfo.FieldByName('OT_DIAMETER').AsString;
    frmU110_Pop.edtEdiameter.Color := clWhite;
    frmU110_Pop.edtEdiameter.ReadOnly := False;

    // 내부직경
    frmU110_Pop.PnlIdiameter.Caption := getLangString(FormNo, 'IN_DIAMETER', 'Internal Diameter', MainDm.M_Info.LANG_TYPE, 'N');
    frmU110_Pop.edtIdiameter.Text  := qryInfo.FieldByName('IN_DIAMETER').AsString;
    frmU110_Pop.edtIdiameter.Color := clWhite;
    frmU110_Pop.edtIdiameter.ReadOnly := False;

    frmU110_Pop.ShowModal ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure fnCommandUpdate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU110.fnCommandExcel;
begin
  try
    if hlbEhgridListExcel(dgInfo, Copy(MainDm.M_Info.ActiveFormName, 6, Length(MainDm.M_Info.ActiveFormName)-5) + '_' + FormatDatetime('YYYYMMDD', Now)) then
    begin
      MessageDlg('Excel save completed.', mtConfirmation, [mbYes], 0);
    end else
    begin
      MessageDlg('Excel save failed.', mtWarning, [mbYes], 0);
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandExcel', 'Excel', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU110.fnCommandPrint;
begin
  try
    if not qryInfo.Active then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) );
    EhPrint.PageHeader.Font.Name := '돋움';
    EhPrint.PageHeader.Font.Size := 10;
    EhPrint.PageFooter.RightText.Clear;
    EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '   ' +
                                     MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
    EhPrint.PageFooter.Font.Name := '돋움';
    EhPrint.PageFooter.Font.Size := 10;
    EhPrint.Preview;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandPrint', 'Print', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU110.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // 코드
    if (Trim(edtCode.Text) <> '') then
      WhereStr := WhereStr + ' AND Upper(MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtCode.Text)+'%') ;
    // 사양
    if (Trim(edtName.Text) <> '') then
      WhereStr := WhereStr + ' AND Upper(MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtName.Text)+'%') ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT MAT_CODE, MAT_SPEC, WEIGHT, HEIGHT, ' +
                '        OT_DIAMETER, IN_DIAMETER, ' +
                '        INS_DT, INS_ID, UPD_DT, UPD_ID ' +
                '   FROM C_ITM_I ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  ORDER BY MAT_CODE ';
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[110] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU110.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU110.fnCommandLang;
var
  i : integer;
begin
  try
    frmU110.Caption      := MainDm.M_Info.ActiveFormName;
    LblSearch.Caption    := getLangString(FormNo, 'pSEARCH'    , 'Search'    , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCode.Caption      := getLangString(FormNo, 'MAT_CODE'   , 'MAT Code'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlSpec.Caption      := getLangString(FormNo, 'MAT_SPEC'   , 'MAT Spec'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlRowHeight.Caption := getLangString(FormNo, 'pROW_HEIGHT', 'Row Height', MainDm.M_Info.LANG_TYPE, 'N');
    PnlFontSize.Caption  := getLangString(FormNo, 'pFONT_SIZE' , 'Font Size' , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// ProcDeleteCode [선택코드삭제]
//==============================================================================
procedure TfrmU110.ProcDeleteCode(CODE: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    StrSQL := ' DELETE FROM C_ITM_I ' +
              '  WHERE MAT_CODE = ' + QuotedStr(CODE) ;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'ProcDeleteCode', 'Delete', 'Item Code['+CODE+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[110] Code Delete || Code['+CODE+'], User['+MainDm.M_Info.UserCode+']');
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'ProcDeleteCode', 'Delete', 'Item Code['+CODE+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[110] Code Delete Fail || Code['+CODE+'], User['+MainDm.M_Info.UserCode+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'ProcDeleteCode', 'Delete', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[110] procedure ProcDeleteCode Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoDblClick
//==============================================================================
procedure TfrmU110.dgInfoDblClick(Sender: TObject);
begin
  if frmMain.cmdUPDATE.Enabled then
  begin
    fnCommandUpdate;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU110.pmControlPopup(Sender: TObject);
begin
  try
    mnCodeReg.Visible := False;
    mnCodeDel.Visible := False;
    mnCodeUdt.Visible := False;

    if (not qryInfo.Active) or
       (dgInfo.SelectedRows.Count < 1) then
    begin
      MessageDlg('Please select a row.', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    if frmMain.cmdREGISTER.Enabled then
    begin // 등록
      mnCodeReg.Caption := getLangString(FormNo, 'pCODE_R', 'Code Regist', MainDm.M_Info.LANG_TYPE, 'N');
      mnCodeReg.Visible := True;
    end else
    begin
      mnCodeReg.Visible := False;
    end;

    if frmMain.cmdDELETE.Enabled then
    begin // 삭제
      mnCodeDel.Caption := getLangString(FormNo, 'pCODE_D', 'Code Delete', MainDm.M_Info.LANG_TYPE, 'N');
      mnCodeDel.Visible := True;
    end else
    begin
      mnCodeDel.Visible := False;
    end;

    if frmMain.cmdUPDATE.Enabled then
    begin // 수정
      mnCodeUdt.Caption := getLangString(FormNo, 'pCODE_U', 'Code Update', MainDm.M_Info.LANG_TYPE, 'N');
      mnCodeUdt.Visible := True;
    end else
    begin
      mnCodeUdt.Visible := False;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'pmControlPopup', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[110] procedure pmControlPopup Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// mnCodeDelClick
//==============================================================================
procedure TfrmU110.mnClick(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    1 : fnCommandAdd;    // 등록
    2 : fnCommandDelete; // 삭제
    3 : fnCommandUpdate; // 수정
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU110.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU110.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  edtName.Text := '';
  edtCode.SetFocus;
  dgInfo.SelectedRows.Clear;
  fnCommandQuery;
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU110.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text, 11);
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU110.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text, 0);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU110.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field = nil then Exit;
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount = 0 then Exit ;
      if SrtFlag = 0 then
      begin
        SrtFlag := 1; Sort := Column.FieldName + ' DESC' ;
      end else
      begin
        SrtFlag := 0; Sort := Column.FieldName + ' ASC' ;
      end;
    end;
  end;
end;

end.




