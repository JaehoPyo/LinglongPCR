unit U310;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls ;

type
  TfrmU310 = class(TForm)
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
    PnlORDER_KIND: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    PnlORDER_TYPE: TPanel;
    lblSearch: TLabel;
    lblCnt: TLabel;
    Panel6: TPanel;
    PnlTimer: TPanel;
    lblTimerStat: TPanel;
    Panel13: TPanel;
    sbtTimer: TSpeedButton;
    tmrQry: TTimer;
    qryTemp: TADOQuery;
    cbORDER_KIND: TComboBox;
    cbORDER_TYPE: TComboBox;
    PnlTBMNo: TPanel;
    PnlCURNo: TPanel;
    PnlBCR_NO: TPanel;
    edtBCR_NO: TEdit;
    PnlCellClick: TPanel;
    Panel1: TPanel;
    PnlSelect: TPanel;
    Panel5: TPanel;
    sbtClear2: TSpeedButton;
    PnlJOB_NO: TPanel;
    edtJOB_NO: TEdit;
    PnlORDER_ID: TPanel;
    edtORDER_ID: TEdit;
    Panel7: TPanel;
    rbCp: TRadioButton;
    rbCc: TRadioButton;
    edtTBM_NO: TEdit;
    edtCURE_NO: TEdit;
    dgInfoR: TDBGridEh;
    qryInfoR: TADOQuery;
    dsInfoR: TDataSource;
    PnlPROCESS: TPanel;
    Panel23: TPanel;
    rbProc1: TRadioButton;
    rbProc2: TRadioButton;
    lblPROCESS: TLabel;
    PD_SEL_GIB_OTDATA: TADOStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure tmrQryTimer(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure sbtTimerClick(Sender: TObject);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure sbtClear2Click(Sender: TObject);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure rbProcClick(Sender: TObject);
    procedure dgInfoRCellClick(Column: TColumnEh);
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
  procedure U310Create();

Const
  FormNo ='310';
  FIdx   = 3;
  SIdx   = 1;

var
  frmU310: TfrmU310;
  SrtFlag : integer = 0 ;

  // 일반작업
  SelectIdx   : integer = 0;
  bRecordCnt  : integer = 0;
  aRecordCnt  : integer = 0;

  // 로봇작업
  SelectIdxR  : integer = 0;
  bRecordCntR : integer = 0;
  aRecordCntR : integer = 0;

implementation

uses Main ;

{$R *.dfm}

//==============================================================================
// U310Create                                                                 //
//==============================================================================
procedure U310Create();
begin
  if not Assigned(frmU310) then
  begin
    frmU310 := TfrmU310.Create(Application);
    with frmU310 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU310.Show;
end;

//==============================================================================
// fnWmMsgRecv                                                                //
//==============================================================================
procedure TfrmU310.fnWmMsgRecv(var MSG: TMessage);
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
// FormCreate                                                                 //
//==============================================================================
procedure TfrmU310.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow                                                                   //
//==============================================================================
procedure TfrmU310.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate                                                               //
//==============================================================================
procedure TfrmU310.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '310';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU310.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU310, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  if not tmrQry.Enabled then tmrQry.Enabled := True;

  if not frmMain.cmdORDER.Enabled then
  begin
    edtORDER_ID.Text     := '';
    edtJOB_NO.Text       := '';
    PnlCellClick.Visible := False;
  end else
  begin
    if (PnlTimer.Color = clYellow) and
       (not PnlCellClick.Visible) then
    begin
      dgInfo.SelectedRows.Clear;
      dgInfoR.SelectedRows.Clear;
      edtORDER_ID.Text     := '';
      edtJOB_NO.Text       := '';
      PnlCellClick.Visible := True;
    end;
  end;
end;

//==============================================================================
// FormDeactivate                                                             //
//==============================================================================
procedure TfrmU310.FormDeactivate(Sender: TObject);
begin
  tmrQry.Enabled := False;
end;

//==============================================================================
// FormClose                                                                  //
//==============================================================================
procedure TfrmU310.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrQry.Enabled  := False;
  qryInfo.Active  := False;
  qryInfoR.Active := False;
  qryTemp.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU310), tsDelete);
    frmU310 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]                                                      //
//==============================================================================
procedure TfrmU310.fnCommandStart;
begin
  rbProcClick(rbProc1);
  fnCommandQuery;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU310.fnCommandOrder;
var
  ExecNo : integer;
  tORDER_STATUS, tORDER_ID, tJOB_NO, tBCR_NO,
  tJobKind, tProc, tOT_FLAG, StrSQL, o_RETCD, o_RETMSG, ParamStr : String;
begin
  if (not PnlCellClick.Visible) then
  begin
    MessageDlg('Please stop the auto refresh. (Order)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;


  if (not qryInfo.Active) or
     (Trim(edtORDER_ID.Text) = '') or
     (Trim(edtJOB_NO.Text) = '') then
  begin
    MessageDlg('Please select a row. (Order)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

    tORDER_ID := Trim(edtORDER_ID.Text);
    tJOB_NO   := Trim(edtJOB_NO.Text);

  if rbCp.Checked then
  begin
    tProc := 'Complete';
    tOT_FLAG := 'D';
  end else
  begin
    tProc := 'Cancel';
    tOT_FLAG := 'C';
  end;

  if rbProc1.Checked then
  begin
    tJobKind := 'Common';
    tBCR_NO  := qryInfo.FieldByName('BCR_NO').AsString;
  end else
  begin
    tJobKind := 'Robot';
    tBCR_NO  := qryInfoR.FieldByName('IN_BCRNO').AsString;
  end;

  if MessageDlg('Do you want to ' + tProc + ' the job?' + #13#10 + #13#10 +
                'Order ID ['+tORDER_ID+']' + #13#10 +
                'Job No   ['+tJOB_NO+']' + #13#10 +
                'Barcode  ['+tBCR_NO+']', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;

  if rbProc1.Checked then
  begin
    // ORDER_STATUS[11] => Wait Status (Pair Conveyor Wait)
    if qryInfo.FieldByName('ORDER_STATUS').AsInteger = 11 then
    begin
      if rbCp.Checked then
           tORDER_STATUS := '90'  // WMS Complete
      else tORDER_STATUS := '97'; // WMS Cancel
    end else
    begin
      if rbCp.Checked then
           tORDER_STATUS := '8'  // MFC Complete Request
      else tORDER_STATUS := '7'; // MFC Cnacel Request
    end;

    try
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE C_JOB_I ' +
                  '    SET ORDER_STATUS = ' + tORDER_STATUS +
                  '  WHERE ORDER_ID = ' + QuotedStr(tORDER_ID) +
                  '    AND JOB_NO   = ' + QuotedStr(tJOB_NO) ;
        SQL.Text := StrSQL;
        ExecNo := ExecSQL;
        if ExecNo > 0 then
        begin
          InsertPGMHist('['+FormNo+']', 'N', 'fnCommandOrder', 'Order', 'Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], Status['+tORDER_STATUS+']', 'SQL', StrSQL, '', '');
          TraceLogWrite('[310] Job '+tProc+' || Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], User['+MainDm.M_Info.UserCode+']');
        end else
        begin
          InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], Status['+tORDER_STATUS+']', 'SQL', StrSQL, '', '');
          TraceLogWrite('[310] Job '+tProc+' Fail || Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], User['+MainDm.M_Info.UserCode+']');
        end;
        Close;
      end;
    except
      on E : Exception do
      begin
        qryTemp.Close;
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Exception Error', 'SQL', StrSQL, '', E.Message);
        TraceLogWrite('[310] procedure fnCommandOrder Fail || ERR['+E.Message+'], SQL['+StrSQL+'], KIND[Common:C_JOB_I]');
        MessageDlg(tProc + ' Processing Failed. (Common)' + #13#10 + #13#10 + '['+E.Message+']', mtWarning, [mbYes], 0) ;
      end;
    end;
    try
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT * FROM IF_ROBOT_INFO ' +
                  '  WHERE ORDER_ID = ' + QuotedStr(tORDER_ID) +
                  '    AND JOB_NO   = ' + QuotedStr(tJOB_NO) ;
        SQL.Text := StrSQL;
        Open;

        if RecordCount > 0 then
        begin
          Close;
          SQL.Clear;
          StrSQL := ' UPDATE IF_ROBOT_INFO ' +
                    '    SET IN_FLAG = ''C'' ' +
                    '      , OT_FLAG = ''C'' ' +
                    '  WHERE ORDER_ID = ' + QuotedStr(tORDER_ID) +
                    '    AND JOB_NO   = ' + QuotedStr(tJOB_NO) ;
          SQL.Text := StrSQL;
          ExecNo := ExecSQL;
          if ExecNo > 0 then
          begin
            InsertPGMHist('['+FormNo+']', 'N', 'fnCommandOrder', 'Order', 'Proc['+tProc+'], Job Kind[Common:IF_ROBOT_INFO], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], Status[C]', 'SQL', StrSQL, '', '');
            TraceLogWrite('[310] Job '+tProc+' || Proc['+tProc+'], Job Kind[Common:IF_ROBOT_INFO], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], User['+MainDm.M_Info.UserCode+']');
          end else
          begin
            InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Proc['+tProc+'], Job Kind[Common:IF_ROBOT_INFO], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], Status[C]', 'SQL', StrSQL, '', '');
            TraceLogWrite('[310] Job '+tProc+' Fail || Proc['+tProc+'], Job Kind[Common:IF_ROBOT_INFO], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], User['+MainDm.M_Info.UserCode+']');
          end;
        end;
        Close;
      end;
    except
      on E : Exception do
      begin
        qryTemp.Close;
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Exception Error', 'SQL', StrSQL, '', E.Message);
        TraceLogWrite('[310] procedure fnCommandOrder Fail || ERR['+E.Message+'], SQL['+StrSQL+'], KIND[Common:IF_ROBOT_INFO]');
        MessageDlg(tProc + ' Processing Failed. (Common)' + #13#10 + #13#10 + '['+E.Message+']', mtWarning, [mbYes], 0) ;
      end;
    end;
    fnCommandQuery;
  end else
  begin
    if qryInfoR.FieldByName('ORDER_USE').AsString = 'X' then
    begin
      MessageDlg('It is impossible to order. (Order)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    try
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' UPDATE IF_ROBOT_INFO ' +
                  '    SET OT_FLAG = '  + QuotedStr(tOT_FLAG) +
                  '  WHERE IN_BCRNO = ' + QuotedStr(tBCR_NO) +
                  '    AND ORDER_ID = ' + QuotedStr(tORDER_ID) +
                  '    AND JOB_NO   = ' + QuotedStr(tJOB_NO) ;

        SQL.Text := StrSQL;
        ExecNo := ExecSQL;
        if ExecNo > 0 then
        begin
          InsertPGMHist('['+FormNo+']', 'N', 'fnCommandOrder', 'Order', 'Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], Status['+tORDER_STATUS+']', 'SQL', StrSQL, '', '');
          TraceLogWrite('[310] Job '+tProc+' || Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], User['+MainDm.M_Info.UserCode+']');
        end else
        begin
          InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], Status['+tORDER_STATUS+']', 'SQL', StrSQL, '', '');
          TraceLogWrite('[310] Job '+tProc+' Fail || Proc['+tProc+'], Job Kind[Common:C_JOB_I], Order ID['+tORDER_ID+'], Job No['+tJOB_NO+'], Barcode['+tBCR_NO+'], User['+MainDm.M_Info.UserCode+']');
        end;
        Close;
      end;
    except
      on E : Exception do
      begin
        qryTemp.Close;
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Exception Error', 'SQL', StrSQL, '', E.Message);
        TraceLogWrite('[310] procedure fnCommandOrder Fail || ERR['+E.Message+'], SQL['+StrSQL+'], KIND[Common:C_JOB_I]');
        MessageDlg(tProc + ' Processing Failed. (Common)' + #13#10 + #13#10 + '['+E.Message+']', mtWarning, [mbYes], 0) ;
      end;
    end;

    try
      With PD_SEL_GIB_OTDATA do
      begin
        Close;
        ProcedureName := 'PD_SEL_GIB_OTDATA';
        Parameters.ParamByName('i_GIB_NO'   ).Value := '1';
        Parameters.ParamByName('i_GT_BARNO' ).Value := qryInfoR.FieldByName('IN_BCRNO').AsString;
        Parameters.ParamByName('i_GT_CODE'  ).Value := qryInfoR.FieldByName('IN_GT_CD').AsString;

        ParamStr := 'i_GIB_NO:' + '1'                                         + '|' +
                    'i_GT_BARNO:' + qryInfoR.FieldByName('IN_BCRNO').AsString + '|' +
                    'i_GT_CODE:'  + qryInfoR.FieldByName('IN_GT_CD').AsString ;

        ExecProc;

        o_RETCD  := Parameters.ParamValues['o_RETCD'];
        o_RETMSG := Parameters.ParamValues['o_RETMSG'];
        Close;
      end;
    except
      on E : Exception do
      begin
        PD_SEL_GIB_OTDATA.Close;
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Exception Error', 'SP', PD_SEL_GIB_OTDATA.ProcedureName, ParamStr, E.Message);
        TraceLogWrite('[310] procedure fnCommandOrder Fail || ERR['+E.Message+'], PARAM['+ParamStr+']');
        MessageDlg(tProc + ' Processing Failed. (Common)' + #13#10 + #13#10 + '['+E.Message+']', mtWarning, [mbYes], 0) ;
      end;
    end;
  end;
  fnCommandQuery;
end;

//==============================================================================
// fnCommandAdd [신규]                                                        //
//==============================================================================
procedure TfrmU310.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]                                                     //
//==============================================================================
procedure TfrmU310.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [수정]                                                     //
//==============================================================================
procedure TfrmU310.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]                                                      //
//==============================================================================
procedure TfrmU310.fnCommandExcel;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if rbProc1.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '';
    end else
    begin
      TmpGrid := dgInfoR;
      tStr := '(Robot)';
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
      TraceLogWrite('[310] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]                                                      //
//==============================================================================
procedure TfrmU310.fnCommandPrint;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if rbProc1.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '';
      if not qryInfo.Active then Exit;
    end else
    begin
      TmpGrid := dgInfoR;
      tStr := '(Robot)';
      if not qryInfoR.Active then Exit;
    end;

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
      TraceLogWrite('[310] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]                                                      //
//==============================================================================
procedure TfrmU310.fnCommandQuery;
var
  Pos_No : integer;
  WhereStr, StrSQL, tType1, tType2 : String;
begin
  bRecordCnt  := aRecordCnt;
  bRecordCntR := aRecordCntR;

  edtORDER_ID.Text := '';
  edtJOB_NO.Text := '';
  WhereStr := '' ;

  // C_JOB_I 검색 조건
  if rbProc1.Checked then
  begin
    // 지시종류
    if (cbORDER_KIND.ItemIndex > 0) then
    begin
      if cbORDER_KIND.Text = 'IN' then
           WhereStr := WhereStr +  'AND SUBSTR(I.ORDER_TYPE, 1, 1) In ( 1, 6 ) '  // IN
      else WhereStr := WhereStr +  'AND SUBSTR(I.ORDER_TYPE, 1, 1) In ( 2, 7 ) '; // OUT
    end;

    // 지시타입
    if (cbORDER_TYPE.ItemIndex > 0) then
    begin
       Pos_No := Pos(',', Trim(cbORDER_TYPE.Text));
       if (Pos_No > 0) then
       begin
         tType1 := Copy(Trim(cbORDER_TYPE.Text),          1, Pos_No - 1);
         tType2 := Copy(Trim(cbORDER_TYPE.Text), Pos_No + 1,          3);

         WhereStr := WhereStr + ' AND I.ORDER_TYPE IN ('+QuotedStr(tType1)+','+QuotedStr(tType2)+')';
       end else
       begin
         tType1 := Copy(Trim(cbORDER_TYPE.Text), 1, 3);
         WhereStr := WhereStr + ' AND I.ORDER_TYPE = ' + QuotedStr(tType1) ;
       end;
    end;

    // TBM No
    if (Trim(edtTBM_NO.Text) <> '') then
      WhereStr := WhereStr + ' AND UPPER(L.TBM_NO) LIKE ' + QuotedStr('%'+UpperCase(edtTBM_NO.Text)+'%');

    // Cure No
    if (Trim(edtCURE_NO.Text) <> '') then
      WhereStr := WhereStr + ' AND UPPER(L.CURE_NO) LIKE ' + QuotedStr('%'+UpperCase(edtCURE_NO.Text)+'%');
  end;

  // 바코드 (C_JOB_I, IF_ROBOT_INFO)
  if (Trim(edtBCR_NO.Text) <> '') then
  begin
    if rbProc1.Checked then
    begin
      WhereStr := WhereStr + ' AND UPPER(L.BCR_NO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%') ;
    end else
    begin
      WhereStr := WhereStr + ' AND ( UPPER(R.IN_BCRNO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%')  + ' or ' +
                             '       UPPER(R.OT_BCRNO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%')  + '  ) ' ;
    end;
  end;

  if rbProc1.Checked then
  begin
    // C_JOB_I
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
                    '        CASE WHEN I.CURRENT_MACHINE < 11 THEN ''S/C#'' || TO_CHAR(I.CURRENT_MACHINE) ' +
                    '             WHEN I.CURRENT_MACHINE >= 11 AND I.CURRENT_MACHINE <= 20 THEN ''PLC#'' || TO_CHAR(I.CURRENT_MACHINE - 10) ' +
                    '             WHEN I.CURRENT_MACHINE > 20 THEN ''EMS#'' || TO_CHAR(I.CURRENT_MACHINE - 20) ' +
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
                    '    AND I.ORDER_STATUS NOT IN ( 90, 97 )  ' + WhereStr +
                    '  ORDER BY I.ORDER_ID, I.JOB_NO, I.PAIR_JOB_MSG ' ;
          SQL.Text := StrSQL;
          Open;

          aRecordCnt := qryInfo.RecordCount;
          if bRecordCnt <> aRecordCnt then
               dgInfo.SelectedRows.Clear
          else dgInfo.MoveBy(SelectIdx-1);
          lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
        end;
      finally
        qryInfo.EnableControls;
      end;
    except
      on E : Exception do
      begin
        qryInfo.Close;
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[1]', 'SQL', StrSQL, '', E.Message);
        TraceLogWrite('[310] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL1['+StrSQL+']');
      end;
    end;
  end else
  begin
    // IF_ROBOT_INFO
    try
      try
        qryInfoR.DisableControls;
        with qryInfoR do
        begin
          Close;
          SQL.Clear;
          StrSQL := ' SELECT R.*, ' +
                    '        CASE WHEN I.ORDER_STATUS IN (90, 97, 7) THEN ''X'' '+
                    '             WHEN R.IN_FLAG = ''N''             THEN ''X'' '+
                    '             WHEN I.ORDER_TYPE = 623            THEN ''O'' '+
                    '             ELSE ''X'' END ORDER_USE '+
                    '   FROM IF_ROBOT_INFO R, C_JOB_I I' +
                    '  WHERE R.ORDER_ID = I.ORDER_ID '+
                    '    AND R.JOB_NO = I.JOB_NO ' + WhereStr +
                    '  ORDER BY R.ORDER_ID, R.JOB_NO ' ;
          SQL.Text := StrSQL;
          Open;

          aRecordCntR := qryInfoR.RecordCount;
          if bRecordCntR <> aRecordCntR then
               dgInfoR.SelectedRows.Clear
          else dgInfoR.MoveBy(SelectIdxR-1);
          lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
        end;
      finally
        qryInfoR.EnableControls;
      end;
    except
      on E : Exception do
      begin
        qryInfoR.Close;
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[2]', 'SQL', StrSQL, '', E.Message);
        TraceLogWrite('[310] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL2['+StrSQL+']');
      end;
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]                                                      //
//==============================================================================
procedure TfrmU310.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]                                                       //
//==============================================================================
procedure TfrmU310.fnCommandLang;
var
  i : integer;
  tStr : String;
  cbIndex : Array [0..5] of Integer;
begin
  try
    frmU310.Caption       := MainDm.M_Info.ActiveFormName;
    LblSearch.Caption     := getLangString(FormNo, 'pSEARCH'     , 'Search'      , MainDm.M_Info.LANG_TYPE, 'N');
    lblPROCESS.Caption    := getLangString(FormNo, 'pPROCESS'    , 'Process'     , MainDm.M_Info.LANG_TYPE, 'N');
    PnlORDER_KIND.Caption := getLangString(FormNo, 'pORDER_KIND' , 'Order Kind'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlORDER_TYPE.Caption := getLangString(FormNo, 'TYPE_DESC'   , 'Order Type'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlTBMNo.Caption      := getLangString(FormNo, 'TBM_NO'      , 'TBM No'      , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCURNo.Caption      := getLangString(FormNo, 'CURE_NO'     , 'Cure No'     , MainDm.M_Info.LANG_TYPE, 'N');
    PnlBCR_NO.Caption     := getLangString(FormNo, 'BCR_NO'      , 'Barcode'     , MainDm.M_Info.LANG_TYPE, 'N');
    PnlSelect.Caption     := getLangString(FormNo, 'pSELECT'     , 'Select Info' , MainDm.M_Info.LANG_TYPE, 'N');
    PnlORDER_ID.Caption   := getLangString(FormNo, 'ORDER_ID'    , 'Order ID'    , MainDm.M_Info.LANG_TYPE, 'N');
    PnlJOB_NO.Caption     := getLangString(FormNo, 'JOB_NO'      , 'Job No'      , MainDm.M_Info.LANG_TYPE, 'N');
    rbCp.Caption          := getLangString(FormNo, 'rCOMPLETE'   , 'Complete'    , MainDm.M_Info.LANG_TYPE, 'N');
    rbCc.Caption          := getLangString(FormNo, 'rCANCEL'     , 'Cancel'      , MainDm.M_Info.LANG_TYPE, 'N');
    lblTimerStat.Caption  := getLangString(FormNo, 'pREFRESH'    , 'Auto Refresh', MainDm.M_Info.LANG_TYPE, 'N');
    rbProc1.Caption       := getLangString(FormNo, 'pPROC1'      , 'Common'      , MainDm.M_Info.LANG_TYPE, 'N');
    rbProc2.Caption       := getLangString(FormNo, 'pPROC2'      , 'Robot'       , MainDm.M_Info.LANG_TYPE, 'N');

    if sbtTimer.Tag = 0 then
         sbtTimer.Caption := getLangString(FormNo, 'bSTOP', 'Stop' , MainDm.M_Info.LANG_TYPE, 'N')  // 중지
    else sbtTimer.Caption := getLangString(FormNo, 'bRUN' , 'Run'  , MainDm.M_Info.LANG_TYPE, 'N'); // 사용

    // 현재 선택된 아이템 저장
    cbIndex[0] := cbORDER_KIND.ItemIndex;
    cbIndex[1] := cbORDER_TYPE.ItemIndex;

    // 콤보박스 아이템 언어 변경
    tStr := getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N');
    // 지시종류
    cbORDER_KIND.Items.Clear();
    cbORDER_KIND.Items.Add(tStr);
    cbORDER_KIND.Items.Add('IN');
    cbORDER_KIND.Items.Add('OUT');

    // 지시타입
    cbORDER_TYPE.Items.Clear();
    cbORDER_TYPE.Items.Add(tStr);
    cbORDER_TYPE.Items.Add('110,120 : Warehouse Input'                   );
    cbORDER_TYPE.Items.Add('210,220 : Warehouse Output'                  );
    cbORDER_TYPE.Items.Add('610 : EMS Load -> Barcode'                   );
    cbORDER_TYPE.Items.Add('611 : Barcode -> Check C/V'                  );
    cbORDER_TYPE.Items.Add('621,622 : Check C/V -> Stand By C/V'         );
    cbORDER_TYPE.Items.Add('623 : Check C/V -> Spray'                    );
    cbORDER_TYPE.Items.Add('631,632 : Stand By C/V -> SCC Load ST'       );
    cbORDER_TYPE.Items.Add('633 : Spray -> SCC Load ST'                  );
    cbORDER_TYPE.Items.Add('640 : Barcode -> Reject'                     );
    cbORDER_TYPE.Items.Add('650 : #580(EPLT) -> SCC Load ST'             );
    cbORDER_TYPE.Items.Add('740 : SCC Unload ST -> Angle Machine'        );
    cbORDER_TYPE.Items.Add('750 : Angle Machine -> EMS Unload ST(Curing)');
    cbORDER_TYPE.Items.Add('760 : Angle Machine -> EMS Unload ST(Reject)');

{
    cbORDER_TYPE.Items.Add('610 : EMS Load ST(TBM) -> Barcode Read C/V'  );
    cbORDER_TYPE.Items.Add('611 : Barcode Read C/V -> Check C/V'         );
    cbORDER_TYPE.Items.Add('621,622 : Check C/V -> Stand By C/V'         );
    cbORDER_TYPE.Items.Add('623 : Check C/V -> Spray M/C'                );
    cbORDER_TYPE.Items.Add('631,632 : Stand by C/V -> SCC Load ST'       );
    cbORDER_TYPE.Items.Add('633 : Spray M/C -> SCC Load ST'              );
    cbORDER_TYPE.Items.Add('640 : Barcode Read C/V -> Reject Line'       );
    cbORDER_TYPE.Items.Add('650 : #580 -> SCC Load ST(EPLT)'             );
    cbORDER_TYPE.Items.Add('710 : SCC Unload ST -> Angle Wait C/V'       );
    cbORDER_TYPE.Items.Add('740 : Angle Wait C/V -> Angle Machine'       );
    cbORDER_TYPE.Items.Add('750 : Angle Machine -> EMS Unload ST(Curing)');
    cbORDER_TYPE.Items.Add('760 : Angle Machine -> EMS Unload ST(Reject)');
}
    // 이전 선택된 아이템 이동
    cbORDER_KIND.ItemIndex := cbIndex[0];
    cbORDER_TYPE.ItemIndex := cbIndex[1];

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');

      if i <= dgInfoR.Columns.Count-1 then
      begin
        dgInfoR.Columns[i].Title.Caption := getLangString(FormNo, dgInfoR.Columns[i].FieldName, dgInfoR.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[310] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoCellClick (C_JOB_I)                                                  //
//==============================================================================
procedure TfrmU310.dgInfoCellClick(Column: TColumnEh);
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;

    with qryInfo do
    begin
      if (PnlCellClick.Visible) and
         (PnlTimer.Color = clYellow) and
         (frmMain.cmdORDER.Enabled) then
      begin // 자동조회 OFF 상태
        edtORDER_ID.Text  := qryInfo.FieldByName('ORDER_ID').AsString;
        edtJOB_NO.Text    := qryInfo.FieldByName('JOB_NO').AsString;
      end else
      begin
        edtORDER_ID.Text  := '';
        edtJOB_NO.Text    := '';
      end;
      if Active then
           SelectIdx := dgInfo.DataSource.DataSet.RecNo // Selected Row Save
      else SelectIdx := 0;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoCellClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[310] procedure dgInfoCellClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoRCellClick (IF_ROBOT_INFO)                                           //
//==============================================================================
procedure TfrmU310.dgInfoRCellClick(Column: TColumnEh);
begin
  try
    if (not qryInfoR.Active) or (qryInfoR.RecordCount = 0) then Exit;

    with qryInfoR do
    begin
      if (PnlCellClick.Visible) and
         (PnlTimer.Color = clYellow) and
         (frmMain.cmdORDER.Enabled) then
      begin // 자동조회 OFF 상태
        edtORDER_ID.Text  := qryInfoR.FieldByName('ORDER_ID').AsString;
        edtJOB_NO.Text    := qryInfoR.FieldByName('JOB_NO').AsString;
      end else
      begin
        edtORDER_ID.Text  := '';
        edtJOB_NO.Text    := '';
      end;
      if Active then
           SelectIdxR := dgInfoR.DataSource.DataSet.RecNo // Selected Row Save
      else SelectIdxR := 0;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoRCellClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[310] procedure dgInfoRCellClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoKeyPress                                                             //
//==============================================================================
procedure TfrmU310.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    sbtTimerClick(sbtTimer);
  end;
end;

//==============================================================================
// KeyPress                                                                   //
//==============================================================================
procedure TfrmU310.KeyPress(Sender: TObject; var Key: Char);
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
// cbKeyPress                                                                 //
//==============================================================================
procedure TfrmU310.cbKeyPress(Sender: TObject; var Key: Char);
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
// cbChange                                                                   //
//==============================================================================
procedure TfrmU310.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// sbtClearClick                                                              //
//==============================================================================
procedure TfrmU310.sbtClearClick(Sender: TObject);
begin
  cbORDER_KIND.ItemIndex := 0;
  cbORDER_TYPE.ItemIndex := 0;
  edtTBM_NO.Text         := '';
  edtCURE_NO.Text        := '';
  edtBCR_NO.Text         := '';
  sbtTimer.Tag           := 1;
  sbtTimerClick(sbtTimer);
  if rbProc1.Checked then dgInfo.SetFocus
  else                    dgInfoR.SetFocus;
end;

//==============================================================================
// sbtClear2Click                                                             //
//==============================================================================
procedure TfrmU310.sbtClear2Click(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  dgInfoR.SelectedRows.Clear;
  edtORDER_ID.Text := '';
  edtJOB_NO.Text   := '';
  if rbProc1.Checked then dgInfo.SetFocus
  else                    dgInfoR.SetFocus;
end;

//==============================================================================
// sbtTimerClick                                                              //
//==============================================================================
procedure TfrmU310.sbtTimerClick(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  dgInfoR.SelectedRows.Clear;
  edtORDER_ID.Text := '';
  edtJOB_NO.Text   := '';
  SelectIdx := 0;
  SelectIdxR := 0;

  if (Sender as TSpeedButton).Tag = 1 then
  begin // 타이머 사용
    (Sender as TSpeedButton).Caption := getLangString(FormNo, 'bSTOP', 'Stop' , MainDm.M_Info.LANG_TYPE, 'N');  // 중지
    (Sender as TSpeedButton).Tag := 0;
    PnlTimer.Color := clLime;
    tmrQry.Enabled := True;
    PnlCellClick.Visible := False;
    fnCommandQuery;
  end else
  begin // 타이머 중지
    (Sender as TSpeedButton).Caption := getLangString(FormNo, 'bRUN' , 'Run'  , MainDm.M_Info.LANG_TYPE, 'N'); // 사용
    (Sender as TSpeedButton).Tag := 1;
    PnlTimer.Color := clYellow;
    tmrQry.Enabled := False;
    if frmMain.cmdORDER.Enabled then PnlCellClick.Visible := True;
  end;
end;

//==============================================================================
// tmrQryTimer                                                                //
//==============================================================================
procedure TfrmU310.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    if m.ConChk then fnCommandQuery;
  finally
    if PnlTimer.Color = clLime then tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// dgInfoTitleClick                                                           //
//==============================================================================
procedure TfrmU310.dgInfoTitleClick(Column: TColumnEh);
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
// rbProcClick                                                                //
//==============================================================================
procedure TfrmU310.rbProcClick(Sender: TObject);
begin
  if (Sender as TRadioButton).Tag = 1 then
  begin
    dgInfo.Visible  := True;
    dgInfoR.Visible := False;

    cbORDER_KIND.Enabled := True;
    cbORDER_TYPE.Enabled := True;
    edtTBM_NO.Enabled    := True;
    edtTBM_NO.Color      := clWhite;
    edtCURE_NO.Enabled   := True;
    edtCURE_NO.Color     := clWhite;

    SelectIdxR  := 0;
    bRecordCntR := 0;
    aRecordCntR := 0;
    dgInfoR.SelectedRows.Clear;
    qryInfoR.Close;
  end else
  begin
    dgInfo.Visible  := False;
    dgInfoR.Visible := True;

    cbORDER_KIND.Enabled := False;
    cbORDER_TYPE.Enabled := False;
    edtTBM_NO.Enabled    := False;
    edtTBM_NO.Color      := $00C1C1C1;
    edtCURE_NO.Enabled   := False;
    edtCURE_NO.Color     := $00C1C1C1;

    SelectIdx  := 0;
    bRecordCnt := 0;
    aRecordCnt := 0;
    dgInfo.SelectedRows.Clear;
    qryInfo.Close;
  end;
  fnCommandQuery;
end;

end.




