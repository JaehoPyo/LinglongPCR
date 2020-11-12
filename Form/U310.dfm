object frmU310: TfrmU310
  Left = 2026
  Top = 265
  ClientHeight = 586
  ClientWidth = 1704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shpB: TShape
    Left = 0
    Top = 585
    Width = 1704
    Height = 1
    Align = alBottom
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitTop = 12
    ExplicitWidth = 1184
  end
  object shpL: TShape
    Left = 0
    Top = 1
    Width = 1
    Height = 584
    Align = alLeft
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object shpR: TShape
    Left = 1703
    Top = 1
    Width = 1
    Height = 584
    Align = alRight
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object shpT: TShape
    Left = 0
    Top = 0
    Width = 1704
    Height = 1
    Align = alTop
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitTop = 4
    ExplicitWidth = 1184
  end
  object Pnl_Base: TPanel
    Left = 1
    Top = 1
    Width = 1702
    Height = 584
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1692
      Height = 510
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 1690
        Height = 508
        Align = alClient
        BorderStyle = bsNone
        ColumnDefValues.Layout = tlCenter
        DataGrouping.Font.Charset = GB2312_CHARSET
        DataGrouping.Font.Color = clWindowText
        DataGrouping.Font.Height = -11
        DataGrouping.Font.Name = 'Tahoma'
        DataGrouping.Font.Style = []
        DataGrouping.ParentFont = False
        DataSource = dsInfo
        DrawGraphicData = True
        DynProps = <>
        EditActions = [geaCopyEh]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        FooterRowCount = 1
        FooterParams.FillStyle = cfstGradientEh
        FooterParams.HorzLineColor = 11053224
        FooterParams.VertLineColor = 11053224
        ImeName = 'Microsoft Office IME 2007'
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        IndicatorParams.FillStyle = cfstGradientEh
        IndicatorParams.HorzLineColor = 11053224
        IndicatorParams.VertLineColor = 11053224
        IndicatorTitle.TitleButton = True
        IndicatorTitle.UseGlobalMenu = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowHeight = 5
        RowLines = 1
        TabOrder = 0
        TitleParams.FillStyle = cfstGradientEh
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -15
        TitleParams.Font.Name = #46027#50880
        TitleParams.Font.Style = []
        TitleParams.HorzLineColor = 11053224
        TitleParams.MultiTitle = True
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 23
        TitleParams.VertLineColor = 11053224
        Visible = False
        OnCellClick = dgInfoCellClick
        OnKeyPress = dgInfoKeyPress
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDER_ID'
            Footers = <>
            Title.Caption = 'Order ID'
            Width = 150
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'JOB_NO'
            Footers = <>
            Title.Caption = 'Job No'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATUS_DESC'
            Footers = <>
            Title.Caption = 'State'
            Width = 110
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'TYPE_DESC'
            Footers = <>
            Title.Caption = 'Order Type'
            Width = 220
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'SS'
            Footers = <>
            Title.Caption = 'Starting Point|Site'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SZ'
            Footers = <>
            Title.Caption = 'Starting Point|Bank'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SX'
            Footers = <>
            Title.Caption = 'Starting Point|Bay'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SY'
            Footers = <>
            Title.Caption = 'Starting Point|Level'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'ES'
            Footers = <>
            Title.Caption = 'Destination|Site'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EZ'
            Footers = <>
            Title.Caption = 'Destination|Bank'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EX'
            Footers = <>
            Title.Caption = 'Destination|Bay'
            Width = 62
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EY'
            Footers = <>
            Title.Caption = 'Destination|Level'
            Width = 62
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'CURRENT_MACHINE_NM'
            Footers = <>
            Title.Caption = 'Current Position|Mach'
            Width = 62
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'CURRENT_POSITION'
            Footers = <>
            Title.Caption = 'Current Position|Site'
            Width = 62
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'FORK_JOB_NM'
            Footers = <>
            Title.Caption = 'Fork|Kind'
            Width = 62
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'FORK_TYPE_NM'
            Footers = <>
            Title.Caption = 'Fork|Type'
            Width = 62
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'TBM_NO'
            Footers = <>
            Title.Caption = 'TBM No'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'CURE_NO'
            Footers = <>
            Title.Caption = 'Cure No'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'SPRAY'
            Footers = <>
            KeyList.Strings = (
              ''
              '0'
              '1')
            PickList.Strings = (
              ''
              'X'
              'O')
            Title.Caption = 'Spray'
            Width = 80
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SPRAY_REQ'
            Footers = <>
            Title.Caption = 'Spray Request'
            Width = 80
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ANGLE_REQ'
            Footers = <>
            Title.Caption = 'Angle Request'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'GT_MAT_CODE'
            Footers = <>
            Title.Caption = 'MAT Code'
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'GT_MAT_SPEC'
            Footers = <>
            Title.Caption = 'MAT Spec'
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'VER_NO'
            Footers = <>
            Title.Caption = 'Version No'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'BCR_NO'
            Footers = <>
            Title.Caption = 'Barcode'
            Width = 110
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = clWhite
            DisplayFormat = '###,###,##0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'WEIGHT'
            Footers = <>
            Title.Caption = 'Weight'
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'PALLET_CODE'
            Footers = <>
            Title.Caption = 'Pallet'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'AM_KBN'
            Footers = <>
            Title.Caption = 'Mode'
            Width = 80
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'USERDATA'
            Footers = <>
            Title.Caption = 'User Data'
            Width = 200
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'MEMO'
            Footers = <>
            Title.Caption = 'Memo'
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dgInfoR: TDBGridEh
        Left = 1
        Top = 1
        Width = 1690
        Height = 508
        Align = alClient
        BorderStyle = bsNone
        ColumnDefValues.Layout = tlCenter
        DataGrouping.Font.Charset = GB2312_CHARSET
        DataGrouping.Font.Color = clWindowText
        DataGrouping.Font.Height = -11
        DataGrouping.Font.Name = 'Tahoma'
        DataGrouping.Font.Style = []
        DataGrouping.ParentFont = False
        DataSource = dsInfoR
        DrawGraphicData = True
        DynProps = <>
        EditActions = [geaCopyEh]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        FooterRowCount = 1
        FooterParams.FillStyle = cfstGradientEh
        FooterParams.HorzLineColor = 11053224
        FooterParams.VertLineColor = 11053224
        ImeName = 'Microsoft Office IME 2007'
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        IndicatorParams.FillStyle = cfstGradientEh
        IndicatorParams.HorzLineColor = 11053224
        IndicatorParams.VertLineColor = 11053224
        IndicatorTitle.TitleButton = True
        IndicatorTitle.UseGlobalMenu = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowHeight = 5
        RowLines = 1
        TabOrder = 1
        TitleParams.FillStyle = cfstGradientEh
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -15
        TitleParams.Font.Name = #46027#50880
        TitleParams.Font.Style = []
        TitleParams.HorzLineColor = 11053224
        TitleParams.MultiTitle = True
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 23
        TitleParams.VertLineColor = 11053224
        Visible = False
        OnCellClick = dgInfoRCellClick
        OnKeyPress = dgInfoKeyPress
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDER_ID'
            Footers = <>
            Title.Caption = 'Order ID'
            Width = 150
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'JOB_NO'
            Footers = <>
            Title.Caption = 'Job No'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'GIB_NO'
            Footers = <>
            Title.Caption = 'Line No'
            Visible = False
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'IN_SITE'
            Footers = <>
            Title.Caption = 'Input|Site'
            Width = 70
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'IN_GT_CD'
            Footers = <>
            Title.Caption = 'Input|MAT Code'
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'IN_BCRNO'
            Footers = <>
            Title.Caption = 'Input|Barcode'
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'IN_FLAG'
            Footers = <>
            Title.Caption = 'Input|State'
            Width = 70
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'IN_DATE'
            Footers = <>
            Title.Caption = 'Input|Date'
            Width = 210
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_SITE'
            Footers = <>
            Title.Caption = 'Output|Site'
            Width = 70
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_GT_CD'
            Footers = <>
            Title.Caption = 'Output|MAT Code'
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_BCRNO'
            Footers = <>
            Title.Caption = 'Output|Barcode'
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_FLAG'
            Footers = <>
            Title.Caption = 'Output|State'
            Width = 70
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_DATE'
            Footers = <>
            Title.Caption = 'Output|Date'
            Width = 210
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDER_USE'
            Footers = <>
            Title.Caption = 'Order Use'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'UPDATE_DT'
            Footers = <>
            Title.Caption = 'Update Date'
            Width = 210
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 62
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            Footers = <>
            KeyList.Strings = (
              ''
              '0'
              '1')
            PickList.Strings = (
              'X'
              'X'
              'O'
              '')
            Visible = False
            Width = 80
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 130
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 110
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = clWhite
            DisplayFormat = '###,###,##0.###'
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 80
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 200
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            Footers = <>
            Visible = False
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 65
      Width = 1692
      Height = 4
      ParentCustomHint = False
      Align = alTop
      BevelEdges = []
      BiDiMode = bdLeftToRight
      Color = 15198183
      Ctl3D = True
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentBackground = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 18
        Height = 2
        Align = alLeft
        BevelOuter = bvNone
        Color = 14258944
        TabOrder = 0
      end
    end
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1692
      Height = 60
      Align = alTop
      ParentBackground = False
      TabOrder = 1
      object PnlORDER_KIND: TPanel
        Left = 338
        Top = 5
        Width = 90
        Height = 23
        BevelOuter = bvNone
        Caption = #51648#49884#51333#47448
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
      end
      object Panel11: TPanel
        Left = 6
        Top = 5
        Width = 120
        Height = 50
        BevelOuter = bvNone
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
        object PnlSearch: TPanel
          Left = 30
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object lblSearch: TLabel
            Left = 0
            Top = 0
            Width = 90
            Height = 32
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = #44160#49353#51312#44148
            Color = 14540253
            ParentColor = False
            Layout = tlBottom
            WordWrap = True
            ExplicitTop = 8
          end
          object lblCnt: TLabel
            Left = 0
            Top = 35
            Width = 90
            Height = 15
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = '(0)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -3
            ExplicitTop = 34
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 30
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sbtClear: TSpeedButton
            Tag = 11
            Left = 0
            Top = 0
            Width = 30
            Height = 50
            Cursor = crHandPoint
            Hint = 'EditBox/ComboBox Clear'
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = #46027#50880
            Font.Style = []
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF
              84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF8400FFFFFFFFFFFF
              FF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84000000000000000000FFFF84FFFF84FFFF84FFFF
              84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000FFFFFF00
              FFFFFFFFFF000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
              FFFF84FFFF84000000FFFFFF848484FFFFFF00FFFFFFFFFF000000FFFF84FFFF
              84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000FFFFFF848484FFFFFFC6
              C6C684848400FFFFFFFFFF000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
              000000FFFFFF848484FFFFFFC6C6C684848400FFFFFFFFFF00FFFF8484840000
              00FFFF84FFFF84FFFF84FFFF84000000FFFFFF848484FFFFFFC6C6C684848400
              FFFFFFFFFF00FFFF848484C6C6C6C6C6C6000000FFFF84FFFF84FFFF84000000
              000000FFFFFFC6C6C684848400FFFFFFFFFF00FFFF848484C6C6C6C6C6C6C6C6
              C6000000FFFF84FFFF84FFFF84FFFF84FFFF8400000000000000FFFFFFFFFF00
              FFFF848484C6C6C6C6C6C6C6C6C6000000FFFF84FFFF84FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF8400000000FFFF848484C6C6C6C6C6C6C6C6C68484848400
              00000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000C6
              C6C6C6C6C6C6C6C6000000840000840000840000000000FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84FFFF84000000000000000000FFFF840000008400
              00840000840000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FF
              FF84FFFF84FFFF84FFFF84FFFF84000000840000840000FFFF84FFFF84FFFF84
              FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF
              84000000000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FF
              FF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtClearClick
            ExplicitLeft = -5
          end
        end
      end
      object PnlORDER_TYPE: TPanel
        Left = 338
        Top = 32
        Width = 90
        Height = 23
        BevelOuter = bvNone
        Caption = #51648#49884#53440#51077
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
      end
      object Panel6: TPanel
        Left = 1506
        Top = 1
        Width = 185
        Height = 58
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 7
        object PnlTimer: TPanel
          Left = 6
          Top = 4
          Width = 175
          Height = 51
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Color = clLime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object lblTimerStat: TPanel
            Left = 0
            Top = 0
            Width = 107
            Height = 51
            Hint = 'Can be changed to [ESC] Key input'
            Align = alClient
            BevelOuter = bvNone
            Caption = #51088#46041#51312#54924
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentBackground = False
            ParentColor = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object Panel13: TPanel
            Left = 107
            Top = 0
            Width = 68
            Height = 51
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            object sbtTimer: TSpeedButton
              Left = 0
              Top = 0
              Width = 68
              Height = 51
              Cursor = crHandPoint
              Hint = 'Can be changed to [ESC] Key input'
              Align = alClient
              Caption = #51473#51648
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = #46027#50880
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtTimerClick
              ExplicitWidth = 66
            end
          end
        end
      end
      object cbORDER_KIND: TComboBox
        Tag = 1
        Left = 432
        Top = 5
        Width = 110
        Height = 23
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'ALL'
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'ALL'
          'IN'
          'OUT')
      end
      object cbORDER_TYPE: TComboBox
        Tag = 1
        Left = 432
        Top = 32
        Width = 320
        Height = 23
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = 'ALL'
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'ALL')
      end
      object PnlTBMNo: TPanel
        Left = 548
        Top = 5
        Width = 90
        Height = 23
        BevelOuter = bvNone
        Caption = 'TBM No'
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
      end
      object PnlCURNo: TPanel
        Left = 758
        Top = 5
        Width = 90
        Height = 23
        BevelOuter = bvNone
        Caption = 'CURE No'
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
      end
      object PnlBCR_NO: TPanel
        Left = 758
        Top = 32
        Width = 90
        Height = 23
        BevelOuter = bvNone
        Caption = #48148#53076#46300
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 13
      end
      object edtBCR_NO: TEdit
        Tag = 1
        Left = 852
        Top = 32
        Width = 110
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyPress = KeyPress
      end
      object PnlCellClick: TPanel
        Left = 964
        Top = 4
        Width = 483
        Height = 52
        BevelOuter = bvNone
        TabOrder = 6
        Visible = False
        object Panel1: TPanel
          Left = 4
          Top = 1
          Width = 120
          Height = 50
          BevelOuter = bvNone
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          object PnlSelect: TPanel
            Left = 30
            Top = 0
            Width = 90
            Height = 50
            Align = alClient
            BevelOuter = bvNone
            Caption = #49440#53469#51221#48372
            Color = 14540253
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 30
            Height = 50
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object sbtClear2: TSpeedButton
              Tag = 11
              Left = 0
              Top = 0
              Width = 30
              Height = 50
              Cursor = crHandPoint
              Hint = 'EditBox/ComboBox Clear'
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = #46027#50880
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000FFFF84FFFF84
                FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF
                84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF8400FFFFFFFFFFFF
                FF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
                FFFF84FFFF84FFFF84FFFF84000000000000000000FFFF84FFFF84FFFF84FFFF
                84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000FFFFFF00
                FFFFFFFFFF000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
                FFFF84FFFF84000000FFFFFF848484FFFFFF00FFFFFFFFFF000000FFFF84FFFF
                84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000FFFFFF848484FFFFFFC6
                C6C684848400FFFFFFFFFF000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84
                000000FFFFFF848484FFFFFFC6C6C684848400FFFFFFFFFF00FFFF8484840000
                00FFFF84FFFF84FFFF84FFFF84000000FFFFFF848484FFFFFFC6C6C684848400
                FFFFFFFFFF00FFFF848484C6C6C6C6C6C6000000FFFF84FFFF84FFFF84000000
                000000FFFFFFC6C6C684848400FFFFFFFFFF00FFFF848484C6C6C6C6C6C6C6C6
                C6000000FFFF84FFFF84FFFF84FFFF84FFFF8400000000000000FFFFFFFFFF00
                FFFF848484C6C6C6C6C6C6C6C6C6000000FFFF84FFFF84FFFF84FFFF84FFFF84
                FFFF84FFFF84FFFF8400000000FFFF848484C6C6C6C6C6C6C6C6C68484848400
                00000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84000000C6
                C6C6C6C6C6C6C6C6000000840000840000840000000000FFFF84FFFF84FFFF84
                FFFF84FFFF84FFFF84FFFF84FFFF84000000000000000000FFFF840000008400
                00840000840000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FF
                FF84FFFF84FFFF84FFFF84FFFF84000000840000840000FFFF84FFFF84FFFF84
                FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF
                84000000000000FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FF
                FF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84FFFF84}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtClear2Click
              ExplicitLeft = 88
              ExplicitTop = -1
            end
          end
        end
        object PnlJOB_NO: TPanel
          Left = 127
          Top = 28
          Width = 90
          Height = 23
          BevelOuter = bvNone
          Caption = #51089#50629#48264#54840
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
        object edtJOB_NO: TEdit
          Tag = 1
          Left = 221
          Top = 28
          Width = 140
          Height = 23
          Color = 16053492
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnKeyPress = KeyPress
        end
        object PnlORDER_ID: TPanel
          Left = 127
          Top = 1
          Width = 90
          Height = 23
          BevelOuter = bvNone
          Caption = #51089#50629' ID'
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
        end
        object edtORDER_ID: TEdit
          Tag = 1
          Left = 221
          Top = 1
          Width = 140
          Height = 23
          Color = 16053492
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyPress = KeyPress
        end
        object Panel7: TPanel
          Left = 367
          Top = 0
          Width = 110
          Height = 52
          BevelInner = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object rbCp: TRadioButton
            Left = 12
            Top = 6
            Width = 90
            Height = 17
            Caption = ' Complete'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
          end
          object rbCc: TRadioButton
            Left = 12
            Top = 29
            Width = 90
            Height = 17
            Caption = ' Cancel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object edtTBM_NO: TEdit
        Tag = 1
        Left = 642
        Top = 5
        Width = 110
        Height = 23
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = KeyPress
      end
      object edtCURE_NO: TEdit
        Tag = 1
        Left = 852
        Top = 5
        Width = 110
        Height = 23
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = KeyPress
      end
      object PnlPROCESS: TPanel
        Left = 129
        Top = 5
        Width = 90
        Height = 50
        BevelOuter = bvNone
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 14
        object lblPROCESS: TLabel
          Left = 0
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          Alignment = taCenter
          Caption = #54532#47196#49464#49828
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object Panel23: TPanel
        Left = 222
        Top = 4
        Width = 110
        Height = 52
        BevelInner = bvLowered
        TabOrder = 0
        object rbProc1: TRadioButton
          Tag = 1
          Left = 9
          Top = 6
          Width = 86
          Height = 17
          Caption = 'Common'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbProcClick
        end
        object rbProc2: TRadioButton
          Tag = 2
          Left = 9
          Top = 29
          Width = 86
          Height = 17
          Caption = 'Robot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = rbProcClick
        end
      end
    end
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 136
    Top = 182
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 104
    Top = 182
  end
  object EhPrint: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 168
    Top = 182
  end
  object tmrQry: TTimer
    Enabled = False
    OnTimer = tmrQryTimer
    Left = 200
    Top = 182
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 104
    Top = 214
  end
  object qryInfoR: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 104
    Top = 262
  end
  object dsInfoR: TDataSource
    DataSet = qryInfoR
    Left = 136
    Top = 262
  end
  object PD_SEL_GIB_OTDATA: TADOStoredProc
    Connection = MainDm.MainDatabase
    ProcedureName = 'PD_SEL_GIB_OTDATA'
    Parameters = <
      item
        Name = 'i_GIB_NO'
        DataType = ftInteger
        Precision = 38
        Value = Null
      end
      item
        Name = 'i_GT_BARNO'
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'i_GT_CODE'
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'o_RETCD'
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end
      item
        Name = 'o_RETMSG'
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end>
    Left = 102
    Top = 318
  end
end
