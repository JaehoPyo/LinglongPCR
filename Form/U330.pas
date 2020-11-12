unit U330;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib,frxClass, frxDBSet, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage ;

type
  TfrmU330 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    Pnl_Main: TPanel;
    Pnl_Sub_Top: TPanel;
    Pnl_Img_Client: TPanel;
    imgMain: TImage;
    Pnl_Bottom: TPanel;
    Splitter4: TSplitter;
    Shp_1_R: TShape;
    Shp_1_L: TShape;
    Shp_2_R: TShape;
    Shp_2_L: TShape;
    Shp_3_L: TShape;
    Shp_3_R: TShape;
    Shp_4_L: TShape;
    Shp_4_R: TShape;
    Shp_5_L: TShape;
    Shp_5_R: TShape;
    Shp_6_L: TShape;
    Shp_6_R: TShape;
    Shp_7_L: TShape;
    Shp_7_R: TShape;
    Shp_8_L: TShape;
    Shp_8_R: TShape;
    Shp_9_R: TShape;
    Shp_9_L: TShape;
    Shp_10_R: TShape;
    Shp_10_L: TShape;
    Shp_11_R: TShape;
    Shp_11_L: TShape;
    Shp_12_R: TShape;
    Shp_12_L: TShape;
    Shp_14_R: TShape;
    Shp_14_L: TShape;
    Shp_13_R: TShape;
    Shp_13_L: TShape;
    Shp_15_L: TShape;
    Shp_15_R: TShape;
    Shp_16_L: TShape;
    Shp_16_R: TShape;
    Shp_17_L: TShape;
    Shp_17_R: TShape;
    Shp_18_R: TShape;
    Shp_18_L: TShape;
    Shp_19_R: TShape;
    Shp_19_L: TShape;
    Shp_20_R: TShape;
    Shp_20_L: TShape;
    Shp_21_R: TShape;
    Shp_21_L: TShape;
    Shp_22_R: TShape;
    Shp_22_L: TShape;
    Shp_23_R: TShape;
    Shp_23_L: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shp_24_R: TShape;
    Shp_24_L: TShape;
    Shp_25_R: TShape;
    Shp_25_L: TShape;
    Shp_26_R: TShape;
    Shp_26_L: TShape;
    Shp_27_R: TShape;
    Shp_27_L: TShape;
    Shp_28_R: TShape;
    Shp_28_L: TShape;
    tmrQry: TTimer;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel1: TPanel;
    lblLine: TLabel;
    cbLine: TComboBox;
    pnlMchID_1: TPanel;
    MchID_1: TPanel;
    Panel12: TPanel;
    pnlMchID_2: TPanel;
    MchID_2: TPanel;
    Panel18: TPanel;
    pnlMchID_4: TPanel;
    MchID_4: TPanel;
    Panel22: TPanel;
    pnlMchID_3: TPanel;
    MchID_3: TPanel;
    Panel26: TPanel;
    pnlMchID_6: TPanel;
    MchID_6: TPanel;
    Panel10: TPanel;
    pnlMchID_8: TPanel;
    MchID_8: TPanel;
    Panel30: TPanel;
    pnlMchID_7: TPanel;
    MchID_7: TPanel;
    Panel34: TPanel;
    pnlMchID_5: TPanel;
    MchID_5: TPanel;
    Panel38: TPanel;
    pnlMchID_9: TPanel;
    MchID_9: TPanel;
    Panel19: TPanel;
    pnlMchID_10: TPanel;
    MchID_10: TPanel;
    Panel35: TPanel;
    pnlMchID_11: TPanel;
    MchID_11: TPanel;
    Panel42: TPanel;
    pnlMchID_12: TPanel;
    MchID_12: TPanel;
    Panel46: TPanel;
    pnlMchID_13: TPanel;
    MchID_13: TPanel;
    Panel50: TPanel;
    pnlMchID_14: TPanel;
    MchID_14: TPanel;
    Panel54: TPanel;
    pnlMchID_15: TPanel;
    MchID_15: TPanel;
    Panel43: TPanel;
    pnlMchID_24: TPanel;
    MchID_24: TPanel;
    Panel56: TPanel;
    pnlMchID_25: TPanel;
    MchID_25: TPanel;
    Panel60: TPanel;
    pnlMchID_26: TPanel;
    MchID_26: TPanel;
    Panel64: TPanel;
    pnlMchID_27: TPanel;
    MchID_27: TPanel;
    Panel68: TPanel;
    pnlMchID_28: TPanel;
    MchID_28: TPanel;
    Panel72: TPanel;
    pnlMchID_16: TPanel;
    MchID_16: TPanel;
    pnlMchID_17: TPanel;
    MchID_17: TPanel;
    Panel80: TPanel;
    pnlMchID_18: TPanel;
    MchID_18: TPanel;
    pnlMchID_19: TPanel;
    MchID_19: TPanel;
    Panel88: TPanel;
    pnlMchID_20: TPanel;
    MchID_20: TPanel;
    pnlMchID_21: TPanel;
    MchID_21: TPanel;
    Panel96: TPanel;
    pnlMchID_22: TPanel;
    MchID_22: TPanel;
    Panel48: TPanel;
    pnlMchID_23: TPanel;
    MchID_23: TPanel;
    Panel104: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Pnl_Bottom_Left: TPanel;
    dgInfo: TDBGridEh;
    Pnl_Bottom_Right: TPanel;
    dgInfo2: TDBGridEh;
    Splitter1: TSplitter;
    qryInfo2: TADOQuery;
    dsInfo2: TDataSource;
    Panel5: TPanel;
    LblCurTitle1: TPanel;
    Panel6: TPanel;
    LblCurTitle2: TPanel;
    Panel7: TPanel;
    PnlCode: TPanel;
    edtMATCode: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    chkGridMain: TCheckBox;
    chkGridSub: TCheckBox;
    Panel17: TPanel;
    Panel76: TPanel;
    Panel25: TPanel;
    Panel21: TPanel;
    Panel83: TPanel;
    Panel37: TPanel;
    Panel87: TPanel;
    Panel84: TPanel;
    Panel91: TPanel;
    Panel95: TPanel;
    Panel99: TPanel;
    Panel103: TPanel;
    Panel9: TPanel;
    Panel33: TPanel;
    Panel29: TPanel;
    Panel15: TPanel;
    Panel31: TPanel;
    Panel55: TPanel;
    Panel59: TPanel;
    Panel41: TPanel;
    Panel45: TPanel;
    Panel63: TPanel;
    Panel49: TPanel;
    Panel67: TPanel;
    Panel71: TPanel;
    Panel53: TPanel;
    Panel39: TPanel;
    Panel75: TPanel;
    Panel79: TPanel;
    Panel13: TPanel;
    MchID_29: TPanel;
    Panel23: TPanel;
    Panel20: TPanel;
    Shp_29_R: TShape;
    Shp_29_L: TShape;
    Panel24: TPanel;
    MchID_30: TPanel;
    Panel28: TPanel;
    Panel32: TPanel;
    Shp_30_R: TShape;
    Shp_30_L: TShape;
    Panel36: TPanel;
    MchID_31: TPanel;
    Panel44: TPanel;
    Panel47: TPanel;
    Shp_31_R: TShape;
    Shp_31_L: TShape;
    Panel51: TPanel;
    MchID_32: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Shp_32_R: TShape;
    Shp_32_L: TShape;
    Panel61: TPanel;
    MchID_33: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel69: TPanel;
    MchID_34: TPanel;
    Panel73: TPanel;
    Panel74: TPanel;
    Shp_33_L: TShape;
    Shp_33_R: TShape;
    Shp_34_L: TShape;
    Shp_34_R: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure cbChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrQryTimer(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure Pnl_BottomResize(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure chkGridSubClick(Sender: TObject);
    procedure chkGridMainClick(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure dgInfo2SelectionChanged(Sender: TObject);
//    procedure Change_Shape;
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
    procedure Display_MchID;
  end;
  procedure U330Create();

Const
  FormNo ='330';
  FIdx   = 3;
  SIdx   = 3;

var
  frmU330: TfrmU330;
  SrtFlag : integer = 0 ;
  SelectIdx1  : integer = 0;
  bRecordCnt1 : integer = 0;
  aRecordCnt1 : integer = 0;
  SelectIdx2  : integer = 0;
  bRecordCnt2 : integer = 0;
  aRecordCnt2 : integer = 0;

implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U330Create
//==============================================================================
procedure U330Create();
begin
  if not Assigned(frmU330) then
  begin
    frmU330 := TfrmU330.Create(Application);
    with frmU330 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU330.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU330.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU330.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU330.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU330.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '330';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU330.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU330, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  if not tmrQry.Enabled then tmrQry.Enabled := True;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU330.FormDeactivate(Sender: TObject);
begin
  tmrQry.Enabled := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU330.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrQry.Enabled  := False;
  qryInfo.Active  := False;
  qryInfo2.Active := False;
  qryTemp.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU330), tsDelete);
    frmU330 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [½ÃÀÛ]
//==============================================================================
procedure TfrmU330.fnCommandStart;
begin
  fnCommandQuery;
end;

//==============================================================================
// fnCommandOrder [Áö½Ã]
//==============================================================================
procedure TfrmU330.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [½Å±Ô]
//==============================================================================
procedure TfrmU330.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [»èÁ¦]
//==============================================================================
procedure TfrmU330.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [¼öÁ¤]
//==============================================================================
procedure TfrmU330.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [¿¢¼¿]
//==============================================================================
procedure TfrmU330.fnCommandExcel;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if chkGridMain.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '(CUR' + FormatFloat('00', (cbLine.ItemIndex * 34) + 1 ) + '-' + 'CUR' + IntToStr((cbLine.ItemIndex * 34) + 17) + ')';
    end else
    begin
      TmpGrid := dgInfo2;
      tStr := '(CUR' + FormatFloat('00', (cbLine.ItemIndex * 34) + 18) + '-' + 'CUR' + IntToStr((cbLine.ItemIndex * 34) + 34) + ')';
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
      TraceLogWrite('[330] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [ÀÎ¼â]
//==============================================================================
procedure TfrmU330.fnCommandPrint;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if chkGridMain.Checked then
    begin
      if not qryInfo.Active then Exit;
      TmpGrid := dgInfo;
      tStr := '(CUR' + FormatFloat('00', (cbLine.ItemIndex * 34) + 1 ) + '-' + 'CUR' + IntToStr((cbLine.ItemIndex * 34) + 17) + ')';
    end else
    begin
      if not qryInfo2.Active then Exit;
      TmpGrid := dgInfo2;
      tStr := '(CUR' + FormatFloat('00', (cbLine.ItemIndex * 34) + 18) + '-' + 'CUR' + IntToStr((cbLine.ItemIndex * 34) + 34) + ')';
    end;

    EhPrint.DBGridEh := TmpGrid;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) + tStr );
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
      TraceLogWrite('[330] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [Á¶È¸]
//==============================================================================
procedure TfrmU330.fnCommandQuery;
var
  StrSQL, WhereStr1, WhereStr2, WhereStr3: String;
  m_No, sIdx, eIdx : Integer;
begin
  bRecordCnt1 := aRecordCnt1; bRecordCnt2 := aRecordCnt2;

//  Change_Shape;
  WhereStr1 := ' AND SUBSTR(MAS.CURE_NO, LENGTH(MAS.CURE_NO)-1, 2) BETWEEN ' ;
  WhereStr2 := ' AND SUBSTR(MAS.CURE_NO, LENGTH(MAS.CURE_NO)-1, 2) BETWEEN ' ;
  WhereStr3 := ' AND SUBSTR(MAS.CURE_NO, LENGTH(MAS.CURE_NO)-1, 2) BETWEEN ' ;

  sIdx := (cbLine.ItemIndex * 34) + 1;
  eIdx := (cbLine.ItemIndex + 1) * 34;

  WhereStr1 := WhereStr1 + IntToStr(sIdx   ) + ' AND ' + IntToStr(eIdx-17);
  WhereStr2 := WhereStr2 + IntToStr(sIdx+17) + ' AND ' + IntToStr(eIdx   );
  WhereStr3 := WhereStr3 + IntToStr(sIdx   ) + ' AND ' + IntToStr(eIdx   );

  // MAT ÄÚµå
  if (Trim(edtMATCode.Text) <> '') then
  begin
    WhereStr1 := WhereStr1 + ' AND UPPER(MAS.GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;
    WhereStr2 := WhereStr2 + ' AND UPPER(MAS.GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;
  end;

  try
    try
      qryInfo.DisableControls;
      with qryInfo do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT DISTINCT MAS.CURE_NO, MAS.GT_MAT_CODE, MAS.VER_NO, ITM.MAT_SPEC GT_MAT_SPEC, ' +
                  '        Nvl(STK.STOCK_QTY, 0) AS STOCK_QTY,    ' +
                  '        DECODE(Lis.L_CV_POS, ''0'', '''', Lis.L_CV_POS) as L_CV_POS, ' +
                  '        DECODE(Lis.R_CV_POS, ''0'', '''', Lis.R_CV_POS) as R_CV_POS, ' +
                  '        Lis.L_TBM_NO, Lis.R_TBM_NO ' +
                  '   FROM C_CURE_S MAS,  ' +
                  '        ( SELECT GT_MAT_CODE, VER_NO, COUNT(*) STOCK_QTY ' +
                  '            FROM W_STOCK_I STK   ' +
                  '           GROUP BY GT_MAT_CODE, VER_NO  ' +
                  '        ) STK, ' +
                  '        ( SELECT JOB.CURE_NO,    ' +
                  '                 MAX(L_CV_POS) AS L_CV_POS, ' +
                  '                 MAX(R_CV_POS) AS R_CV_POS, ' +
                  '                 MAX(L_TBM_NO) AS L_TBM_NO, ' +
                  '                 MAX(R_TBM_NO) AS R_TBM_NO  ' +
                  '            FROM (  ' +
                  '                   SELECT L.CURE_NO, L.TONG_POS, ' +
                  '                         (CASE WHEN L.TONG_POS = ''L'' AND I.ES = I.TO_POSITION THEN CURRENT_MACHINE WHEN L.TONG_POS = ''R'' THEN 0 ELSE CURRENT_POSITION END) AS L_CV_POS, ' +
                  '                         (CASE WHEN L.TONG_POS = ''R'' AND I.ES = I.TO_POSITION THEN CURRENT_MACHINE WHEN L.TONG_POS = ''L'' THEN 0 ELSE CURRENT_POSITION END) AS R_CV_POS, ' +
                  '                          DECODE(TONG_POS, ''L'', TBM_NO, '''') AS L_TBM_NO, ' +
                  '                          DECODE(TONG_POS, ''R'', TBM_NO, '''') AS R_TBM_NO  ' +
                  '                     FROM C_JOB_I I, W_ORDERLUGG L ' +
                  '                    WHERE I.ORDER_ID = L.ORDER_ID  ' +
                  '                      AND I.JOB_NO = L.JOB_NO      ' +
                  '                      AND SUBSTR(I.ORDER_TYPE, 1, 1) IN (''2'', ''7'') ' +
                  '                      AND I.ORDER_STATUS NOT IN ( 90, 97 ) ' +
                  '                  ) JOB  ' +
                  '           GROUP BY JOB.CURE_NO ' +
                  '        ) LIS, ' +
                  '        ( SELECT MAT_CODE, MAT_SPEC ' +
                  '            FROM C_ITM_I ' +
                  '        ) ITM ' +
                  '  WHERE MAS.CURE_NO = LIS.CURE_NO(+) ' +
                  '    AND MAS.GT_MAT_CODE = ITM.MAT_CODE(+) ' +
                  '    AND MAS.GT_MAT_CODE = STK.GT_MAT_CODE(+) ' +
                  '    AND MAS.VER_NO = STK.VER_NO(+) ' + WhereStr1 +
                  '  ORDER BY MAS.CURE_NO ' ;
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
      TraceLogWrite('[330] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL1['+StrSQL+']');
    end;
  end;

  try
    try
      qryInfo2.DisableControls;
      with qryInfo2 do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT DISTINCT MAS.CURE_NO, MAS.GT_MAT_CODE, MAS.VER_NO, ITM.MAT_SPEC GT_MAT_SPEC, ' +
                  '        Nvl(STK.STOCK_QTY, 0) AS STOCK_QTY,    ' +
                  '        DECODE(Lis.L_CV_POS, ''0'', '''', Lis.L_CV_POS) as L_CV_POS, ' +
                  '        DECODE(Lis.R_CV_POS, ''0'', '''', Lis.R_CV_POS) as R_CV_POS, ' +
                  '        Lis.L_TBM_NO, Lis.R_TBM_NO ' +
                  '   FROM C_CURE_S MAS,  ' +
                  '        ( SELECT GT_MAT_CODE, VER_NO, COUNT(*) STOCK_QTY ' +
                  '            FROM W_STOCK_I STK   ' +
                  '           GROUP BY GT_MAT_CODE, VER_NO  ' +
                  '        ) STK, ' +
                  '        ( SELECT JOB.CURE_NO,    ' +
                  '                 MAX(L_CV_POS) AS L_CV_POS, ' +
                  '                 MAX(R_CV_POS) AS R_CV_POS, ' +
                  '                 MAX(L_TBM_NO) AS L_TBM_NO, ' +
                  '                 MAX(R_TBM_NO) AS R_TBM_NO  ' +
                  '            FROM (  ' +
                  '                   SELECT L.CURE_NO, L.TONG_POS, ' +
                  '                         (CASE WHEN L.TONG_POS = ''L'' AND I.ES = I.TO_POSITION THEN CURRENT_MACHINE WHEN L.TONG_POS = ''R'' THEN 0 ELSE CURRENT_POSITION END) AS L_CV_POS, ' +
                  '                         (CASE WHEN L.TONG_POS = ''R'' AND I.ES = I.TO_POSITION THEN CURRENT_MACHINE WHEN L.TONG_POS = ''L'' THEN 0 ELSE CURRENT_POSITION END) AS R_CV_POS, ' +
                  '                          DECODE(TONG_POS, ''L'', TBM_NO, '''') AS L_TBM_NO, ' +
                  '                          DECODE(TONG_POS, ''R'', TBM_NO, '''') AS R_TBM_NO  ' +
                  '                     FROM C_JOB_I I, W_ORDERLUGG L ' +
                  '                    WHERE I.ORDER_ID = L.ORDER_ID  ' +
                  '                      AND I.JOB_NO = L.JOB_NO      ' +
                  '                      AND SUBSTR(I.ORDER_TYPE, 1, 1) IN (''2'', ''7'') ' +
                  '                      AND I.ORDER_STATUS NOT IN ( 90, 97 ) ' +
                  '                  ) JOB  ' +
                  '           GROUP BY JOB.CURE_NO ' +
                  '        ) LIS, ' +
                  '        ( SELECT MAT_CODE, MAT_SPEC ' +
                  '            FROM C_ITM_I ' +
                  '        ) ITM ' +
                  '  WHERE MAS.CURE_NO = LIS.CURE_NO(+) ' +
                  '    AND MAS.GT_MAT_CODE = ITM.MAT_CODE(+) ' +
                  '    AND MAS.GT_MAT_CODE = STK.GT_MAT_CODE(+) ' +
                  '    AND MAS.VER_NO = STK.VER_NO(+) ' + WhereStr2 +
                  '  ORDER BY MAS.CURE_NO ' ;
        SQL.Text := StrSQL;
        Open;

        aRecordCnt2 := qryInfo2.RecordCount;
        if bRecordCnt2 <> aRecordCnt2 then
             dgInfo2.SelectedRows.Clear
        else dgInfo2.MoveBy(SelectIdx2-1);
      end;
    finally
      qryInfo2.EnableControls;
    end;
  except
    on E : Exception do
    begin
      qryInfo2.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[2]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[330] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL2['+StrSQL+']');
    end;
  end;

  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
        StrSQL := ' SELECT DISTINCT MAS.CURE_NO, MAS.GT_MAT_CODE, MAS.VER_NO, ITM.MAT_SPEC GT_MAT_SPEC, ' +
                  '        Nvl(STK.STOCK_QTY, 0) AS STOCK_QTY,    ' +
                  '        DECODE(Lis.L_CV_POS, null, ''0'', Lis.L_CV_POS) as L_CV_POS, ' +
                  '        DECODE(Lis.R_CV_POS, null, ''0'', Lis.R_CV_POS) as R_CV_POS, ' +
                  '        Lis.L_TBM_NO, Lis.R_TBM_NO ' +
                  '   FROM C_CURE_S MAS,  ' +
                  '        ( SELECT GT_MAT_CODE, VER_NO, COUNT(*) STOCK_QTY ' +
                  '            FROM W_STOCK_I STK   ' +
                  '           GROUP BY GT_MAT_CODE, VER_NO  ' +
                  '        ) STK, ' +
                  '        ( SELECT JOB.CURE_NO,    ' +
                  '                 MAX(L_CV_POS) AS L_CV_POS, ' +
                  '                 MAX(R_CV_POS) AS R_CV_POS, ' +
                  '                 MAX(L_TBM_NO) AS L_TBM_NO, ' +
                  '                 MAX(R_TBM_NO) AS R_TBM_NO  ' +
                  '            FROM (  ' +
                  '                   SELECT L.CURE_NO, L.TONG_POS, ' +
                  '                         (CASE WHEN L.TONG_POS = ''L'' AND I.ES = I.TO_POSITION THEN CURRENT_MACHINE WHEN L.TONG_POS = ''R'' THEN 0 ELSE CURRENT_POSITION END) AS L_CV_POS, ' +
                  '                         (CASE WHEN L.TONG_POS = ''R'' AND I.ES = I.TO_POSITION THEN CURRENT_MACHINE WHEN L.TONG_POS = ''L'' THEN 0 ELSE CURRENT_POSITION END) AS R_CV_POS, ' +
                  '                          DECODE(TONG_POS, ''L'', TBM_NO, '''') AS L_TBM_NO, ' +
                  '                          DECODE(TONG_POS, ''R'', TBM_NO, '''') AS R_TBM_NO  ' +
                  '                     FROM C_JOB_I I, W_ORDERLUGG L ' +
                  '                    WHERE I.ORDER_ID = L.ORDER_ID  ' +
                  '                      AND I.JOB_NO = L.JOB_NO      ' +
                  '                      AND SUBSTR(I.ORDER_TYPE, 1, 1) IN (''2'', ''7'') ' +
                  '                      AND I.ORDER_STATUS NOT IN ( 90, 97 ) ' +
                  '                  ) JOB  ' +
                  '           GROUP BY JOB.CURE_NO ' +
                  '        ) LIS, ' +
                  '        ( SELECT MAT_CODE, MAT_SPEC ' +
                  '            FROM C_ITM_I ' +
                  '        ) ITM ' +
                  '  WHERE MAS.CURE_NO = LIS.CURE_NO(+) ' +
                  '    AND MAS.GT_MAT_CODE = ITM.MAT_CODE(+) ' +
                  '    AND MAS.GT_MAT_CODE = STK.GT_MAT_CODE(+) ' +
                  '    AND MAS.VER_NO = STK.VER_NO(+) ' + WhereStr3 +
                  '  ORDER BY MAS.CURE_NO ' ;
      SQL.Text := StrSQL;
      Open;
      First;
      while Not ( Eof ) do
      begin
        m_No := StrToIntDef(Copy(FieldByName('CURE_NO').AsString, Length(FieldByName('CURE_NO').AsString)-1, 2), 0) ;

        if      m_No > 34 then m_No := m_No - 34
        else if m_No > 68 then m_No := m_No - 68
        else m_No := m_No;

        if ( FieldByName('L_CV_POS').AsString = '0' ) then
           TShape(Self.FindComponent('Shp_' + IntToStr(m_No) + '_L')).Brush.Color := $00C0C0C0
        else
           TShape(Self.FindComponent('Shp_' + IntToStr(m_No) + '_L')).Brush.Color := $003EDD22;
        if ( FieldByName('R_CV_POS').AsString = '0' ) then
           TShape(Self.FindComponent('Shp_' + IntToStr(m_No) + '_R')).Brush.Color := $00C0C0C0
        else
           TShape(Self.FindComponent('Shp_' + IntToStr(m_No) + '_R')).Brush.Color := $003EDD22;

        Next;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[3]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[330] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL3['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [´Ý±â]
//==============================================================================
procedure TfrmU330.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [¾ð¾î]
//==============================================================================
procedure TfrmU330.fnCommandLang;
var
  i : integer;
begin
  try
    frmU330.Caption   := MainDm.M_Info.ActiveFormName;
    PnlSearch.Caption := getLangString(FormNo, 'pSEARCH'     , 'Search'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblLine.Caption   := getLangString(FormNo, 'pCURING_LINE', 'Curing Line', MainDm.M_Info.LANG_TYPE, 'N');
    PnlCode.Caption   := getLangString(FormNo, 'GT_MAT_CODE' , 'MAT Code'   , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption  := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      if not dgInfo2.Columns[i].Visible then Continue;
      dgInfo2.Columns[i].Title.Caption := getLangString(FormNo, dgInfo2.Columns[i].FieldName, dgInfo2.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[330] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU330.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU330.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU330.cbChange(Sender: TObject);
begin
  Display_MchID;
  fnCommandQuery;
end;

//==============================================================================
// Display_MchID
//==============================================================================
procedure TfrmU330.Display_MchID;
var
  i : Integer;
begin
  for i := 1 to 34 do
  begin
    if Trim(MainDm.MACH_CUR[(cbLine.ItemIndex * 34) + i].USED) = 'N' then
    begin
      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Caption := 'N/A';
      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Color   := clWhite;
    end else
    begin
      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Caption := MainDm.MACH_CUR[(cbLine.ItemIndex * 34) + i].ID;
      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Color   := clBtnFace;
    end;
  end;
  LblCurTitle1.Caption := '[ CUR' + FormatFloat('00', (cbLine.ItemIndex * 34) + 1 ) + ' - ' + 'CUR' + IntToStr((cbLine.ItemIndex * 34) + 17) + ' ]';
  LblCurTitle2.Caption := '[ CUR' + FormatFloat('00', (cbLine.ItemIndex * 34) + 18) + ' - ' + 'CUR' + IntToStr((cbLine.ItemIndex * 34) + 34) + ' ]';
end;

//==============================================================================
// tmrQryTimer
//==============================================================================
procedure TfrmU330.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    if m.ConChk then fnCommandQuery;
  finally
    tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// Pnl_BottomResize
//==============================================================================
procedure TfrmU330.Pnl_BottomResize(Sender: TObject);
begin
  Pnl_Bottom_Left.Width := (Pnl_Bottom.Width - Splitter1.Width) div 2;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU330.sbtClearClick(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  dgInfo2.SelectedRows.Clear;
  SelectIdx1 := 0;
  SelectIdx2 := 0;
  cbLine.ItemIndex := 0;
  edtMATCode.Text := '';
  cbLine.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [Ç°¸ñÃ£±â]
//==============================================================================
procedure TfrmU330.sbt_ITEMClick(Sender: TObject);
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
      TraceLogWrite('[330] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU330.dgInfoTitleClick(Column: TColumnEh);
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
// chkGridMainClick
//==============================================================================
procedure TfrmU330.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU330.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU330.dgInfoSelectionChanged(Sender: TObject);
begin
  if dgInfo.DataSource.DataSet.Active then
       SelectIdx1 := dgInfo.DataSource.DataSet.RecNo
  else SelectIdx1 := 0;
end;

//==============================================================================
// dgInfo2SelectionChanged
//==============================================================================
procedure TfrmU330.dgInfo2SelectionChanged(Sender: TObject);
begin
  if dgInfo2.DataSource.DataSet.Active then
       SelectIdx2 := dgInfo2.DataSource.DataSet.RecNo
  else SelectIdx2 := 0;
end;

//        '        case when R_CV_POS in ( 43, 44, 45 ) then R_CV_POS else L_CV_POS end L_CV_POS, ' +
//        '        case when L_CV_POS in ( 43, 44, 45 ) then L_CV_POS else R_CV_POS end R_CV_POS, ' +
end.




