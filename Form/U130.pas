unit U130;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib,frxClass, frxDBSet, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls ;

type
  TfrmU130 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
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
    edtMATCode: TEdit;
    Panel1: TPanel;
    lblLine: TLabel;
    cbLine: TComboBox;
    PnlRowHeight: TPanel;
    PnlFontSize: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    lblSearch: TLabel;
    lblCnt: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure cbChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
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
  end;
  procedure U130Create();

Const
  FormNo ='130';
  FIdx   = 1;
  SIdx   = 3;

var
  frmU130: TfrmU130;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U130Create
//==============================================================================
procedure U130Create();
begin
  if not Assigned(frmU130) then
  begin
    frmU130 := TfrmU130.Create(Application);
    with frmU130 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU130.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU130.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ORDER   : begin fnCommandOrder   ; end;           // MSG_MDI_WIN_ORDER   = 11 ; // Áö½Ã
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;           // MSG_MDI_WIN_ADD     = 12 ; // ½Å±Ô
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;           // MSG_MDI_WIN_DELETE  = 13 ; // »èÁ¦
    MSG_MDI_WIN_UPDATE  : begin fnCommandUpdate  ; end;           // MSG_MDI_WIN_UPDATE  = 14 ; // ¼öÁ¤
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;           // MSG_MDI_WIN_EXCEL   = 15 ; // ¿¢¼¿
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;           // MSG_MDI_WIN_PRINT   = 16 ; // ÀÎ¼â
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;           // MSG_MDI_WIN_QUERY   = 17 ; // Á¶È¸
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;    // MSG_MDI_WIN_CLOSE   = 20 ; // ´Ý±â
    MSG_MDI_WIN_LANG    : begin fnCommandLang    ; end;           // MSG_MDI_WIN_LANG    = 21 ; // ¾ð¾î
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU130.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU130.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU130.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '130';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU130.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU130, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU130.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU130.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU130), tsDelete);
    frmU130 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [½ÃÀÛ]
//==============================================================================
procedure TfrmU130.fnCommandStart;
begin
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [Áö½Ã]
//==============================================================================
procedure TfrmU130.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [½Å±Ô]
//==============================================================================
procedure TfrmU130.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [»èÁ¦]
//==============================================================================
procedure TfrmU130.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [¼öÁ¤]
//==============================================================================
procedure TfrmU130.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [¿¢¼¿]
//==============================================================================
procedure TfrmU130.fnCommandExcel;
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
      TraceLogWrite('[130] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [ÀÎ¼â]
//==============================================================================
procedure TfrmU130.fnCommandPrint;
begin
  try
    if not qryInfo.Active then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) );
    EhPrint.PageHeader.Font.Name := 'µ¸¿ò';
    EhPrint.PageHeader.Font.Size := 10;
    EhPrint.PageFooter.RightText.Clear;
    EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '   ' +
                                     MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
    EhPrint.PageFooter.Font.Name := 'µ¸¿ò';
    EhPrint.PageFooter.Font.Size := 10;
    EhPrint.Preview;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandPrint', 'Print', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[130] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [Á¶È¸]
//==============================================================================
procedure TfrmU130.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  WhereStr := '' ;
  // CUR No
  if (cbLine.ItemIndex > 0) then
    WhereStr := WhereStr + ' AND LINE_NO = ' + QuotedStr(IntToStr(cbLine.ItemIndex)) ;
  // MAT ÄÚµå
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT CURE_NO, TONG_POS, PLAN_NO, PLAN_QTY, COMP_QTY, ' +
                '        GR_MAT_CODE, GT_MAT_CODE, VER_NO, OUT_BCR, ' +
                '        CURE_STS, OUT_REQ, ANGLE_REQ, SPRAY_REQ, ' +
                '        DECODE(MCH_CARGO, ''1'', ''O'', ''X'') as MCH_CARGO ' +
                '   FROM C_CURE_S ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  ORDER BY CURE_NO, TONG_POS ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[130] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [´Ý±â]
//==============================================================================
procedure TfrmU130.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [¾ð¾î]
//==============================================================================
procedure TfrmU130.fnCommandLang;
var
  i : integer;
  cbIndex : Integer;
begin
  try
    frmU130.Caption      := MainDm.M_Info.ActiveFormName;
    LblSearch.Caption    := getLangString(FormNo, 'pSEARCH'     , 'Search'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblLine.Caption      := getLangString(FormNo, 'pCURING_LINE', 'Curing Line', MainDm.M_Info.LANG_TYPE, 'N');
    PnlCode.Caption      := getLangString(FormNo, 'GT_MAT_CODE' , 'MAT Code'   , MainDm.M_Info.LANG_TYPE, 'N');
    PnlRowHeight.Caption := getLangString(FormNo, 'pROW_HEIGHT' , 'Row Height', MainDm.M_Info.LANG_TYPE, 'N');
    PnlFontSize.Caption  := getLangString(FormNo, 'pFONT_SIZE'  , 'Font Size' , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;

    cbIndex := cbLine.ItemIndex;
    cbLine.Items.Clear();
    cbLine.Items.Add(getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N'));
    cbLine.Items.Add('CURE 01-17');
    cbLine.Items.Add('CURE 18-34');
    cbLine.Items.Add('CURE 35-51');
    cbLine.Items.Add('CURE 52-68');
    cbLine.ItemIndex := cbIndex;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[130] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU130.KeyPress(Sender: TObject; var Key: Char);
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
// cbKeyPress
//==============================================================================
procedure TfrmU130.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TComboBox).ItemIndex := 0;
    fnCommandQuery;
  end;
end;

//==============================================================================
// cbChange
//==============================================================================
procedure TfrmU130.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU130.sbtClearClick(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  cbLine.ItemIndex := 0;
  edtMATCode.Text := '';
  cbLine.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [Ç°¸ñÃ£±â]
//==============================================================================
procedure TfrmU130.sbt_ITEMClick(Sender: TObject);
begin
  try
    frmItemSearch := TfrmItemSearch.Create(Application);
    frmItemSearch.edtCode.Text := edtMATCode.Text;
    frmItemSearch.ShowModal ;

    if m.Popup_ItemInfo.ResultCd = 'OK' then
    begin
      edtMATCode.Text := m.Popup_ItemInfo.DATA01;
      edtMATCode.SetFocus;
      fnCommandQuery;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'sbt_ITEMClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[130] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU130.dgInfoTitleClick(Column: TColumnEh);
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

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU130.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text, 0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU130.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text, 11);
end;

end.




