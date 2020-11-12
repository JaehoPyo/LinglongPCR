object frmU620: TfrmU620
  Left = 2026
  Top = 265
  ClientHeight = 592
  ClientWidth = 1484
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shpB: TShape
    Left = 0
    Top = 591
    Width = 1484
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
    Height = 590
    Align = alLeft
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object shpR: TShape
    Left = 1483
    Top = 1
    Width = 1
    Height = 590
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
    Width = 1484
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
    Width = 1482
    Height = 590
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1472
      Height = 516
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter3: TSplitter
        Left = 1
        Top = 161
        Width = 1470
        Height = 7
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        ExplicitTop = 337
      end
      object Pnl_Main_Top: TPanel
        Left = 1
        Top = 1
        Width = 1470
        Height = 160
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 9
          Top = 2
          Width = 1
          Height = 26
          Align = alNone
          Beveled = True
        end
        object Splitter1: TSplitter
          Left = 601
          Top = 0
          Width = 7
          Height = 160
          Beveled = True
          ExplicitLeft = 731
          ExplicitHeight = 336
        end
        object Pnl_Main_Top_Left: TPanel
          Left = 0
          Top = 0
          Width = 601
          Height = 160
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object dgInfo: TDBGridEh
            Left = 0
            Top = 26
            Width = 601
            Height = 134
            Align = alClient
            BorderStyle = bsNone
            ColumnDefValues.Layout = tlCenter
            ColumnDefValues.Title.Alignment = taCenter
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
            TitleParams.ParentFont = False
            TitleParams.RowHeight = 23
            TitleParams.VertLineColor = 11053224
            OnCellClick = dgInfoCellClick
            OnSelectionChanged = dgInfoSelectionChanged
            OnTitleClick = dgInfoTitleClick
            Columns = <
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_GRADE'
                Footers = <>
                Title.Caption = 'Grade Code'
                Width = 150
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRADE_DESC'
                Footers = <>
                Title.Caption = 'User Grade'
                Width = 300
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_INFO_1'
                Footers = <>
                Title.Caption = #51221#48372
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'ADMIN_YN'
                Footers = <>
                Title.Caption = #44288#47532#51088#44428#54620
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'tCR_DT'
                Footers = <>
                Title.Caption = #46321#47197#51068#51088
                Visible = False
                Width = 100
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object PnlUserGroup: TPanel
            Left = 0
            Top = 0
            Width = 601
            Height = 26
            Align = alTop
            Alignment = taLeftJustify
            Color = 15198183
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            object LblUserGroup: TPanel
              Left = 22
              Top = 3
              Width = 180
              Height = 20
              BevelOuter = bvNone
              Caption = '[ '#49324#50857#51088' '#44536#47353' ]'
              Color = 14408667
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #46027#50880
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object Pnl_Main_Top_Client: TPanel
          Left = 608
          Top = 0
          Width = 862
          Height = 160
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dgInfoMenu: TDBGridEh
            Left = 0
            Top = 26
            Width = 862
            Height = 134
            Align = alClient
            BorderStyle = bsNone
            ColumnDefValues.Layout = tlCenter
            ColumnDefValues.Title.Alignment = taCenter
            DataGrouping.Font.Charset = GB2312_CHARSET
            DataGrouping.Font.Color = clWindowText
            DataGrouping.Font.Height = -11
            DataGrouping.Font.Name = 'Tahoma'
            DataGrouping.Font.Style = []
            DataGrouping.ParentFont = False
            DataSource = dsInfoMenu
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
            TitleParams.ParentFont = False
            TitleParams.RowHeight = 23
            TitleParams.VertLineColor = 11053224
            OnCellClick = dgInfoMenuCellClick
            OnTitleClick = dgInfoTitleClick
            Columns = <
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'MENU_ID'
                Footers = <>
                Title.Caption = 'Menu Code '
                Width = 150
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROGRAM_NAME'
                Footers = <>
                Title.Caption = 'Menu Name'
                Width = 300
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'MENU_USED'
                Footers = <>
                Title.Caption = 'Menu Used'
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'USER_INFO_1'
                Footers = <>
                Title.Caption = #51221#48372
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'ADMIN_YN'
                Footers = <>
                Title.Caption = #44288#47532#51088#44428#54620
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'tCR_DT'
                Footers = <>
                Title.Caption = #46321#47197#51068#51088
                Visible = False
                Width = 100
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object PnlMenuList: TPanel
            Left = 0
            Top = 0
            Width = 862
            Height = 26
            Align = alTop
            Alignment = taLeftJustify
            Color = 15198183
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            object LblMenuList: TPanel
              Left = 22
              Top = 3
              Width = 180
              Height = 20
              BevelOuter = bvNone
              Caption = '[ '#47700#45684' '#47785#47197' ]'
              Color = 14408667
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #46027#50880
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
      object Pnl_Main_Bottom: TPanel
        Left = 1
        Top = 168
        Width = 1470
        Height = 347
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object dgInfoSub: TDBGridEh
          Left = 0
          Top = 26
          Width = 1470
          Height = 321
          Align = alClient
          BorderStyle = bsNone
          ColumnDefValues.Layout = tlCenter
          ColumnDefValues.Title.Alignment = taCenter
          Ctl3D = True
          DataGrouping.Font.Charset = GB2312_CHARSET
          DataGrouping.Font.Color = clWindowText
          DataGrouping.Font.Height = -11
          DataGrouping.Font.Name = 'Tahoma'
          DataGrouping.Font.Style = []
          DataGrouping.ParentFont = False
          DataSource = dsInfoSub
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
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
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
          TitleParams.ParentFont = False
          TitleParams.RowHeight = 23
          TitleParams.VertLineColor = 11053224
          OnCellClick = dgInfoSubCellClick
          OnKeyPress = dgInfoSubKeyPress
          OnTitleClick = dgInfoTitleClick
          Columns = <
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'GRADE_DESC'
              Footers = <>
              ReadOnly = True
              Title.Caption = 'User Grade'
              Width = 150
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Color = 16053492
              DynProps = <>
              EditButtons = <>
              FieldName = 'PROGRAM_ID'
              Footers = <>
              ReadOnly = True
              Title.Caption = 'Menu Code'
              Width = 100
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'PROGRAM_NAME'
              Footers = <>
              ReadOnly = True
              Title.Caption = 'Menu Name'
              Width = 250
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_ORDER'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Order'
              Width = 80
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_REGIST'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Regist'
              Width = 80
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_DELETE'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Delete'
              Width = 80
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_UPDATE'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Update'
              Width = 80
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_EXCEL'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Excel'
              Width = 80
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_PRINT'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Print'
              Width = 80
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_QUERY'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0'
                '')
              Title.Caption = 'Inquery'
              Width = 80
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'USE_YN'
              Footers = <>
              Visible = False
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'UP_DATE'
              Footers = <>
              ReadOnly = True
              Title.Caption = 'Update Date'
              Width = 250
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'CR_DATE'
              Footers = <>
              ReadOnly = True
              Title.Caption = 'Create Date'
              Width = 250
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object PnlUserGrade: TPanel
          Left = 0
          Top = 0
          Width = 1470
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          Color = 15198183
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object LblUserGrade: TPanel
            Left = 22
            Top = 3
            Width = 180
            Height = 20
            BevelOuter = bvNone
            Caption = '[ '#49324#50857#51088' '#44428#54620' ]'
            Color = 14408667
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = #46027#50880
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 65
      Width = 1472
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
      Width = 1472
      Height = 60
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object Panel6: TPanel
        Left = 1218
        Top = 1
        Width = 253
        Height = 58
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 4
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
        TabOrder = 5
        object PnlInfo: TPanel
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
        object Panel9: TPanel
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
            ExplicitLeft = -5
          end
        end
      end
      object PnlMenuCode: TPanel
        Left = 389
        Top = 5
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #47700#45684#53076#46300
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object edtCode: TEdit
        Left = 493
        Top = 5
        Width = 180
        Height = 23
        TabStop = False
        CharCase = ecUpperCase
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object PnlMenuName: TPanel
        Left = 389
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #47700#45684#47749
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
      end
      object edtName: TEdit
        Left = 493
        Top = 32
        Width = 180
        Height = 23
        TabStop = False
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object PnlGroupCode: TPanel
        Left = 129
        Top = 5
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #44536#47353#53076#46300
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
      object edtGroup: TEdit
        Left = 233
        Top = 5
        Width = 150
        Height = 23
        TabStop = False
        CharCase = ecUpperCase
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object PnlGroupName: TPanel
        Left = 129
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #44536#47353#47749
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
      end
      object edtGroupName: TEdit
        Left = 233
        Top = 32
        Width = 150
        Height = 23
        TabStop = False
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtUSED_YN: TEdit
        Left = 679
        Top = 5
        Width = 150
        Height = 23
        TabStop = False
        CharCase = ecUpperCase
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Visible = False
      end
    end
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 56
    Top = 158
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 158
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 88
    Top = 158
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
    Left = 120
    Top = 158
  end
  object qryInfoSub: TADOQuery
    Connection = MainDm.MainDatabase
    BeforeEdit = qryInfoSubBeforeEdit
    AfterPost = qryInfoSubAfterPost
    Parameters = <>
    Left = 24
    Top = 406
  end
  object dsInfoSub: TDataSource
    DataSet = qryInfoSub
    Left = 56
    Top = 406
  end
  object qryInfoMenu: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 648
    Top = 126
  end
  object dsInfoMenu: TDataSource
    DataSet = qryInfoMenu
    Left = 682
    Top = 126
  end
end
