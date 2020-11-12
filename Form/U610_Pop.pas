unit U610_Pop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmU610_Pop = class(TForm)
    Pnl_Main: TPanel;
    Pnl_Sub: TPanel;
    Pnl_Top: TPanel;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    Pnl_Btn0: TPanel;
    Panel24: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    GroupBox3: TGroupBox;
    PnlUSERID: TPanel;
    PnlGrade: TPanel;
    qryCommand: TADOQuery;
    qrySearch: TADOQuery;
    cbGrade: TComboBox;
    edtUSERID: TEdit;
    PnlPW: TPanel;
    edtPW: TEdit;
    PnlPWCheck: TPanel;
    edtPWCheck: TEdit;
    PnlCurrPW: TPanel;
    edtCurrPW: TEdit;
    qryTemp: TADOQuery;
    PnlUSERNM: TPanel;
    edtUSERNM: TEdit;
    PnlFormName: TPanel;
    btnSave: TSpeedButton;
    btnClose: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure USERKeyPress(Sender: TObject; var Key: Char);
    procedure edtPWCheckChange(Sender: TObject);
    procedure edtCurrPWChange(Sender: TObject);
  private
    procedure SetItemList;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmU610_Pop: TfrmU610_Pop;

implementation

uses Main, U610;

{$R *.dfm}

//==============================================================================
// btnSaveClick
//==============================================================================
procedure TfrmU610_Pop.btnSaveClick(Sender: TObject);
var
  ExecNo : integer ;
  StrSQL, tmpStr : String ;
begin
  //================================
  // 데이터 체크
  //================================
  if Trim(edtUSERID.Text) = ''  then
  begin
    edtUSERID.SetFocus;
    MessageDlg('Check the User Code.', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtPW.Text) = '' then
  begin
    edtPW.SetFocus;
    MessageDlg('Check the Password(1).', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtPWCheck.Text) = '' then
  begin
    edtPWCheck.SetFocus;
    MessageDlg('Check the Password(2).', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if Trim(edtPW.Text) <> Trim(edtPWCheck.Text) then
  begin
    edtPWCheck.SetFocus;
    edtPWCheck.Color := $00BFBFFF;
    MessageDlg('User password is not the same.', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if (btnSave.Tag = 2) and (Trim(edtCurrPW.Text) = '') then
  begin
    edtCurrPW.SetFocus;
    MessageDlg('Please enter your current password.', mtConfirmation, [mbYes], 0) ;
    Exit;
  end;

  if (btnSave.Tag = 2) and
     (MainDM.fnTableDataGet('610', 'C_USER_I', 'PASSWORD', 'S', 'USER_ID='+QuotedStr(UpperCase(edtUSERID.Text))) <> edtCurrPW.Text) then
  begin
    edtCurrPW.SetFocus;
    edtCurrPW.Color := $00BFBFFF;
    MessageDlg('Please confirm your current password.', mtWarning, [mbYes], 0) ;
    Exit;
  end;

  //================================
  // 코드데이터 처리
  //================================
  if btnSave.Tag = 1 then // 등록
  begin
    tmpStr := 'Regist';
    StrSQL := ' INSERT INTO C_USER_I ( ' +
              '     USER_ID, USER_NAME, USER_USED, USER_GRADE, ' +
              '     PASSWORD, CR_DATE, UP_DATE ) ' +
              '   VALUES( ' +
              QuotedStr(UpperCase(edtUSERID.Text))   + ',' +
              QuotedStr(edtUSERNM.Text)              + ',' +
              ' ''Y'', ' +
              QuotedStr(IntToStr(cbGrade.ItemIndex)) + ',' +
              QuotedStr(edtPW.Text)                  + ',' +
              ' SYSDATE, ' +
              ' NULL) ' ;
  end else
  if btnSave.Tag = 2 then // 수정
  begin
    tmpStr := 'Update';
    StrSQL := ' UPDATE C_USER_I ' +
            	'    SET USER_NAME  = ' + QuotedStr(edtUSERNM.Text) +
              '      , USER_GRADE = ' + QuotedStr(IntToStr(cbGrade.ItemIndex)) +
              '      , PASSWORD   = ' + QuotedStr(edtPW.Text) +
              '      , UP_DATE      = SYSDATE ' +
              ' WHERE UPPER(USER_ID) = ' + QuotedStr(UpperCase(edtUSERID.Text)) +
              '   AND PASSWORD       = ' + QuotedStr(edtCurrPW.Text) ;
  end;

  try
    with qryCommand do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL ;
      ExecNo := ExecSQL;

      if (ExecNo > 0) and (btnSave.Tag = 1) then // 등록
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr, 'User Code['+edtUSERID.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[610] User '+tmpStr+' || User Code['+UpperCase(edtUSERID.Text)+'], '+tmpStr+' User['+MainDm.M_Info.UserCode+']');
      end else
      if (ExecNo > 0) and (btnSave.Tag = 2) then // 수정
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'btnSaveClick', tmpStr, 'User Code['+edtUSERID.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[610] User '+tmpStr+' || User Code['+UpperCase(edtUSERID.Text)+'], '+tmpStr+' User['+MainDm.M_Info.UserCode+']');
        if UpperCase(MainDM.M_Info.UserCode) = UpperCase(edtUSERID.Text) then
        begin
          MainDM.M_Info.UserName  := edtUSERNM.Text;               // 사용자명
          MainDM.M_Info.UserGrade := IntToStr(cbGrade.ItemIndex);  // 사용자권한
          MainDM.M_Info.UserPwd   := edtPW.Text;                   // 비밀번호

          frmMain.staLoginInfo.Panels[4].Text := MainDm.M_Info.UserCode + ' / ' + MainDm.M_Info.UserName ;
        end;
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'User Code['+edtUSERID.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[610] User '+tmpStr+' Fail || User Code['+UpperCase(edtUSERID.Text)+'], '+tmpStr+' User['+MainDm.M_Info.UserCode+']');
      end;
      Close;
    end;
    frmU610.SetComboBox ;
    frmU610.fnCommandQuery;
    Close;
  except
    on E : Exception do
    begin
      qryCommand.Close;
      MessageDlg('Code ' +tmpStr+ ' Failed.' + #13#10 + #13#10 + '['+E.Message+']' , mtWarning, [mbYes], 0) ;
      InsertPGMHist('['+FormNo+']', 'E', 'btnSaveClick', tmpStr, 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[610] procedure btnSaveClick(Popup) Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU610_Pop.FormActivate(Sender: TObject);
begin
  SetItemList;
  if btnSave.Tag = 1 then edtUSERID.SetFocus   // 등록
  else                    edtUSERNM.SetFocus;  // 수정
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU610_Pop.FormDeactivate(Sender: TObject);
begin
  qryCommand.Active := False;
  qrySearch.Active  := False;
  qryTemp.Active    := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU610_Pop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCommand.Active := False;
  qrySearch.Active  := False;
  qryTemp.Active    := False;

  Action := Cafree;
  try frmU610_Pop := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmU610_Pop.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// SetItemList
//==============================================================================
procedure TfrmU610_Pop.SetItemList;
begin
//
end;

//==============================================================================
// USERKeyPress
//==============================================================================
procedure TfrmU610_Pop.USERKeyPress(Sender: TObject; var Key: Char);
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
// edtPWCheckChange
//==============================================================================
procedure TfrmU610_Pop.edtPWCheckChange(Sender: TObject);
begin
  if Trim(edtPW.Text) <> '' then
  begin
    if Copy(edtPW.Text, 1, Length((Sender as TEdit).Text)) <> (Sender as TEdit).Text then
    begin
      (Sender as TEdit).Color := $00BFBFFF;
    end else
    if Copy(edtPW.Text, 1, Length((Sender as TEdit).Text)) = (Sender as TEdit).Text then
    begin
      (Sender as TEdit).Color := clWhite;
    end;

    if edtPW.Text = (Sender as TEdit).Text then
    begin
      (Sender as TEdit).Color := $0084FF84;
    end;
  end;
end;

//==============================================================================
// edtCurrPWChange
//==============================================================================
procedure TfrmU610_Pop.edtCurrPWChange(Sender: TObject);
begin
  if (Sender as TEdit).Color = $00BFBFFF then
  begin
    (Sender as TEdit).Color := clWhite;
  end;
end;

end.
