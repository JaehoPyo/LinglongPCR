unit h_MainLib;

interface

uses inifiles,Windows, Sysutils, ExtCtrls, ADODB, ScktComp, Graphics ;

Const
  LogFileName  : String = '.\Log\Monitoring.Log';
  INI_PATH : String = 'AwHouse.INI';
  MenuCount = 6;

  START_SCNO = 1 ; // Start SC No
  End_SCNO   = 4 ; // End SC No

  SPACE     = #$20;
  BACKSPACE = #8 ;
  DEL       = #48;
  STX       = #2 ;
  ETX       = #3 ;
  CR        = #13;   //D
  LF        = #10;   //A
  ACK       = #6 ;
  NAK       = #21;
  Enq       = #5 ;

  SC_IN_BUFF : Array [1..3] of integer = (141, 151, 181);
  SC_OT_BUFF : Array [1..3] of integer = (130, 160, 170);

  AC_IN_BUFF : Array [1..3] of integer = (140, 150, 180);
  AC_OT_BUFF : Array [1..3] of integer = (131, 161, 171);
  AC_POS     : Array [0..7] of integer = (433, 393, 309, 266, 182, 139, 55, 15);

  AC_BUFF : Array [1..8] of integer = (131, 124, 161, 171, 140, 150, 190, 180);

  BCR_LINE_BUFF : Array [1..3] of integer = (102, 112, 120);

  //==================================
  // 링롱 타이어 추가 2020.01.14
  //==================================
  LANG_GUBUN  : Array [1..3] of String = ('KOR', 'ENG', 'CHI');
  GRADE_GUBUN : Array [0..3] of String = ('Supervisor','CCR','ASRS','ProductManager');
  BUTTON_LIST : Array [0..6] of String = ('ORDER', 'REGIST', 'DELETE', 'UPDATE', 'EXCEL', 'PRINT', 'QUERY');

  CELL_MAX_HOGI  = 10;
  CELL_MAX_BANK  = 2;
  CELL_MAX_BAY   = 38;
  CELL_MAX_LEVEL = 12;

  TBM_MAX_COUNT  = 20; // 성형기 설비수량(1,2 단계 합해서 20)
  CUR_MAX_COUNT  = 68; // 가류기 설비수량
  CUR_LINE_COUNT = 17; // 가류기 라인별 설비수량
  CUR_LINE       = 4;  // 가류기 라인 수

  MAN_IPGO_SCNO   = 7;    // 수동입고 크레인 No
  MAN_IPGO_F_SITE = 482;  // 수동입고 Front Site
  MAN_IPGO_R_SITE = 484;  // 수동입고 Rear Site

  MAN_IPGO_F_SITE_LIST : Array[1..11] of integer = (3011, 3021, 3031, 3041, 3051, 0,
                                                    3071, 3081, 3091, 3111, 3121);  // 호기별 수동입고 Front Site
  MAN_IPGO_R_SITE_LIST : Array[1..11] of integer = (3012, 3022, 3032, 3042, 3052, 0,
                                                    3072, 3082, 3092, 3112, 3122);  // 호기별 수동입고 Rear Site
  CONN_STATUS_COLOR    : Array [0..1] of TColor = ($008484FF, $0068FF68);

  //========================================================================
  // 메인폼 툴바 버튼 Tag값
  //========================================================================
  MSG_MDI_WIN_ORDER   = 11 ; // 지시
  MSG_MDI_WIN_ADD     = 12 ; // 신규
  MSG_MDI_WIN_DELETE  = 13 ; // 삭제
  MSG_MDI_WIN_UPDATE  = 14 ; // 수정
  MSG_MDI_WIN_EXCEL   = 15 ; // 엑셀
  MSG_MDI_WIN_PRINT   = 16 ; // 인쇄
  MSG_MDI_WIN_QUERY   = 17 ; // 조회
  MSG_MDI_WIN_CLOSE   = 20 ; // 닫기
  MSG_MDI_WIN_LANG    = 21 ; // 언어
type
  TStatus = (START, STANDBY, READY, ORDER, RETURN, CLEAR, RESET, ERR) ;

  TPopupData = Record
    DATA01, DATA02, DATA03, DATA04, DATA05, DATA06, DATA07, DATA08, DATA09, DATA10 : String;
    WEIGHT, QTY : integer;
    ResultCd : String;
    PopupType, PopupMsg,PopupRc : String;
    tmOn : Boolean;
  end;

  TPGM_HIST_INFO = Record
    MENU_ID      : String;
    HIST_TYPE    : String;
    EVENT_NAME   : String;
    COMMAND_TYPE : String;
    COMMAND_TEXT : String;
    PARAM        : String;
    ERROR_MSG    : String;
    o_ERR_CD     : String;
    o_ERR_MSG    : String;
  end;

  TDATA_INFO = Record
    FrmNo  : String;
    DATA1  : String;
    DATA2  : String;
    DATA3  : String;
    DATA4  : String;
    DATA5  : String;
    DATA6  : String;
    DATA7  : String;
    DATA8  : String;
    DATA9  : String;
    DATA10 : String;
    CompareStr : String;
  end;

  TMENU_GRADE = Record
    FrmNo : String;
    Grade : String;
  end;

  TMachUsed = Record
	  In_Used    : Boolean;
	  Ot_Used    : Boolean;
  end;

  TTORDER = Record
    ID_DATE      : String;
	  ID_TIME      : String;
	  ID_TYPE      : String;
	  ID_INDEX     : integer;
	  ID_SUBIDX    : integer;
	  ID_EMG       : integer;
	  ID_SC        : String;
	  ID_CODE      : String;
	  LOAD_BANK    : String;
	  LOAD_BAY     : String;
	  LOAD_LEVEL   : String;
	  UNLOAD_BANK  : String;
	  UNLOAD_BAY   : String;
	  UNLOAD_LEVEL : String;
	  KIND_1       : String;
	  KIND_2       : String;
	  KIND_3       : String;
	  KIND_4       : String;
	  KIND_5       : String;
	  NOW_SITE     : String;
	  NOW_MACH     : String;
	  IN_SITE      : String;
	  IN_DATE      : String;
	  OT_SITE      : String;
	  OT_DATE      : String;
	  BCR_CHK      : integer;
	  STATUS       : String;
	  PROCESS      : String;
	  ITEM_LOT     : String;
	  ITEM_TYPE    : String;
	  ITEM_WEIGHT  : String;
	  ITEM_QTY     : String;
	  ITEM_INFO_01 : String;
	  ITEM_INFO_02 : String;
	  ITEM_INFO_03 : String;
	  ITEM_INFO_04 : String;
	  ITEM_INFO_05 : String;
	  ITEM_INFO_06 : String;
	  ITEM_INFO_07 : String;
	  ITEM_INFO_08 : String;
	  ITEM_INFO_09 : String;
	  ITEM_INFO_10 : String;
	  ITEM_INFO_11 : String;
	  ITEM_INFO_12 : String;
	  ITEM_INFO_13 : String;
	  ITEM_INFO_14 : String;
	  ITEM_INFO_15 : String;
	  ITEM_INFO_16 : String;
	  ITEM_INFO_17 : String;
	  ITEM_INFO_18 : String;
	  ITEM_INFO_19 : String;
	  ITEM_INFO_20 : String;
	  PLT_CODE     : String;
	  WRAP_YN      : String;
	  MEMO_1       : String;
	  MEMO_2       : String;
	  MEMO_3       : String;
	  MEMO_4       : String;
	  MEMO_5       : String;
	  ID_USER      : String;
	  END_YN       : String;
	  SEND_YN      : String;
	  OR_DT        : String;
	  UP_DT        : String;
	  CR_DT        : String;
  end;

  TTRACKInfo = Record
    ID_DATE      : String;
    ID_TIME      : String;
    ID_TYPE      : String;
    ID_INDEX     : integer;
    ID_SUBIDX    : integer;
    ID_EMG       : integer;
    ID_SC        : String;
    ID_CODE      : String;
    ID_BANK      : String;
    ID_BAY       : String;
    ID_LEVEL     : String;
    KIND_1       : String;
    KIND_2       : String;
    KIND_3       : String;
    KIND_4       : String;
    KIND_5       : String;
    IN_SITE      : String;
    IN_DATE      : String;
    OT_SITE      : String;
    OT_DATE      : String;
    BCR_CHK      : integer;
    STATUS       : String;
    PROCESS      : String;
    ITEM_LOT     : String;
    ITEM_TYPE    : String;
    ITEM_WEIGHT  : String;
    ITEM_QTY     : String;
    ITEM_INFO_01 : String;
    ITEM_INFO_02 : String;
    ITEM_INFO_03 : String;
    ITEM_INFO_04 : String;
    ITEM_INFO_05 : String;
    ITEM_INFO_06 : String;
    ITEM_INFO_07 : String;
    ITEM_INFO_08 : String;
    ITEM_INFO_09 : String;
    ITEM_INFO_10 : String;
    ITEM_INFO_11 : String;
    ITEM_INFO_12 : String;
    ITEM_INFO_13 : String;
    ITEM_INFO_14 : String;
    ITEM_INFO_15 : String;
    ITEM_INFO_16 : String;
    ITEM_INFO_17 : String;
    ITEM_INFO_18 : String;
    ITEM_INFO_19 : String;
    ITEM_INFO_20 : String;
    PLT_CODE     : String;
    WRAP_YN      : String;
    MEMO_1       : String;
    MEMO_2       : String;
    MEMO_3       : String;
    MEMO_4       : String;
    MEMO_5       : String;
    ID_USER      : String;
    UP_DT        : String;
    CR_DT        : String;
  End;

  TITEMInfo = Record
    ITEM_TYPE    : String;
    ITEM_WEIGHT  : String;
    ITEM_QTY     : String;
    ITEM_INFO_01 : String;
    ITEM_INFO_02 : String;
    ITEM_INFO_03 : String;
    ITEM_INFO_04 : String;
    ITEM_INFO_05 : String;
    ITEM_INFO_06 : String;
    ITEM_INFO_07 : String;
    ITEM_INFO_08 : String;
    ITEM_INFO_09 : String;
    ITEM_INFO_10 : String;
    ITEM_INFO_11 : String;
    ITEM_INFO_12 : String;
    ITEM_INFO_13 : String;
    ITEM_INFO_14 : String;
    ITEM_INFO_15 : String;
    ITEM_INFO_16 : String;
    ITEM_INFO_17 : String;
    ITEM_INFO_18 : String;
    ITEM_INFO_19 : String;
    ITEM_INFO_20 : String;
  End;

  TSCRC = Record
    ForkCenter     : String;
    ForkTrayExist  : String;
    ReturnFinish   : String;
    WorkReady      : String;
    MachineAction  : String;
    MachineTrouble : String;
    WorkMode       : String;
    MachinePower   : String;
    Bay            : integer;
    Level          : integer;
    Error          : integer;
  End;

  TSCIO = Record
    ID_DATE      : String;
    ID_TIME      : String;
    ID_INDEX     : integer;
    ID_SUBIDX    : integer;
    IO_TYPE      : String;
    ID_SC        : String;
    LOAD_BANK    : String;
    LOAD_BAY     : String;
    LOAD_LEVEL   : String;
    UNLOAD_BANK  : String;
    UNLOAD_BAY   : String;
    UNLOAD_LEVEL : String;
    SC_STATUS    : String;
    CR_DT        : String;
  End;

  TLANG_DESC = Record
    FORMID     : String;
    FIELD_NAME : String;
    FIELD_TYPE : String;
    DESC : Array [1..3] of String;
  end;

  TLANG_PGM = Record // Form Name Description
    LANG : Array [0..49] of TLANG_DESC ;               // [Form개수]
  end;

  TLANG_INFO = Record // Form Field Description
    LANG : Array [0..66,0..99] of TLANG_DESC ;         // [Form번호,단어개수]
  end;

  Main_Info = Record
    MainHd   : Hwnd;
    IdPass   : Boolean;
    ConChk   : Boolean ;
    MenuName, MenuNumber, MenuTitle  : String ;
    UserCode, UserName, UserPwd, UserGrade, UserAdmin, UserETC1, UserETC2 : String;
    DbOle, DbType, DbUser, DbPswd, DbAlais, DbFile  : String;
    WMS_NO : String;
    Popup_ItemInfo : TPopupData;

    WRHS      : String;
    LANG_TYPE : integer;
    LANG_STR  : String;
    LANG_PGM  : TLANG_PGM;
    LANG_FORM : TLANG_INFO;
    PCPosition : integer;

    ReLogin : Boolean;

    ActiveFormID, ActiveFormName : String;
    HistInfo : TPGM_HIST_INFO;

    ActivePCName, ActivePCAddr : String;
  end;

  Mach_Info = Record
    ID    : String;
    USED  : String;
  end;

  Form_Info = Record
    Mainhd  : HWND ;
    ConnectionType : String;
    Menu_Name, Menu_Number, Menu_Title  : String ;
  End;

  TCVR = Record
   Case Integer of
    1 : (All : Array [1..6] of AnsiChar);
    2 : (
      CargoExist     : AnsiChar;
      StraightFinish : AnsiChar;
      LeftFinish     : AnsiChar; // Fork
      RightFinish    : AnsiChar; // Join
      ByPassFinish   : AnsiChar;
      PosCenter      : AnsiChar; // 정위치
    )
  End;

  TOP = Record
   Case Integer of
    1 : (All : Array [1..7] of AnsiChar);
    2 : (
      Auto   : AnsiChar;
      Semi   : AnsiChar;
      Manu   : AnsiChar;
      Erro   : AnsiChar;
      Emer   : AnsiChar;
      RRun1  : AnsiChar;
      RRun2  : AnsiChar;
    )
  End;

  TSC = Record
   Case Integer of
    1 : (All : Array [1..2] of AnsiChar);
    2 : (
      InReady  : AnsiChar;
      OutReady : AnsiChar;
    )
  End;

  TAC = Record
   Case Integer of
    1 : (All : Array [1..27] of AnsiChar);
    2 : (
      Ready     : Array [1..8] of AnsiChar; // 작업대 Ready
      OtSensor  : Array [1..8] of AnsiChar; // 작업대 돌출감지
      AC_Auto   : AnsiChar;                 // 자동
      AC_Manu   : AnsiChar;                 // 수동
      AC_Emer   : AnsiChar;                 // 비상정지
      AC_Ready  : AnsiChar;                 // 오토카 Ready
      AC_Run    : AnsiChar;                 // 작업중
      AC_Error  : AnsiChar;                 // 에러
      AC_Cargo  : AnsiChar;                 // 화물유
      AC_LCPL   : AnsiChar;                 // 로딩완료
      AC_UCPL   : AnsiChar;                 // 언로딩완료
      DoorOpen1 : AnsiChar;                 // 안전 펜스 DOOR OPEN (H.P)
      DoorOpen2 : AnsiChar;                 // 안전 펜스 DOOR OPEN (O.P)
    )
  End;

  TRM = Record
   Case Integer of
    1 : (All : Array [1..7] of AnsiChar);
    2 : (
      RM1_RUN_CMD : AnsiChar;   // 포장룸1 출고 RUN CMD
      RM1_FEED_BK : AnsiChar;   // 포장룸1 입고 RUN FEED BANK
      RM1_DOOR    : AnsiChar;   // 포장룸1 DOOR OPEN
      RM2_RUN_CMD : AnsiChar;   // 포장룸2 출고 RUN CMD
      RM2_FEED_BK : AnsiChar;   // 포장룸2 입고 RUN FEED BANK
      RM2_DOOR    : AnsiChar;   // 포장룸2 DOOR OPEN
      RM_EMER     : AnsiChar;   // 포장룸 비상정지
    )
  End;

  TDR = Record
   Case Integer of
    1 : (All : Array [1..9] of AnsiChar);
    2 : (
    IN_DR_RDY : AnsiChar;  // 입고라인 DOOR READY
    IN_DR_RUN : AnsiChar;  // 입고라인 DOOR RUNNING
    IN_DR_UPL : AnsiChar;  // 입고라인 DOOR FULL UP LIMIT
    IN_DR_DWL : AnsiChar;  // 입고라인 DOOR FULL DOWN LIMIT
    OT_DR_RDY : AnsiChar;  // 출고라인 DOOR READY
    OT_DR_RUN : AnsiChar;  // 출고라인 DOOR RUNNING
    OT_DR_UPL : AnsiChar;  // 출고라인 DOOR FULL UP LIMIT
    OT_DR_DWL : AnsiChar;  // 출고라인 DOOR FULL DOWN LIMIT
    AGV_LOCK  : AnsiChar;  // AGV CV120 LOCK 요청상태
    )
  End;

  TSDR = Record
   Case Integer of
    1 : (All : Array [1..2] of AnsiChar);
    2 : (
    SDoor1 : AnsiChar;
    SDoor2 : AnsiChar;
    )
  End;

  TWP = Record
   Case Integer of
    1 : (All : Array [1..4] of AnsiChar);
    2 : (
    WP_MANUAL_CENTER : AnsiChar;  // WRAPPING MACHINE 수동 정위치 상태
    WP_READY         : AnsiChar;  // WRAPPING MACHINE 자동 준비 상태
    WP_JOB_COMPLETE  : AnsiChar;  // WRAPPING MACHINE 랩핑완료
    WP_EMER          : AnsiChar;  // WRAPPING MACHINE 비상정지
    )
  End;

  TCVCR = Record
  case Integer of
    1 : (All : Array [0..1268] of AnsiChar);
    2 : (
      OP     : Array [ 1..  2 ] of TOP;    //   2 *  7 =   14 Byte 2019.04.10 Update
      BUFF   : Array [ 0..199 ] of TCVR;   // 200 *  6 = 1200 Byte 2019.04.19 Update
      SC     : Array [ 1..  3 ] of TSC;    //   3 *  2 =    6 Byte 2019.04.10 Update
      AC     : TAC;                        //   1 * 27 =   27 Byte 2019.04.19 Update
      ROOM   : TRM;                        //   1 *  7 =    7 Byte 2019.05.16 Update
      DOOR   : TDR;                        //   1 *  9 =    9 Byte 2019.05.16 Update
      WRAP   : TWP;                        //   1 *  4 =    4 Byte 2019.04.19 Update
      SDoor  : TSDR;                       //   1*   2 =    2 Byte 2019.09.27 Update
   )
  end;

  TCVW = Record
   Case Integer of
    1 : (All : Array [1..4] of AnsiChar);
    2 : (
      StraightOrder  : AnsiChar;
      LeftOrder      : AnsiChar; // Fork
      RightOrder     : AnsiChar; // Join
      ByPass         : Ansichar;
    )
  End;

  TACW = Record
   Case Integer of
    1 : (All : Array [1..13] of AnsiChar);
    2 : (
      AC_JobPos : Array [1..8] of AnsiChar;
      AC_Order  : AnsiChar;
      AC_Cancel : AnsiChar;
      AC_Retry  : AnsiChar;
      AC_Reset  : AnsiChar;
      AC_Home   : AnsiChar;
    )
  End;

  TCVCW = Record
   Case Integer of
    1 : (All : Array [1..817] of AnsiChar);
    2 : (
      BUFF : Array [0..199] of TCVW;  // 200 * 4 = 800
      AC   : TACW;                    //  13 * 1 = 13
      E_STOP        : AnsiChar;       //   1
      F_RESET       : AnsiChar;       //   1
      RM1_READ_CONF : AnsiChar;       //   1
      RM2_READ_CONF : AnsiChar;       //   1
    )
  End;

  TCV = Record
    Case Integer of
      1 : (All : Array[1..2086] of AnsiChar);
      2 : (
        Read  : TCVCR; // 1269
        Write : TCVCW; //  817
      )
  end;

implementation

end.
