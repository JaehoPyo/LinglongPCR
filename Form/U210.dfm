object frmU210: TfrmU210
  Left = 2026
  Top = 0
  ClientHeight = 740
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
  object Pnl_Base: TPanel
    Left = 0
    Top = 0
    Width = 1636
    Height = 740
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Pnl_Main: TPanel
      Left = 5
      Top = 249
      Width = 1626
      Height = 486
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 3
      object Splitter3: TSplitter
        Left = 1
        Top = 328
        Width = 1624
        Height = 7
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
        ExplicitTop = 27
      end
      object dgInfo: TDBGridEh
        Left = 1
        Top = 27
        Width = 1624
        Height = 301
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
              'X'
              'X'
              'O'
              '')
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
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 1624
        Height = 26
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Color = 15198183
        ParentBackground = False
        TabOrder = 1
        object LblList: TPanel
          Left = 22
          Top = 3
          Width = 180
          Height = 20
          BevelOuter = bvNone
          Caption = '[ '#49688#46041' '#51077#44256' '#51089#50629' ]'
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
      object Pnl_Bottom: TPanel
        Left = 1
        Top = 335
        Width = 1624
        Height = 150
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object dgStatus: TDBGridEh
          Left = 0
          Top = 26
          Width = 1624
          Height = 124
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
          TabOrder = 2
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
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1624
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
          TabOrder = 1
          OnClick = chkGridSubClick
        end
      end
      object chkGridMain: TCheckBox
        Left = 6
        Top = 46
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
        TabOrder = 3
        OnClick = chkGridMainClick
      end
    end
    object Pnl_Top2: TPanel
      Left = 5
      Top = 125
      Width = 1626
      Height = 60
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #46027#50880
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object LblFitem: TLabel
        Left = 1617
        Top = 1
        Width = 8
        Height = 58
        Hint = 'Front Cargo Information'
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16711808
        Font.Height = -23
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object Panel5: TPanel
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
        object Panel6: TPanel
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
          object lblFCargoInfo: TLabel
            Left = 0
            Top = 0
            Width = 90
            Height = 28
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = #51204' '#54868#47932
            Color = 14540253
            ParentColor = False
            Layout = tlBottom
            WordWrap = True
            ExplicitLeft = -3
            ExplicitTop = -2
          end
          object lblFSite1: TLabel
            Left = 0
            Top = 31
            Width = 90
            Height = 19
            Hint = 'Front Site No'
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = '[SITE 482]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Layout = tlCenter
            ExplicitTop = 32
          end
        end
        object Panel14: TPanel
          Left = 0
          Top = 0
          Width = 30
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sbtClear1: TSpeedButton
            Tag = 1
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
      object Panel17: TPanel
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
        TabOrder = 7
        object lblMAT_CODE1: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object Panel18: TPanel
        Left = 129
        Top = 32
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
        TabOrder = 8
        object lblMAT_SPEC1: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object edtMAT_SPEC1: TEdit
        Tag = 1
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
      object edtMAT_CODE1: TEdit
        Tag = 1
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
        OnChange = edtMAT_CODEChange
        OnKeyPress = KeyPress
      end
      object Panel21: TPanel
        Left = 352
        Top = 6
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 9
        object sbt_ITEM1: TSpeedButton
          Tag = 1
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
          ExplicitLeft = 1
          ExplicitTop = -1
        end
      end
      object edtBCR_NO1: TEdit
        Tag = 1
        Left = 492
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
      object Panel24: TPanel
        Left = 388
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
        TabOrder = 10
        object lblVER_NO1: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object edtVER_NO1: TEdit
        Tag = 1
        Left = 492
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
      object Panel25: TPanel
        Left = 388
        Top = 32
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
        TabOrder = 11
        object lblBCR_NO1: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object Panel26: TPanel
        Left = 908
        Top = 5
        Width = 100
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
        object lblFCargoExist: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 28
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = #54868#47932#44048#51648
          Color = 14540253
          ParentColor = False
          Layout = tlBottom
          WordWrap = True
          ExplicitTop = 8
        end
        object lblFSite2: TLabel
          Left = 0
          Top = 31
          Width = 100
          Height = 19
          Hint = 'Front Site No'
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Caption = '[SITE 482]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Layout = tlCenter
          ExplicitTop = 32
          ExplicitWidth = 90
        end
      end
      object edtFCargo: TEdit
        Tag = 1
        Left = 1012
        Top = 5
        Width = 150
        Height = 50
        TabStop = False
        Alignment = taCenter
        AutoSize = False
        Color = 16053492
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -41
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        OnKeyPress = KeyPress
      end
      object PnlFCrago: TPanel
        Left = 1046
        Top = 8
        Width = 82
        Height = 42
        BevelOuter = bvNone
        Color = 16053492
        ParentBackground = False
        TabOrder = 14
        Visible = False
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 82
          Height = 42
          Hint = 'Front Cargo Sensor On'
          Align = alClient
          Brush.Color = 3223857
          ParentShowHint = False
          Pen.Color = clSilver
          Pen.Width = 2
          Shape = stCircle
          ShowHint = True
          ExplicitLeft = -7
          ExplicitTop = 2
          ExplicitHeight = 44
        end
        object Shape2: TShape
          Left = 32
          Top = 12
          Width = 18
          Height = 18
          Hint = 'Front Cargo Sensor On'
          ParentShowHint = False
          Pen.Color = clSilver
          Pen.Width = 2
          Shape = stCircle
          ShowHint = True
        end
      end
      object Panel7: TPanel
        Left = 648
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
        TabOrder = 15
        object lblWEIGHT1: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #47924#44172
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 30
          ExplicitHeight = 15
        end
      end
      object edtWeight1: TEdit
        Tag = 1
        Left = 752
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
      object Panel27: TPanel
        Left = 648
        Top = 32
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
        TabOrder = 16
        object lblSPRAY1: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #49828#54532#47112#51060
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object cbSpray1: TComboBox
        Tag = 1
        Left = 752
        Top = 32
        Width = 150
        Height = 23
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 5
        Text = 'NO'
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'NO'
          'OK')
      end
    end
    object Pnl_Top1: TPanel
      Left = 5
      Top = 65
      Width = 1626
      Height = 60
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #46027#50880
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object LblType: TLabel
        Left = 1617
        Top = 1
        Width = 8
        Height = 58
        Hint = 'Input Type'
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -23
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object Panel9: TPanel
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
        TabOrder = 0
        object Panel10: TPanel
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
          object lblENTER_TYPE: TLabel
            Left = 0
            Top = 0
            Width = 90
            Height = 50
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #51077#44256#53440#51077
            Color = 14540253
            ParentColor = False
            Layout = tlCenter
            WordWrap = True
            ExplicitLeft = 6
            ExplicitTop = -1
          end
        end
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 30
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sbtClear3: TSpeedButton
            Tag = 3
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
      object Panel23: TPanel
        Left = 129
        Top = 4
        Width = 513
        Height = 51
        BevelInner = bvLowered
        TabOrder = 1
        object rbMode1: TRadioButton
          Tag = 1
          Left = 15
          Top = 5
          Width = 150
          Height = 17
          Caption = 'Production'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbModeClick
        end
        object rbMode4: TRadioButton
          Tag = 4
          Left = 15
          Top = 28
          Width = 150
          Height = 17
          Caption = 'Curing in Reject'
          TabOrder = 3
          OnClick = rbModeClick
        end
        object rbMode2: TRadioButton
          Tag = 2
          Left = 175
          Top = 5
          Width = 150
          Height = 17
          Caption = 'Repair'
          TabOrder = 1
          OnClick = rbModeClick
        end
        object rbMode5: TRadioButton
          Tag = 5
          Left = 175
          Top = 28
          Width = 150
          Height = 17
          Caption = 'Barcode Error'
          TabOrder = 4
          OnClick = rbModeClick
        end
        object rbMode3: TRadioButton
          Tag = 3
          Left = 335
          Top = 5
          Width = 150
          Height = 17
          Caption = 'Warehouse Full'
          TabOrder = 2
          OnClick = rbModeClick
        end
        object rbMode6: TRadioButton
          Tag = 6
          Left = 335
          Top = 28
          Width = 150
          Height = 17
          Caption = 'etc'
          TabOrder = 5
          OnClick = rbModeClick
        end
      end
      object Panel31: TPanel
        Left = 648
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
        TabOrder = 2
        object lblSCUse: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #49444#48708#49324#50857
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object edtSCUse: TEdit
        Tag = 1
        Left = 752
        Top = 5
        Width = 150
        Height = 23
        Hint = 'Stacker Crane Warehousing Availability Check'
        TabStop = False
        Alignment = taCenter
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        OnKeyPress = KeyPress
      end
      object Panel32: TPanel
        Left = 648
        Top = 32
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
        TabOrder = 4
        object lblEmptyCnt: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #44277#49472#49688#47049
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object edtEmptyCnt: TEdit
        Tag = 1
        Left = 752
        Top = 32
        Width = 150
        Height = 23
        Hint = 'Empty Cell Count'
        TabStop = False
        Alignment = taCenter
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        OnKeyPress = KeyPress
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 245
      Width = 1626
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
      TabOrder = 4
      object Panel4: TPanel
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
    object Pnl_Top2_R: TPanel
      Left = 5
      Top = 185
      Width = 1626
      Height = 60
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #46027#50880
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object LblRitem: TLabel
        Left = 1617
        Top = 1
        Width = 8
        Height = 58
        Hint = 'Rear Cargo Information'
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4227072
        Font.Height = -23
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
        ExplicitHeight = 28
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
        TabOrder = 6
        object PnlInfo: TPanel
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
          object lblRCargoInfo: TLabel
            Left = 0
            Top = 0
            Width = 90
            Height = 28
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = #54980' '#54868#47932
            Color = 14540253
            ParentColor = False
            Layout = tlBottom
            WordWrap = True
            ExplicitLeft = -3
            ExplicitTop = -2
          end
          object lblRSite1: TLabel
            Left = 0
            Top = 31
            Width = 90
            Height = 19
            Hint = 'Rear Site No'
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = '[SITE 484]'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = #46027#50880
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
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
          object sbtClear2: TSpeedButton
            Tag = 2
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
      object Panel13: TPanel
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
        TabOrder = 7
        object lblMAT_CODE2: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object Panel15: TPanel
        Left = 129
        Top = 32
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
        TabOrder = 8
        object lblMAT_SPEC2: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object edtMAT_SPEC2: TEdit
        Tag = 2
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
      object edtMAT_CODE2: TEdit
        Tag = 2
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
        OnChange = edtMAT_CODEChange
        OnKeyPress = KeyPress
      end
      object Panel16: TPanel
        Left = 352
        Top = 6
        Width = 30
        Height = 21
        BevelOuter = bvNone
        TabOrder = 9
        object sbt_ITEM2: TSpeedButton
          Tag = 2
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
          ExplicitTop = -1
        end
      end
      object edtBCR_NO2: TEdit
        Tag = 2
        Left = 492
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
      object Panel19: TPanel
        Left = 388
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
        TabOrder = 10
        object lblVER_NO2: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object edtVER_NO2: TEdit
        Tag = 2
        Left = 492
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
      object Panel20: TPanel
        Left = 388
        Top = 32
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
        TabOrder = 11
        object lblBCR_NO2: TLabel
          Left = 0
          Top = 0
          Width = 100
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
      object Panel22: TPanel
        Left = 908
        Top = 5
        Width = 100
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
        object lblRCargoExist: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 28
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = #54868#47932#44048#51648
          Color = 14540253
          ParentColor = False
          Layout = tlBottom
          WordWrap = True
          ExplicitTop = 8
        end
        object lblRSite2: TLabel
          Left = 0
          Top = 31
          Width = 100
          Height = 19
          Hint = 'Rear Site No'
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Caption = '[SITE 484]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Layout = tlCenter
          ExplicitTop = 32
          ExplicitWidth = 90
        end
      end
      object edtRCargo: TEdit
        Tag = 1
        Left = 1012
        Top = 5
        Width = 150
        Height = 50
        TabStop = False
        Alignment = taCenter
        AutoSize = False
        Color = 16053492
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -41
        Font.Name = #44404#47548
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        OnKeyPress = KeyPress
      end
      object PnlRCrago: TPanel
        Left = 1046
        Top = 8
        Width = 82
        Height = 42
        BevelOuter = bvNone
        Color = 16053492
        ParentBackground = False
        TabOrder = 14
        Visible = False
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 82
          Height = 42
          Hint = 'Rear Cargo Sensor On'
          Align = alClient
          Brush.Color = 3223857
          ParentShowHint = False
          Pen.Color = clSilver
          Pen.Width = 2
          Shape = stCircle
          ShowHint = True
          ExplicitTop = -1
          ExplicitWidth = 80
          ExplicitHeight = 44
        end
        object Shape4: TShape
          Left = 32
          Top = 12
          Width = 18
          Height = 18
          Hint = 'Rear Cargo Sensor On'
          ParentShowHint = False
          Pen.Color = clSilver
          Pen.Width = 2
          Shape = stCircle
          ShowHint = True
        end
      end
      object Panel28: TPanel
        Left = 648
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
        TabOrder = 15
        object lblWEIGHT2: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #47924#44172
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 30
          ExplicitHeight = 15
        end
      end
      object edtWeight2: TEdit
        Tag = 2
        Left = 752
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
      object Panel29: TPanel
        Left = 648
        Top = 32
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
        TabOrder = 16
        object lblSPRAY2: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = #49828#54532#47112#51060
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object cbSpray2: TComboBox
        Tag = 2
        Left = 752
        Top = 32
        Width = 150
        Height = 23
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 5
        Text = 'NO'
        OnKeyPress = cbKeyPress
        Items.Strings = (
          'NO'
          'OK')
      end
    end
    object Panel33: TPanel
      Left = 5
      Top = 5
      Width = 1626
      Height = 60
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #46027#50880
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      object LblPosition: TLabel
        Left = 1617
        Top = 1
        Width = 8
        Height = 58
        Hint = 'Input Type'
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object Label1: TLabel
        Left = 1609
        Top = 1
        Width = 8
        Height = 58
        Hint = 'Input Type'
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
        ExplicitHeight = 28
      end
      object Panel34: TPanel
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
        TabOrder = 0
        object Panel35: TPanel
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
          object lblENTER_POS: TLabel
            Left = 0
            Top = 0
            Width = 90
            Height = 50
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #51077#44256#50948#52824
            Color = 14540253
            ParentColor = False
            Layout = tlCenter
            WordWrap = True
            ExplicitLeft = 6
            ExplicitTop = -1
          end
        end
        object Panel36: TPanel
          Left = 0
          Top = 0
          Width = 30
          Height = 50
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sbtClear4: TSpeedButton
            Tag = 4
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
      object Panel37: TPanel
        Left = 129
        Top = 4
        Width = 513
        Height = 51
        BevelInner = bvLowered
        TabOrder = 1
        object rbPos1: TRadioButton
          Tag = 1
          Left = 15
          Top = 17
          Width = 150
          Height = 17
          Caption = 'Reject Line'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbPosClick
        end
        object rbPos2: TRadioButton
          Tag = 2
          Left = 175
          Top = 17
          Width = 150
          Height = 17
          Hint = 'Input Line'
          Caption = 'Input Line[Cart]'
          TabOrder = 1
          OnClick = rbPosClick
        end
      end
      object Panel30: TPanel
        Left = 648
        Top = 5
        Width = 100
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
        object lblSCNo: TLabel
          Left = 0
          Top = 0
          Width = 100
          Height = 50
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = #51201#52824#54840#44592
          Color = 14540253
          ParentColor = False
          Layout = tlCenter
          WordWrap = True
          ExplicitLeft = -1
        end
      end
      object edtSCNo: TEdit
        Tag = 1
        Left = 752
        Top = 5
        Width = 150
        Height = 49
        Hint = 'Fix Staker Crane No'
        TabStop = False
        Alignment = taCenter
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6316128
        Font.Height = -41
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        OnChange = edtSCNoChange
        OnKeyPress = KeyPress
        OnKeyUp = edtSCNoKeyUp
      end
    end
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 246
  end
  object dsInfo: TDataSource
    DataSet = qryInfo
    Left = 56
    Top = 246
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
    Top = 246
  end
  object qryTemp: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 88
    Top = 246
  end
  object tmrQry: TTimer
    Enabled = False
    OnTimer = tmrQryTimer
    Left = 152
    Top = 246
  end
  object qryStatus: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 24
    Top = 294
  end
  object dsStatus: TDataSource
    DataSet = qryStatus
    Left = 56
    Top = 294
  end
  object PD_MANUAL_INPUT: TADOStoredProc
    Connection = MainDm.MainDatabase
    ProcedureName = 'PD_MANUAL_GT_INPUT'
    Parameters = <
      item
        Name = 'I_STCNO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 38
        Value = Null
      end
      item
        Name = 'I_IN_MODE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 38
        Value = Null
      end
      item
        Name = 'I_F_SITE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_CODE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_SKU'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_VER'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_BCR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_SPRAY'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_WEIGHT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_F_DATE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_SITE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_CODE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_SKU'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_VER'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_BCR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_SPRAY'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_WEIGHT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_R_DATE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'O_CODE'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Value = Null
      end
      item
        Name = 'O_MSG'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end>
    Left = 86
    Top = 294
  end
  object qryCheck: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 120
    Top = 294
  end
end
