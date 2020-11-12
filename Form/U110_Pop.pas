unit U110_Pop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmU110_Pop = class(TForm)
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
    PnlCode: TPanel;
    PnlIdiameter: TPanel;
    qryCommand: TADOQuery;
    qrySearch: TADOQuery;
    edtEdiameter: TEdit;
    PnlEdiameter: TPanel;
    edtCode: TEdit;
    PnlWeight: TPanel;
    edtWeight: TEdit;
    PnlHeight: TPanel;
    edtHeight: TEdit;
    edtIdiameter: TEdit;
    qryTemp: TADOQuery;
    PnlSpec: TPanel;
    edtSpec: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetItemList;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmU110_Pop: TfrmU110_Pop;

implementation

uses U110;

{$R *.dfm}

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU110_Pop.btnSaveClick(Sender: TObject);
var
  ExecNo : integer ;
  StrSQL, tmpStr : String ;
begin
  //================================
  // 데이터 체크
  //================================
  if Trim(edtCode.Text) = ''  then
  begin
    edtCode.SetFocus;
    MessageDlg('Check the MAT Code.', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  //================================
  // 코드데이터 처리
  //================================
  if btnSave.Tag = 1 then // 등록
  begin
    tmpStr := 'Regist';
    StrSQL := ' INSERT INTO C_ITM_I ( ' +
              '     MAT_CODE, MAT_SPEC, WEIGHT, HEIGHT, ' +
              '     OT_DIAMETER, IN_DIAMETER, UPD_DT, INS_DT, INS_ID )  ' +
              '   VALUES( ' +
              QuotedStr(edtCode.Text) + ',' +
              QuotedStr(edtSpec.Text) + ',' +
              FormatFloat('######0.000', StrToFloatDef(Trim(edtWeight.Text   ), 0)) + ',' +
              FormatFloat('######0.000', StrToFloatDef(Trim(edtHeight.Text   ), 0)) + ',' +
              FormatFloat('######0.000', StrToFloatDef(Trim(edtEdiameter.Text), 0)) + ',' +
              FormatFloat('######0.000', StrToFloatDef(Trim(edtIdiameter.Text), 0)) + ',' +
              ' SYSDATE , '+
              ' SYSDATE , '+
              QuotedStr(MainDm.M_Info.UserCode) + ')' ;
  end else
  if btnSave.Tag = 2 then // 수정
  begin
    tmpStr := 'Update';
    StrSQL := ' UPDATE C_ITM_I ' +
            	'    SET MAT_SPEC = ' + QuotedStr(edtSpec.Text) +
              '      , WEIGHT = ' + FormatFloat('######0.000', StrToFloatDef(Trim(edtWeight.Text), 0)) +
              '      , HEIGHT = ' + FormatFloat('######0.000', StrToFloatDef(Trim(edtHeight.Text), 0)) +
              '      , OT_DIAMETER = ' + FormatFloat('######0.000', StrToFloatDef(Trim(edtEdiameter.Text), 0)) +
              '      , IN_DIAMETER = ' + FormatFloat('######0.000', StrToFloatDef(Trim(edtIdiameter.Text), 0)) +
              '      , UPD_DT = SYSDATE ' +
              '      , UPD_ID = ' + QuotedStr(MainDm.M_Info.UserCode) +
              ' WHERE MAT_CODE = ' + QuotedStr(edtCode.Text) ;
  end;

  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL ;
      ExecNo := ExecSQL;

      if (ExecNo > 0) then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr, 'Item Code['+edtCode.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[110] Code '+tmpStr+' || Code['+edtCode.Text+'], User['+MainDm.M_Info.UserCode+']');
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'Item Code['+edtCode.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[110] Code '+tmpStr+' Fail || Code['+edtCode.Text+'], User['+MainDm.M_Info.UserCode+']')
      end;
      Close;
    end;
    frmU110.fnCommandQuery;
    Close;
  except
    on E : Exception do
    begin
      qryCommand.Close;
      MessageDlg('Code ' +tmpStr+ ' Failed.' + #13#10 + #13#10 + '['+E.Message+']' , mtWarning, [mbYes], 0) ;
      InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[110] procedure btnSaveClick(Popup) Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU110_Pop.FormActivate(Sender: TObject);
begin
  SetItemList;
  if btnSave.Tag = 1 then edtCode.SetFocus   // 등록
  else                    edtSpec.SetFocus;  // 수정
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU110_Pop.FormDeactivate(Sender: TObject);
begin
  qryCommand.Active := False;
  qrySearch.Active  := False;
  qryTemp.Active    := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU110_Pop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCommand.Active := False;
  qrySearch.Active  := False;
  qryTemp.Active    := False;

  Action := Cafree;
  try frmU110_Pop := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmU110_Pop.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// SetItemList
//==============================================================================
procedure TfrmU110_Pop.SetItemList;
begin
//
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU110_Pop.KeyPress(Sender: TObject; var Key: Char);
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

end.
