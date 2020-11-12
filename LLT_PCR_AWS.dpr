program LLT_PCR_AWS;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  d_MainDm in 'Lib\d_MainDm.pas' {MainDm: TDataModule},
  h_MainLib in 'Lib\h_MainLib.pas',
  h_ReferLib in 'Lib\h_ReferLib.pas',
  Main in 'Form\Main.pas' {frmMain},
  Login in 'Form\Login.pas' {frmLoginBox},
  ItemSearch in 'Form\ItemSearch.pas' {frmItemSearch},
  U110 in 'Form\U110.pas' {frmU110},
  U610 in 'Form\U610.pas' {frmU610},
  U110_Pop in 'Form\U110_Pop.pas' {frmU110_Pop},
  U610_Pop in 'Form\U610_Pop.pas' {frmU610_Pop},
  U630 in 'Form\U630.pas' {frmU630},
  U510 in 'Form\U510.pas' {frmU510},
  U640 in 'Form\U640.pas' {frmU640},
  U620 in 'Form\U620.pas' {frmU620},
  U650 in 'Form\U650.pas' {frmU650},
  U520 in 'Form\U520.pas' {frmU520},
  U420 in 'Form\U420.pas' {frmU420},
  U430 in 'Form\U430.pas' {frmU430},
  U530 in 'Form\U530.pas' {frmU530},
  U540 in 'Form\U540.pas' {frmU540},
  U550 in 'Form\U550.pas' {frmU550},
  U410 in 'Form\U410.pas' {frmU410},
  U410_Pop in 'Form\U410_Pop.pas' {frmU410_Pop},
  U120 in 'Form\U120.pas' {frmU120},
  U130 in 'Form\U130.pas' {frmU130},
  U560 in 'Form\U560.pas' {frmU560},
  U340 in 'Form\U340.pas' {frmU340},
  U330 in 'Form\U330.pas' {frmU330},
  U320 in 'Form\U320.pas' {frmU320},
  U350 in 'Form\U350.pas' {frmU350},
  U210 in 'Form\U210.pas' {frmU210},
  U220 in 'Form\U220.pas' {frmU220},
  U310 in 'Form\U310.pas' {frmU310};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Linglong PCR Auto Warehouse Management System';
  Application.CreateForm(TMainDm, MainDm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
