object frmU610: TfrmU610
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
      object dgInfo: TDBGridEh
        Left = 1
        Top = 1
        Width = 1470
        Height = 514
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        PopupMenu = pmControl
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
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_ID'
            Footers = <>
            Title.Caption = 'User Code'
            Width = 200
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_NAME'
            Footers = <>
            Title.Caption = 'User Name'
            Width = 200
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Checkboxes = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_GRADE'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2'
              '3'
              '')
            PickList.Strings = (
              '0000'
              '1111'
              '2222'
              '3333'
              '4444')
            Title.Caption = 'User Grade'
            Visible = False
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'GRADE_DESC'
            Footers = <>
            Title.Caption = 'User Grade'
            Width = 150
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'UP_DATE'
            Footers = <>
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
            Title.Caption = 'Create Date'
            Width = 250
          end>
        object RowDetailData: TRowDetailPanelControlEh
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
      object PnlCode: TPanel
        Left = 129
        Top = 5
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #49324#50857#51088#53076#46300
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
        object PnlSearch: TPanel
          Left = 30
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Caption = #44160#49353#51312#44148
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
      object edtCode: TEdit
        Left = 233
        Top = 5
        Width = 150
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = KeyPress
      end
      object PnlName: TPanel
        Left = 129
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #49324#50857#51088#47749
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
      object edtName: TEdit
        Left = 233
        Top = 32
        Width = 150
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = KeyPress
      end
      object PnlGrade: TPanel
        Left = 389
        Top = 5
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #49324#50857#51088#44428#54620
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
      object cbGrade: TComboBox
        Left = 493
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
        Text = #51204#52404
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          #51204#52404
          'Supervisor'
          'CCR'
          'ASRS'
          'ProductManager')
      end
      object Panel6: TPanel
        Left = 1218
        Top = 1
        Width = 253
        Height = 58
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
      end
    end
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 56
    Top = 94
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 94
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 88
    Top = 94
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
    Top = 94
  end
  object pmControl: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnPopup = pmControlPopup
    Left = 152
    Top = 94
    object mnCodeReg: TMenuItem
      Tag = 1
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #49324#50857#51088#46321#47197
      ImageIndex = 0
      ShortCut = 45
      Visible = False
      OnClick = mnClick
    end
    object mnCodeDel: TMenuItem
      Tag = 2
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #49324#50857#51088#49325#51228
      ImageIndex = 0
      ShortCut = 46
      Visible = False
      OnClick = mnClick
    end
    object mnCodeUdt: TMenuItem
      Tag = 3
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #49324#50857#51088#49688#51221
      ImageIndex = 0
      Visible = False
      OnClick = mnClick
    end
  end
end
