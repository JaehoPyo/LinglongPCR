unit U350;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls ;

type
  TfrmU350 = class(TForm)
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
    Panel11: TPanel;
    PnlSelect: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    PnlMinValue: TPanel;
    PnlMaxValue: TPanel;
    udMinValue: TUpDown;
    edtMinValue: TEdit;
    udMaxValue: TUpDown;
    edtMaxValue: TEdit;
    PnlParamName: TPanel;
    edtParamName: TEdit;
    PnlParamDesc: TPanel;
    edtParamDesc: TEdit;
    PnlCurValue: TPanel;
    edtCurValue: TEdit;
    udCurValue: TUpDown;
    qryTemp: TADOQuery;
    edtUSER_CTRL: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure sbtClearClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
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
  procedure U350Create();

Const
  FormNo ='350';
  FIdx   = 3;
  SIdx   = 5;

var
  frmU350: TfrmU350;
  SrtFlag : integer = 0 ;
  SelectIdx : integer = 0 ;

implementation

uses Main ;

{$R *.dfm}

//==============================================================================
// U350Create
//==============================================================================
procedure U350Create();
begin
  if not Assigned(frmU350) then
  begin
    frmU350 := TfrmU350.Create(Application);
    with frmU350 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU350.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU350.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU350.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU350.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU350.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '350';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU350.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU350, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU350.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU350.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU350), tsDelete);
    frmU350 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [½ÃÀÛ]
//==============================================================================
procedure TfrmU350.fnCommandStart;
begin
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [Áö½Ã]
//==============================================================================
procedure TfrmU350.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [½Å±Ô]
//==============================================================================
procedure TfrmU350.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [»èÁ¦]
//==============================================================================
procedure TfrmU350.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [¼öÁ¤]
//==============================================================================
procedure TfrmU350.fnCommandUpdate;
var
  ExecNo : integer;
  StrSQL : String;
begin
  if (not qryInfo.Active) or
     (Trim(edtParamName.Text) = '') then
  begin
    MessageDlg('Please select a row. (Update)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if Trim(edtUSER_CTRL.Text) <> 'Y' then
  begin
    MessageDlg('This parameter cannot be changed. (Update)' + #13#10 + #13#10 +
               '[Control=N]', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if (Trim(edtParamName.Text) = 'REJECT_USE') And
     (Trim(edtCurValue.Text) = '6')  then
  begin
    MessageDlg('There is no Stacker 6', mtConfirmation, [mbYes], 0);
    Exit ;
  end;


  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE C_PARAM_D ' +
                '    SET MIN_VAL  = ' + edtMinValue.Text +
                '      , MAX_VAL  = ' + edtMaxValue.Text +
                '      , CURR_VAL = ' + edtCurValue.Text +
                '      , UPDATE_DT = SYSDATE ' +
                '  WHERE PARAM_NAME = ' + QuotedStr(Trim(edtParamName.Text)) +
                '    AND USER_CTRL = ''Y'' ' ;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;

      if ExecNo > 0 then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'fnCommandUpdate', 'Update', 'Param['+Trim(edtParamName.Text)+'], Min['+edtMinValue.Text+'], Max['+edtMaxValue.Text+'], Curr['+edtCurValue.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[350] Parameter Update || Param['+Trim(edtParamName.Text)+'], Min['+edtMinValue.Text+'], Max['+edtMaxValue.Text+'], Curr['+edtCurValue.Text+']');
        udCurValue.Min := StrToIntDef(edtMinValue.Text, 0);
        udCurValue.Max := StrToIntDef(edtMaxValue.Text, 9);
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Param['+Trim(edtParamName.Text)+'], Min['+edtMinValue.Text+'], Max['+edtMaxValue.Text+'], Curr['+edtCurValue.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[350] Parameter Update Fail || Param['+Trim(edtParamName.Text)+'], Min['+edtMinValue.Text+'], Max['+edtMaxValue.Text+'], Curr['+edtCurValue.Text+']');
      end;
      Close;
    end;
    fnCommandQuery;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[350] procedure fnCommandUpdate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandExcel [¿¢¼¿]
//==============================================================================
procedure TfrmU350.fnCommandExcel;
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
      TraceLogWrite('[350] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [ÀÎ¼â]
//==============================================================================
procedure TfrmU350.fnCommandPrint;
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
      TraceLogWrite('[350] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [Á¶È¸]
//==============================================================================
procedure TfrmU350.fnCommandQuery;
var
  StrSQL : String;
begin
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT PARAM_NAME, MIN_VAL, MAX_VAL, CURR_VAL, PARAM_REMARK, ' +
                '        USER_CTRL, UPDATE_DT, CREATE_DT ' +
                '   FROM C_PARAM_D ' +
                '  WHERE USER_VIEW = ''Y'' ' +
                '  ORDER BY PARAM_NAME ' ;
      SQL.Text := StrSQL;
      Open;
      dgInfo.MoveBy(SelectIdx-1);
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[350] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [´Ý±â]
//==============================================================================
procedure TfrmU350.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [¾ð¾î]
//==============================================================================
procedure TfrmU350.fnCommandLang;
var
  i : integer;
begin
  try
    frmU350.Caption      := MainDm.M_Info.ActiveFormName;
    PnlSelect.Caption    := getLangString(FormNo, 'PInfo'       , 'Select Info'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlParamName.Caption := getLangString(FormNo, 'PARAM_NAME'  , 'Parameter'    , MainDm.M_Info.LANG_TYPE, 'N');
    PnlParamDesc.Caption := getLangString(FormNo, 'PARAM_REMARK', 'Description'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMinValue.Caption  := getLangString(FormNo, 'MIN_VAL'     , 'Min Value'    , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMaxValue.Caption  := getLangString(FormNo, 'MAX_VAL'     , 'Max Value'    , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCurValue.Caption  := getLangString(FormNo, 'CURR_VAL'    , 'Current Value', MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[350] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU350.sbtClearClick(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  SelectIdx := 0;
  edtParamName.Text   := '';
  edtParamDesc.Text   := '';
  edtUSER_CTRL.Text   := '';
  udMinValue.Min      := 0;
  udMinValue.Max      := 9999;
  udMaxValue.Min      := 0;
  udMaxValue.Max      := 9999;
  udCurValue.Min      := 0;
  udCurValue.Max      := 0;
  udMinValue.Position := 0;
  udMaxValue.Position := 0;
  udCurValue.Position := 0;
  dgInfo.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU350.dgInfoCellClick(Column: TColumnEh);
begin
  try
    with qryInfo do
    begin
      edtParamName.Text := FieldByName('PARAM_NAME'  ).AsString;
      edtParamDesc.Text := FieldByName('PARAM_REMARK').AsString;
      edtMinValue.Text  := IntToStr(FieldbyName('MIN_VAL' ).AsInteger);
      edtMaxValue.Text  := IntToStr(FieldbyName('MAX_VAL' ).AsInteger);
      edtCurValue.Text  := IntToStr(FieldbyName('CURR_VAL').AsInteger);
      udCurValue.Min    := FieldByName('MIN_VAL').AsInteger;
      udCurValue.Max    := FieldByName('MAX_VAL').AsInteger;
      edtUSER_CTRL.Text := FieldByName('USER_CTRL').AsString;

      if Active then SelectIdx := dgInfo.DataSource.DataSet.RecNo // Selected Row Save
      else           SelectIdx := 0;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoCellClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[350] procedure dgInfoCellClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU350.dgInfoTitleClick(Column: TColumnEh);
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





