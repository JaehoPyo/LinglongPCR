unit U210;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU210 = class(TForm)
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    qryInfo: TADOQuery;
    dsInfo: TDataSource;
    EhPrint: TPrintDBGridEh;
    qryTemp: TADOQuery;
    Pnl_Top2: TPanel;
    Pnl_Top1: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    lblENTER_TYPE: TLabel;
    Panel12: TPanel;
    sbtClear3: TSpeedButton;
    Panel23: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Pnl_Top2_R: TPanel;
    Panel11: TPanel;
    PnlInfo: TPanel;
    lblRCargoInfo: TLabel;
    lblRSite1: TLabel;
    Panel8: TPanel;
    sbtClear2: TSpeedButton;
    Panel13: TPanel;
    lblMAT_CODE2: TLabel;
    Panel15: TPanel;
    lblMAT_SPEC2: TLabel;
    edtMAT_SPEC2: TEdit;
    edtMAT_CODE2: TEdit;
    Panel16: TPanel;
    sbt_ITEM2: TSpeedButton;
    edtBCR_NO2: TEdit;
    Panel19: TPanel;
    lblVER_NO2: TLabel;
    edtVER_NO2: TEdit;
    Panel20: TPanel;
    lblBCR_NO2: TLabel;
    Panel22: TPanel;
    edtRCargo: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    lblFCargoInfo: TLabel;
    lblFSite1: TLabel;
    Panel14: TPanel;
    sbtClear1: TSpeedButton;
    Panel17: TPanel;
    lblMAT_CODE1: TLabel;
    Panel18: TPanel;
    lblMAT_SPEC1: TLabel;
    edtMAT_SPEC1: TEdit;
    edtMAT_CODE1: TEdit;
    Panel21: TPanel;
    sbt_ITEM1: TSpeedButton;
    edtBCR_NO1: TEdit;
    Panel24: TPanel;
    lblVER_NO1: TLabel;
    edtVER_NO1: TEdit;
    Panel25: TPanel;
    lblBCR_NO1: TLabel;
    Panel26: TPanel;
    edtFCargo: TEdit;
    rbMode1: TRadioButton;
    rbMode4: TRadioButton;
    rbMode2: TRadioButton;
    rbMode5: TRadioButton;
    rbMode3: TRadioButton;
    rbMode6: TRadioButton;
    PnlFCrago: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    PnlRCrago: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Panel7: TPanel;
    lblWEIGHT1: TLabel;
    edtWeight1: TEdit;
    Panel27: TPanel;
    lblSPRAY1: TLabel;
    cbSpray1: TComboBox;
    Panel28: TPanel;
    lblWEIGHT2: TLabel;
    edtWeight2: TEdit;
    Panel29: TPanel;
    lblSPRAY2: TLabel;
    cbSpray2: TComboBox;
    LblFitem: TLabel;
    LblRitem: TLabel;
    LblType: TLabel;
    tmrQry: TTimer;
    dgInfo: TDBGridEh;
    Panel2: TPanel;
    LblList: TPanel;
    Pnl_Bottom: TPanel;
    Panel3: TPanel;
    LblStatus: TPanel;
    chkGridSub: TCheckBox;
    qryStatus: TADOQuery;
    dsStatus: TDataSource;
    chkGridMain: TCheckBox;
    Splitter3: TSplitter;
    dgStatus: TDBGridEh;
    lblFCargoExist: TLabel;
    lblFSite2: TLabel;
    lblRCargoExist: TLabel;
    lblRSite2: TLabel;
    PD_MANUAL_INPUT: TADOStoredProc;
    qryCheck: TADOQuery;
    Panel31: TPanel;
    lblSCUse: TLabel;
    edtSCUse: TEdit;
    Panel32: TPanel;
    lblEmptyCnt: TLabel;
    edtEmptyCnt: TEdit;
    Panel33: TPanel;
    LblPosition: TLabel;
    Panel34: TPanel;
    Panel35: TPanel;
    lblENTER_POS: TLabel;
    Panel36: TPanel;
    sbtClear4: TSpeedButton;
    Panel37: TPanel;
    rbPos1: TRadioButton;
    rbPos2: TRadioButton;
    Panel30: TPanel;
    lblSCNo: TLabel;
    edtSCNo: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure rbModeClick(Sender: TObject);
    procedure tmrQryTimer(Sender: TObject);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure dgStatusSelectionChanged(Sender: TObject);
    procedure chkGridMainClick(Sender: TObject);
    procedure chkGridSubClick(Sender: TObject);
    procedure edtMAT_CODEChange(Sender: TObject);
    procedure edtSCNoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbPosClick(Sender: TObject);
    procedure edtSCNoChange(Sender: TObject);
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
  procedure U210Create();

Const
  FormNo ='210';
  FIdx   = 2;
  SIdx   = 1;

var
  frmU210: TfrmU210;
  SrtFlag : integer = 0 ;
  SelectIdx1  : integer = 0;
  bRecordCnt1 : integer = 0;
  aRecordCnt1 : integer = 0;
  SelectIdx2  : integer = 0;
  bRecordCnt2 : integer = 0;
  aRecordCnt2 : integer = 0;
  F_SITE      : integer = 482;
  R_SITE      : integer = 484;
  SC_NO       : integer = 7;
  tENTER_TYPE : String;

implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U210Create
//==============================================================================
procedure U210Create();
begin
  if not Assigned(frmU210) then
  begin
    frmU210 := TfrmU210.Create(Application);
    with frmU210 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU210.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU210.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU210.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU210.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU210.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '210';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU210.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU210, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  fnCommandQuery;
  if not tmrQry.Enabled then tmrQry.Enabled := True;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU210.FormDeactivate(Sender: TObject);
begin
  tmrQry.Enabled := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU210.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrQry.Enabled   := False;
  qryInfo.Active   := False;
  qryStatus.Active := False;
  qryTemp.Active   := False;
  qryCheck.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU210), tsDelete);
    frmU210 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU210.fnCommandStart;
begin
  rbModeClick(rbMode1);
  rbPosClick(rbPos1);
  {
  edtSCNo.Text      := IntToStr(MAN_IPGO_SCNO);
  lblFSite1.Caption := '[SITE '+IntToStr(F_SITE)+']';
  lblFSite2.Caption := '[SITE '+IntToStr(F_SITE)+']';
  lblRSite1.Caption := '[SITE '+IntToStr(R_SITE)+']';
  lblRSite2.Caption := '[SITE '+IntToStr(R_SITE)+']';
  }
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU210.fnCommandOrder;
var
  i, Job_CNT : Integer;
  Fork_Type, tWgt1, tWgt2, ParamStr, o_Code, o_Msg : String;
begin
  Job_CNT := 0; Fork_Type := '';

  // 스태커크레인 입고 가능 상태 체크
  if UpperCase(edtSCUse.Text) <> 'POSSIBLE' then
  begin
    MessageDlg('Staker Crane is prohibited.', mtWarning, [mbYes], 0);
    Exit;
  end;

  // Front 화물없고 정보 입력되있는 경우
  if (not PnlFCrago.Visible) and
     ((Trim(edtMAT_CODE1.Text) <> '') or
      (Trim(edtVER_NO1.Text  ) <> '') or
      (Trim(edtBCR_NO1.Text  ) <> '')) then
  begin
    MessageDlg('There is no cargo at the front location. (Order)', mtConfirmation, [mbYes], 0);
    edtMAT_CODE1.SetFocus;
    Exit;
  end;

  // Rear 화물없고 정보 입력되있는 경우
  if (not PnlRCrago.Visible) and
     ((Trim(edtMAT_CODE2.Text) <> '') or
      (Trim(edtVER_NO2.Text  ) <> '') or
      (Trim(edtBCR_NO2.Text  ) <> '')) then
  begin
    MessageDlg('There is no cargo at the rear location. (Order)', mtConfirmation, [mbYes], 0);
    edtMAT_CODE2.SetFocus;
    Exit;
  end;

  // Front, Rear 코드 입력 안된 경우
  if (Trim(edtMAT_CODE1.Text) = '') and
     (Trim(edtMAT_CODE2.Text) = '') then
  begin
    MessageDlg('Please enter code. (Order)', mtConfirmation, [mbYes], 0);
    Exit;
  end;

  // Front 코드 입력 되었지만 VER NO, BCR NO 없는 경우
  if (Trim(edtMAT_CODE1.Text) <> '') and
     ((Trim(edtVER_NO1.Text) = '') or
      (Trim(edtBCR_NO1.Text) = '')) then
  begin
    MessageDlg('Please enter Front version no or barcode. (Order)', mtConfirmation, [mbYes], 0);
    Exit;
  end;

  // Rear 코드 입력 되었지만 VER NO, BCR NO 없는 경우
  if (Trim(edtMAT_CODE2.Text) <> '') and
     ((Trim(edtVER_NO2.Text) = '') or
      (Trim(edtBCR_NO2.Text) = '')) then
  begin
    MessageDlg('Please enter Rear version no or barcode. (Order)', mtConfirmation, [mbYes], 0);
    Exit;
  end;

  // Front 화물있고 정보 모두 입력 된 경우
  if (PnlFCrago.Visible) and
     (Trim(edtMAT_CODE1.Text) <> '') and
     (Trim(edtVER_NO1.Text  ) <> '') and
     (Trim(edtBCR_NO1.Text  ) <> '') then
  begin
    Fork_Type := 'F';
    inc(Job_CNT);
  end;

  // Rear 화물있고 정보 모두 입력 된 경우
  if (PnlRCrago.Visible) and
     (Trim(edtMAT_CODE2.Text) <> '') and
     (Trim(edtVER_NO2.Text  ) <> '') and
     (Trim(edtBCR_NO2.Text  ) <> '') then
  begin
    Fork_Type := 'R';
    inc(Job_CNT);
  end;

  // 작업 카운트가 0이거나 포크 타입이 지정 안된경우
  if (Job_CNT < 1) or
     (Fork_Type = '') then
  begin
    MessageDlg('Please check the input information. (Order)', mtConfirmation, [mbYes], 0);
    Exit;
  end;

  // 공셀이 부족한 경우
  if StrToIntDef(edtEmptyCnt.Text, 0) < Job_CNT then
  begin
    MessageDlg('Staker Crane #4 has no empty cell.' + #13#10 + #13#10 +
               '(Empty Cell='+IntToStr(StrToIntDef(edtEmptyCnt.Text, 0) )+', Job Count='+IntToStr(Job_CNT)+')'
               , mtWarning, [mbYes], 0);
    Exit;
  end;

  if Job_CNT = 2 then
  begin
    Fork_Type := 'FR';
    if MessageDlg('Do you want to insert the product?' + #13#10 + #13#10 +
                  ' [Front- Site'+IntToStr(F_SITE)+']' + #13#10 +
                  ' Code : '    + edtMAT_CODE1.Text + #13#10 +
                  ' Spec : '    + edtMAT_SPEC1.Text + #13#10 +
                  ' Ver No : '  + edtVER_NO1.Text + #13#10 +
                  ' Barcode : ' + edtBCR_NO1.Text + #13#10 +
                  ' Weight : '  + edtWeight1.Text + #13#10 +
                  ' Spray : '   + cbSpray1.Text + #13#10 + #13#10 +
                  ' [Rear- Site'+IntToStr(MAN_IPGO_R_SITE)+']' + #13#10 +
                  ' Code : '    + edtMAT_CODE2.Text + #13#10 +
                  ' Spec : '    + edtMAT_SPEC2.Text + #13#10 +
                  ' Ver No : '  + edtVER_NO2.Text + #13#10 +
                  ' Barcode : ' + edtBCR_NO2.Text + #13#10 +
                  ' Weight : '  + edtWeight2.Text + #13#10 +
                  ' Spray : '   + cbSpray2.Text, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end else
  begin
    if Fork_Type = 'F' then
    begin
      if MessageDlg('Do you want to insert the product?' + #13#10 + #13#10 +
                    ' [Front- Site'+IntToStr(F_SITE)+']' + #13#10 +
                    ' Code : '    + edtMAT_CODE1.Text + #13#10 +
                    ' Spec : '    + edtMAT_SPEC1.Text + #13#10 +
                    ' Ver No : '  + edtVER_NO1.Text + #13#10 +
                    ' Barcode : ' + edtBCR_NO1.Text + #13#10 +
                    ' Weight : '  + edtWeight1.Text + #13#10 +
                    ' Spray : '   + cbSpray1.Text, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
    end else
    begin
      if MessageDlg('Do you want to insert the product?' + #13#10 + #13#10 +
                    ' [Rear- Site'+IntToStr(R_SITE)+']' + #13#10 +
                    ' Code : '    + edtMAT_CODE2.Text + #13#10 +
                    ' Spec : '    + edtMAT_SPEC2.Text + #13#10 +
                    ' Ver No : '  + edtVER_NO2.Text + #13#10 +
                    ' Barcode : ' + edtBCR_NO2.Text + #13#10 +
                    ' Weight : '  + edtWeight2.Text + #13#10 +
                    ' Spray : '   + cbSpray2.Text, mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
    end;
  end;

  if Trim(edtWeight1.Text) = '' then tWgt1 := '0' else tWgt1 := Trim(edtWeight1.Text);
  if Trim(edtWeight2.Text) = '' then tWgt2 := '0' else tWgt2 := Trim(edtWeight2.Text);

  try
    with PD_MANUAL_INPUT do
    begin
      Close;
      ProcedureName := 'PD_MANUAL_GT_INPUT';
      Parameters.ParamByName('i_STCNO'   ).Value := Trim(edtSCNo.Text);
      Parameters.ParamByName('i_IN_MODE' ).Value := StrToIntDef(tENTER_TYPE,1);
      Parameters.ParamByName('i_F_SITE'  ).Value := IntToStr(F_SITE);
      Parameters.ParamByName('i_F_CODE'  ).Value := Trim(edtMAT_CODE1.Text);
      Parameters.ParamByName('i_F_SKU'   ).Value := Trim(edtMAT_SPEC1.Text);
      Parameters.ParamByName('i_F_VER'   ).Value := Trim(edtVER_NO1.Text);
      Parameters.ParamByName('i_F_BCR'   ).Value := Trim(edtBCR_NO1.Text);
      Parameters.ParamByName('i_F_SPRAY' ).Value := cbSpray1.ItemIndex;
      Parameters.ParamByName('i_F_WEIGHT').Value := tWgt1;
      Parameters.ParamByName('i_F_DATE'  ).Value := Now();
      Parameters.ParamByName('i_R_SITE'  ).Value := IntToStr(R_SITE);
      Parameters.ParamByName('i_R_CODE'  ).Value := Trim(edtMAT_CODE2.Text);
      Parameters.ParamByName('i_R_SKU'   ).Value := Trim(edtMAT_SPEC2.Text);
      Parameters.ParamByName('i_R_VER'   ).Value := Trim(edtVER_NO2.Text);
      Parameters.ParamByName('i_R_BCR'   ).Value := Trim(edtBCR_NO2.Text);
      Parameters.ParamByName('i_R_SPRAY' ).Value := cbSpray2.ItemIndex;
      Parameters.ParamByName('i_R_WEIGHT').Value := tWgt2;
      Parameters.ParamByName('i_R_DATE'  ).Value := Now();

      ParamStr := 'i_STCNO:'   + Trim(edtSCNo.Text)                   + '|' +
                  'i_IN_MODE:' + IntToStr(StrToIntDef(tENTER_TYPE,1)) + '|' +
                  'i_F_SITE:'  + IntToStr(F_SITE)                     + '|' +
                  'i_F_CODE:'  + Trim(edtMAT_CODE1.Text)              + '|' +
                  'i_F_SKU:'   + Trim(edtMAT_SPEC1.Text)              + '|' +
                  'i_F_VER:'   + Trim(edtVER_NO1.Text)                + '|' +
                  'i_F_BCR:'   + Trim(edtBCR_NO1.Text)                + '|' +
                  'i_F_SPRAY:' + IntToStr(cbSpray1.ItemIndex)         + '|' +
                  'i_F_WEIGHT:'+ tWgt1                                + '|' +
                  'i_F_DATE:'  + FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) +
                  'i_R_SITE:'  + IntToStr(MAN_IPGO_R_SITE)            + '|' +
                  'i_R_CODE:'  + Trim(edtMAT_CODE2.Text)              + '|' +
                  'i_R_SKU:'   + Trim(edtMAT_SPEC2.Text)              + '|' +
                  'i_R_VER:'   + Trim(edtVER_NO2.Text)                + '|' +
                  'i_R_BCR:'   + Trim(edtBCR_NO2.Text)                + '|' +
                  'i_R_SPRAY:' + IntToSTr(cbSpray2.ItemIndex)         + '|' +
                  'i_R_WEIGHT:'+ tWgt2                                + '|' +
                  'i_R_DATE:'  + FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
      ExecProc;

      o_Code := IntToStr(Parameters.ParamValues['o_Code']);
      o_Msg  := Parameters.ParamValues['o_msg'];
      if o_Code = '0' then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'fnCommandOrder', 'Order',
                      'Job Count['+IntToStr(Job_CNT)+'], Fork['+Fork_Type+']' +
                      ', CodeF['+Trim(edtMAT_CODE1.Text)+'], BcrF['+Trim(edtBCR_NO1.Text)+']' +
                      ', CodeR['+Trim(edtMAT_CODE2.Text)+'], BcrR['+Trim(edtBCR_NO2.Text)+']',
                      'SP', ProcedureName, ParamStr, '');
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order',
                      'Exception Error', 'SP', PD_MANUAL_INPUT.ProcedureName, ParamStr, 'ErrCode['+o_Code+'], ErrMsg['+o_Msg+']' );
        MessageDlg('Warehousing Order Failed.' + #13#10 + #13#10 + 'ErrCode['+o_Code+'], ErrMsg['+o_Msg+']', mtWarning, [mbYes], 0) ;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      PD_MANUAL_INPUT.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Exception Error', 'SP', PD_MANUAL_INPUT.ProcedureName, ParamStr, E.Message);
      TraceLogWrite('[210] procedure fnCommandOrder Fail || ERR['+E.Message+'], PARAM['+ParamStr+']');
      MessageDlg('Warehousing Order Failed.' + #13#10 + #13#10 + '['+E.Message+']', mtWarning, [mbYes], 0) ;
    end;
  end;
  fnCommandQuery;
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU210.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU210.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU210.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU210.fnCommandExcel;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if chkGridMain.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '(Manual StoreIn List)';
    end else
    begin
      TmpGrid := dgStatus;
      tStr := '(Rack Usage Status)';
    end;

    if hlbEhgridListExcel(TmpGrid, Copy(MainDm.M_Info.ActiveFormName, 6, Length(MainDm.M_Info.ActiveFormName)-5) + tStr + '_' + FormatDatetime('YYYYMMDD', Now)) then
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
      TraceLogWrite('[210] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU210.fnCommandPrint;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if chkGridMain.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '(Manual StoreIn List)';
    end else
    begin
      TmpGrid := dgStatus;
      tStr := '(Rack Usage Status)';
    end;
    if not qryInfo.Active then Exit;

    EhPrint.DBGridEh := TmpGrid;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) + tStr);
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
      TraceLogWrite('[210] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU210.fnCommandQuery;
var
  tFCargo, tRCargo : integer;
  StrSQL : String;
begin
  //=============================
  // 수동입고 작업 디스플레이
  //=============================
  bRecordCnt1 := aRecordCnt1;
  try
    try
      qryInfo.DisableControls;
      with qryInfo do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT I.*, L.*, ' +
                  '        FN_GETJOBSTATUS(I.ORDER_STATUS) AS STATUS_DESC, ' +
                  '       (SELECT CD_TEXT FROM C_CODE_D WHERE CD_TP = 100 AND CD_ID = TO_CHAR(I.ORDER_TYPE)) AS TYPE_DESC, ' +
                  '        CASE WHEN I.CURRENT_MACHINE < 30 THEN ''S/C#'' || TO_CHAR(I.CURRENT_MACHINE) ' +
                  '             WHEN I.CURRENT_MACHINE IN (31, 32, 33, 34, 35) THEN ''PLC#'' || TO_CHAR(I.CURRENT_MACHINE - 30) ' +
                  '             WHEN I.CURRENT_MACHINE IN (41, 42, 43, 44, 45) THEN ''EMS#'' || TO_CHAR(I.CURRENT_MACHINE - 40) ' +
                  '             ELSE TO_CHAR(I.CURRENT_MACHINE) END CURRENT_MACHINE_NM, ' +
                  '        CASE WHEN I.FORK_JOB = 1 THEN ''Single'' ' +
                  '             WHEN I.FORK_JOB = 2 THEN ''Double'' ' +
                  '             ELSE TO_CHAR(I.FORK_JOB) END FORK_JOB_NM, ' +
                  '        CASE WHEN I.FORK_TYPE = 1 THEN ''Front'' ' +
                  '             WHEN I.FORK_TYPE = 2 THEN ''Rear'' ' +
                  '             ELSE TO_CHAR(I.FORK_TYPE) END FORK_TYPE_NM ' +
                  '   FROM C_JOB_I I, W_ORDERLUGG L   ' +
                  '  WHERE I.ORDER_ID = L.ORDER_ID(+) ' +
                  '    AND I.JOB_NO   = L.JOB_NO(+) ' +
                  '    AND I.ORDER_STATUS NOT IN ( 90, 97 )  ' +
                  '    AND SUBSTR(I.ORDER_TYPE, 1, 1) In ( 1, 6 ) ' +
                  '    AND L.TBM_NO = ''MAN'' ' +
                 // '    AND I.SS IN ( ' + IntToStr(F_SITE) + ', ' + IntToStr(R_SITE) + ')' +
                  '  ORDER BY I.ORDER_ID, I.JOB_NO, I.PAIR_JOB_MSG ' ;
        SQL.Text := StrSQL;
        Open;

        aRecordCnt1 := qryInfo.RecordCount;
        if bRecordCnt1 <> aRecordCnt1 then
             dgInfo.SelectedRows.Clear
        else dgInfo.MoveBy(SelectIdx1-1);
      end;
    finally
      qryInfo.EnableControls;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[1]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[210] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL1['+StrSQL+']');
    end;
  end;

  //=============================
  // 랙 사용 현황 표시
  //=============================
  bRecordCnt2 := aRecordCnt2;
  try
    try
      qryStatus.DisableControls;
      if (Trim(edtSCNo.Text) <> '') then
      begin
        with qryStatus do
        begin
          Close;
          SQL.Clear;
          StrSQL := ' SELECT S, COUNT(*) AS CELL_TOT, ' +
                    '        100-TRUNC(SUM(CELL_CNT1) / SUM(CELL_TOT) * 100, 1) AS CELL_RATIO, ' +
                    '        SUM(CELL_CNT1)  AS CELL_CNT1, SUM(CELL_CNT2)  AS CELL_CNT2, ' +
                    '        SUM(CELL_CNT3)  AS CELL_CNT3, SUM(CELL_CNT4)  AS CELL_CNT4, ' +
                    '        SUM(CELL_CNT5)  AS CELL_CNT5, SUM(CELL_CNT6)  AS CELL_CNT6, ' +
                    '        SUM(CELL_CNT7)  AS CELL_CNT7, SUM(CELL_CNT8)  AS CELL_CNT8, ' +
                    '        SUM(CELL_CNT9)  AS CELL_CNT9, SUM(CELL_CNT10) AS CELL_CNT10, ' +
                    '        SUM(CELL_CNT11) AS CELL_CNT11 ' +
                    '   FROM ( ' +
                    '         SELECT S, 1 AS CELL_TOT, ' +
                    '               (CASE WHEN STATUS = ''0'' AND LUGG = ''0'' THEN 1 ELSE 0 END) AS CELL_CNT1, ' + // 빈셀
                    '               (CASE WHEN STATUS = ''0'' AND LUGG = ''1'' THEN 1 ELSE 0 END) AS CELL_CNT2, ' + // 제품
                    '               (CASE WHEN STATUS = ''0'' AND LUGG = ''2'' THEN 1 ELSE 0 END) AS CELL_CNT3, ' + // 파레트
                    '                DECODE(STATUS, ''1'', 1, 0) AS CELL_CNT4, ' +                                  // 입고중
                    '                DECODE(STATUS, ''2'', 1, 0) AS CELL_CNT5, ' +                                  // 출고중
                    '                DECODE(STATUS, ''3'', 1, 0) AS CELL_CNT6, ' +                                  // 예약
                    '                DECODE(STATUS, ''4'', 1, 0) AS CELL_CNT7, ' +                                  // 피킹
                    '                DECODE(STATUS, ''5'', 1, 0) AS CELL_CNT8, ' +                                  // 이중입고
                    '                DECODE(STATUS, ''6'', 1, 0) AS CELL_CNT9, ' +                                  // 공출고
                    '                DECODE(STATUS, ''8'', 1, 0) AS CELL_CNT10, ' +                                 // 금지
                    '                DECODE(STATUS, ''99'', 1, 0) AS CELL_CNT11 ' +                                 // 셀없음
                    '           FROM C_RACK_I ' +
                    '        ) ' +
                    '  WHERE S =  ' + Trim(edtSCNo.Text) +
                    '  GROUP BY S ' +
                    '  ORDER BY S ' ;
          SQL.Text := StrSQL;
          Open;

          aRecordCnt2 := qryStatus.RecordCount;
          if bRecordCnt2 <> aRecordCnt2 then
               dgStatus.SelectedRows.Clear
          else dgStatus.MoveBy(SelectIdx2-1);
          edtEmptyCnt.Text := IntToStr(FieldByName('CELL_CNT1').AsInteger);
        end;
      end;
    finally
      qryStatus.EnableControls;
    end;
  except
    on E: Exception do
    begin
      qryStatus.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[2]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[210] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL2['+StrSQL+']');
    end;
  end;


  //=============================
  // 수동입고대 화물유무 표시
  //=============================
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT FN_GETSITEVALUE( ' + IntToStr(F_SITE) + ', 0) as FCargo ' +
                '      , FN_GETSITEVALUE( ' + IntToStr(R_SITE) + ', 0) as RCargo ' +
                '   FROM DUAL ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        tFCargo := FieldByName('FCargo').AsInteger;
        if (tFCargo = 1) and (not PnlFCrago.Visible) and (Trim(edtMAT_CODE1.Text) <> '') then
          LblFitem.Caption := 'Front Item ['+edtMAT_CODE1.Text+']     ';
        if (tFCargo = 0) and (PnlFCrago.Visible) and (Trim(edtMAT_CODE1.Text) <> '') then
          LblFitem.Caption := 'No Cargo ['+IntToStr(F_SITE)+']     ';
        PnlFCrago.Visible := Boolean(tFCargo);

        tRCargo := FieldByName('RCargo').AsInteger;
        if (tRCargo = 1) and (not PnlRCrago.Visible) and (Trim(edtMAT_CODE2.Text) <> '') then
          LblRitem.Caption := 'Rear Item ['+edtMAT_CODE2.Text+']     ';
        if (tRCargo = 0) and (PnlRCrago.Visible) and (Trim(edtMAT_CODE2.Text) <> '') then
          LblRitem.Caption := 'No Cargo ['+IntToStr(R_SITE)+']     ';
        PnlRCrago.Visible := Boolean(tRCargo);
      end else
      begin
        PnlFCrago.Visible := False;
        PnlRCrago.Visible := False;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[3]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[210] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL3['+StrSQL+']');
    end;
  end;
  //=========================================
  // 스태커크레인 입고 가능 상태 체크
  //=========================================
  try
    with qryCheck do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT FN_GETPARAMDEFINE(''STC'+edtSCNo.Text+'_USE'') AS STATUS ' +
                '   FROM DUAL ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        if (FieldByName('STATUS').AsInteger in [1,3]) then
        begin
          edtSCUse.Text := 'Possible'
        end else
        begin
          edtSCUse.Text := 'Impossible';
          edtEmptyCnt.Text := '0';
        end;
      end else
      begin
        edtSCUse.Text := 'Unable to check';
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryCheck.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[4]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[210] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL4['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU210.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU210.fnCommandLang;
var
  i : integer;
begin
  try
    frmU210.Caption        := MainDm.M_Info.ActiveFormName;
    lblENTER_TYPE.Caption  := getLangString(FormNo, 'pENTER_TYPE', 'In Type'              , MainDm.M_Info.LANG_TYPE, 'N');
    lblSCNo.Caption        := getLangString(FormNo, 'pHOGI'      , 'SC'                   , MainDm.M_Info.LANG_TYPE, 'N');
    lblSCUse.Caption       := getLangString(FormNo, 'SC_USED'    , 'SC Use'               , MainDm.M_Info.LANG_TYPE, 'N');
    lblEmptyCnt.Caption    := getLangString(FormNo, 'pEMP_CNT'   , 'Empty Cell'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblFCargoInfo.Caption  := getLangString(FormNo, 'pFCargoInfo', 'Front Item'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblRCargoInfo.Caption  := getLangString(FormNo, 'pRCargoInfo', 'Rear Item'            , MainDm.M_Info.LANG_TYPE, 'N');
    lblMAT_CODE1.Caption   := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code'             , MainDm.M_Info.LANG_TYPE, 'N');
    lblMAT_CODE2.Caption   := lblMAT_CODE1.Caption;
    lblMAT_SPEC1.Caption   := getLangString(FormNo, 'GT_MAT_SPEC', 'MAT Spec'             , MainDm.M_Info.LANG_TYPE, 'N');
    lblMAT_SPEC2.Caption   := lblMAT_SPEC1.Caption;
    lblVER_NO1.Caption     := getLangString(FormNo, 'pVER_NO'    , 'VER No'               , MainDm.M_Info.LANG_TYPE, 'N');
    lblVER_NO2.Caption     := lblVER_NO1.Caption;
    lblBCR_NO1.Caption     := getLangString(FormNo, 'BCR_NO'     , 'Barcode'              , MainDm.M_Info.LANG_TYPE, 'N');
    lblBCR_NO2.Caption     := lblBCR_NO1.Caption;
    lblWEIGHT1.Caption     := getLangString(FormNo, 'WEIGHT'     , 'Weight'               , MainDm.M_Info.LANG_TYPE, 'N');
    lblWEIGHT2.Caption     := lblWEIGHT1.Caption;
    lblSPRAY1.Caption      := getLangString(FormNo, 'SPRAY'      , 'Spray'                , MainDm.M_Info.LANG_TYPE, 'N');
    lblSPRAY2.Caption      := lblSPRAY1.Caption;
    lblENTER_POS.Caption   := getLangString(FormNo, 'pENTER_POS' , 'In Position]'         , MainDm.M_Info.LANG_TYPE, 'N');
    lblFCargoExist.Caption := getLangString(FormNo, 'pCargoExist', 'Cargo Sensor'         , MainDm.M_Info.LANG_TYPE, 'N');
    lblRCargoExist.Caption := lblFCargoExist.Caption;
    LblList.Caption        := getLangString(FormNo, 'pManInJob'  , '[ Manual Input Job ]' , MainDm.M_Info.LANG_TYPE, 'N');
    LblStatus.Caption      := getLangString(FormNo, 'pRACK'      , '[ Rack Usage Status ]', MainDm.M_Info.LANG_TYPE, 'N');


    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if i <= dgStatus.Columns.Count-1 then
      begin
        dgStatus.Columns[i].Title.Caption  := getLangString(FormNo, dgStatus.Columns[i].FieldName, dgStatus.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption  := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[210] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU210.KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// cbKeyPress
//==============================================================================
procedure TfrmU210.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    (Sender as TComboBox).ItemIndex := 0;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU210.sbtClearClick(Sender: TObject);
var
  tSeq : integer;
begin
  tSeq := (Sender as TSpeedButton).Tag;
  Case tSeq of
    1, 2:
    begin
      TEdit(Self.FindComponent('edtMAT_CODE'+IntToStr(tSeq))).Text := '';       // MAT 코드
      TEdit(Self.FindComponent('edtMAT_SPEC'+IntToStr(tSeq))).Text := '';       // MAT 사양
      TEdit(Self.FindComponent('edtVER_NO'+IntToStr(tSeq))).Text   := '';       // Ver No
      TEdit(Self.FindComponent('edtBCR_NO'+IntToStr(tSeq))).Text   := '';       // 바코드
      TEdit(Self.FindComponent('edtWeight'+IntToStr(tSeq))).Text   := '';       // 무게
      TComboBox(Self.FindComponent('cbSpray'+IntToStr(tSeq))).ItemIndex := 0;   // Spray 여부
      TEdit(Self.FindComponent('edtMAT_CODE'+IntToStr(tSeq))).SetFocus;
    end;
    3:
    begin
      rbMode1.Checked := True;
    end;
  end;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU210.sbt_ITEMClick(Sender: TObject);
var
  tSeq : integer;
begin
  try
    tSeq := (Sender as TSpeedButton).Tag;
    frmItemSearch := TfrmItemSearch.Create(Application);
    frmItemSearch.edtCode.Text := TEdit(Self.FindComponent('edtMAT_CODE'+IntToStr(tSeq))).Text;
    frmItemSearch.ShowModal ;

    if m.Popup_ItemInfo.ResultCd = 'OK' then
    begin
      TEdit(Self.FindComponent('edtMAT_CODE'+IntToStr(tSeq))).Text := m.Popup_ItemInfo.DATA01;
      TEdit(Self.FindComponent('edtMAT_SPEC'+IntToStr(tSeq))).Text := m.Popup_ItemInfo.DATA02;
      TEdit(Self.FindComponent('edtMAT_CODE'+IntToStr(tSeq))).SetFocus;
      fnCommandQuery;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'sbt_ITEMClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[210] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// tmrQryTimer
//==============================================================================
procedure TfrmU210.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    if m.ConChk then fnCommandQuery;
  finally
    tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// rbModeClick
//==============================================================================
procedure TfrmU210.rbModeClick(Sender: TObject);
begin
  tENTER_TYPE     := IntToStr((Sender as TRadioButton).Tag);
  lblType.Caption := 'Item Type [' + ((Sender as TRadioButton).Caption) + ']     ';
end;

//==============================================================================
// rbPosClick                                                                 //
//==============================================================================
procedure TfrmU210.rbPosClick(Sender: TObject);
begin
  // Default SC(Reject Line)
  if (Sender as TRadioButton).Tag = 1 then
  begin
    edtSCNo.ReadOnly   := True;
    edtSCNo.Color      := $00F4F4F4;
    edtSCNo.Font.Color := $00606060;
    edtSCNo.Text       := '7';
    F_SITE := 482;
    R_SITE := 484;
    lblFSite1.Caption := '[SITE 482]';
    lblFSite2.Caption := '[SITE 482]';
    lblRSite1.Caption := '[SITE 484]';
    lblRSite2.Caption := '[SITE 484]';
    lblPosition.Caption := 'In Position [' + rbPos1.Caption + ']     ';
  end else
  begin
    edtSCNo.Text       := '';
    edtSCNo.Color      := clWindow;
    edtSCNo.ReadOnly   := False;
    edtSCNo.Font.Color := clWindowText;
    PnlRCrago.Visible  := False;
    PnlFCrago.Visible  := False;
    lblPosition.Caption := 'In Position [' + rbPos2.Caption + ']     ';
  end;
end;

//==============================================================================
// chkGridMainClick
//==============================================================================
procedure TfrmU210.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU210.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU210.dgInfoSelectionChanged(Sender: TObject);
begin
  if dgInfo.DataSource.DataSet.Active then
       SelectIdx1 := dgInfo.DataSource.DataSet.RecNo
  else SelectIdx1 := 0;
end;

//==============================================================================
// dgStatusSelectionChanged
//==============================================================================
procedure TfrmU210.dgStatusSelectionChanged(Sender: TObject);
begin
  if dgStatus.DataSource.DataSet.Active then
       SelectIdx2 := dgStatus.DataSource.DataSet.RecNo
  else SelectIdx2 := 0;
end;

//==============================================================================
// edtMAT_CODEChange
//==============================================================================
procedure TfrmU210.edtMAT_CODEChange(Sender: TObject);
var
  edtIdx : integer;
begin
  edtIdx := (Sender as TEdit).Tag;

  if TEdit(Self.FindComponent('edtMAT_CODE'+IntToStr(edtIdx))).Text = 'EPLT' then
  begin
    TEdit(Self.FindComponent('edtMAT_SPEC'+IntToStr(edtIdx))).Text := 'EPLT';
    TEdit(Self.FindComponent('edtVER_NO'  +IntToStr(edtIdx))).Text := 'EPLT';
    TEdit(Self.FindComponent('edtBCR_NO'  +IntToStr(edtIdx))).Text := 'EPLT';
  end;

  case edtIdx of
    1 :
    begin
      if Trim(edtMAT_CODE1.Text) <> '' then
      begin
        if PnlFCrago.Visible then
             LblFitem.Caption := 'Front Item ['+edtMAT_CODE1.Text+']     '
        else LblFitem.Caption := 'No Cargo ['+IntToStr(F_SITE)+']     ';
      end else LblFitem.Caption := '';
    end;
    2 :
    begin
      if Trim(edtMAT_CODE2.Text) <> '' then
      begin
        if PnlRCrago.Visible then
             LblRitem.Caption := 'Rear Item ['+edtMAT_CODE2.Text+']     '
        else LblRitem.Caption := 'No Cargo ['+IntToStr(R_SITE)+']     ';
      end else LblRitem.Caption := '';
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU210.dgInfoTitleClick(Column: TColumnEh);
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

procedure TfrmU210.edtSCNoChange(Sender: TObject);
var
  tmpSC_NO : integer;
begin
  if (rbPos2.Checked) then
  begin
    if ((Sender as TEdit).Text <> '') and
       (StrToIntDef((Sender as TEdit).Text, 0) <> 0) and
       (StrToIntDef((Sender as TEdit).Text, 0) <= High(MAN_IPGO_R_SITE_LIST)) then
    begin
      tmpSC_NO := StrToIntDef((Sender as TEdit).Text, 0);
      F_SITE := MAN_IPGO_F_SITE_LIST[StrToInt(Trim(edtSCNo.Text))];
      R_SITE := MAN_IPGO_R_SITE_LIST[StrToInt(Trim(edtSCNo.Text))];
      lblFSite1.Caption := '[SITE '+IntToStr(F_SITE)+']';
      lblFSite2.Caption := '[SITE '+IntToStr(F_SITE)+']';
      lblRSite1.Caption := '[SITE '+IntToStr(R_SITE)+']';
      lblRSite2.Caption := '[SITE '+IntToStr(R_SITE)+']';
      SC_NO  := tmpSC_NO;
    end else
    begin
      lblFSite1.Caption := '[SITE N/A]';
      lblFSite2.Caption := '[SITE N/A]';
      lblRSite1.Caption := '[SITE N/A]';
      lblRSite2.Caption := '[SITE N/A]';
      SC_NO  := 0;
      F_SITE := 0;
      R_SITE := 0;
    end;
  end;
end;

//==============================================================================
// edtSCNoKeyUp
//==============================================================================
procedure TfrmU210.edtSCNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Trim(edtSCNo.Text) <> '') then
  begin
    if (StrToIntDef(edtSCNo.Text, 0) > Length(MAN_IPGO_F_SITE_LIST)) or
       (StrToIntDef(edtSCNo.Text, 0) = 0) then
    begin
      MessageDlg('Please enter only numbers from 1 to 11.', mtConfirmation, [mbYes], 0);
      edtSCNo.Text := '1';
      Exit;
    end;
  end;
end;

end.




