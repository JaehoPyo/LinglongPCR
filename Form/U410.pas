unit U410;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, Grids, StdCtrls, Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.Win.ADODB, Data.DB, Vcl.ComCtrls,
  Vcl.Menus, Math, StrUtils, DateUtils, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, PrnDbgeh ;

type
  TfrmU410 = class(TForm)
    qryCell: TADOQuery;
    qryInfo: TADOQuery;
    tmrQry: TTimer;
    dsCell: TDataSource;
    shpB: TShape;
    shpR: TShape;
    Pnl_Base: TPanel;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    lblSearch: TLabel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    CellStatus10: TPanel;
    CellStatus1: TPanel;
    CellStatus3: TPanel;
    CellStatus11: TPanel;
    CellStatus5: TPanel;
    CellStatus6: TPanel;
    CellStatus2: TPanel;
    pnlCellStatus10: TPanel;
    pnlCellStatus1: TPanel;
    pnlCellStatus3: TPanel;
    pnlCellStatus11: TPanel;
    pnlCellStatus2: TPanel;
    pnlCellStatus6: TPanel;
    pnlCellStatus5: TPanel;
    CellStatus8: TPanel;
    pnlCellStatus8: TPanel;
    CellStatus12: TPanel;
    pnlCellStatus12: TPanel;
    CellStatus4: TPanel;
    pnlCellStatus4: TPanel;
    Pnl_Main: TPanel;
    PnlRackBase: TPanel;
    Pnl_Bottom: TPanel;
    Splitter1: TSplitter;
    Pnl_Bottom_Right: TPanel;
    Panel2: TPanel;
    LblChart: TPanel;
    Pnl_Bottom_Left: TPanel;
    Panel3: TPanel;
    LblInfo: TPanel;
    PnlRemark: TPanel;
    lblRemark: TLabel;
    Panel4: TPanel;
    Panel9: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel14: TPanel;
    lblHOGI: TLabel;
    Panel15: TPanel;
    lblLocation: TLabel;
    cbHogi: TComboBox;
    Panel16: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel21: TPanel;
    cbCLevel: TComboBox;
    Panel22: TPanel;
    CellStatus99: TPanel;
    pnlCellStatus99: TPanel;
    dgInfo: TDBGridEh;
    qrySummary: TADOQuery;
    DBChart1: TDBChart;
    Series2: TBarSeries;
    EhPrint: TPrintDBGridEh;
    CellStatus98: TPanel;
    pnlCellStatus98: TPanel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrQryTimer(Sender: TObject);
    procedure CellPanelClick(Sender: TObject);
    procedure CellPanelDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbHogiChange(Sender: TObject);
    procedure cbCChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
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
    procedure fnCommandQuerySub;
    procedure fnCommandLang;
    procedure fnCommandClose;
    procedure fnWmMsgRecv(var MSG: TMessage); message WM_USER ;
    function  fnCellCreate : Boolean ;
    procedure SetColorStatus(RACK_NO, RACK_STAT, RACK_USE, ITEM_TYPE, ITEM_CODE, SPRAY: String);
  end;
  procedure U410Create();

const
  FormNo = '410' ;
  FIdx   = 4;
  SIdx   = 1;

var
  frmU410: TfrmU410;
  SrtFlag : integer = 0 ;
  BankPanel  : Array [1..CELL_MAX_BANK] of TPanel;
  CellPanel  : Array [1..CELL_MAX_BANK, 0..CELL_MAX_BAY, 0..CELL_MAX_LEVEL] of TPanel;
  CellLabel  : Array [1..CELL_MAX_BANK, 0..CELL_MAX_BAY, 0..CELL_MAX_LEVEL] of TLabel;
  SelectHogi : integer;
  SelectCell, SelectBank, SelectBay, SelectLevel : String;
  GridClick : Boolean;
implementation

uses Main, U410_Pop ;

{$R *.dfm}

//==============================================================================
// U410Create
//==============================================================================
procedure U410Create();
begin
  if not Assigned(frmU410) then
  begin
    frmU410 := TfrmU410.Create(Application);
    with frmU410 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU410.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU410.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU410.FormCreate(Sender: TObject);
begin
  cbHogi.ItemIndex := 0;
  SelectHogi  := 1;
  SelectCell  := '';
  SelectBank  := '';
  SelectBay   := '';
  SelectLevel := '';
  GridClick   := False;
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU410.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU410.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '410';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU410.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU410, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);

  fnCommandQuery;
  fnCommandQuerySub;
  if not tmrQry.Enabled then tmrQry.Enabled := True;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU410.FormDeactivate(Sender: TObject);
begin
  tmrQry.Enabled := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU410.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrQry.Enabled    := False;
  qryInfo.Active    := False;
  qryCell.Active    := False;
  qrySummary.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU410), tsDelete);
    frmU410 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU410.fnCommandStart;
begin
  fnCellCreate;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU410.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU410.fnCommandAdd  ;
begin
  try
    if Boolean(qryCell.FieldByName('STOCK_EXIST').AsInteger) then
    begin // Stock 데이터 있으면 수정으로 이동
      if frmMain.cmdUPDATE.Enabled then fnCommandUpdate;
      GridClick := False;
      Exit;
    end;

    // Register Enabled Check
    if not frmMain.cmdREGISTER.Enabled then
    begin
      GridClick := False;
      Exit;
    end;

    // No Rack
    if (qryCell.FieldByName('STATUS').AsString = '99') or
       (qryCell.FieldByName('STATUS').AsString = ''  ) then
    begin
      GridClick := False;
      Exit;
    end;

    // Grid Double Click
    if (GridClick) and
       ((not qryCell.Active) or
        (dgInfo.SelectedRows.Count <> 1)) then
    begin
      MessageDlg('Select only one rack. (Regist)', mtConfirmation, [mbYes], 0);
      GridClick := False;
      Exit ;
    end;

    // Cell Panel Double Click
    if (not GridClick) and
       ((not qryCell.Active) or
        (qryCell.RecordCount > 1)) then
    begin
      MessageDlg('Select only one rack. (Regist)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    GridClick := False;

    frmU410_Pop := TfrmU410_Pop.Create(Application);
    frmU410_Pop.Caption := frmU410.Caption;
    frmU410_Pop.PnlFormName.Caption := getLangString(FormNo, 'pRACK_R', 'Rack Data Regist', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.btnSave.Caption     := getLangString(FormNo, 'bREGIST', 'Regist', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.btnClose.Caption    := getLangString(FormNo, 'bCLOSE' , 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.btnSave.Tag         := 1; // 등록

    // 랙 위치
    frmU410_Pop.PnlLoc.Caption  := getLangString(FormNo, 'LOCATION', 'Location', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtLoc.Text     := qryCell.FieldByName('LOCATION').AsString;
    frmU410_Pop.edtLoc.Hint     := qryCell.FieldByName('RACK_NO').AsString ;
    // 랙 상태
    frmU410_Pop.PnlStatus.Caption  := getLangString(FormNo, 'pSTATUS', 'State', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbStatus.ItemIndex := fnGetStatusIdx(qryCell.FieldByName('LUGG').AsString, qryCell.FieldByName('STATUS').AsString);
    // MAT 코드
    frmU410_Pop.PnlCode.Caption         := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    // MAT 사양
    frmU410_Pop.PnlSpec.Caption         := getLangString(FormNo, 'GT_MAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    // 무게
    frmU410_Pop.PnlWeight.Caption       := getLangString(FormNo, 'WEIGHT', 'Weight', MainDm.M_Info.LANG_TYPE, 'N');
    // Ver No
    frmU410_Pop.PnlVerNo.Caption        := getLangString(FormNo, 'VER_NO', 'Version No', MainDm.M_Info.LANG_TYPE, 'N');
    // 바코드
    frmU410_Pop.PnlBarcode.Caption      := getLangString(FormNo, 'BCR_NO', 'Barcode', MainDm.M_Info.LANG_TYPE, 'N');
    // Weight Judge
    frmU410_Pop.PnlWeightJudge.Caption  := getLangString(FormNo, 'WGT_JUDGE', 'Weight Judge', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbWeightJudge.ItemIndex := 0;
    // Show Judge
    frmU410_Pop.PnlShowJudge.Caption    := getLangString(FormNo, 'SHOW_JUDGE', 'Show Judge', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbShowJudge.ItemIndex   := 0;
    // Spray
    frmU410_Pop.PnlSpray.Caption        := getLangString(FormNo, 'SPRAY', 'Spray', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbSpray.ItemIndex       := 0;

    frmU410_Pop.ShowModal ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandAdd', 'Regist', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[410] procedure fnCommandAdd Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU410.fnCommandDelete;
begin
  try
    // No Rack
    if (qryCell.FieldByName('STATUS').AsString = '99') or
       (qryCell.FieldByName('STATUS').AsString = ''  ) then Exit;

    if Boolean(qryCell.FieldByName('STOCK_EXIST').AsInteger) then
    begin // Stock 데이터 있으면 수정으로 이동
      frmU410_Pop := TfrmU410_Pop.Create(Application);
      frmU410_Pop.Caption := frmU410.Caption;
      frmU410_Pop.PnlFormName.Caption := getLangString(FormNo, 'pRACK_D', 'Rack Data Delete', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.btnSave.Caption     := getLangString(FormNo, 'bDELETE', 'Delete', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.btnClose.Caption    := getLangString(FormNo, 'bCLOSE' , 'Close', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.btnSave.Tag         := 3; // 삭제
      // 랙 위치
      frmU410_Pop.PnlLoc.Caption  := getLangString(FormNo, 'LOCATION', 'Location', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.edtLoc.Text     := qryCell.FieldByName('LOCATION').AsString;
      frmU410_Pop.edtLoc.Hint     := qryCell.FieldByName('RACK_NO').AsString ;
      frmU410_Pop.edtLoc.ReadOnly := True;
      // 랙 상태
      frmU410_Pop.PnlStatus.Caption  := getLangString(FormNo, 'STATUS_DESC', 'State', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.cbStatus.Hint      := frmU410_Pop.cbStatus.Items[(fnGetStatusIdx(qryCell.FieldByName('LUGG').AsString, qryCell.FieldByName('STATUS').AsString))];
      frmU410_Pop.cbStatus.ItemIndex := 0;
      frmU410_Pop.cbStatus.Enabled   := False;
      // MAT 코드
      frmU410_Pop.PnlCode.Caption  := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.edtCode.Text     := qryCell.FieldByName('GT_MAT_CODE').AsString;
      frmU410_Pop.edtCode.ReadOnly := True;
      frmU410_Pop.edtCode.Color    := $00DDDDDD;
      // MAT 사양
      frmU410_Pop.PnlSpec.Caption   := getLangString(FormNo, 'GT_MAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.edtSpec.Text      := qryCell.FieldByName('GT_MAT_SPEC').AsString;
      frmU410_Pop.edtSpec.ReadOnly  := True;
      frmU410_Pop.edtSpec.Color     := $00DDDDDD;
      // 무게
      frmU410_Pop.PnlWeight.Caption  := getLangString(FormNo, 'WEIGHT', 'Weight', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.edtWeight.Text     := qryCell.FieldByName('WEIGHT').AsString;
      frmU410_Pop.edtWeight.ReadOnly := True;
      frmU410_Pop.edtWeight.Color    := $00DDDDDD;
      // Ver No
      frmU410_Pop.PnlVerNo.Caption  := getLangString(FormNo, 'VER_NO', 'Version No', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.edtVerNo.Text     := qryCell.FieldByName('VER_NO').AsString;
      frmU410_Pop.edtVerNo.ReadOnly := True;
      frmU410_Pop.edtVerNo.Color    := $00DDDDDD;
      // 바코드
      frmU410_Pop.PnlBarcode.Caption  := getLangString(FormNo, 'BCR_NO', 'Barcode', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.edtBarcode.Text     := qryCell.FieldByName('BCR_NO').AsString;
      frmU410_Pop.edtBarcode.ReadOnly := True;
      frmU410_Pop.edtBarcode.Color    := $00DDDDDD;
      // Weight Judge
      frmU410_Pop.PnlWeightJudge.Caption  := getLangString(FormNo, 'WGT_JUDGE', 'Weight Judge', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.cbWeightJudge.ItemIndex := StrToIntDef(qryCell.FieldByName('WGT_JUDGE').AsString, 0);
      frmU410_Pop.cbWeightJudge.Enabled   := False;
      // Show Judge
      frmU410_Pop.PnlShowJudge.Caption  := getLangString(FormNo, 'SHOW_JUDGE', 'Show Judge', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.cbShowJudge.ItemIndex := StrToIntDef(qryCell.FieldByName('SHOW_JUDGE').AsString, 0);
      frmU410_Pop.cbShowJudge.Enabled   := False;
      // Spray
      frmU410_Pop.PnlSpray.Caption  := getLangString(FormNo, 'SPRAY', 'Spray', MainDm.M_Info.LANG_TYPE, 'N');
      frmU410_Pop.cbSpray.ItemIndex := StrToIntDef(qryCell.FieldByName('SPRAY').AsString, 0);
      frmU410_Pop.cbSpray.Enabled   := False;

      // 품목찾기
      frmU410_Pop.PnlSearchCode.Visible := False;

      frmU410_Pop.ShowModal ;
    end else
    begin
      MessageDlg('There is no data in that location. (Delete)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandDelete', 'Delete', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[410] procedure fnCommandDelete Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU410.fnCommandUpdate;
begin
  try
    if not Boolean(qryCell.FieldByName('STOCK_EXIST').AsInteger) then
    begin // Stock 데이터 없으면 등록으로 이동
      if frmMain.cmdREGISTER.Enabled then fnCommandAdd;
      GridClick := False;
      Exit;
    end;

    // Update Enabled Check
    if not frmMain.cmdUPDATE.Enabled then
    begin
      GridClick := False;
      Exit;
    end;

    // No Rack
    if (qryCell.FieldByName('STATUS').AsString = '99') or
       (qryCell.FieldByName('STATUS').AsString = ''  ) then
    begin
      GridClick := False;
      Exit;
    end;
    // Grid Double Click
    if (GridClick) and
       ((not qryCell.Active) or
        (dgInfo.SelectedRows.Count <> 1)) then
    begin
      MessageDlg('Select only one rack. (Update)', mtConfirmation, [mbYes], 0);
      GridClick := False;
      Exit ;
    end;

    // Cell Panel Double Click
    if (not GridClick) and
       ((not qryCell.Active) or
        (qryCell.RecordCount > 1)) then
    begin
      MessageDlg('Select only one rack. (Update)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    GridClick := False;

    frmU410_Pop := TfrmU410_Pop.Create(Application);
    frmU410_Pop.Caption := frmU410.Caption;
    frmU410_Pop.PnlFormName.Caption := getLangString(FormNo, 'pRACK_U', 'Rack Data Update', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.btnSave.Caption     := getLangString(FormNo, 'bUPDATE', 'Update', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.btnClose.Caption    := getLangString(FormNo, 'bCLOSE' , 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.btnSave.Tag         := 2; // 수정
    // 랙 위치
    frmU410_Pop.PnlLoc.Caption  := getLangString(FormNo, 'LOCATION', 'Location', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtLoc.Text     := qryCell.FieldByName('LOCATION').AsString;
    frmU410_Pop.edtLoc.Hint     := qryCell.FieldByName('RACK_NO').AsString ;
    // 랙 상태
    frmU410_Pop.PnlStatus.Caption  := getLangString(FormNo, 'STATUS_DESC', 'State', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbStatus.ItemIndex := fnGetStatusIdx(qryCell.FieldByName('LUGG').AsString, qryCell.FieldByName('STATUS').AsString);
    // MAT 코드
    frmU410_Pop.PnlCode.Caption  := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtCode.Text     := qryCell.FieldByName('GT_MAT_CODE').AsString;
    // MAT 사양
    frmU410_Pop.PnlSpec.Caption   := getLangString(FormNo, 'GT_MAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtSpec.Text      := qryCell.FieldByName('GT_MAT_SPEC').AsString;
    // 무게
    frmU410_Pop.PnlWeight.Caption := getLangString(FormNo, 'WEIGHT', 'Weight', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtWeight.Text    := qryCell.FieldByName('WEIGHT').AsString;
    // Ver No
    frmU410_Pop.PnlVerNo.Caption  := getLangString(FormNo, 'VER_NO', 'Version No', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtVerNo.Text     := qryCell.FieldByName('VER_NO').AsString;
    // 바코드
    frmU410_Pop.PnlBarcode.Caption  := getLangString(FormNo, 'BCR_NO', 'Barcode', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.edtBarcode.Text     := qryCell.FieldByName('BCR_NO').AsString;
    // Weight Judge
    frmU410_Pop.PnlWeightJudge.Caption  := getLangString(FormNo, 'WGT_JUDGE', 'Weight Judge', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbWeightJudge.ItemIndex := StrToIntDef(qryCell.FieldByName('WGT_JUDGE').AsString, 0);
    // Show Judge
    frmU410_Pop.PnlShowJudge.Caption    := getLangString(FormNo, 'SHOW_JUDGE', 'Show Judge', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbShowJudge.ItemIndex   := StrToIntDef(qryCell.FieldByName('SHOW_JUDGE').AsString, 0);
    // Spray
    frmU410_Pop.PnlSpray.Caption    := getLangString(FormNo, 'SPRAY', 'Spray', MainDm.M_Info.LANG_TYPE, 'N');
    frmU410_Pop.cbSpray.ItemIndex   := StrToIntDef(qryCell.FieldByName('SPRAY').AsString, 0);

    frmU410_Pop.ShowModal ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[410] procedure fnCommandUpdate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU410.fnCommandExcel;
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
      TraceLogWrite('[410] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU410.fnCommandPrint;
begin
  try
    if not qryCell.Active then Exit;

    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5));
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
      TraceLogWrite('[410] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU410.fnCommandQuery;
var
  StrSQL : String;
begin
  //============================
  // 랙 상태 표시 쿼리
  //============================
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.RACK_NO, R.LUGG, R.STATUS, R.RACK_USE, ' +
                '        FN_GETRACK_STR(R.LUGG, R.STATUS) AS STATUS_DESC, ' +
                '        S.GT_MAT_CODE, S.SPRAY ' +
                '   FROM C_RACK_I R, W_STOCK_I S ' +
                '  WHERE R.RACK_NO = S.RACK_NO(+) ' +
                '    AND R.S = ' + IntToStr(SelectHogi) +
                '  ORDER BY R.Z, R.X, R.Y ';
      SQL.Text := StrSQL ;
      Open;
      First;

      while not(Eof) do
      begin
        SetColorStatus (FieldByName('RACK_NO'    ).AsString,   // 랙 위치
                        FieldByName('STATUS'     ).AsString,   // 랙 상태
                        FieldByName('RACK_USE'   ).AsString,   // 랙 사용유무
                        FieldByName('LUGG'       ).AsString,   // 제품구분(제품,파레트)
                        FieldByName('GT_MAT_CODE').AsString,   // 제품코드
                        FieldByName('SPRAY'      ).AsString);  // 스프레이 여부
        Next ;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[1]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[410] procedure fnCommandQuery[1] Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;

  //============================
  // 랙 사용현황 표시(차트)
  //============================
  try
    with qrySummary do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT STATUS, COUNT(STATUS) AS STATUS_SUM, ' +
                '        FN_GETRACK_STR(LUGG, STATUS) AS STATUS_DESC ' +
                '   FROM C_RACK_I ' +
                '  WHERE S = ' + IntToStr(SelectHogi) +
                '  GROUP BY LUGG, STATUS ' +
                '  ORDER BY STATUS_SUM ' ;
      SQL.Text := StrSQL ;
      Open;
    end;
  except
    on E : Exception do
    begin
      qrySummary.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[2]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[410] procedure fnCommandQuery[2] Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU410.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU410.fnCommandLang;
var
  i : integer;
  cbIndex : Array [0..5] of Integer;
begin
  try
    frmU410.Caption     := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption   := getLangString(FormNo, 'pSEARCH'    , 'Search'               , MainDm.M_Info.LANG_TYPE, 'N');
    lblHOGI.Caption     := getLangString(FormNo, 'pHOGI'      , 'SC'                   , MainDm.M_Info.LANG_TYPE, 'N');
    lblLocation.Caption := getLangString(FormNo, 'pLocation'  , 'Location'             , MainDm.M_Info.LANG_TYPE, 'N');
    lblRemark.Caption   := getLangString(FormNo, 'pREMARK'    , 'Remark'               , MainDm.M_Info.LANG_TYPE, 'N');
    lblInfo.Caption     := getLangString(FormNo, 'pRACK_INFO' , '[ Rack Infomation ]'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblChart.Caption    := getLangString(FormNo, 'pRACK_CHART', '[ Rack Usage Status ]', MainDm.M_Info.LANG_TYPE, 'N');

    pnlCellStatus10.Caption := getLangString(FormNo, 'pSTATUS10' , 'Empty Rack' , MainDm.M_Info.LANG_TYPE, 'N');  // 빈셀
    pnlCellStatus11.Caption := getLangString(FormNo, 'pSTATUS11' , 'Goods'      , MainDm.M_Info.LANG_TYPE, 'N');  // 제품
    pnlCellStatus12.Caption := getLangString(FormNo, 'pSTATUS12' , 'Pallet'     , MainDm.M_Info.LANG_TYPE, 'N');  // 파레트
    pnlCellStatus1.Caption  := getLangString(FormNo, 'pSTATUS1' , 'Input'       , MainDm.M_Info.LANG_TYPE, 'N');  // 입고중
    pnlCellStatus2.Caption  := getLangString(FormNo, 'pSTATUS2' , 'Output'      , MainDm.M_Info.LANG_TYPE, 'N');  // 출고중
    pnlCellStatus3.Caption  := getLangString(FormNo, 'pSTATUS3' , 'Reserved'    , MainDm.M_Info.LANG_TYPE, 'N');  // 예약
    pnlCellStatus4.Caption  := getLangString(FormNo, 'pSTATUS4' , 'Picking'     , MainDm.M_Info.LANG_TYPE, 'N');  // 피킹
    pnlCellStatus5.Caption  := getLangString(FormNo, 'pSTATUS5' , 'Double Error', MainDm.M_Info.LANG_TYPE, 'N');  // 이중입고
    pnlCellStatus6.Caption  := getLangString(FormNo, 'pSTATUS6' , 'Empty Error' , MainDm.M_Info.LANG_TYPE, 'N');  // 공출고
    pnlCellStatus8.Caption  := getLangString(FormNo, 'pSTATUS8' , 'Blocking'    , MainDm.M_Info.LANG_TYPE, 'N');  // 금지
    pnlCellStatus99.Caption := getLangString(FormNo, 'pSTATUS99', 'No Rack'     , MainDm.M_Info.LANG_TYPE, 'N');  // 셀없음
    pnlCellStatus98.Caption := getLangString(FormNo, 'pSTATUS98', 'Spray'       , MainDm.M_Info.LANG_TYPE, 'N');  // 스프레이 여부

    // 현재 선택된 아이템 저장
    cbIndex[0] := cbHOGI.ItemIndex;
    cbIndex[1] := cbCBank.ItemIndex;
    cbIndex[2] := cbCBay.ItemIndex;
    cbIndex[3] := cbCLevel.ItemIndex;

    // 콤보박스 아이템 언어 변경
    ChangeComboLang;

    // 언어 변경 후 복원
    cbHogi.ItemIndex      := cbIndex[0];
    cbCBank.ItemIndex     := cbIndex[1];
    cbCBay.ItemIndex      := cbIndex[2];
    cbCLevel.ItemIndex    := cbIndex[3];

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[410] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCellCreate
//==============================================================================
function TfrmU410.fnCellCreate: Boolean ;
  function fnCreateBank(Bank: integer): Boolean;
    function fnCreateCell(Bank: integer): Boolean;
    var
      i, j, k : integer ;
      aBank, bBank, TmpWidth : Integer;
    begin
      try
        for i := 0 to CELL_MAX_BAY do
        begin
          for j := 0 to CELL_MAX_LEVEL do
          begin
            CellPanel[Bank][i][j] := TPanel.Create(Self);
            with CellPanel[Bank][i][j] do
            begin
              Parent      := TPanel(Self.FindComponent('BankPnl'+IntToStr(Bank))) ;
              Align       := alNone ;
              AutoSize    := False ;
              BevelInner  := bvRaised;
              BevelOuter  := bvLowered;

              ShowHint := True ;
              ParentBackground := False;
              ParentColor      := False;
              ParentFont       := False;
              ParentShowHint   := False;
              ParentCustomHint := False;

              Name    := 'Cell'+FormatFloat('0', Bank)+FormatFloat('000',i)+FormatFloat('00',j);
              Caption := '';
              Hint    := 'Cell'+FormatFloat('0', Bank)+FormatFloat('000',i)+FormatFloat('00',j);

              Width := (BankPanel[1].Width Div (CELL_MAX_BAY+1)) - 1;
              if i = 0 then
              begin
                Left := 8;
              end else
              begin
                Left := CellPanel[Bank][i-1][j].Left + CellPanel[Bank][i-1][j].Width + 1 ;
              end;

              Height := (BankPanel[1].Height - 6) Div (CELL_MAX_LEVEL+1);
              Top := ((BankPanel[1].Height) - ((BankPanel[1].Height - 6) Div (CELL_MAX_LEVEL+1)) * (j+1)) - ((BankPanel[1].Height - (Height * (CELL_MAX_LEVEL+1))) Div 2);

              Font.Charset := DEFAULT_CHARSET ;
              Font.Name    := '돋움';
              Font.Size    := 10 ;
              Font.Color   := $004D4D4D ;
              Font.Style   := [];

              if (i=0) or (j=0) then
              begin
                Color := $00CECECE ;
                if i=0 then Caption := FormatFloat('00', j);
                if j=0 then Caption := FormatFloat('00', i);
                if (i=0) and (j=0) then Caption := IntToStr(Bank)+'B'
              end else
              begin
                Color := $00E8E8E8 ;
                OnClick    := CellPanelClick;
                OnDblClick := CellPanelDblClick;

                CellLabel[Bank][i][j] := TLabel.Create(Self);
                with CellLabel[Bank][i][j] do
                begin
                  Parent      := CellPanel[Bank][i][j] ;
                  Name        := 'CellLabel'+FormatFloat('0',Bank)+FormatFloat('000',i)+FormatFloat('00',j);
                  Hint        := 'Spray Processing Status';
                  Align       := alNone;
                  AutoSize    := True;
                  WordWrap    := True;
                  Caption     := '';
                  Alignment   := taCenter;
                  LayOut      := tlCenter;
                  Transparent := True;
                  Top         := 2;
                  Left        := CellPanel[Bank][i][j].Width - 11;
                  Font.Size   := 7;
                  Font.Name   := 'Verdana';
                  Font.Color  := clWhite;
                  Font.Style  := [fsBold];
                  Visible     := False;
                  BringToFront;
                end;
              end;
            end;
          end;
        end;
      except
        on E : Exception do
        begin
          InsertPGMHist('['+FormNo+']', 'E', 'fnCreateCell', '', 'Exception Error', 'PGM', '', '', E.Message);
          TraceLogWrite('[410] procedure fnCreateCell || ERR['+E.Message+']');
        end;
      end;
    end;
  var
    i : integer ;
  begin
    try
      BankPanel[Bank] := TPanel.Create(Self);
      with BankPanel[Bank] do
      begin
        Parent           := PnlRackBase;
        ParentBackground := False;
        ParentColor      := False;
        ParentFont       := False;
        ParentShowHint   := False;
        ParentCustomHint := False;

        Name := 'BankPnl'+IntToStr(Bank) ;

        if Bank = 1 then
        begin
          Height := (PnlRackBase.Height div 2);
          Align  := alTop;
        end else
        begin
          Height := BankPanel[1].Height ;
          Align  := alBottom;
        end;

        Color      := $00E1E1E1;
        Caption    := '';
        AutoSize   := False ;
        BevelInner := bvNone;
        BevelOuter := bvRaised;

        Visible := False ; Application.ProcessMessages;
        fnCreateCell(Bank) ;
        Visible := True  ; Application.ProcessMessages;
        if Bank = 2 then
        begin
          Pnl_Bottom.Height := Pnl_Bottom.Height + Pnl_Main.Height - (BankPanel[1].Height * 2);
          cbHogi.Enabled   := True;
          cbCBank.Enabled  := True;
          cbCBay.Enabled   := True;
          cbCLevel.Enabled := True;
        end;
      end;
    except
      on E : Exception do
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'fnCreateBank', '', 'Exception Error', 'PGM', '', '', E.Message);
        TraceLogWrite('[410] procedure fnCreateBank || ERR['+E.Message+']');
      end;
    end;
  end;
var
  i : integer ;
begin
  try
    for i := 1 to CELL_MAX_BANK do
    begin
      fnCreateBank(i) ;
      Application.ProcessMessages;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCellCreate', '', 'Exception Error', 'PGM', '', IntToStr(i), E.Message);
      TraceLogWrite('[410] procedure fnCellCreate || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuerySub [하위조회]
//==============================================================================
procedure TfrmU410.fnCommandQuerySub;
var
  StrSQL, WhereStr : String;
begin
  //============================
  // 랙 정보 표시(그리드)
  //============================
  try
    WhereStr := '';

    // 적치호기
    case cbHogi.ItemIndex of
      0..4 : WhereStr := WhereStr + ' AND R.S = ' + QuotedStr(IntToStr(cbHogi.ItemIndex+1));
      5..10: WhereStr := WhereStr + ' AND R.S = ' + QuotedStr(IntToStr(cbHogi.ItemIndex+2));
    end;

    // 적치열
    if (cbCBank.ItemIndex > 0)  then
      WhereStr := WhereStr + ' AND R.Z = ' + QuotedStr(IntToStr(cbCBank.ItemIndex));

    // 적치연
    if (cbCBay.ItemIndex > 0)  then
      WhereStr := WhereStr + ' AND R.X = ' + QuotedStr(IntToStr(cbCBay.ItemIndex));

    // 적치단
    if (cbCLevel.ItemIndex > 0)  then
      WhereStr := WhereStr + ' AND R.Y = ' + QuotedStr(IntToStr(cbCLevel.ItemIndex));

    with qryCell do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.*, DECODE(S.RACK_NO,NUll, 0, 1) as STOCK_EXIST, S.* ' +
                '      , FN_GETLOC_STR(R.S, R.Z, R.X, R.Y, 1) AS LOCATION ' +
                '      , FN_GETRACK_STR(R.LUGG, R.STATUS) AS STATUS_DESC ' +
                '      , TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) AS EXPIRY ' +
                '      , FN_GETENTERTYPE(S.ENTER_TYPE) AS ENTER_TYPE_DESC ' +
                '   FROM W_STOCK_I S, C_RACK_I R ' +
                '  WHERE R.RACK_NO = S.RACK_NO(+) ' + WhereStr +
//                '    AND R.STATUS <> ''99'' ' +
                '  ORDER BY R.RACK_NO ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryCell.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuerySub', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[410] procedure fnCommandQuerySub Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// tmrQryTimer
//==============================================================================
procedure TfrmU410.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    if m.ConChk then fnCommandQuery ;
  finally
    tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// SetColorStatus
//==============================================================================
procedure TfrmU410.SetColorStatus(RACK_NO, RACK_STAT, RACK_USE, ITEM_TYPE, ITEM_CODE, SPRAY: String);
var
  IdBnk, IdBay, IdLvl : Integer;
  TmpCell : TPanel;
  TmpLbl  : TLabel;
begin
  try
    IdBnk := StrToInt(Copy(RACK_NO, 3, 1)) ;
    IdBay := StrToInt(Copy(RACK_NO, 4, 3)) ;
    IdLvl := StrToInt(Copy(RACK_NO, 7, 2)) ;

    TmpCell := TPanel(Self.FindComponent('Cell'+FormatFloat('0',IdBnk)+FormatFloat('000',IdBay)+FormatFloat('00',IdLvl))) ;
    TmpLbl  := TLabel(Self.FindComponent('CellLabel'+FormatFloat('0',IdBnk)+FormatFloat('000',IdBay)+FormatFloat('00',IdLvl))) ;

    if ( TmpCell <> nil ) then
    begin
      if (RACK_STAT = '99') then TmpCell.Caption := 'X' else TmpCell.Caption := '';

      if      (RACK_USE  =  '1') then TmpCell.Color := CellStatus8.Color                           // 금지
      else if (RACK_STAT =  '0') and (ITEM_TYPE = '0') then TmpCell.Color := CellStatus10.Color    // 빈셀
      else if (RACK_STAT =  '0') and (ITEM_TYPE = '1') then TmpCell.Color := CellStatus11.Color    // 제품
      else if (RACK_STAT =  '0') and (ITEM_TYPE = '2') then TmpCell.Color := CellStatus12.Color    // 파레트
      else if (RACK_STAT =  '1') then TmpCell.Color := CellStatus1.Color                           // 입고중
      else if (RACK_STAT =  '2') then TmpCell.Color := CellStatus2.Color                           // 출고중
      else if (RACK_STAT =  '3') then TmpCell.Color := CellStatus3.Color                           // 예약
      else if (RACK_STAT =  '5') then TmpCell.Color := CellStatus5.Color                           // 이중입고
      else if (RACK_STAT =  '6') then TmpCell.Color := CellStatus6.Color                           // 공출고
      else if (RACK_STAT =  '8') then TmpCell.Color := CellStatus8.Color                           // 금지
      else if (RACK_STAT = '99') then TmpCell.Color := CellStatus99.Color;                         // 셀없음

      // 스프레이 퍼리 여부
      if (SPRAY = '1') then
      begin
        TmpLbl.Caption := 'S';
        TmpLbl.Visible := True;
      end else
      begin
        TmpLbl.Caption := '';
        TmpLbl.Visible := False;
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'SetColorStatus', '', 'Exception Error', 'PGM', '', RACK_NO, E.Message);
      TraceLogWrite('[410] procedure SetColorStatus || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// CellPanelClick
//==============================================================================
procedure TfrmU410.CellPanelClick(Sender: TObject);
var
  ID_CODE, ID_BANK, ID_BAY, ID_LEVEL, StrSQL : String ;
begin
  try
    ID_CODE := Copy((Sender as TPanel).Name, 5, 6);
    ID_BANK  := Copy(ID_CODE, 1, 1) ;
    ID_BAY   := Copy(ID_CODE, 2, 3) ;
    ID_LEVEL := Copy(ID_CODE, 5, 2) ;

    if (ID_BANK = '0') or (ID_BAY = '000') or (ID_LEVEL = '00') then Exit;

    if SelectCell <> ID_CODE then
    begin
      cbCBank.ItemIndex  := StrToIntDef(ID_BANK,  0);
      cbCBay.ItemIndex   := StrToIntDef(ID_BAY,   0);
      cbCLevel.ItemIndex := StrToIntDef(ID_LEVEL, 0);
      SelectBank         := cbCBank.Text;
      SelectBay          := cbCBay.Text;
      SelectLevel        := cbCLevel.Text;
      SelectCell         := ID_CODE;
    end;
    fnCommandQuerySub;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'CellPanelClick', '', 'Exception Error', 'PGM', '', ID_CODE, E.Message);
      TraceLogWrite('[410] procedure CellPanelClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// CellPanelDblClick
//==============================================================================
procedure TfrmU410.CellPanelDblClick(Sender: TObject);
var
  ID_CODE, ID_BANK, ID_BAY, ID_LEVEL, StrSQL : String ;
begin
  try
    ID_CODE := Copy((Sender as TPanel).Name, 5, 6);
    ID_BANK  := Copy(ID_CODE, 1, 1) ;
    ID_BAY   := Copy(ID_CODE, 2, 3) ;
    ID_LEVEL := Copy(ID_CODE, 5, 2) ;

    if (ID_BANK = '0') or (ID_BAY = '000') or (ID_LEVEL = '00') then Exit;

    GridClick := False;
    fnCommandUpdate;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'CellPanelDblClick', '', 'Exception Error', 'PGM', '', ID_CODE, E.Message);
      TraceLogWrite('[410] procedure CellPanelDblClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoDblClick
//==============================================================================
procedure TfrmU410.dgInfoDblClick(Sender: TObject);
begin
  GridClick := True;
  fnCommandUpdate;
end;

//==============================================================================
// cbHogiChange
//==============================================================================
procedure TfrmU410.cbHogiChange(Sender: TObject);
begin

  case cbHogi.ItemIndex of
    0.. 4 : SelectHogi := cbHogi.ItemIndex + 1;
    5..10 : SelectHogi := cbHogi.ItemIndex + 2;
  end;
  cbCBank.ItemIndex  := 0;
  cbCBay.ItemIndex   := 0;
  cbCLevel.ItemIndex := 0;

  SelectCell  := '';
  SelectBank  := '';
  SelectBay   := '';
  SelectLevel := '';

  fnCommandQuery;
  fnCommandQuerySub;
end;

//==============================================================================
// cbCChange
//==============================================================================
procedure TfrmU410.cbCChange(Sender: TObject);
begin
  if (Sender as TComboBox).ItemIndex <> 0 then
  begin
    if      (Sender as TComboBox).Tag = 1 then SelectBank  := (Sender as TComboBox).Text
    else if (Sender as TComboBox).Tag = 2 then SelectBay   := (Sender as TComboBox).Text
    else if (Sender as TComboBox).Tag = 3 then SelectLevel := (Sender as TComboBox).Text;

    if (cbCBank.ItemIndex  <> 0) and
       (cbCBay.ItemIndex   <> 0) and
       (cbCLevel.ItemIndex <> 0) then
    begin
      SelectCell := SelectBank + SelectBay + SelectLevel ;
    end;
  end else
  begin
    if      (Sender as TComboBox).Tag = 1 then SelectBank  := ''
    else if (Sender as TComboBox).Tag = 2 then SelectBay   := ''
    else if (Sender as TComboBox).Tag = 3 then SelectLevel := '';
    SelectCell := '';
  end;
  fnCommandQuerySub;
end;

//==============================================================================
// ChangeComboLang ( 언어에 따라 콤보 박스 안의 내용을 바꿈)
//==============================================================================
procedure TfrmU410.ChangeComboLang;
var
  i : Integer;
  tStr : String;
begin
  try
    tStr := getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N');

    // 적치호기
    cbHOGI.Items.Clear();
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_1', 'Stacker Crane 1', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_2', 'Stacker Crane 2', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_3', 'Stacker Crane 3', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_4', 'Stacker Crane 4', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_5', 'Stacker Crane 5', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_7', 'Stacker Crane 7', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_8', 'Stacker Crane 8', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_9', 'Stacker Crane 9', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_10', 'Stacker Crane 10', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_11', 'Stacker Crane 11', MainDm.M_Info.LANG_TYPE, 'N'));

    cbHOGI.ItemIndex := 0;

    // 열, 연, 단
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
      TraceLogWrite('[410] procedure ChangeComboLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU410.sbtClearClick(Sender: TObject);
begin
  SelectHogi := 1;
  cbHogi.ItemIndex   := 0;
  cbCBank.ItemIndex  := 0;
  cbCBay.ItemIndex   := 0;
  cbCLevel.ItemIndex := 0;
  SelectBank         := '';
  SelectBay          := '';
  SelectLevel        := '';
  SelectCell         := '';
  fnCommandQuery;
  fnCommandQuerySub;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU410.dgInfoTitleClick(Column: TColumnEh);
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

end.

