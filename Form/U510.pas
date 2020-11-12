unit U510;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU510 = class(TForm)
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
    Panel26: TPanel;
    Panel27: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    PnlCompleteDate: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    lblCnt: TLabel;
    dgInfo: TDBGridEh;
    edtMATSpec: TEdit;
    PnlMATCode: TPanel;
    edtMATCode: TEdit;
    PnlMATSpec: TPanel;
    PnlOrderKind: TPanel;
    PnlBarcode: TPanel;
    cbKIND_DESC: TComboBox;
    PnlRowHeight: TPanel;
    PnlFontSize: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel4: TPanel;
    Panel7: TPanel;
    cbHogi: TComboBox;
    Panel20: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel21: TPanel;
    cbCLevel: TComboBox;
    Panel22: TPanel;
    Panel5: TPanel;
    Panel16: TPanel;
    edtTBM_NO: TEdit;
    edtVER_NO: TEdit;
    edtBCR_NO: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    lblSearch: TLabel;
    lblCompleteDate: TLabel;
    lblMATCode: TLabel;
    lblMATSpec: TLabel;
    lblOrderKind: TLabel;
    lblBarcode: TLabel;
    lblRowHeight: TLabel;
    lblFontSize: TLabel;
    lblVersion: TLabel;
    lblTBMNo: TLabel;
    lblHOGI: TLabel;
    lblLocation: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ChangeComboLang;
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
  procedure U510Create();

const
  FormNo ='510';
  FIdx   = 5;
  SIdx   = 1;

var
  frmU510: TfrmU510;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U510Create
//==============================================================================
procedure U510Create();
begin
  if not Assigned(frmU510) then
  begin
    frmU510 := TfrmU510.Create(Application);
    with frmU510 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU510.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU510.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ORDER   : begin fnCommandOrder   ; end;           // MSG_MDI_WIN_ORDER   = 11 ; // ����
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;           // MSG_MDI_WIN_ADD     = 12 ; // �ű�
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;           // MSG_MDI_WIN_DELETE  = 13 ; // ����
    MSG_MDI_WIN_UPDATE  : begin fnCommandUpdate  ; end;           // MSG_MDI_WIN_UPDATE  = 14 ; // ����
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;           // MSG_MDI_WIN_EXCEL   = 15 ; // ����
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;           // MSG_MDI_WIN_PRINT   = 16 ; // �μ�
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;           // MSG_MDI_WIN_QUERY   = 17 ; // ��ȸ
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;    // MSG_MDI_WIN_CLOSE   = 20 ; // �ݱ�
    MSG_MDI_WIN_LANG    : begin fnCommandLang    ; end;           // MSG_MDI_WIN_LANG    = 21 ; // ���
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU510.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU510.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU510.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '510';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU510.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU510, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU510.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU510.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU510), tsDelete);
    frmU510 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [����]
//==============================================================================
procedure TfrmU510.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [����]
//==============================================================================
procedure TfrmU510.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [�ű�]
//==============================================================================
procedure TfrmU510.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [����]
//==============================================================================
procedure TfrmU510.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [����]
//==============================================================================
procedure TfrmU510.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [����]
//==============================================================================
procedure TfrmU510.fnCommandExcel;
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
      TraceLogWrite('[510] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [�μ�]
//==============================================================================
procedure TfrmU510.fnCommandPrint;
begin
  try
    if not qryInfo.Active then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) );
    EhPrint.PageHeader.Font.Name := '����';
    EhPrint.PageHeader.Font.Size := 10;
    EhPrint.PageFooter.RightText.Clear;
    EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '   ' +
                                     MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
    EhPrint.PageFooter.Font.Name := '����';
    EhPrint.PageFooter.Font.Size := 10;
    EhPrint.Preview;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandPrint', 'Print', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[510] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [��ȸ]
//==============================================================================
procedure TfrmU510.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // MAT�ڵ�
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  // MAT���
  if (Trim(edtMATSpec.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtMATSpec.Text)+'%');

  //  ���ñ���
  if (cbKIND_DESC.ItemIndex > 0 ) then
    WhereStr := WhereStr + ' AND KIND_DESC LIKE ' + QuotedStr('%'+cbKIND_DESC.Text+'%');

  // ���ڵ�
  if (Trim(edtBCR_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(BCR_NO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%');

  // VER No
  if (Trim(edtVER_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(VER_NO) LIKE ' + QuotedStr('%'+UpperCase(edtVER_NO.Text)+'%');

  // TBM No
  if (Trim(edtTBM_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(TBM_NO) LIKE ' + QuotedStr('%'+UpperCase(edtTBM_NO.Text)+'%');

  // ��ġȣ��
  if (cbHogi.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND ES = ' + QuotedStr(IntToStr(cbHogi.ItemIndex));

  // ��ġ��
  if (cbCBank.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND EZ = ' + QuotedStr(IntToStr(cbCBank.ItemIndex));

  // ��ġ��
  if (cbCBay.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND EX = ' + QuotedStr(IntToStr(cbCBay.ItemIndex));

  // ��ġ��
  if (cbCLevel.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND EY = ' + QuotedStr(IntToStr(cbCLevel.ItemIndex));

  // �Ϸ��Ͻ�
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND TO_CHAR(COMPLETE_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                       ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * ' + #13#10 +
                '   FROM VW_JOBORDER_H ' + #13#10 +
                '  WHERE SUBSTR(ORDER_TYPE, 1, 1) In ( 1, 6 ) ' + #13#10 + WhereStr + #13#10 +
                '  ORDER BY COMPLETE_DATETIME, ORDER_ID, JOB_NO ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[510] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [�ݱ�]
//==============================================================================
procedure TfrmU510.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [���]
//==============================================================================
procedure TfrmU510.fnCommandLang;
var
  i : integer;
  cbIndex : Array [0..5] of Integer;
begin
  try
    frmU510.Caption         := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption       := getLangString(FormNo, 'pSEARCH'          , 'Search'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblCompleteDate.Caption := getLangString(FormNo, 'COMPLETE_DATETIME', 'Complete Date', MainDm.M_Info.LANG_TYPE, 'N');
    lblMATCode.Caption      := getLangString(FormNo, 'GT_MAT_CODE'      , 'MAT Code'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblMATSpec.Caption      := getLangString(FormNo, 'GT_MAT_SPEC'      , 'MAT Spec'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblOrderKind.Caption    := getLangString(FormNo, 'pORDER_KIND'      , 'Order Kind'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblBarcode.Caption      := getLangString(FormNo, 'BCR_NO'           , 'Barcode'      , MainDm.M_Info.LANG_TYPE, 'N');
    lblVersion.Caption      := getLangString(FormNo, 'pVER_NO'          , 'Ver No'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblTBMNo.Caption        := getLangString(FormNo, 'TBM_NO'           , 'TBM No'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblHOGI.Caption         := getLangString(FormNo, 'pHOGI'            , 'SC'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblLocation.Caption     := getLangString(FormNo, 'pLocation'        , 'Location'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption    := getLangString(FormNo, 'pROW_HEIGHT'      , 'Row Height'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption     := getLangString(FormNo, 'pFONT_SIZE'       , 'Font Size'    , MainDm.M_Info.LANG_TYPE, 'N');

    // �޺��ڽ� ������ ����
    // ���� ���õ� ������ ����
    cbIndex[0] := cbKIND_DESC.ItemIndex;
    cbIndex[1] := cbHOGI.ItemIndex;
    cbIndex[2] := cbCBank.ItemIndex;
    cbIndex[3] := cbCBay.ItemIndex;
    cbIndex[4] := cbCLevel.ItemIndex;

    // �޺��ڽ� ������ ��� ����
    ChangeComboLang;

    // ��� ���� �� ����
    cbKIND_DESC.ItemIndex := cbIndex[0];
    cbHogi.ItemIndex      := cbIndex[1];
    cbCBank.ItemIndex     := cbIndex[2];
    cbCBay.ItemIndex      := cbIndex[3];
    cbCLevel.ItemIndex    := cbIndex[4];

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[510] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU510.KeyPress(Sender: TObject; var Key: Char);
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
// cbKeyPress
//==============================================================================
procedure TfrmU510.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
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
procedure TfrmU510.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU510.DatePickerKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU510.sbtClearClick(Sender: TObject);
begin
  edtMATCode.Text       := ''; // MAT�ڵ�
  edtMATSpec.Text       := ''; // MAT���
  cbKIND_DESC.ItemIndex := 0;  // ���ñ���
  edtBCR_NO.Text        := ''; // ���ڵ�
  edtVER_NO.Text        := ''; // ���� No.
  edtTBM_NO.Text        := ''; // TBM No.
  cbHogi.ItemIndex      := 0;  // ��ġȣ��
  cbCBank.ItemIndex     := 0;  // ��ġ ��
  cbCBay.ItemIndex      := 0;  // ��ġ ��
  cbCLEvel.ItemIndex    := 0;  // ��ġ ��
  DatePicker1.Date      := Now;
  TimePicker1.Time      := StrToTime('00:00:00');
  DatePicker2.Date      := Now;
  TimePicker2.Time      := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [ǰ��ã��]
//==============================================================================
procedure TfrmU510.sbt_ITEMClick(Sender: TObject);
begin
  try
    frmItemSearch := TfrmItemSearch.Create(Application);
    frmItemSearch.edtCode.Text := edtMATCode.Text;
    frmItemSearch.ShowModal ;

    if m.Popup_ItemInfo.ResultCd = 'OK' then
    begin
      edtMATCode.Text := m.Popup_ItemInfo.DATA01;
      edtMATSpec.Text := m.Popup_ItemInfo.DATA02;
      edtMATCode.SetFocus;
      fnCommandQuery;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'sbt_ITEMClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[510] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU510.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU510.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU510.dgInfoTitleClick(Column: TColumnEh);
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
// ChangeComboLang ( �� ���� �޺� �ڽ� ���� ������ �ٲ�)
//==============================================================================
procedure TfrmU510.ChangeComboLang;
var
  i : Integer;
  tStr : String;
begin
  try
    tStr := getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N');
    // ���ñ���
    cbKIND_DESC.Items.Clear();
    cbKIND_DESC.Items.Add(tStr);
    cbKIND_DESC.Items.Add('INPUT');
    cbKIND_DESC.Items.Add('MOVE');
    cbKIND_DESC.ItemIndex := 0;

    // ��ġȣ��
    cbHOGI.Items.Clear();
    cbHOGI.Items.Add(tStr);
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_1', 'Stacker Crane 1', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_2', 'Stacker Crane 2', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_3', 'Stacker Crane 3', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_4', 'Stacker Crane 4', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.ItemIndex := 0;

    // ��, ��, ��
    cbCBank.Items.Clear();
    cbCBank.Items.Add(tStr);
    cbCBay.Items.Clear();
    cbCBay.Items.Add(tStr);   
    cbCLevel.Items.Clear();
    cbCLevel.Items.Add(tStr);     
    for i := 1 to CELL_MAX_BAY do
    begin
     if i <= CELL_MAX_BANK  then cbCBank.Items.Add(FormatFloat('0', i));
     if i <= CELL_MAX_BAY   then cbCBay.Items.Add(FormatFloat('000', i));
     if i <= CELL_MAX_LEVEL then cbCLevel.Items.Add(FormatFloat('00', i));
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'ChangeComboLang', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[510] procedure ChangeComboLang || ERR['+E.Message+']');
    end;
  end;
end;

end.

