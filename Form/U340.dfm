object frmU340: TfrmU340
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
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 1622
        Height = 26
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Color = 15198183
        ParentBackground = False
        TabOrder = 3
        object LblStock: TPanel
          Left = 22
          Top = 3
          Width = 180
          Height = 20
          BevelOuter = bvNone
          Caption = '[ '#51116#44256' '#54788#54889' ]'
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
      object dgInfo: TDBGridEh
        Left = 1
        Top = 27
        Width = 1622
        Height = 262
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
        OnSelectionChanged = dgInfoSelectionChanged
        OnTitleClick = dgInfoTitleClick
        Columns = <
          item
            Alignment = taCenter
            AutoFitColWidth = False
            Color = 16053492
            DynProps = <>
            EditButtons = <>
            FieldName = 'GT_MAT_CODE'
            Footer.Alignment = taCenter
            Footer.Color = clWhite
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
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
            Footer.Color = clWhite
            Footers = <>
            Title.Caption = 'MAT Spec'
            Width = 123
          end
          item
            Alignment = taCenter
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'VER_NO'
            Footer.Color = clWhite
            Footers = <>
            Title.Caption = 'Version No'
            Width = 90
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'TBM_NO'
            Footer.Color = clWhite
            Footers = <>
            Title.Caption = 'Production TBM No'
            Width = 300
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'CUR_NO'
            Footer.Color = clWhite
            Footers = <>
            Title.Caption = 'Production Cure No'
            Width = 665
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = 16053492
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'TOTAL'
            Footer.Alignment = taRightJustify
            Footer.Color = clWhite
            Footer.DisplayFormat = '###,###,##0'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Total'
            Width = 60
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'STC1_CNT'
            Footer.Alignment = taRightJustify
            Footer.Color = clWhite
            Footer.DisplayFormat = '###,###,##0'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'SC1'
            Width = 60
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'STC2_CNT'
            Footer.Alignment = taRightJustify
            Footer.Color = clWhite
            Footer.DisplayFormat = '###,###,##0'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'SC2'
            Width = 60
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            Color = clWhite
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'STC3_CNT'
            Footer.Alignment = taRightJustify
            Footer.Color = clWhite
            Footer.DisplayFormat = '###,###,##0'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'SC3'
            Width = 60
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'STC4_CNT'
            Footer.Alignment = taRightJustify
            Footer.Color = clWhite
            Footer.DisplayFormat = '###,###,##0'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clNavy
            Footer.Font.Height = -15
            Footer.Font.Name = #46027#50880
            Footer.Font.Style = [fsBold]
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'SC4'
            Width = 60
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
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 1622
          Height = 26
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Color = 15198183
          ParentBackground = False
          TabOrder = 0
          object LblStatus: TPanel
            Left = 22
            Top = 3
            Width = 180
            Height = 20
            BevelOuter = bvNone
            Caption = '[ '#47001' '#49324#50857' '#54788#54889' ]'
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
        object dgStatus: TDBGridEh
          Left = 0
          Top = 26
          Width = 1622
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
          DataSource = dsStatus
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
          OnSelectionChanged = dgStatusSelectionChanged
          OnTitleClick = dgInfoTitleClick
          Columns = <
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Color = clWhite
              DynProps = <>
              EditButtons = <>
              FieldName = 'S'
              Footer.Alignment = taCenter
              Footer.Color = clWhite
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footers = <>
              Title.Caption = 'SC'
              Width = 110
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              Color = 16053492
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_TOT'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_TOT'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Total'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0.#%'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_RATIO'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0.##%'
              Footer.FieldName = 'CELL_RATIO'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtAvg
              Footers = <>
              Title.Caption = 'Ratio'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              Color = 16053492
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT1'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT1'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Empty'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              Color = clWhite
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT2'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT2'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Goods'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT3'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT3'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Pallet'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT4'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT4'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Input'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT5'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT5'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Output'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT6'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT6'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Reserved'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT7'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT7'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Picking'
              Visible = False
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT8'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT8'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Doble Error'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT9'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT9'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Empty Error'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT10'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT10'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Blocking'
              Width = 123
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'CELL_CNT11'
              Footer.Alignment = taRightJustify
              Footer.Color = clWhite
              Footer.DisplayFormat = '###,###,##0'
              Footer.FieldName = 'CELL_CNT11'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'NoRack'
              Width = 123
            end>
          object RowDetailData: TRowDetailPanelControlEh
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
      object chkGridMain: TCheckBox
        Left = 6
        Top = 32
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
        TabOrder = 2
        object PnlMonitoring: TPanel
          Left = 30
          Top = 0
          Width = 90
          Height = 50
          Align = alClient
          BevelOuter = bvNone
          Caption = #47784#45768#53552#47553
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
            ExplicitTop = -1
          end
        end
      end
      object PnlRowHeight: TPanel
        Left = 129
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
        TabOrder = 3
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
        Left = 129
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
        TabOrder = 4
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
        Left = 274
        Top = 5
        Width = 26
        Height = 23
        Associate = edtRowHeight
        Min = 1
        Max = 10
        Position = 1
        TabOrder = 5
      end
      object edtRowHeight: TEdit
        Left = 213
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
        TabOrder = 0
        Text = '1'
        OnChange = edtRowHeightChange
      end
      object udFontSize: TUpDown
        Left = 274
        Top = 32
        Width = 26
        Height = 23
        Associate = edtFontSize
        Min = 8
        Max = 20
        Position = 11
        TabOrder = 6
      end
      object edtFontSize: TEdit
        Left = 213
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
        TabOrder = 1
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
  object qryStatus: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 238
  end
  object dsStatus: TDataSource
    DataSet = qryStatus
    Left = 56
    Top = 238
  end
  object tmrQry: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = tmrQryTimer
    Left = 88
    Top = 239
  end
end
