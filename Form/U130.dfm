object frmU130: TfrmU130
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
        ReadOnly = True
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
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'CURE_NO'
            Footers = <>
            Title.Caption = 'Cure No'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'TONG_POS'
            Footers = <>
            Title.Caption = 'Pos ID'
            Width = 80
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLAN_NO'
            Footers = <>
            Title.Caption = 'Plan No'
            Width = 150
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLAN_QTY'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '###,###,##0'
            Footer.FieldName = 'PLAN_QTY'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Plan Qty'
            Width = 110
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'COMP_QTY'
            Footer.Alignment = taRightJustify
            Footer.DisplayFormat = '###,###,##0'
            Footer.FieldName = 'COMP_QTY'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Complete Qty'
            Width = 110
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'GR_MAT_CODE'
            Footers = <>
            Title.Caption = 'SAP Code'
            Width = 110
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
            FieldName = 'VER_NO'
            Footers = <>
            Title.Caption = 'Version No'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OUT_BCR'
            Footers = <>
            Title.Caption = 'Barcode'
            Width = 120
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'CURE_STS'
            Footers = <>
            Title.Caption = 'Cure State'
            Width = 100
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'MCH_CARGO'
            Footers = <>
            Title.Caption = 'Cargo Sensor'
            Width = 110
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'OUT_REQ'
            Footers = <>
            Title.Caption = 'Out Request'
            Width = 100
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
            Width = 110
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'SPRAY_REQ'
            Footers = <>
            Title.Caption = 'Spray Request'
            Width = 110
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
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = 'MAT '#53076#46300
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
            ExplicitLeft = 88
            ExplicitTop = -1
          end
        end
      end
      object edtMATCode: TEdit
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
      object Panel1: TPanel
        Left = 129
        Top = 5
        Width = 100
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
        TabOrder = 6
        object lblLine: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #44032#47448#44592' '#46972#51064
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 80
          ExplicitHeight = 15
        end
      end
      object cbLine: TComboBox
        Left = 233
        Top = 5
        Width = 150
        Height = 23
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = cbChange
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'ALL'
          'CURE 01-17'
          'CURE 18-34'
          'CURE 35-51'
          'CURE 52-68')
      end
      object PnlRowHeight: TPanel
        Left = 389
        Top = 5
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #54665' '#45458#51060
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
      object PnlFontSize: TPanel
        Left = 389
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #44544#51088#53356#44592
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
      object udRowHeight: TUpDown
        Left = 554
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 9
      end
      object edtRowHeight: TEdit
        Left = 493
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
        TabOrder = 2
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object udFontSize: TUpDown
        Left = 554
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 10
      end
      object edtFontSize: TEdit
        Left = 493
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
        TabOrder = 3
        Text = '11'
        OnChange = edtFontSizeChange
      end
      object Panel14: TPanel
        Left = 352
        Top = 33
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 11
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
end
