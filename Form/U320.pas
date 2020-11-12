unit U320;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.ImageList,
  Vcl.ImgList ;

type
  TfrmU320 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    PnlMATCode: TPanel;
    edtMATCode: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    Pnl_Main: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Pnl_Bottom: TPanel;
    Pnl_Sub_Top: TPanel;
    imgMain: TImage;
    MchID_1: TPanel;
    Panel3: TPanel;
    Shp_5: TShape;
    Panel9: TPanel;
    Shp_2: TShape;
    Panel10: TPanel;
    Shp_3: TShape;
    Panel12: TPanel;
    Shp_4: TShape;
    Panel13: TPanel;
    Shp_6: TShape;
    Panel15: TPanel;
    Shp_7: TShape;
    Panel16: TPanel;
    Shp_8: TShape;
    MchID_2: TPanel;
    MchID_3: TPanel;
    MchID_4: TPanel;
    MchID_5: TPanel;
    MchID_6: TPanel;
    MchID_7: TPanel;
    MchID_8: TPanel;
    dgInfo: TDBGridEh;
    Panel22: TPanel;
    LblTBMTitle1: TPanel;
    Splitter4: TSplitter;
    tmrQry: TTimer;
    Panel2: TPanel;
    Shp_1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure tmrQryTimer(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure dgInfoSelectionChanged(Sender: TObject);
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
  procedure U320Create();

Const
  FormNo ='320';
  FIdx   = 3;
  SIdx   = 2;

var
  frmU320: TfrmU320;
  SrtFlag : integer = 0 ;
  SelectIdx : integer = 0;
  bRecordCnt : integer = 0;
  aRecordCnt : integer = 0;

implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U320Create
//==============================================================================
procedure U320Create();
begin
  if not Assigned(frmU320) then
  begin
    frmU320 := TfrmU320.Create(Application);
    with frmU320 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU320.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU320.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU320.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU320.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU320.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '320';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU320.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU320, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  if not tmrQry.Enabled then tmrQry.Enabled := True;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU320.FormDeactivate(Sender: TObject);
begin
  tmrQry.Enabled := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU320.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrQry.Enabled := False;
  qryInfo.Active := False;
  qryTemp.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU320), tsDelete);
    frmU320 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [½ÃÀÛ]
//==============================================================================
procedure TfrmU320.fnCommandStart;
begin
  fnCommandQuery;
end;

//==============================================================================
// fnCommandOrder [Áö½Ã]
//==============================================================================
procedure TfrmU320.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [½Å±Ô]
//==============================================================================
procedure TfrmU320.fnCommandAdd  ;
begin
  //
end;

//==============================================================================
// fnCommandDelete [»èÁ¦]
//==============================================================================
procedure TfrmU320.fnCommandDelete;
begin
  //
end;

//==============================================================================
// fnCommandUpdate [¼öÁ¤]
//==============================================================================
procedure TfrmU320.fnCommandUpdate;
begin
  //
end;

//==============================================================================
// fnCommandExcel [¿¢¼¿]
//==============================================================================
procedure TfrmU320.fnCommandExcel;
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
      TraceLogWrite('[320] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [ÀÎ¼â]
//==============================================================================
procedure TfrmU320.fnCommandPrint;
begin
  try
    if not qryInfo.Active then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5));
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
      TraceLogWrite('[320] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [Á¶È¸]
//==============================================================================
procedure TfrmU320.fnCommandQuery;
var
  WhereStr1, WhereStr2, StrSQL : String;
  i, sIdx, eIdx : Integer;
begin
  bRecordCnt := aRecordCnt;

  WhereStr1 := '';
  //WhereStr1 := ' AND SUBSTR(MAS.TBM_NO, LENGTH(MAS.TBM_NO)-1, 2) BETWEEN ' ;
  //WhereStr2 := ' AND SUBSTR(MAS.TBM_NO, LENGTH(MAS.TBM_NO)-1, 2) BETWEEN ' ;

  //sIdx := (cbLine.ItemIndex * 16) + 1;
  //eIdx := (cbLine.ItemIndex + 1) * 16;

  //WhereStr1 := WhereStr1 + IntToStr(sIdx) + ' AND ' + IntToStr(eIdx);
  //hereStr2 := WhereStr2 + IntToStr(sIdx) + ' AND ' + IntToStr(eIdx);

  // MAT ÄÚµå
  if (Trim(edtMATCode.Text) <> '') then
  begin
    WhereStr1 := ' AND UPPER(MAS.GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;
  end;

  try
    try
      qryInfo.DisableControls;
      with qryInfo do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT DISTINCT MAS.TBM_NO, MAS.GT_MAT_CODE, ITM.MAT_SPEC GT_MAT_SPEC, ' +
                  '        MAS.VER_NO, MAS.BCR_NO, MAS.PLAN_QTY, MAS.COMP_QTY, ' +
                  '        DECODE(MAS.MCH_CARGO, ''1'', ''O'', ''X'') as MCH_CARGO, ' +
                  '        Nvl(STK.STOCK_QTY, 0) AS STOCK_QTY ' +
                  '   FROM C_TBM_S MAS, ' +
                  '        ( SELECT GT_MAT_CODE, VER_NO, COUNT(*) STOCK_QTY ' +
                  '            FROM W_STOCK_I STK ' +
                  '           GROUP BY GT_MAT_CODE, VER_NO ' +
                  '        ) STK, ' +
                  '        ( SELECT MAT_CODE, MAT_SPEC ' +
                  '            FROM C_ITM_I ' +
                  '        ) ITM ' +
                  '  WHERE MAS.GT_MAT_CODE = ITM.MAT_CODE(+) ' +
                  '    AND MAS.GT_MAT_CODE = STK.GT_MAT_CODE(+) ' +
                  '    AND MAS.VER_NO = STK.VER_NO(+) ' + WhereStr1 +
                  '  ORDER BY MAS.TBM_NO ' ;
        SQL.Text := StrSQL;
        Open;

        aRecordCnt := qryInfo.RecordCount;
        if bRecordCnt <> aRecordCnt then
             dgInfo.SelectedRows.Clear
        else dgInfo.MoveBy(SelectIdx-1);
      end;
    finally
      qryInfo.EnableControls;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[1]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[320] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL1['+StrSQL+']');
    end;
  end;

  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT SUBSTR(CARGO_INFO, ' + IntToStr(sIdx) + ', 16) as CARGO_INFO ' +
                '   FROM VW_TBMCARGO ' ;
      SQL.Text := StrSQL;
      Open;

      if not (Bof and Eof) then
      begin
        for i := 1 to 8 do
        begin
          TShape(Self.FindComponent('Shp_' + IntToStr(i))).Visible :=
          Boolean(StrToIntDef(Copy(FieldByName('CARGO_INFO').AsString, i, 1), 0));
        end;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error[2]', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[320] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL2['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [´Ý±â]
//==============================================================================
procedure TfrmU320.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [¾ð¾î]
//==============================================================================
procedure TfrmU320.fnCommandLang;
var
  i : integer;
begin
  try
    frmU320.Caption    := MainDm.M_Info.ActiveFormName;
    PnlSearch.Caption  := getLangString(FormNo, 'pSEARCH'    , 'Search'   , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMATCode.Caption := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code' , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[320] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU320.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU320.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU320.cbChange(Sender: TObject);
begin
  Display_MchID;
  fnCommandQuery;
end;

//==============================================================================
// Display_MchID
//==============================================================================
procedure TfrmU320.Display_MchID;
var
  i : Integer;
begin
//  for i := 1 to 16 do
//  begin
//    if Trim(MainDm.MACH_TBM[(cbLine.ItemIndex * 16) + i].USED) = 'N' then
//    begin
//      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Caption := 'N/A';
//      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Color   := clWhite;
//    end else
//    begin
//      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Caption := MainDm.MACH_TBM[(cbLine.ItemIndex * 16) + i].ID;
//      TPanel(Self.FindComponent('MchID_' + IntToStr(i))).Color   := clBtnFace;
//    end;
//  end;
//  LblTBMTitle1.Caption := '[ TBM' + FormatFloat('00', (cbLine.ItemIndex * 16) + 1 ) + ' - ' + 'TBM' + IntToStr((cbLine.ItemIndex * 16) + 16) + ' ]';
end;

//==============================================================================
// tmrQryTimer
//==============================================================================
procedure TfrmU320.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    if m.ConChk then fnCommandQuery;
  finally
    tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU320.sbtClearClick(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  SelectIdx := 0;
  edtMATCode.Text := '';
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [Ç°¸ñÃ£±â]
//==============================================================================
procedure TfrmU320.sbt_ITEMClick(Sender: TObject);
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
      TraceLogWrite('[320] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU320.dgInfoTitleClick(Column: TColumnEh);
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
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU320.dgInfoSelectionChanged(Sender: TObject);
begin
  if dgInfo.DataSource.DataSet.Active then
       SelectIdx := dgInfo.DataSource.DataSet.RecNo
  else SelectIdx := 0;
end;

end.




