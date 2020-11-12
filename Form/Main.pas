unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ToolWin, Menus, ExtCtrls,  StdCtrls, DB, ADODB,
  d_MainDm, h_MainLib, h_ReferLib, Grids, DBGrids, DBCtrls, Mask,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Imaging.GIFImg, ShellAPI, CPort, Vcl.Tabs;
type
  TTabSetState = (tsAdd, tsTabChange, tsFormChange, tsDelete);

  PTabRecord = ^TTabRecord;

  TTabRecord = record
    FormRef : TForm;
  end;

type
  TfrmMain = class(TForm)
    Pnl_Top : TPanel;
    staLoginInfo: TStatusBar;
    tmrSystem: TTimer;
    GroupBox1: TGroupBox;
    ImageUp: TImage;
    ImageDown: TImage;
    ImageMenuO: TImage;
    ImageMenuX: TImage;
    Img_Menu: TImage;
    tmrConnectCheck: TTimer;
    qryDBChk: TADOQuery;
    Pnl_MenuBasic: TPanel;
    Panel1: TPanel;
    Pnl_Menu: TPanel;
    PnlMenusize5: TPanel;
    PnlMenuSizeSub5: TPanel;
    PnlMenu5: TPanel;
    shp500T: TShape;
    shp500L: TShape;
    shp500R: TShape;
    PnlMenuTile5: TPanel;
    Shape11: TShape;
    Shape12: TShape;
    ImgMenusize5: TImage;
    Image14: TImage;
    img500: TImage;
    lbl500: TLabel;
    PnlMenuBot5: TPanel;
    Shape13: TShape;
    PnlMenuTop5: TPanel;
    Shape14: TShape;
    PnlMenusize4: TPanel;
    PnlMenuSizeSub4: TPanel;
    PnlMenu4: TPanel;
    shp400T: TShape;
    shp400L: TShape;
    shp400R: TShape;
    PnlMenuTile4: TPanel;
    Shape25: TShape;
    Shape26: TShape;
    ImgMenusize4: TImage;
    Image30: TImage;
    img400: TImage;
    lbl400: TLabel;
    PnlMenuBot4: TPanel;
    Shape27: TShape;
    PnlMenuTop4: TPanel;
    Shape28: TShape;
    PnlMenusize3: TPanel;
    PnlMenuSizeSub3: TPanel;
    PnlMenu3: TPanel;
    shp300T: TShape;
    shp300L: TShape;
    shp300R: TShape;
    PnlMenuTile3: TPanel;
    Shape38: TShape;
    Shape39: TShape;
    ImgMenusize3: TImage;
    Image38: TImage;
    img300: TImage;
    lbl300: TLabel;
    PnlMenuBot3: TPanel;
    Shape40: TShape;
    PnlMenuTop3: TPanel;
    Shape41: TShape;
    PnlMenusize2: TPanel;
    PnlMenuSizeSub2: TPanel;
    PnlMenuBot2: TPanel;
    Shape47: TShape;
    PnlMenuTop2: TPanel;
    Shape48: TShape;
    PnlMenu2: TPanel;
    shp200T: TShape;
    shp200L: TShape;
    shp200R: TShape;
    PnlMenuTile2: TPanel;
    Shape45: TShape;
    Shape46: TShape;
    ImgMenusize2: TImage;
    Image46: TImage;
    img200: TImage;
    lbl200: TLabel;
    PnlMenusize1: TPanel;
    PnlMenuSizeSub1: TPanel;
    PnlMenuBot1: TPanel;
    Shape54: TShape;
    PnlMenu1: TPanel;
    shp100T: TShape;
    shp100L: TShape;
    shp100R: TShape;
    PnlMenuTile1: TPanel;
    shp100TL: TShape;
    shp100TR: TShape;
    ImgMenusize1: TImage;
    Image4: TImage;
    img100: TImage;
    lbl100: TLabel;
    PnlMenuTop1: TPanel;
    Shape55: TShape;
    qryCommChk: TADOQuery;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    qryPermit: TADOQuery;
    PnlMenusize6: TPanel;
    PnlMenuSizeSub6: TPanel;
    PnlMenu6: TPanel;
    shp600T: TShape;
    shp600L: TShape;
    shp600R: TShape;
    PnlMenuTile6: TPanel;
    Shape58: TShape;
    Shape59: TShape;
    ImgMenusize6: TImage;
    Image8: TImage;
    img600: TImage;
    lbl600: TLabel;
    PnlMenuBot6: TPanel;
    Shape60: TShape;
    Shape61: TShape;
    Shape62: TShape;
    PnlMenuTop6: TPanel;
    Shape63: TShape;
    Shape64: TShape;
    Shape65: TShape;
    PnlMenuSize: TPanel;
    Shape76: TShape;
    Img_MenuDetect: TImage;
    Img_MenusizeDown: TImage;
    Img_MenusizeUp: TImage;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    cmdEXCEL: TSpeedButton;
    Pnl_Btn6: TPanel;
    cmdPRINT: TSpeedButton;
    Pnl_Btn7: TPanel;
    Pnl_Btn10: TPanel;
    cmdCLOSE: TSpeedButton;
    Pnl_Btn2: TPanel;
    cmdREGISTER: TSpeedButton;
    Pnl_Btn8: TPanel;
    cmdPREV: TSpeedButton;
    Pnl_Btn9: TPanel;
    cmdNEXT: TSpeedButton;
    Pnl_Btn3: TPanel;
    cmdDELETE: TSpeedButton;
    Panel7: TPanel;
    Pnl_Btn1: TPanel;
    cmdINQUIRY: TSpeedButton;
    cmdORDER: TSpeedButton;
    Panel53: TPanel;
    Panel4: TPanel;
    Shape49: TShape;
    Shape52: TShape;
    Pan120: TPanel;
    Shape69: TShape;
    Shape73: TShape;
    shp120: TShape;
    lbl120: TLabel;
    Img120: TImage;
    Pan110: TPanel;
    Shape75: TShape;
    Shape77: TShape;
    shp110: TShape;
    lbl110: TLabel;
    Img110: TImage;
    Panel13: TPanel;
    Shape82: TShape;
    Shape83: TShape;
    Panel16: TPanel;
    Shape84: TShape;
    Shape85: TShape;
    Panel5: TPanel;
    Shape68: TShape;
    Shape72: TShape;
    Panel6: TPanel;
    Shape74: TShape;
    Shape78: TShape;
    Panel8: TPanel;
    Shape81: TShape;
    Shape90: TShape;
    Pan220: TPanel;
    Shape103: TShape;
    Shape104: TShape;
    shp220: TShape;
    lbl220: TLabel;
    Img220: TImage;
    Pan210: TPanel;
    Shape106: TShape;
    Shape107: TShape;
    shp210: TShape;
    lbl210: TLabel;
    Img210: TImage;
    Panel9: TPanel;
    Panel19: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel28: TPanel;
    Pan340: TPanel;
    Shape50: TShape;
    Shape51: TShape;
    Shp340: TShape;
    lbl340: TLabel;
    Img340: TImage;
    Pan310: TPanel;
    Shape67: TShape;
    Shape70: TShape;
    Shp310: TShape;
    lbl310: TLabel;
    Img310: TImage;
    Pan330: TPanel;
    Shape93: TShape;
    Shape96: TShape;
    Shp330: TShape;
    lbl330: TLabel;
    Img330: TImage;
    Pan320: TPanel;
    Shape102: TShape;
    Shape105: TShape;
    Shp320: TShape;
    lbl320: TLabel;
    Img320: TImage;
    Pan430: TPanel;
    Shape92: TShape;
    Shape99: TShape;
    Shp430: TShape;
    lbl430: TLabel;
    Img430: TImage;
    Pan420: TPanel;
    Shape109: TShape;
    Shape110: TShape;
    Shp420: TShape;
    lbl420: TLabel;
    Img420: TImage;
    Pan410: TPanel;
    Shape112: TShape;
    Shape113: TShape;
    Shp410: TShape;
    lbl410: TLabel;
    Img410: TImage;
    Pan550: TPanel;
    Shape115: TShape;
    Shape116: TShape;
    Shp550: TShape;
    lbl550: TLabel;
    Img550: TImage;
    Pan540: TPanel;
    Shape118: TShape;
    Shape119: TShape;
    Shp540: TShape;
    lbl540: TLabel;
    Img540: TImage;
    Pan520: TPanel;
    Shape121: TShape;
    Shape122: TShape;
    Shp520: TShape;
    lbl520: TLabel;
    Img520: TImage;
    Pan510: TPanel;
    Shape124: TShape;
    Shape125: TShape;
    Shp510: TShape;
    lbl510: TLabel;
    Img510: TImage;
    Pan610: TPanel;
    Shape66: TShape;
    Shape71: TShape;
    Shp610: TShape;
    lbl610: TLabel;
    Img610: TImage;
    Pan620: TPanel;
    Shape127: TShape;
    Shape128: TShape;
    Shp620: TShape;
    lbl620: TLabel;
    Img620: TImage;
    Pan630: TPanel;
    Shape10: TShape;
    Shape22: TShape;
    Shp630: TShape;
    lbl630: TLabel;
    img630: TImage;
    tmrLogFileCheck: TTimer;
    Pan350: TPanel;
    Shape30: TShape;
    Shape31: TShape;
    Shp350: TShape;
    lbl350: TLabel;
    Img350: TImage;
    Panel2: TPanel;
    PnlTitle: TPanel;
    Panel10: TPanel;
    LblMenu000: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Pan530: TPanel;
    Shape43: TShape;
    Shape44: TShape;
    Shp530: TShape;
    lbl530: TLabel;
    Img530: TImage;
    PnlDatabaseConn: TPanel;
    LblDatabaseConn: TLabel;
    PnlLanguage: TPanel;
    LblLang3: TLabel;
    LblLang2: TLabel;
    LblLang1: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Pan130: TPanel;
    Shape53: TShape;
    Shape79: TShape;
    shp130: TShape;
    lbl130: TLabel;
    Img130: TImage;
    Pan560: TPanel;
    Shape8: TShape;
    Shape9: TShape;
    Shp560: TShape;
    lbl560: TLabel;
    Img560: TImage;
    Pan640: TPanel;
    Shape24: TShape;
    Shape29: TShape;
    Shp640: TShape;
    lbl640: TLabel;
    img640: TImage;
    Pan650: TPanel;
    Shape56: TShape;
    Shape57: TShape;
    Shp650: TShape;
    lbl650: TLabel;
    img650: TImage;
    Pan660: TPanel;
    Shape86: TShape;
    Shape87: TShape;
    Shp660: TShape;
    lbl660: TLabel;
    img660: TImage;
    Panel14: TPanel;
    Image6: TImage;
    Panel15: TPanel;
    Pnl_Btn4: TPanel;
    cmdUPDATE: TSpeedButton;
    Panel17: TPanel;
    lblVerSion: TLabel;
    Label1: TLabel;
    Panel18: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Image1: TImage;
    Panel26: TPanel;
    tsMain: TTabSet;
    qryTemp: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    btnFreeLoc: TButton;
    Panel3: TPanel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    qty: TLabel;
    Label2: TLabel;
    SP_PD_GET_FREE_LOC: TADOStoredProc;
    Label3: TLabel;
    cbsc: TComboBox;
    Edit3: TEdit;
    Label4: TLabel;
    PnlMFCInterfaceConn: TPanel;
    LblMFCInterfaceConn: TLabel;
    PnlMESInterfaceConn: TPanel;
    LblMESInterfaceConn: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnClick(Sender: TObject);
    procedure execMenuLblClick(Sender: TObject);
    procedure ImgMenusizeClick(Sender: TObject);
    procedure Img_MenuIconUpClick(Sender: TObject);
    procedure tmrSystemTimer(Sender: TObject);
    procedure lblMenuMouseLeave(Sender: TObject);
    procedure lblMenuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure tmrConnectCheckTimer(Sender: TObject);
    procedure execLoginClick(Sender: TObject);
    procedure staLoginInfoDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure tmrLogFileCheckTimer(Sender: TObject);
    procedure LblLangDblClick(Sender: TObject);
    procedure tsMainClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnFreeLocClick(Sender: TObject);
  private
    { Private declarations }
    procedure execMenuActive( Menu_Number : Integer );
  public
    { Public declarations }
    procedure WmMsgRecv(var Message: TMessage); message WM_USER;
    function  fnDBConChk: Boolean;
    procedure fnCloseSet;
    procedure CloseChkMsg(Sender: TObject);

    // 계정 권한 관련
    procedure fnMenuPermit;

    // 설비명 관련
    procedure fnGetMachInfo;

    // 로그자동삭제 관련
    procedure LogFileDelete;
    Function  DeleteRecodingFile(fileDir: string; iOption: integer): boolean;
    function  MinDeleteFile(const DirName : string; const UseRecycleBin: Boolean): Boolean;

    // 언어 변경 관련
    procedure fnNameChange;

    // TabSet 관련 함수
    procedure TabSetDisplay(AFormRef: TForm; TabSetState: TTabSetState);
    function  FnIsCreated(Const formName: String): Boolean;

    procedure CreateConfig;
  end;

Const
  FormNo = '000';

var
  frmMain: TfrmMain;
  amenu : Array [1..6] of integer;
  menuGrade : Array [1..6,1..10] of TMENU_GRADE;
  DeleteOption : integer ;
implementation

uses Login,
     U110, U120, U130,
     U210, U220,
     U310, U320, U330, U340, U350,
     U410, U420, U430,
     U510, U520, U530, U540, U550, U560,
     U610, U620, U630, U640, U650;

{$R *.dfm}

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmMain.FormCreate(Sender: TObject);
var
  TmpVer : String;
begin
  try
    m.MainHd := Handle;
    MainDm.M_Info.ReLogin := False;
    CloseChk := False ;

    TmpVer := fnGetFileVersionInfo(Application.Exename);
    MainDm.pVersion := 'v' + TmpVer;
    lblVerSion.Caption := 'Version ' + TmpVer;

    MainDm.M_Info.ActivePCName := SysGetComputerName; // PC Name
    MainDm.M_Info.ActivePCAddr := SysGetLocalIp(1);   // PC Ip-Address

    execLoginClick(nil) ;

    CreateConfig;

    fnWmMsgSend(2222222, 222);

    Application.HintPause := 250;
    Application.HintHidePause := 6000;

    // 로그 삭제 옵션
    DeleteOption := StrToIntDef(IniRead(INI_PATH, 'Delete', 'DeleteOption', '0'), 0);
    LogFileDelete; // 프로그램 시작 시 로그 삭제

    InsertPGMHist('[Main]', 'N', 'FormCreate', '', 'Program Start ' + MainDm.pVersion, 'PGM', '', '', '');
    TraceLogWrite('Program Start ' + MainDm.pVersion + ' ['+MainDm.M_Info.UserCode+']');
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'FormCreate', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure FormCreate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmMain.FormActivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormCloseQuery
//==============================================================================
procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not CloseChk then
  begin
    CloseChkMsg(nil);
    CanClose := False;
  end;
end;

//==============================================================================
// CloseChkMsg
//==============================================================================
procedure TfrmMain.CloseChkMsg(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to exit the program?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CloseChk := True ;
    Close;
  end;
end;

//==============================================================================
// fnCloseSet
//==============================================================================
procedure TfrmMain.fnCloseSet;
begin
  tmrSystem.Enabled       := False;
  tmrConnectCheck.Enabled := False;
  tmrLogFileCheck.Enabled := False;

  qryCommChk.Active := False;
  qryDBChk.Active   := False;
  qryPermit.Active  := False;
  qryTemp.Active    := False;

  if MainDM.MainDatabase.Connected then MainDM.MainDatabase.Close ;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MainDm.MainDatabase.Connected then
    InsertPGMHist('[Main]', 'N', 'FormClose', '', 'Program Close ' + MainDm.pVersion, 'PGM', '', '', '');
  TraceLogWrite('Program Close ' + MainDm.pVersion + ' ['+MainDm.M_Info.UserCode+']');
  fnCloseSet;
  ExitProcess(0);
end;

//==============================================================================
// WmMsgRecv (툴바 버튼 활성화 여부)
//==============================================================================
procedure TfrmMain.WmMsgRecv(var Message: TMessage);
  Procedure ToolBtnSet(TBtnNo: Integer; Status: String);
  var
    BtnStatus : Boolean;
  begin
    if   Status = '1' then BtnStatus := True else BtnStatus := False;
    case TBtnNo of
      1  : cmdORDER.Enabled    := BtnStatus ; // 지시
      2  : cmdREGISTER.Enabled := BtnStatus ; // 등록
      3  : cmdDELETE.Enabled   := BtnStatus ; // 삭제
      4  : cmdUPDATE.Enabled   := BtnStatus ; // 삭제
      5  : cmdEXCEL.Enabled    := BtnStatus ; // 엑셀
      6  : cmdPRINT.Enabled    := BtnStatus ; // 인쇄
      7  : cmdINQUIRY.Enabled  := BtnStatus ; // 조회
      8  : cmdPREV.Enabled     := BtnStatus ; // 이전
      9  : cmdNEXT.Enabled     := BtnStatus ; // 다음
      10 : cmdCLOSE.Enabled    := BtnStatus ; // 닫기
    end;
  end;
var
  i : Integer;
  RecvStr : String;
begin
  RecvStr := IntToStr(Message.WParam) + IntToStr(Message.LParam);

  for i := 1 to Length(RecvStr) do
  begin
    ToolBtnSet(i, Copy(RecvStr, i , 1));
  end;
end;

//==============================================================================
// CreateConfig
//==============================================================================
procedure TfrmMain.CreateConfig;
var
  tFName, tFSize, tFPath, tCDate, tADate, tUDate, TitleStr : String;
begin
  try
    if not DirectoryExists('.\Log') then ForceDirectories('.\Log');

    MainDm.M_Info.ActiveFormID := '000';
    MainDm.M_Info.LANG_PGM     := fnMenuNameGetRecord(MainDm.M_Info.WRHS, MainDm.M_Info.LANG_TYPE);
    MainDm.M_Info.LANG_FORM    := fnNameGetRecord(MainDm.M_Info.WRHS, MainDm.M_Info.ActiveFormID, MainDm.M_Info.LANG_TYPE);
    fnNameChange;

    frmMain.Caption    := IniRead(INI_PATH, 'PROGRAM', 'ProgramName', '') + ' ' +
                          getLangString(FormNo, 'bTITLE', frmMain.Caption, MainDm.M_Info.LANG_TYPE, 'N') + ' ' + MainDm.pVersion;
    frmMain.Hint       := getLangString(FormNo, 'bTITLE', frmMain.Caption, MainDm.M_Info.LANG_TYPE, 'N') + ' ' + MainDm.pVersion;
    LblMenu000.Caption := frmMain.Hint;
    MainDm.M_Info.ActiveFormName := frmMain.Hint;

    fnDBConChk;
    staLoginInfo.Panels[02].Text := IniRead(INI_PATH, 'PROGRAM', 'CompanyName', '');
    staLoginInfo.Panels[03].Text := IniRead(INI_PATH, 'PROGRAM', 'CompanyKind', '');

    staLoginInfo.Panels[06].Text := MainDm.M_Info.ActivePCName + ' [' + MainDm.M_Info.ActivePCAddr + ']';
    staLoginInfo.Panels[07].Text := FormatDateTime( 'YYYY-MM-DD HH:NN:SS', Now);
    staLoginInfo.Panels[11].Text := '';

    staLoginInfo.Panels[00].Style := psOwnerDraw ;
    PnlMenuSize.Parent := staLoginInfo ;

    staLoginInfo.Panels[01].Style := psOwnerDraw ;
    PnlLanguage.Parent := staLoginInfo ;

    staLoginInfo.Panels[08].Style := psOwnerDraw ;
    PnlMFCInterfaceConn.Parent := staLoginInfo ;

    staLoginInfo.Panels[09].Style := psOwnerDraw ;
    PnlMESInterfaceConn.Parent := staLoginInfo ;

    staLoginInfo.Panels[10].Style := psOwnerDraw ;
    PnlDatabaseConn.Parent := staLoginInfo ;

    tmrConnectCheck.Enabled := True ;
    tmrSystem.Enabled := True;

    fnGetMachInfo;

    if fnGetFileAttr(Application.ExeName, tFName, tFSize, tFPath, tCDate, tADate, tUDate) then
    begin
      TitleStr := ' File Name : ' + tFName + #13#10 +
                  ' Size : ' + tFSize + 'MB' + #13#10 +
                  ' Path : ' + tFPath + #13#10 +
                  ' Create  Time : ' + tCDate + #13#10 +
                  ' Access  Time : ' + tADate + #13#10 +
                  ' Rewrite Time : ' + tUDate ;
    end else TitleStr := '';
    PnlTitle.Hint := TitleStr;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'CreateConfig', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure CreateConfig Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// btnClick (툴바버튼 클릭 이벤트)
//==============================================================================
procedure TfrmMain.btnClick(Sender: TObject);
begin
  if      (Sender as TSpeedButton) = cmdNEXT then // 다음 폼
    Previous
  else if (Sender as TSpeedButton) = cmdPREV then // 이전 폼
    Next
  else if (ActiveMDIChild <> Nil) then
  begin
    if ((Sender as TspeedButton).Name <> 'cmdINQUIRY') and
       ((Sender as TspeedButton).Name <> 'cmdCLOSE'  ) then
      InsertPGMHist('['+MainDm.M_Info.ActiveFormID+']', 'N', 'btnClick', (Sender as TSpeedButton).Hint, 'Command Button Click', 'PGM', '', '', '');
    SendMessage(ActiveMDIChild.Handle, WM_USER, TSpeedButton(Sender).Tag, 0);
  end;
end;

//==============================================================================
// tmrSystemTimer
//==============================================================================
procedure TfrmMain.tmrSystemTimer(Sender: TObject);
begin
  try
    try
      tmrSystem.Enabled := False;
      staLoginInfo.Panels[7].Text := FormatDateTime( 'YYYY-MM-DD HH:NN:SS', Now);
    finally
      tmrSystem.Enabled := True;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'tmrSystemTimer', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure tmrSystemTimer Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// execMenuLblClick (좌측 메뉴버튼 클릭 이벤트 활성화)
//==============================================================================
procedure TfrmMain.execMenuLblClick(Sender: TObject);
begin
  try
    if (TLabel(Sender).Tag) <> 0 then
    begin
      execMenuActive(StrToInt(IntToStr(TLabel(Sender).Tag)+'0'));
      //InsertPGMHist('[Main]', 'N', 'execMenuLblClick', '', 'Program Menu Click ['+IntToStr(TLabel(Sender).Tag)+']', 'PGM', '', '', '');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'execMenuLblClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure execMenuLblClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// execMenuActive (메뉴번호에 따라 해당하는 폼을 활성화)
//==============================================================================
procedure TfrmMain.execMenuActive(Menu_Number: Integer);
var
  tfrmName : String;
begin
  tfrmName := 'frmU' + Copy(IntToStr(Menu_Number), 1, 3);
  if FnIsCreated(tfrmName) then Exit;

  case Menu_Number of
     1100 : begin U110Create(); TabSetDisplay(TForm(frmU110), tsAdd); end; // 110. 품목관리
     1200 : begin U120Create(); TabSetDisplay(TForm(frmU120), tsAdd); end; // 120. 성형기 생산정보
     1300 : begin U130Create(); TabSetDisplay(TForm(frmU130), tsAdd); end; // 130. 가류기 생산정보
     2100 : begin U210Create(); TabSetDisplay(TForm(frmU210), tsAdd); end; // 210. 창고 수동입고
     2200 : begin U220Create(); TabSetDisplay(TForm(frmU220), tsAdd); end; // 220. 창고 수동출고
     3100 : begin U310Create(); TabSetDisplay(TForm(frmU310), tsAdd); end; // 310. 작업진행현황
     3200 : begin U320Create(); TabSetDisplay(TForm(frmU320), tsAdd); end; // 320. 성형기 모니터링
     3300 : begin U330Create(); TabSetDisplay(TForm(frmU330), tsAdd); end; // 330. 가류기 모니터링
     3400 : begin U340Create(); TabSetDisplay(TForm(frmU340), tsAdd); end; // 340. 랙 모니터링
     3500 : begin U350Create(); TabSetDisplay(TForm(frmU350), tsAdd); end; // 350. 파라미터 설정
     4100 : begin U410Create(); TabSetDisplay(TForm(frmU410), tsAdd); end; // 410. 랙 재고 현황
     4200 : begin U420Create(); TabSetDisplay(TForm(frmU420), tsAdd); end; // 420. 품목별 재고조회
     4300 : begin U430Create(); TabSetDisplay(TForm(frmU430), tsAdd); end; // 430. 위치별 재고조회
     5100 : begin U510Create(); TabSetDisplay(TForm(frmU510), tsAdd); end; // 510. 입고실적조회
     5200 : begin U520Create(); TabSetDisplay(TForm(frmU520), tsAdd); end; // 520. 출고실적조회
     5300 : begin U530Create(); TabSetDisplay(TForm(frmU530), tsAdd); end; // 530. 품목별 실적조회
     5400 : begin U540Create(); TabSetDisplay(TForm(frmU540), tsAdd); end; // 540. 기간별 실적조회
     5500 : begin U550Create(); TabSetDisplay(TForm(frmU550), tsAdd); end; // 550. 에러이력조회
     5600 : begin U560Create(); TabSetDisplay(TForm(frmU560), tsAdd); end; // 560. 웹서비스 이력조회
     6100 : begin U610Create(); TabSetDisplay(TForm(frmU610), tsAdd); end; // 610. 사용자관리
     6200 : begin U620Create(); TabSetDisplay(TForm(frmU620), tsAdd); end; // 620. 사용자그룹관리
     6300 : begin U630Create(); TabSetDisplay(TForm(frmU630), tsAdd); end; // 630. 프로그램명관리
     6400 : begin U640Create(); TabSetDisplay(TForm(frmU640), tsAdd); end; // 640. 공통코드관리
     6500 : begin U650Create(); TabSetDisplay(TForm(frmU650), tsAdd); end; // 650. 프로그램사용이력
     6600 : begin MainDm.M_Info.ReLogin := True; execLoginClick(nil); end; // 660. 로그인/로그아웃
     else Exit;
  end;
end;

//==============================================================================
// tmrConnectCheckTimer
//==============================================================================
procedure TfrmMain.tmrConnectCheckTimer(Sender: TObject);
begin
  try
    try
      tmrConnectCheck.Enabled := False ;
      if not fnDBConChk then
      begin
        ADOConnection('N');
      end;
    finally
      tmrConnectCheck.Enabled := True ;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'tmrConnectCheckTimer', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure tmrConnectCheckTimer Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// execLoginClick (로그인/로그아웃)
//==============================================================================
procedure TfrmMain.execLoginClick(Sender: TObject);
var
  i : integer;
begin
  try
    MainDm.M_Info.IdPass := False;
    LoginBoxCreate();

    if MainDm.M_Info.IdPass then
    begin
      staLoginInfo.Panels[4].Text := MainDm.M_Info.UserCode + ' / ' + MainDm.M_Info.UserName ;
      fnMenuPermit;

      for i := MdiChildCount - 1 downto 0 do MDIChildren[i].Close; // 전체 서브폼 Close

      if (MainDm.M_Info.ActiveFormID <> '000') then
      begin
        fnWmMsgSend(2222222, 222);
        MainDm.M_Info.ActiveFormID   := '000';
        MainDm.M_Info.ActiveFormName := frmMain.Hint;
        LblMenu000.Caption := frmMain.Hint;
      end;

      Case StrToInt(MainDM.M_Info.UserGrade) of
        0 : staLoginInfo.Panels[5].Text := 'Supervisor';
        1 : staLoginInfo.Panels[5].Text := 'CCR';
        2 : staLoginInfo.Panels[5].Text := 'ASRS';
        3 : staLoginInfo.Panels[5].Text := 'ProductManager';
      end;
    end else
    begin
      if MainDm.M_Info.UserCode = '' then
      begin
        Close;
        ExitProcess(0);
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'execLoginClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure execLoginClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnDBConChk
//==============================================================================
function TfrmMain.fnDBConChk: Boolean;
var
  StrSQL : String;
begin
  Result := False ;
  try
    with qryDBChk do
    begin
      Close;
      SQL.Clear ;
      StrSQL := ' SELECT SYSDATE FROM DUAL ' ;
      SQL.Text := StrSQL ;
      Open ;
      if not (Bof and Eof) then
      begin
        Result := True ;
        m.ConChk := True ;
        frmMain.LblDatabaseConn.Color := CONN_STATUS_COLOR[1];

        SQL.Clear;
        StrSQL := ' SELECT INT_NAME, (CASE WHEN INT_DATE > SYSDATE - (((1/24)/60)/4) THEN 1 ELSE 0 END) STATUS ' +
                  '   FROM C_INT_I ' ;
        SQL.Text := StrSQL;
        Open;
        if not (Bof and Eof) then
        begin
          while not (Eof) do
          begin
            if FieldByName('INT_NAME').AsString = 'MFC' then
            begin
              frmMain.LblMFCInterfaceConn.Color := CONN_STATUS_COLOR[FieldByName('STATUS').AsInteger];
            end else
            if FieldByName('INT_NAME').AsString = 'MES' then
            begin
              frmMain.LblMESInterfaceConn.Color := CONN_STATUS_COLOR[FieldByName('STATUS').AsInteger];
            end;
            Next;
          end;
        end else
        begin
          frmMain.LblMFCInterfaceConn.Color := CONN_STATUS_COLOR[0];
          frmMain.LblMESInterfaceConn.Color := CONN_STATUS_COLOR[0];
        end;
      end else
      begin
        frmMain.LblDatabaseConn.Color     := CONN_STATUS_COLOR[0];
        frmMain.LblMFCInterfaceConn.Color := CONN_STATUS_COLOR[0];
        frmMain.LblMESInterfaceConn.Color := CONN_STATUS_COLOR[0];
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryDBChk.Close;
      m.ConChk := False ;
      frmMain.LblDatabaseConn.Color     := CONN_STATUS_COLOR[0];
      frmMain.LblMFCInterfaceConn.Color := CONN_STATUS_COLOR[0];
      frmMain.LblMESInterfaceConn.Color := CONN_STATUS_COLOR[0];
      InsertPGMHist('[Main]', 'E', 'fnDBConChk', 'Database', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[Main] function fnDBConChk Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnMenuPermit
//==============================================================================
procedure TfrmMain.fnMenuPermit;
var
  i,j, pHight : Integer;
  StrSQL : String;
  TmpPnl : TPanel ;
begin
  try
    for i := Low(amenu) to High(amenu) do amenu[i] := 0;

    with qryPermit do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT M.MENU_ID, R.GRADESTR, ' +
                '        (CASE WHEN (R.PROGRAM_ID = '''') or (R.PROGRAM_ID is NULL) THEN ''N'' ' +
                '              ELSE ''Y'' END) as MENU_USED ' +
                '   FROM C_MENU_I M ' +
                '   LEFT OUTER JOIN ' +
                '   (SELECT PROGRAM_ID, REPLACE(USE_ORDER||USE_REGIST||USE_DELETE||USE_UPDATE||USE_EXCEL||USE_PRINT||USE_QUERY, 0, 2) as GRADESTR ' +
                '      FROM C_USER_ROLE ' +
                '     WHERE USER_GRADE = ' + QuotedStr(MainDM.M_Info.UserGrade) + ') R' +
                '     ON M.MENU_ID = R.PROGRAM_ID ' +
                '  WHERE M.MENU_LVL = ''2'' ' +
                '  ORDER BY M.MENU_ID ' ;

      SQL.Text := StrSQL;
      Open;
      First;

      while not (Eof) do
      begin
        if FieldByName('MENU_USED').AsString = 'Y' then
        begin
          i := StrToInt(Copy(FieldByName('MENU_ID').AsString,1,1));
          j := StrToInt(Copy(FieldByName('MENU_ID').AsString,2,1));
          Inc(amenu[i]);

          menuGrade[i][j].FrmNo := FieldByName('MENU_ID' ).AsString;
          menuGrade[i][j].Grade := FieldByName('GRADESTR').AsString;
        end;

        TmpPnl := TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString));

        if TmpPnl <> nil then
        begin
          if FieldByName('MENU_USED').AsString = 'N' then
          begin
            TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString)).Visible := False
          end else
          begin
            TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString)).Top := ((amenu[i]) * 24) + 2;
            TPanel(Self.FindComponent('Pan'+FieldByName('MENU_ID').AsString)).Visible := True;
          end;
        end;
        Next;
      end;
      Close;

      pHight := 42;   // (Menu높이(24) * Menu개수) + 42
      for i := Low(amenu) to High(amenu) do
      begin
        if amenu[i] = 0 then
             TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Visible := False
        else TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Visible := True;

        if amenu[i] > 0 then
        begin
          TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Height    := pHight + (Pan110.Height * amenu[i] - 3);
          TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Hint      := IntToStr(pHight + (Pan110.Height * amenu[i]) - 3);
          TPanel(Self.FindComponent('PnlMenuSizeSub'+IntToStr(i))).Height := pHight + (Pan110.Height * amenu[i]) - 5;
        end;
      end;
    end;
  except
    on E : Exception do
    begin
      qryPermit.Close;
      InsertPGMHist('[Main]', 'E', 'fnMenuPermit', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[Main] procedure fnMenuPermit Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// Img_MenusizeClick (각 메뉴의 숨김/표시 이미지 클릭 시)
//==============================================================================
procedure TfrmMain.ImgMenusizeClick(Sender: TObject);
var
  MenuNo, StdSize  : integer;
  TmpPnl : TPanel ;
  TmpImg : TImage ;
begin
  try
    TmpPnl  := nil; TmpImg := nil;
    StdSize := 32 ;
    MenuNo  := (Sender as TImage).Tag ;
    TmpPnl  := TPanel(Self.FindComponent('PnlMenusize'+IntToStr(MenuNo))) ;
    TmpImg  := TImage(Self.FindComponent('ImgMenusize'+IntToStr(MenuNo))) ;

    if TmpPnl.Height <> StdSize then
    begin // 메뉴가 펼쳐져있을 경우
      TmpPnl.Height  := StdSize ;
      TmpImg.Picture := ImageDown.Picture ;
      TmpImg.Hint    := 'Menu Unfold';
    end else
    begin // 메뉴가 숨겨져있을 경우
      TmpPnl.Height  := StrToInt(TmpPnl.Hint) ;
      TmpImg.Picture := ImageUp.Picture ;
      TmpImg.Hint    := 'Menu Fold';
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'ImgMenusizeClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure ImgMenusizeClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// Img_MenuIconUpClick (전체 메뉴의 숨김/표시 이미지 클릭 시)
//==============================================================================
procedure TfrmMain.Img_MenuIconUpClick(Sender: TObject);
var
  SelImg, StdSize, i : integer;
begin
  StdSize := 32 ;
  SelImg  := (Sender as TImage).Tag ;

  case SelImg of
    1 : // 전체 메뉴 숨김
    begin
      for i:= 1 to MenuCount do
      begin
        TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Height  := StdSize ;
        TImage(Self.FindComponent('ImgMenusize'+IntToStr(i))).Picture := ImageDown.Picture ;
        TImage(Self.FindComponent('ImgMenusize'+IntToStr(i))).Hint    := 'Menu Unfold';
      end;
    end;
    2 : // 전체 메뉴 펼침
    begin
      for i:= 1 to MenuCount do
      begin
        TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Height :=
        StrToInt(TPanel(Self.FindComponent('PnlMenusize'+IntToStr(i))).Hint) ;
        TImage(Self.FindComponent('ImgMenusize'+IntToStr(i))).Picture := ImageUp.Picture ;
        TImage(Self.FindComponent('ImgMenusize'+IntToStr(i))).Hint    := 'Menu Fold';
      end;
    end;
    3 : // 메뉴창 숨김/표시
    begin
      if Pnl_MenuBasic.Visible then
      begin
        Pnl_MenuBasic.Visible := False ;
        Img_MenuDetect.Picture := ImageMenuO.Picture ;
      end else
      begin
        Pnl_MenuBasic.Visible := True ;
        Img_MenuDetect.Picture := ImageMenuX.Picture ;
      end;
    end;
  end;
end;

//==============================================================================
// lblMenuMouseLeave (마우스포인터 사라질 경우)
//==============================================================================
procedure TfrmMain.lblMenuMouseLeave(Sender: TObject);
begin
  TShape(Self.FindComponent('Shp'+IntToStr((Sender as TLabel).Tag))).Brush.Color := $00E1E1E1;
end;

//==============================================================================
// lblMenuMouseMove (마우스포인터 위치한 경우)
//==============================================================================
procedure TfrmMain.lblMenuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TShape(Self.FindComponent('Shp'+IntToStr((Sender as TLabel).Tag))).Brush.Color := $00EFC79E;
end;

//==============================================================================
// staLoginInfoDrawPanel
//==============================================================================
procedure TfrmMain.staLoginInfoDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  try
    if Panel = staLoginInfo.Panels[00] then
    begin
      with PnlMenuSize do
      begin
        Top := Rect.Top - 1 ;
        Left := Rect.Left + 1 ;
      end;
    end;

    if Panel = staLoginInfo.Panels[01] then
    begin
      with PnlLanguage do
      begin
        Top := Rect.Top - 1 ;
        Left := Rect.Left ;
      end;
    end;

    if Panel = staLoginInfo.Panels[08] then
    begin
      with PnlMFCInterfaceConn do
      begin
        Top := Rect.Top - 1 ;
        Left := Rect.Left ;
      end;
    end;

    if Panel = staLoginInfo.Panels[09] then
    begin
      with PnlMESInterfaceConn do
      begin
        Top := Rect.Top - 1 ;
        Left := Rect.Left ;
      end;
    end;

    if Panel = staLoginInfo.Panels[10] then
    begin
      with PnlDatabaseConn do
      begin
        Top := Rect.Top - 1 ;
        Left := Rect.Left ;
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'staLoginInfoDrawPanel', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure staLoginInfoDrawPanel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnLangChange (선택 언어에 따른 Caption Display 변경)
//==============================================================================
procedure TfrmMain.fnNameChange ;
var
  i, j : integer ;
begin
  try
    //=======================================
    // 상단 타이틀 폰트 변경
    //=======================================
    if MainDm.M_Info.LANG_TYPE in [1, 2] then
    begin
      frmMain.LblMenu000.Font.Name := 'HY견고딕';
      frmMain.LblMenu000.Font.Size := 18;
      frmMain.LblMenu000.Font.Style := [];
    end else
    begin
      frmMain.LblMenu000.Font.Name := '돋움';
      frmMain.LblMenu000.Font.Size := 22;
      frmMain.LblMenu000.Font.Style := [fsBold];
    end;

    //=======================================
    // 상단 버튼 명 변경
    //=======================================
    cmdORDER.Caption    := getLangString(FormNo, 'bORDER'   , cmdORDER.Caption    , MainDm.M_Info.LANG_TYPE, 'N');
    cmdREGISTER.Caption := getLangString(FormNo, 'bREGIST'  , cmdREGISTER.Caption , MainDm.M_Info.LANG_TYPE, 'N');
    cmdDELETE.Caption   := getLangString(FormNo, 'bDELETE'  , cmdDELETE.Caption   , MainDm.M_Info.LANG_TYPE, 'N');
    cmdUPDATE.Caption   := getLangString(FormNo, 'bUPDATE'  , cmdUPDATE.Caption   , MainDm.M_Info.LANG_TYPE, 'N');
    cmdEXCEL.Caption    := getLangString(FormNo, 'bEXCEL'   , cmdEXCEL.Caption    , MainDm.M_Info.LANG_TYPE, 'N');
    cmdPRINT.Caption    := getLangString(FormNo, 'bPRINT'   , cmdPRINT.Caption    , MainDm.M_Info.LANG_TYPE, 'N');
    cmdINQUIRY.Caption  := getLangString(FormNo, 'bINQUIRY' , cmdINQUIRY.Caption  , MainDm.M_Info.LANG_TYPE, 'N');
    cmdPREV.Caption     := getLangString(FormNo, 'bPREV'    , cmdPREV.Caption     , MainDm.M_Info.LANG_TYPE, 'N');
    cmdNEXT.Caption     := getLangString(FormNo, 'bNEXT'    , cmdNEXT.Caption     , MainDm.M_Info.LANG_TYPE, 'N');
    cmdCLOSE.Caption    := getLangString(FormNo, 'bCLOSE'   , cmdCLOSE.Caption    , MainDm.M_Info.LANG_TYPE, 'N');

    //=======================================
    // 메뉴명 변경
    //=======================================
    for i := Low(MainDm.M_Info.LANG_PGM.LANG) to High(MainDm.M_Info.LANG_PGM.LANG) do
    begin
      if Trim(MainDm.M_Info.LANG_PGM.LANG[i].FORMID) = '' then Break;

      case MainDm.M_Info.LANG_TYPE of
        1..3 :
        begin
          if MainDm.M_Info.LANG_PGM.LANG[i].FIELD_TYPE = '1' then
          begin
            TLabel(Self.FindComponent('lbl'+MainDm.M_Info.LANG_PGM.LANG[i].FORMID)).Caption := MainDm.M_Info.LANG_PGM.LANG[i].FORMID +'.' + MainDm.M_Info.LANG_PGM.LANG[i].DESC[MainDm.M_Info.LANG_TYPE];
          end else
          begin
            TLabel(Self.FindComponent('lbl'+MainDm.M_Info.LANG_PGM.LANG[i].FORMID)).Caption := MainDm.M_Info.LANG_PGM.LANG[i].FORMID +'. ' + MainDm.M_Info.LANG_PGM.LANG[i].DESC[MainDm.M_Info.LANG_TYPE];

            //=======================================
            // TabSet 생성 된 탭 캡션 변경
            //=======================================
            for j := 0 to tsMain.Tabs.Count - 1 do
            begin
              if Copy(tsMain.Tabs.Strings[j], 1, 3) = MainDm.M_Info.LANG_PGM.LANG[i].FORMID then
              begin
                tsMain.Tabs.Strings[j] := MainDm.M_Info.LANG_PGM.LANG[i].FORMID +'. ' + MainDm.M_Info.LANG_PGM.LANG[i].DESC[MainDm.M_Info.LANG_TYPE];
              end;
            end;
          end;
        end;
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'fnNameChange', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure fnNameChange Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// LblLangDblClick
//==============================================================================
procedure TfrmMain.LblLangDblClick(Sender: TObject);
var
  i, tmpLangType : integer;
begin
  try
    // 변경한 언어 타입 저장
    tmpLangType := (Sender as TLabel).Tag;
    MainDm.M_Info.LANG_TYPE := tmpLangType;
    MainDm.M_Info.LANG_STR  := LANG_GUBUN[tmpLangType];
    IniWrite(INI_PATH, 'UserSeting', 'LanguageType', IntToStr(MainDm.M_Info.LANG_TYPE));
    InsertPGMHist('[Main]', 'N', 'LblLangDblClick', 'Language', 'Program Language Change [' + IntToStr(MainDm.M_Info.LANG_TYPE)+':'+LANG_GUBUN[tmpLangType] + ']', 'PGM', '', '', '');

    // 선택 언어 라벨 색상 변경
    for i := Low(LANG_GUBUN) to High(LANG_GUBUN) do
    begin
      if i = tmpLangType then
      begin
        TLabel(Self.FindComponent('LblLang'+IntToStr(i))).Font.Color := $00EC8937;
        TLabel(Self.FindComponent('LblLang'+IntToStr(i))).Font.Style := [fsBold];
      end else
      begin
        TLabel(Self.FindComponent('LblLang'+IntToStr(i))).Font.Color := clBlack;
        TLabel(Self.FindComponent('LblLang'+IntToStr(i))).Font.Style := [];
      end;
    end;

    // 언어 변경
    fnNameChange;

    // 메인폼 캡션 변경
    frmMain.Caption := IniRead(INI_PATH, 'PROGRAM', 'ProgramName', '') + ' ' +
                       getLangString(FormNo, 'bTITLE', frmMain.Caption, MainDm.M_Info.LANG_TYPE, 'N') + ' ' + MainDm.pVersion;
    frmMain.Hint    := getLangString(FormNo, 'bTITLE', frmMain.Caption, MainDm.M_Info.LANG_TYPE, 'N') + ' ' + MainDm.pVersion;

    // 상단 타이틀 변경
    if MainDm.M_Info.ActiveFormID = '000' then
    begin
      LblMenu000.Caption := frmMain.Hint;
      MainDm.M_Info.ActiveFormName := frmMain.Hint;
    end else
    begin
      LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;

    // 하위폼에 언어 변경됫음을 알림
    if (ActiveMDIChild <> nil) and
       (MainDm.M_Info.ActiveFormID <> '000') then
    begin
      SendMessage(ActiveMDIChild.Handle, WM_USER, 21, 0);
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'LblLangDblClick', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure LblLangDblClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// FnIsCreated
//==============================================================================
function TfrmMain.FnIsCreated(Const formName: String): Boolean;
var
  i	: Integer;
begin
  Result := False;

  try
    with Screen do
    begin
      for i := 0 to FormCount - 1 do
      begin
        if UpperCase(FormName) = UpperCase(Forms[i].Name) then
        begin
          TabSetDisplay(Forms[i], tsFormChange);
          Forms[i].Show;
          Result := True;
        end;
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'FnIsCreated', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] function FnIsCreated Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// TabSetDisplay
//==============================================================================
procedure TfrmMain.TabSetDisplay(AFormRef: TForm; TabSetState: TTabSetState);
var
  TabRecord : PTabRecord;
  i, j : Integer;
begin
  try
    with tsMain do
    begin
      OnClick := Nil;

      case TabSetState of
        //=========================================
        // 탭을 새로 추가해줄때
        //=========================================
        tsAdd :
        begin
          New(TabRecord);

          with TabRecord^ do
          begin
            FormRef  := AFormRef;
          end;
          AFormRef.Caption := MainDm.M_Info.ActiveFormName;
          TabIndex := Tabs.AddObject(AFormRef.Caption, TObject(TabRecord));
        end;

        //=========================================
        // 선택된 탭의 폼을 활성화 해줘야 할때
        //=========================================
        tsTabChange :
        begin
          for i := 0 to Tabs.Count - 1 do
          begin
            if AFormRef = PTabRecord(Tabs.Objects[i]).FormRef then
            begin
              PTabRecord(Tabs.Objects[i]).FormRef.Show;
              TabIndex := i;
              Break;
            end;
          end;
        end;

        //=========================================
        // Active Form의 바뀌어서 탭을 바꿔야 할때
        //=========================================
        tsFormChange :
        begin
          for i := 0 to Tabs.Count - 1 do
          begin
            if AFormRef = PTabRecord(Tabs.Objects[i]).FormRef then
            begin
              TabIndex := i;
              Break;
            end;
          end;
        end;

        //=========================================
        // 차일드 폼을 종료해서 탭을 지워야 할때
        //=========================================
        tsDelete :
        begin
          for i := 0 to Tabs.Count - 1 do
          begin
            if AFormRef = PTabRecord(Tabs.Objects[i]).FormRef then
            begin
              Tabs.Delete(i);

              for j := i to Tabs.Count - 1 do
                Tabs[j] := PTabRecord(Tabs.Objects[j]).FormRef.Caption;
              Break;
            end;
          end;

          if (MdiChildCount <= 1) and
             (MainDm.M_Info.ActiveFormID <> '000') then
          begin
            fnWmMsgSend(2222222, 222);
            MainDm.M_Info.ActiveFormID   := '000';
            MainDm.M_Info.ActiveFormName := frmMain.Hint;
            LblMenu000.Caption := frmMain.Hint;
          end;
        end;
      end;

      if ( Assigned(ActiveMDIChild)) and
         ( tsMain.TabIndex > -1) then
      begin
        ActiveMDIChild.WindowState := wsMaximized;
        ActiveMDIChild.Show;
      end;
      OnClick := tsMainClick;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Main]', 'E', 'TabSetDisplay', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Main] procedure TabSetDisplay Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnGetMachInfo
//==============================================================================
procedure TfrmMain.fnGetMachInfo;
var
  StrSQL : String;
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM C_MACH_I ' +
                '  WHERE WRHS = ' + QuotedStr(MainDm.M_Info.WRHS) +
                '  ORDER BY MC_ID, MC_IDX ' ;
      SQL.Text := StrSQL;
      Open;
      First;

      while not (Eof) do
      begin
        if FieldByName('MC_ID').AsString = 'TBM' then
        begin
          MainDm.MACH_TBM[StrToInt(FieldByName('MC_IDX').AsString)].ID :=
          FieldByName('MC_ID').AsString + FieldByName('MC_IDX').AsString;
          MainDm.MACH_TBM[StrToInt(FieldByName('MC_IDX').AsString)].USED :=
          FieldByName('MC_USED').AsString;
        end else
        begin
          MainDm.MACH_CUR[StrToInt(FieldByName('MC_IDX').AsString)].ID :=
          FieldByName('MC_ID').AsString + FieldByName('MC_IDX').AsString;
          MainDm.MACH_CUR[StrToInt(FieldByName('MC_IDX').AsString)].USED :=
          FieldByName('MC_USED').AsString;
        end;
        Next;
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('[Main]', 'E', 'fnGetMachInfo', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[Main] procedure fnGetMachInfo Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// tsMainClick
//==============================================================================
procedure TfrmMain.tsMainClick(Sender: TObject);
begin
  TabSetDisplay(PTabRecord(tsMain.Tabs.Objects[tsMain.TabIndex]).FormRef, tsTabChange);
end;

//==============================================================================
// 로그자동 삭제 관련 함수
//==============================================================================
procedure TfrmMain.tmrLogFileCheckTimer(Sender: TObject);
begin
  try
    tmrLogFileCheck.Enabled := False ;
    LogFileDelete ;
  finally
    tmrLogFileCheck.Enabled := True ;
  end;
end;

procedure TfrmMain.LogFileDelete;
var
  i : integer ;
  DeleteDir : String ;
begin
  DeleteDir := '.\Log\';
  if (DeleteDir <> '') and
     (DeleteOption in [0..2])then
  begin
    DeleteRecodingFile(DeleteDir, DeleteOption);
    InsertPGMHist('[Main]', 'N', 'LogFileDelete', '', 'Automatically Delete Log ['+IntToStr(DeleteOption)+']', 'PGM', '', '', '');
  end;
end;

function TfrmMain.DeleteRecodingFile(fileDir: String; iOption: integer): Boolean;
var
  FoundFile : Integer;
  SearchRec : TSearchRec;
  stLogDir  : string;
  Sdate : TDateTime;
begin
  Sdate :=  Now();
  result := true;
  stLogDir := fileDir + '*';
  try
    FoundFile := findfirst(stLogDir,faAnyFile,SearchRec);
    while FoundFile = 0 do
    begin
      Application.ProcessMessages;
      case iOption of
       0 : if (Sdate - FileDateToDateTime(SearchRec.Time)) >= 30 then
           begin
             if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
             MinDeleteFile(fileDir + SearchRec.name, true); //
           end;
       1 : if (Sdate - FileDateToDateTime(SearchRec.Time)) >= 7 then
           begin
             if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
             MinDeleteFile(fileDir + SearchRec.name, true); //
           end;
       2 : if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
           MinDeleteFile(fileDir + SearchRec.name, true); //
      end;
      FoundFile := findnext(SearchRec);
    end;
    FindClose(SearchRec);
  except
    FindClose(SearchRec);
    result := false;
  end;
end;

function TfrmMain.MinDeleteFile(const DirName : string;
const UseRecycleBin: Boolean): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
  DirBuf: array [0..255] of char;
  Directory: string;
begin
  try
    Directory := ExcludeTrailingPathDelimiter(DirName);

    Fillchar(SHFileOpStruct, sizeof(SHFileOpStruct), 0);
    FillChar(DirBuf, sizeof(DirBuf), 0);
    StrPCopy(DirBuf, Directory);

    with SHFileOpStruct do
    begin
      Wnd := 0;
      pFrom := @DirBuf;
      wFunc := FO_DELETE;
      if UseRecycleBin = True then
      fFlags := FOF_NOCONFIRMATION or FOF_SILENT;
    end;
    Result := (SHFileOperation(SHFileOpStruct)=0);
  except
    Result := False;
  end;
end;

//==============================================================================
// 테스트 함수
//==============================================================================

//==============================================================================
// 셀 생성
//==============================================================================
procedure TfrmMain.Button1Click(Sender: TObject);
var
  s, i, j, k : integer;
  StrSQL : String;
begin
  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;
    for s := 7 to 11 do
    begin
      for i := 1 to 2 do
      begin
        for j := 1 to 38 do
        begin
          for k := 1 to 12 do
          begin
            with qryTemp do
            begin
              Close;
              SQL.Clear;
              StrSQL := ' INSERT INTO C_RACK_I VALUES( ' +
                        QuotedStr('ASRS') + ', ' +
                        QuotedStr(FormatFloat('00',s)+FormatFloat('0',i)+FormatFloat('000',j)+FormatFloat('00',k)) + ', ' +
                        IntToStr(S) + ', ' +
                        IntToStr(i) + ', ' +
                        IntToStr(j) + ', ' +
                        IntToStr(k) + ', ' +
                        QuotedStr('0') + ', ' +
                        QuotedStr('0') + ', ' +
                        QuotedStr('0') + ', ' +
                        'NULL, ' +
                        QuotedStr('0') + ', ' +
                        'NULL, ' +
                        'NULL) ' ;
              SQL.Text := StrSQL;
              ExecSQL;
            end;
          end;
        end;
      end;
    end;
    if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;

  except
    on E : Exception do
    begin
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      qryTemp.Close;
    end;
  end;
end;

//==============================================================================
// 로그삭제
//==============================================================================
procedure TfrmMain.Button2Click(Sender: TObject);
begin
  LogFileDelete;
end;

//==============================================================================
// 빈셀찾기
//==============================================================================
procedure TfrmMain.btnFreeLocClick(Sender: TObject);
var
 tRack1, tRack2, SCStt : String;
begin
  case cbSC.ItemIndex of
    0 : SCStt := '10000000';
    1 : SCStt := '01000000';
    2 : SCStt := '00100000';
    3 : SCStt := '00010000';
    4 : SCStt := '00001000';
    5 : SCStt := '00000100';
    6 : SCStt := '00000010';
    7 : SCStt := '00000001';
  end;

  with SP_PD_GET_FREE_LOC do
  begin
    Close;
    Parameters.ParamByName('i_STORAGE_ID').Value := 'ASRS';
    Parameters.ParamByName('i_Lugg'      ).Value := StrToInt(Edit3.Text);
    Parameters.ParamByName('i_SelStc'    ).Value := SCStt;
    Parameters.ParamByName('i_qty'       ).Value := StrToInt(Edit12.Text);
    Parameters.ParamByName('i_Fork'      ).Value := StrToInt(Edit11.Text);
    ExecProc;

    edit1.Text  := IntToStr(Parameters.ParamValues['o_Code']);
    Edit2.Text  := Parameters.ParamValues['o_msg'];
    tRack1      := Parameters.ParamValues['o_rackno1'];
    tRack2      := Parameters.ParamValues['o_rackno2'];
    Edit9.Text  := Copy(tRack1,1,2)+'-'+Copy(tRack1,3,1)+'-'+Copy(tRack1,4,3)+'-'+Copy(tRack1,7,2);
    Edit10.Text := Copy(tRack2,1,2)+'-'+Copy(tRack2,3,1)+'-'+Copy(tRack2,4,3)+'-'+Copy(tRack2,7,2);
    Close;
  end;
end;


initialization
  //중복 실행 방지 코드 부분
  CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'LLT_PCR_AWS');
  if GetlastError = ERROR_ALREADY_EXISTS then
  begin
    MessageDlg('The program is already running.', mtError, [mbYes], 0);
    Halt;
  end;
end.
