object frmU550: TfrmU550
  Left = 2026
  Top = 265
  ClientHeight = 586
  ClientWidth = 1636
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
    Width = 1636
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
    Left = 1635
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
    Width = 1636
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
    Width = 1634
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
      Width = 1624
      Height = 510
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      OnResize = Pnl_MainResize
      object Splitter3: TSplitter
        Left = 1
        Top = 289
        Width = 1622
        Height = 7
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
        ExplicitLeft = -23
        ExplicitTop = 319
      end
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 1622
        Height = 288
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowHeight = 5
        RowLines = 1
        SumList.Active = True
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
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_LOG_DATETIME'
            Footers = <>
            Title.Caption = 'Occurrence Date'
            Width = 250
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_CODE'
            Footers = <>
            Title.Caption = 'Error Code'
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_MACHINE_NM'
            Footers = <>
            Title.Caption = 'Machine'
            Width = 90
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_NAME'
            Footers = <>
            Title.Caption = 'Description'
            Width = 480
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'RESET_DATETIME'
            Footers = <>
            Title.Caption = 'Clear Date'
            Width = 250
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_SITE'
            Footers = <>
            Title.Caption = 'Site'
            Width = 55
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_BAY'
            Footers = <>
            Title.Caption = 'Bay'
            Width = 55
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ERROR_LEVEL'
            Footers = <>
            Title.Caption = 'Level'
            Width = 55
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
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
            DynProps = <>
            EditButtons = <>
            FieldName = 'JOB_NO'
            Footers = <>
            Title.Caption = 'Job No'
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Pnl_Bottom: TPanel
        Left = 1
        Top = 296
        Width = 1622
        Height = 213
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 627
          Top = 0
          Width = 7
          Height = 213
          Beveled = True
          ExplicitLeft = 625
          ExplicitTop = 30
          ExplicitHeight = 125
        end
        object Pnl_Bottom_Right: TPanel
          Left = 634
          Top = 0
          Width = 988
          Height = 213
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBChart1: TDBChart
            Left = 0
            Top = 26
            Width = 988
            Height = 187
            AllowPanning = pmNone
            MarginBottom = 2
            MarginLeft = 1
            MarginRight = 1
            MarginTop = 1
            Title.Text.Strings = (
              ' ')
            Chart3DPercent = 1
            View3D = False
            View3DOptions.Orthogonal = False
            View3DOptions.Perspective = 0
            View3DWalls = False
            Zoom.Allow = False
            Align = alClient
            Color = 16382457
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            PrintMargins = (
              15
              35
              15
              35)
            ColorPaletteIndex = 13
            object Series2: TBarSeries
              ColorEachPoint = True
              DataSource = qrySummary
              Title = 'Series1'
              XLabelsSource = 'ERROR_DATA'
              BarStyle = bsBevel
              BarWidthPercent = 30
              Sides = 25
              XValues.Name = 'X'
              XValues.Order = loAscending
              YValues.Name = 'Bar'
              YValues.Order = loNone
              YValues.ValueSource = 'ERROR_CNT'
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 988
            Height = 26
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Color = 15198183
            ParentBackground = False
            TabOrder = 1
            object LblChart: TPanel
              Left = 22
              Top = 3
              Width = 180
              Height = 20
              BevelOuter = bvNone
              Caption = '[ '#50640#47084#52264#53944' ]'
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
        object Pnl_Bottom_Left: TPanel
          Left = 0
          Top = 0
          Width = 627
          Height = 213
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object dgSummary: TDBGridEh
            Left = 0
            Top = 26
            Width = 627
            Height = 187
            Align = alClient
            BorderStyle = bsNone
            ColumnDefValues.Layout = tlCenter
            DataGrouping.Font.Charset = GB2312_CHARSET
            DataGrouping.Font.Color = clWindowText
            DataGrouping.Font.Height = -11
            DataGrouping.Font.Name = 'Tahoma'
            DataGrouping.Font.Style = []
            DataGrouping.ParentFont = False
            DataSource = dsSummary
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
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
            ParentFont = False
            RowHeight = 5
            RowLines = 1
            SumList.Active = True
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
            OnTitleClick = dgInfoTitleClick
            Columns = <
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'ERROR_DATA'
                Footers = <>
                Title.Caption = 'Mach-Error Code'
                Width = 140
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ERROR_NAME'
                Footers = <>
                Title.Caption = 'Description'
                Width = 350
              end
              item
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'ERROR_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.FieldName = 'ERROR_CNT'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Count'
                Width = 90
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 627
            Height = 26
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Color = 15198183
            ParentBackground = False
            TabOrder = 1
            object LblSummary: TPanel
              Left = 22
              Top = 3
              Width = 180
              Height = 20
              BevelOuter = bvNone
              Caption = '[ '#50640#47084#50836#50557' ]'
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
          object chkGridSub: TCheckBox
            Left = 5
            Top = 31
            Width = 14
            Height = 16
            Cursor = crHandPoint
            Hint = 'Select Grid - Excel or Print'
            Color = 15987699
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = chkGridSubClick
          end
        end
      end
      object chkGridMain: TCheckBox
        Left = 6
        Top = 6
        Width = 14
        Height = 16
        Cursor = crHandPoint
        Hint = 'Select Grid - Excel or Print'
        Checked = True
        Color = 15987699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkGridMainClick
      end
    end
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1624
      Height = 60
      Align = alTop
      ParentBackground = False
      TabOrder = 0
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
        TabOrder = 6
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
          object lblSearch: TLabel
            Left = 0
            Top = 0
            Width = 90
            Height = 32
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = #44160#49353#51312#44148
            Layout = tlBottom
            WordWrap = True
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
            ExplicitTop = -1
            ExplicitHeight = 51
          end
        end
      end
      object Panel6: TPanel
        Left = 213
        Top = 5
        Width = 244
        Height = 23
        BevelOuter = bvNone
        TabOrder = 0
        object DatePicker1: TDateTimePicker
          Left = 0
          Top = 0
          Width = 150
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 43201.594927025500000000
          Time = 43201.594927025500000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          ParentFont = False
          TabOrder = 0
          OnKeyPress = DatePickerKeyPress
        end
        object TimePicker1: TDateTimePicker
          Tag = 1
          Left = 154
          Top = 0
          Width = 90
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 38799.291666666660000000
          Format = 'HH:mm:ss'
          Time = 38799.291666666660000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          Kind = dtkTime
          ParentFont = False
          TabOrder = 1
          OnKeyPress = DatePickerKeyPress
        end
        object Panel3: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object PnlCompleteDate: TPanel
        Left = 129
        Top = 5
        Width = 80
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
        TabOrder = 7
        object lblOccurDate: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 50
          Align = alClient
          Alignment = taCenter
          Caption = #48156#49373#51068#51088
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object Panel2: TPanel
        Left = 213
        Top = 32
        Width = 244
        Height = 23
        BevelOuter = bvNone
        TabOrder = 1
        object Panel18: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
        object DatePicker2: TDateTimePicker
          Left = 0
          Top = 0
          Width = 150
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 43201.594982314800000000
          Time = 43201.594982314800000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          ParentFont = False
          TabOrder = 0
          OnKeyPress = DatePickerKeyPress
        end
        object TimePicker2: TDateTimePicker
          Tag = 2
          Left = 154
          Top = 0
          Width = 90
          Height = 23
          Cursor = crHandPoint
          Align = alLeft
          Date = 38799.999988425930000000
          Format = 'HH:mm:ss'
          Time = 38799.999988425930000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
          Kind = dtkTime
          ParentFont = False
          TabOrder = 1
          OnKeyPress = DatePickerKeyPress
        end
      end
      object edtErrorCode: TEdit
        Tag = 2
        Left = 547
        Top = 32
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = KeyPress
      end
      object PnlMachine: TPanel
        Left = 463
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #49444#48708
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
      object PnlErrorCode: TPanel
        Left = 463
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Caption = #50640#47084#53076#46300
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
      object cbMACHINE: TComboBox
        Tag = 1
        Left = 547
        Top = 5
        Width = 150
        Height = 23
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
          'ALL'
          'EMS'
          'S/C'
          'PLC')
      end
      object PnlRowHeight: TPanel
        Left = 703
        Top = 5
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        object lblRowHeight: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #54665' '#45458#51060
          Color = 14540253
          ParentColor = False
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 50
          ExplicitHeight = 15
        end
      end
      object PnlFontSize: TPanel
        Left = 703
        Top = 32
        Width = 80
        Height = 23
        BevelOuter = bvNone
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
        object lblFontSize: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #44544#51088#53356#44592
          Color = 14540253
          ParentColor = False
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object udRowHeight: TUpDown
        Left = 848
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 12
      end
      object edtRowHeight: TEdit
        Left = 787
        Top = 5
        Width = 61
        Height = 23
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object udFontSize: TUpDown
        Left = 848
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 13
      end
      object edtFontSize: TEdit
        Left = 787
        Top = 32
        Width = 61
        Height = 23
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '11'
        OnChange = edtFontSizeChange
      end
    end
    object Panel4: TPanel
      Left = 5
      Top = 65
      Width = 1624
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
      object Panel5: TPanel
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
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 56
    Top = 190
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 190
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
    Left = 88
    Top = 190
  end
  object qrySummary: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 238
  end
  object dsSummary: TDataSource
    DataSet = qrySummary
    Left = 56
    Top = 238
  end
end
