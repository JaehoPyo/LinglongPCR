unit U560;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart ;

type
  TfrmU560 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    PnlIFDate: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    lblCnt: TLabel;
    PnlIFID: TPanel;
    PnlRowHeight: TPanel;
    PnlFontSize: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    lblSearch: TLabel;
    lblIFDate: TLabel;
    lblRowHeight: TLabel;
    lblFontSize: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    dgInfo: TDBGridEh;
    edtIFID: TEdit;
    PnlIFSEQ: TPanel;
    edtIFSEQ: TEdit;
    Pnl_Bottom: TPanel;
    Splitter3: TSplitter;
    Pnl_Bottom_Left: TPanel;
    edtSendXml: TRichEdit;
    Pnl_Bottom_Right: TPanel;
    edtReceiveXml: TRichEdit;
    Panel12: TPanel;
    LblSendXML: TPanel;
    Panel13: TPanel;
    LblRecvXML: TPanel;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure Pnl_MainResize(Sender: TObject);
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
    procedure fnWmMsgRecv(var MSG: TMessage); message WM_USER ;
  end;
  procedure U560Create();

const
  FormNo ='560';
  FIdx   = 5;
  SIdx   = 6;

var
  frmU560: TfrmU560;
  SrtFlag : integer = 0 ;

implementation

uses Main ;

{$R *.dfm}

//==============================================================================
// U560Create
//==============================================================================
procedure U560Create();
begin
  if not Assigned(frmU560) then
  begin
    frmU560 := TfrmU560.Create(Application);
    with frmU560 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU560.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU560.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU560.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU560.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU560.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '560';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU560.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU560, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU560.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU560.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU560), tsDelete);
    frmU560 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU560.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU560.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU560.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU560.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU560.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU560.fnCommandExcel;
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
      TraceLogWrite('[560] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU560.fnCommandPrint;
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
      TraceLogWrite('[560] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU560.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // 인터페이스 ID
  if (Trim(edtIFID.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(IFID) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtIFID.Text)) + '%') ;

  // 인터페이스 SEQ
  if (Trim(edtIFSEQ.Text) <> '') then
    WhereStr := WhereStr + ' AND IFSEQ LIKE ' + QuotedStr('%' + Trim(edtIFSEQ.Text) + '%');

  // 인터페이스 일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  // IFDATE의 TYPE이 DATETIME이 아님. VARCHAR(23)
  WhereStr := WhereStr + ' AND IFDATE BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                        ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT IFID, IFSEQ, IFDATE, ' +
                '        DBMS_LOB.SUBSTR(SENDXML, 4000, 1) as SENDXML, ' +
                '        DBMS_LOB.SUBSTR(RECVXML, 4000, 1) as RECVXML  ' +
                '   FROM IF_XMLDOC  ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  ORDER BY IFDATE, IFID ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[560] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU560.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU560.fnCommandLang;
var
  i : integer;
begin
  try
    frmU560.Caption      := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption    := getLangString(FormNo, 'pSEARCH'    , 'Search'             , MainDm.M_Info.LANG_TYPE, 'N');
    lblIFDATE.Caption    := getLangString(FormNo, 'IFDATE'     , 'Interface Date'     , MainDm.M_Info.LANG_TYPE, 'N');
    PnlIFID.Caption      := getLangString(FormNo, 'IFID'       , 'Interface ID'       , MainDm.M_Info.LANG_TYPE, 'N');
    PnlIFSEQ.Caption     := getLangString(FormNo, 'IFSEQ'      , 'Sequence'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption := getLangString(FormNo, 'pROW_HEIGHT', 'Row Height'         , MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption  := getLangString(FormNo, 'pFONT_SIZE' , 'Font Size'          , MainDm.M_Info.LANG_TYPE, 'N');
    LblSendXML.Caption   := getLangString(FormNo, 'pSENDXML'   , '[ Send XML Script ]', MainDm.M_Info.LANG_TYPE, 'N');
    LblRecvXML.Caption   := getLangString(FormNo, 'pRECVXML'   , '[ Recv XML Script ]', MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[560] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU560.KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU560.DatePickerKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    Case (Sender as TDateTimePicker).Tag of
      0 : (Sender as TDateTimePicker).Date := Now;
      1 : (Sender as TDateTimePicker).Time := StrToTime('00:00:00.000');
      2 : (Sender as TDateTimePicker).Time := StrToTime('23:59:59.999');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU560.sbtClearClick(Sender: TObject);
begin
  edtIFID.Text  := '';
  edtIFSEQ.Text := '';
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU560.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text, 0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU560.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text, 11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU560.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field = nil then Exit;
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount=0 then Exit ;
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

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU560.dgInfoCellClick(Column: TColumnEh);
begin
  if (not qryInfo.Active) or
     (qryInfo.RecordCount = 0) then
  begin
    edtSendXml.Text    := '';
    edtReceiveXml.Text := '';
    Exit;
  end;
  edtSendXml.Text    := dgInfo.Fields[3].AsString;
  edtReceiveXml.Text := dgInfo.Fields[4].AsString;
end;

//==============================================================================
// Pnl_MainResize
//==============================================================================
procedure TfrmU560.Pnl_MainResize(Sender: TObject);
begin
  Pnl_Bottom.Height     := (Pnl_Main.Height div 2) - 50;
  Pnl_Bottom_Left.Width := (Pnl_Main.Width - Splitter1.Width - 2) div 2;
end;

end.

