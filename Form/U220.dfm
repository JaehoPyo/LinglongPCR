object frmU220: TfrmU220
  Left = 2026
  Top = 0
  ClientHeight = 740
  ClientWidth = 1784
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
  object Pnl_Base: TPanel
    Left = 0
    Top = 0
    Width = 1784
    Height = 740
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 5
      Top = 65
      Width = 1774
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
      TabOrder = 1
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
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1774
      Height = 666
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 2
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 1772
        Height = 664
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
        OnDrawColumnCell = dgInfoDrawColumnCell
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Caption = 'Location'
            Width = 115
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = clWhite
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATUS_DESC'
            Footers = <>
            Title.Caption = 'State'
            Width = 90
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
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'GT_MAT_SPEC'
            Footers = <>
            Title.Caption = 'MAT Spec'
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'BCR_NO'
            Footers = <>
            Title.Caption = 'Barcode'
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'VER_NO'
            Footers = <>
            Title.Caption = 'Version No'
            Width = 90
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
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
            DynProps = <>
            EditButtons = <>
            FieldName = 'MCH_NO'
            Footers = <>
            Title.Caption = 'TBM No'
            Width = 90
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'WGT_JUDGE'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1')
            PickList.Strings = (
              'OK'
              'NG')
            Title.Caption = 'Weight Judge'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHOW_JUDGE'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1')
            PickList.Strings = (
              'OK'
              'NG')
            Title.Caption = 'Show Judge'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'ENTER_TYPE_DESC'
            Footers = <>
            Title.Caption = 'In Type'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXPIRY'
            Footers = <>
            Title.Caption = 'Expiry'
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
              'X'
              'X'
              'O'
              '')
            Title.Caption = 'Spray'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SC_USED'
            Footers = <>
            Title.Caption = 'SC Use'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'CREATE_DT'
            Footers = <>
            Title.Caption = 'Create Date'
            Width = 220
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'UPDATE_DT'
            Footers = <>
            Title.Caption = 'Update Date'
            Visible = False
            Width = 250
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1774
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
        TabOrder = 12
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
            Color = 14540253
            ParentColor = False
            Layout = tlBottom
            WordWrap = True
            ExplicitLeft = -3
            ExplicitTop = -3
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
            ExplicitLeft = -6
            ExplicitTop = -1
          end
        end
      end
      object Panel1: TPanel
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
          Tag = 2
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
        object Panel4: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
        end
      end
      object Panel7: TPanel
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
          Tag = 1
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
          Tag = 3
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
      object edtMATSpec: TEdit
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
      object PnlMATCode: TPanel
        Left = 463
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
        TabOrder = 13
        object lblMATCode: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = 'MAT '#53076#46300
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 63
          ExplicitHeight = 15
        end
      end
      object edtMATCode: TEdit
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
        ParentFont = False
        TabOrder = 2
        OnKeyPress = KeyPress
      end
      object PnlMATSpec: TPanel
        Left = 463
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
        TabOrder = 14
        object lblMATSpec: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = 'MAT '#49324#50577
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 63
          ExplicitHeight = 15
        end
      end
      object PnlBarcode: TPanel
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
        TabOrder = 15
        object lblBarcode: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #48148#53076#46300
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 45
          ExplicitHeight = 15
        end
      end
      object PnlRowHeight: TPanel
        Left = 1443
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
        TabOrder = 16
        object lblRowHeight: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #54665' '#45458#51060
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 50
          ExplicitHeight = 15
        end
      end
      object PnlFontSize: TPanel
        Left = 1443
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
        TabOrder = 17
        object lblFontSize: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #44544#51088#53356#44592
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object udRowHeight: TUpDown
        Left = 1588
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 18
      end
      object edtRowHeight: TEdit
        Left = 1527
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
        TabOrder = 10
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object udFontSize: TUpDown
        Left = 1588
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 19
      end
      object edtFontSize: TEdit
        Left = 1527
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
        TabOrder = 11
        Text = '11'
        OnChange = edtFontSizeCHange
      end
      object Panel9: TPanel
        Left = 1183
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
        TabOrder = 20
        object lblHOGI: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #51201#52824#54840#44592
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object Panel10: TPanel
        Left = 1183
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
        TabOrder = 21
        object lblLocation: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #51201#52824#50948#52824
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object cbHogi: TComboBox
        Left = 1267
        Top = 5
        Width = 170
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 8
        Text = 'ALL'
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'ALL'
          'Stacker Crane 1'
          'Stacker Crane 2'
          'Stacker Crane 3'
          'Stacker Crane 4')
      end
      object Panel20: TPanel
        Left = 1267
        Top = 32
        Width = 170
        Height = 23
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
        object cbCBank: TComboBox
          Tag = 1
          Left = 0
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'ALL'
          OnChange = cbChange
          OnKeyPress = cbKeyPress
          Items.Strings = (
            'ALL')
        end
        object cbCBay: TComboBox
          Tag = 1
          Left = 58
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
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
            'ALL')
        end
        object Panel21: TPanel
          Left = 112
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
        object cbCLevel: TComboBox
          Tag = 1
          Left = 116
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
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
        object Panel22: TPanel
          Left = 54
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
        end
      end
      object Panel12: TPanel
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
        TabOrder = 22
        object lblVersion: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = 'VER No'
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 51
          ExplicitHeight = 15
        end
      end
      object Panel16: TPanel
        Left = 943
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
        TabOrder = 23
        object lblTBMNo: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = 'TBM No'
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 54
          ExplicitHeight = 15
        end
      end
      object edtTBM_NO: TEdit
        Tag = 2
        Left = 1027
        Top = 5
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyPress = KeyPress
      end
      object edtVER_NO: TEdit
        Tag = 1
        Left = 787
        Top = 5
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = KeyPress
      end
      object edtBCR_NO: TEdit
        Tag = 1
        Left = 787
        Top = 32
        Width = 150
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
      object Panel14: TPanel
        Left = 666
        Top = 6
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 24
        object sbt_ITEM: TSpeedButton
          Tag = 11
          Left = 0
          Top = 0
          Width = 30
          Height = 21
          Cursor = crHandPoint
          Hint = 'Search Item'
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #46027#50880
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000012170000121700000000000000000000E3C8868D720D
            8D720DE3C886E1E1E1E1E1E1E5E5E5E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E0E0E0E0E0E0B08A21EBC636E0B22F8D720DE3C886E1E1E1E1E1E1E3
            E3E3E1E1E1E1E1E1E1E1E1E0E0E0E1E1E1E0E0E0E1E1E1E0E0E0CFA132FEF9CF
            EBC636E0B22F8D720DE3C886E1E1E1E1E1E1E5E5E5E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E3C886CFA132FEF9CFEBC636E0B22F8D720DE3C886E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0E0E0E1E1E1E3C886
            CFA132FEF9CFEBC636E0B22F8D720DE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3C886CFA132FEF9CFEBC636E0B22F8B
            7212BEBEBE8F8F8F747474919191C1C1C1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1E1E3C886CFA132FEF9CF8271307B7B7BADADADD6D6D6EDEDEDD5D5D5ACAC
            AC797979D1D1D1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E18B7215787772BA
            BABADADADAE8E8E8ECECECEDEDEDECECECCECECE7D7D7DE1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1C1C1C1A6A6A6CBCBCBD8D8D8E6E6E6EBEBEBEBEBEBE9E9
            E9E1E1E1ABABABC4C4C4E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1949494C6C6C6D6
            D6D6E5E5E5EEEEEEF0F0F0EFEFEFEBEBEBE0E0E0CDCDCD969696E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E18E8E8ED8D8D8E4E4E4F1F1F1F8F8F8F9F9F9F8F8F8F2F2
            F2E9E9E9DADADA909090E1E1E1E1E1E1E1E1E1E1E1E1E1E1E19D9D9DDADADAF0
            F0F0FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1DBDBDBA0A0A0E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1CBCBCBC2C2C2F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF5F5F5C0C0C0CECECEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E19E9E9EE6
            E6E6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDDFDFDF9D9D9DE1E1E1E1E1E1E1E1E1
            E1E1E1E1E1E1E1E1E1E1E1E1DCDCDCA2A2A2CDCDCDF2F2F2FCFCFCEEEEEEC8C8
            C8A2A2A2DFDFDFE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
            E1E1D2D2D2B3B3B3A4A4A4B5B5B5D6D6D6E1E1E1E1E1E1E1E1E1}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbt_ITEMClick
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 1622
          ExplicitHeight = 58
        end
      end
      object PnlInDate: TPanel
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
        TabOrder = 25
        object lblInDate: TLabel
          Left = 0
          Top = 25
          Width = 80
          Height = 25
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Caption = #51077#44256#51068#51088
          Color = 14540253
          ParentColor = False
          WordWrap = True
          ExplicitTop = 24
        end
        object cbInDate: TCheckBox
          Left = 16
          Top = 6
          Width = 60
          Height = 14
          Caption = ' '#51204#52404
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 0
          OnClick = cbInDateClick
        end
      end
      object Panel5: TPanel
        Left = 943
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
        TabOrder = 26
        object lblItem_Type: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #51116#44256#53440#51077
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object cbItem_Type: TComboBox
        Tag = 1
        Left = 1027
        Top = 32
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 7
        Text = 'Tire'
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'Tire'
          'Pallet'
          'ALL')
      end
    end
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 32
    Top = 166
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 64
    Top = 166
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
    Left = 128
    Top = 166
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 96
    Top = 166
  end
end
