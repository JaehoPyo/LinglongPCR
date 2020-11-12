unit U410_Pop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmU410_Pop = class(TForm)
    Pnl_Main: TPanel;
    Pnl_Sub: TPanel;
    Pnl_Top: TPanel;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    btnClose: TSpeedButton;
    Pnl_Btn0: TPanel;
    btnSave: TSpeedButton;
    Panel24: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    PnlFormName: TPanel;
    Panel16: TPanel;
    GroupBox3: TGroupBox;
    PnlLoc: TPanel;
    PnlVerNo: TPanel;
    qryCommand: TADOQuery;
    edtWeight: TEdit;
    PnlWeight: TPanel;
    edtLoc: TEdit;
    PnlCode: TPanel;
    edtCode: TEdit;
    PnlSpec: TPanel;
    edtSpec: TEdit;
    edtVerNo: TEdit;
    PnlStatus: TPanel;
    PnlBarcode: TPanel;
    edtBarcode: TEdit;
    PnlWeightJudge: TPanel;
    PnlShowJudge: TPanel;
    cbWeightJudge: TComboBox;
    cbShowJudge: TComboBox;
    cbStatus: TComboBox;
    PnlSearchCode: TPanel;
    sbt_ITEM: TSpeedButton;
    PnlSpray: TPanel;
    cbSpray: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmU410_Pop: TfrmU410_Pop;

  tLoc, tStatus, tCode, tSpec,
  tWeight, tVer, tBcr, tWgtJg, tShowJg, tSpray : String;
implementation

uses U410, ItemSearch;

{$R *.dfm}

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU410_Pop.btnSaveClick(Sender: TObject);
var
  ExecNo, SQLKind : integer ;
  StrSQL1, StrSQL2, tmpStr, RackNo, rLUGG, rSTAT, tWgt, rLUGGStr : String ;
begin
  RackNo  := edtLoc.Hint;
  SQLKind := btnSave.Tag; // 1:등록, 2:수정, 3:삭제

  if Trim(edtWeight.Text) = '' then
       tWgt := '0'
  else tWgt := Trim(edtWeight.Text);

  case cbStatus.ItemIndex of
    0 : begin rSTAT := '0' ; rLUGG := '0'; SQLKind := 3; end; //  빈셀
    1 : begin rSTAT := '0' ; rLUGG := '1'; end;               //  제품
    2 : begin rSTAT := '0' ; rLUGG := '2'; end;               //  파레트
    3 : begin rSTAT := '1' ; rLUGG := '';  end;               //  입고중
    4 : begin rSTAT := '2' ; rLUGG := '';  end;               //  출고중
    5 : begin rSTAT := '3' ; rLUGG := '';  end;               //  예약
    6 : begin rSTAT := '5' ; rLUGG := '';  end;               //  이중입고
    7 : begin rSTAT := '6' ; rLUGG := '';  end;               //  공출고
    8 : begin rSTAT := '8' ; rLUGG := '';  end;               //  금지
  end;

  //========================================================================
  // 등록이고 제품,파레트,출고중,예약으로 상태를 바꿀때 코드입력 안되있으면
  //========================================================================
  if (SQLKind = 1) and
     (cbStatus.ItemIndex in [1,2,4,5]) and
     (Trim(edtCode.Text) = '') then
  begin
    MessageDlg('Please enter code. (Regist)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  //=============================
  // 랙 재고 (W_STOCK_I)
  //=============================
  case SQLKind of
    1 :
    begin
      tmpStr := 'Regist';
      StrSQL1 := ' INSERT INTO W_STOCK_I ( ' +
                 ' STORAGE_ID, RACK_NO, GT_MAT_CODE, GT_MAT_SPEC, VER_NO, ' +
                 ' BCR_NO, WEIGHT, WGT_JUDGE, SHOW_JUDGE, SPRAY, CREATE_DT) ' +
                 ' VALUES ( ' +
                 ' ''ASRS'', ' +
                 QuotedStr(RackNo)          + ',' + QuotedStr(edtCode.Text)  + ',' +
                 QuotedStr(edtSpec.Text)    + ',' + QuotedStr(edtVerNo.Text) + ',' +
                 QuotedStr(edtBarcode.Text) + ',' + tWgt + ',' +
                 IntToStr(cbWeightJudge.ItemIndex) + ',' +
                 IntToStr(cbShowJudge.ItemIndex)   + ',' +
                 IntToStr(cbSpray.ItemIndex)       + ',' +
                 ' SYSDATE ) ';
    end;
    2 :
    begin
      tmpStr := 'Update';
      StrSQL1 := ' UPDATE W_STOCK_I ' +
                 '    SET GT_MAT_CODE = ' + QuotedStr(edtCode.Text) +
                 '      , GT_MAT_SPEC = ' + QuotedStr(edtSpec.Text) +
                 '      , VER_NO      = ' + QuotedStr(edtVerNo.Text) +
                 '      , BCR_NO      = ' + QuotedStr(edtBarcode.Text) +
                 '      , WEIGHT      = ' + tWgt +
                 '      , WGT_JUDGE   = ' + IntToStr(cbWeightJudge.ItemIndex)  +
                 '      , SHOW_JUDGE  = ' + IntToStr(cbShowJudge.ItemIndex) +
                 '      , SPRAY       = ' + IntToStr(cbSpray.ItemIndex) +
                 '      , UPDATE_DT   = SYSDATE ' +
                 '  Where RACK_NO = ' + QuotedStr(RackNo) ;
    end;
    3 :
    begin
      tmpStr := 'Delete';
      StrSQL1 := ' DELETE FROM W_STOCK_I ' +
                 '  WHERE RACK_NO = ' + QuotedStr(RackNo) ;
    end;
  end;

  //=============================
  // 랙 상태 (C_RACK_I)
  //=============================
  if rLUGG <> '' then rLUGGStr := ' , LUGG = ' + rLUGG else rLUGGStr := '';

  StrSQL2 := ' UPDATE C_RACK_I ' +
             '    SET STATUS  = ' + rSTAT + rLUGGStr +
             '  WHERE RACK_NO = ' + QuotedStr(RackNo);


  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    with qryCommand do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL2 ; // C_RACK_I
      ExecNo := ExecSQL;

      if (((SQLKind  = 3) and (btnSave.Tag = 2)) or             // 공셀 변경이고 재고데이터 있으면 (또는)
          (btnSave.Tag = 3) or                                  // 삭제
          ((SQLKind <> 3) and (Trim(edtCode.Text) <> ''))) and  // 공셀 변경아니고 코드값이 있으면
         (ExecNo > 0) then                                      // W_STOCK_I 처리
      begin
        SQL.Clear;
        SQL.Text := StrSQL1 ; // W_STOCK_I
        ExecNo := ExecSQL;

        if (ExecNo >= 0) then
        begin // C_RACK_I, W_STOCK_I - Success
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
          InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr, 'Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+']', 'SQL', StrSQL2+'|'+StrSQL1, '', '');
          TraceLogWrite('[410] Rack Data '+tmpStr+' || Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+']');
          InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr,
                        'Location['+edtLoc.Text+'], ' +
                        'State['+tStatus+'->'+cbStatus.Text+'], ' +
                        'Code['+tCode+'->'+edtCode.Text+'], ' +
                        'Spec['+tSpec+'->'+edtSpec.Text+'], ' +
                        'Weight['+tWeight+'->'+edtWeight.Text+'], ' +
                        'Version No['+tVer+'->'+edtVerNo.Text+'], ' +
                        'Barcode['+tBcr+'->'+edtBarcode.Text+'], ' +
                        'Weight Judge['+tWgtJg+'->'+cbWeightJudge.Text+'], ' +
                        'Show Judge['+tShowJg+'->'+cbShowJudge.Text+'], ' +
                        'Spray['+tSpray+'->'+cbSpray.Text+']',
                        'SQL', StrSQL2+'|'+StrSQL1, '', '');
          TraceLogWrite('[410] Rack Data '+tmpStr+' || ' +
                        'Location['+edtLoc.Text+'], ' +
                        'State['+tStatus+'->'+cbStatus.Text+'], ' +
                        'Code['+tCode+'->'+edtCode.Text+'], ' +
                        'Spec['+tSpec+'->'+edtSpec.Text+'], ' +
                        'Weight['+tWeight+'->'+edtWeight.Text+'], ' +
                        'Version No['+tVer+'->'+edtVerNo.Text+'], ' +
                        'Barcode['+tBcr+'->'+edtBarcode.Text+'], ' +
                        'Weight Judge['+tWgtJg+'->'+cbWeightJudge.Text+'], ' +
                        'Show Judge['+tShowJg+'->'+cbShowJudge.Text+'], ' +
                        'Spray['+tSpray+'->'+cbSpray.Text+']');
        end else
        begin // W_STOCK_I - Fail
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
          InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+']', 'SQL', StrSQL1, '', '');
          TraceLogWrite('[410] Rack Data '+tmpStr+' Fail || Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+'], SQL1['+StrSQL1+']')
        end;
      end else
      begin  // C_RACK_I Only Update
        if (ExecNo > 0) then
        begin
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
          InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr, 'Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+']', 'SQL', StrSQL2, '', '');
          TraceLogWrite('[410] Rack Data '+tmpStr+' || Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+']');
          InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr,
                        'Location['+edtLoc.Text+'], ' +
                        'State['+tStatus+'->'+cbStatus.Text+'], ' +
                        'Code['+tCode+'->'+edtCode.Text+'], ' +
                        'Spec['+tSpec+'->'+edtSpec.Text+'], ' +
                        'Weight['+tWeight+'->'+edtWeight.Text+'], ' +
                        'Version No['+tVer+'->'+edtVerNo.Text+'], ' +
                        'Barcode['+tBcr+'->'+edtBarcode.Text+'], ' +
                        'Weight Judge['+tWgtJg+'->'+cbWeightJudge.Text+'], ' +
                        'Show Judge['+tShowJg+'->'+cbShowJudge.Text+'], ' +
                        'Spray['+tSpray+'->'+cbSpray.Text+']',
                        'SQL', StrSQL2, '', '');
          TraceLogWrite('[410] Rack Data '+tmpStr+' || ' +
                        'Location['+edtLoc.Text+'], ' +
                        'State['+tStatus+'->'+cbStatus.Text+'], ' +
                        'Code['+tCode+'->'+edtCode.Text+'], ' +
                        'Spec['+tSpec+'->'+edtSpec.Text+'], ' +
                        'Weight['+tWeight+'->'+edtWeight.Text+'], ' +
                        'Version No['+tVer+'->'+edtVerNo.Text+'], ' +
                        'Barcode['+tBcr+'->'+edtBarcode.Text+'], ' +
                        'Weight Judge['+tWgtJg+'->'+cbWeightJudge.Text+'], ' +
                        'Show Judge['+tShowJg+'->'+cbShowJudge.Text+'], ' +
                        'Spray['+tSpray+'->'+cbSpray.Text+']');
        end else
        begin // C_RACK_I - Fail
          if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
          InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+']', 'SQL', StrSQL2, '', '');
          TraceLogWrite('[410] Rack Data '+tmpStr+' Fail || Location['+edtLoc.Text+'], State['+cbStatus.Text+'], Code['+edtCode.Text+'], Barcode['+edtBarcode.Text+'], SQL2['+StrSQL2+']')
        end;
      end;
      Close;
    end;
    frmU410.fnCommandQuery;
    frmU410.fnCommandQuerySub;
    Close;
  except
    on E : Exception do
    begin
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      qryCommand.Close;
      MessageDlg('Rack Data ' +tmpStr+ ' Failed.' + #13#10 + #13#10 + '['+E.Message+']' , mtWarning, [mbYes], 0) ;
      InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'Exception Error', 'SQL', StrSQL1+'|'+StrSQL2, '', E.Message);
      TraceLogWrite('[410] procedure btnSaveClick(Popup) Fail || ERR['+E.Message+'], SQL1['+StrSQL1+'], SQL2['+StrSQL2+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU410_Pop.FormActivate(Sender: TObject);
begin
  frmU410.tmrQry.Enabled := False;
  if btnSave.Tag = 1 then // 등록
    cbStatus.SetFocus
  else
  if btnSave.Tag = 2 then // 수정
    edtCode.SetFocus
  else
  if btnSave.Tag = 3 then
    Pnl_Btn0.SetFocus;

  tLoc    := edtLoc.Text;
  if btnSave.Tag = 3 then
       tStatus := cbStatus.Hint
  else tStatus := cbStatus.Text;
  tCode   := edtCode.Text;
  tSpec   := edtSpec.Text;
  tWeight := edtWeight.Text;
  tVer    := edtVerNo.Text;
  tBcr    := edtBarcode.Text;
  tWgtJg  := cbWeightJudge.Text;
  tShowJg := cbShowJudge.Text;
  tSpray  := cbSpray.Text;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU410_Pop.FormDeactivate(Sender: TObject);
begin
  qryCommand.Active := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU410_Pop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCommand.Active := False;
  if not frmU410.tmrQry.Enabled then frmU410.tmrQry.Enabled := True;

  Action := Cafree;
  try frmU410_Pop := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmU410_Pop.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU410_Pop.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btnSaveClick(nil);
  end else
  if key = #27 then
  begin
    Close;
  end;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU410_Pop.sbt_ITEMClick(Sender: TObject);
begin
  try
    frmItemSearch := TfrmItemSearch.Create(Application);
    frmItemSearch.edtCode.Text := edtCode.Text;
    frmItemSearch.ShowModal ;

    if m.Popup_ItemInfo.ResultCd = 'OK' then
    begin
      edtCode.Text := m.Popup_ItemInfo.DATA01;
      edtSpec.Text := m.Popup_ItemInfo.DATA02;
      edtCode.SetFocus;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'sbt_ITEMClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[410] procedure sbt_ITEMClick(Popup) || ERR['+E.Message+']');
    end;
  end;
end;

end.
