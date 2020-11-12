object frmU540: TfrmU540
  Left = 2026
  Top = 265
  ClientHeight = 586
  ClientWidth = 1594
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
    Top = 585
    Width = 1594
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
    Left = 1593
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
    Width = 1594
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
    Width = 1592
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
      Width = 1582
      Height = 510
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 318
        Top = 1
        Width = 7
        Height = 508
        Beveled = True
        ExplicitLeft = 731
        ExplicitHeight = 336
      end
      object Pnl_Main_Left: TPanel
        Left = 1
        Top = 1
        Width = 317
        Height = 508
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object PnlCode_perform: TPanel
          Left = 0
          Top = 0
          Width = 317
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
          TabOrder = 0
          object LblCode_perform: TPanel
            Left = 22
            Top = 3
            Width = 180
            Height = 20
            BevelOuter = bvNone
            Caption = '[ '#44592#44036#48324' '#49892#51201' ]'
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
          Left = 0
          Top = 26
          Width = 317
          Height = 482
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
          OnSelectionChanged = dgInfoSelectionChanged
          OnTitleClick = dgInfoTitleClick
          Columns = <
            item
              Alignment = taCenter
              Color = 16053492
              DynProps = <>
              EditButtons = <>
              FieldName = 'JOB_DATE'
              Footers = <>
              Title.Caption = 'Complete Date'
              Width = 90
            end
            item
              Alignment = taRightJustify
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'JOB_CNT'
              Footer.Alignment = taRightJustify
              Footer.DisplayFormat = '###,###,##0'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Total'
              Visible = False
              Width = 90
            end
            item
              Alignment = taRightJustify
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'IN_CNT'
              Footer.Alignment = taRightJustify
              Footer.DisplayFormat = '###,###,##0'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'JOB Count|Input'
              Width = 90
            end
            item
              Alignment = taRightJustify
              DisplayFormat = '###,###,##0'
              DynProps = <>
              EditButtons = <>
              FieldName = 'OT_CNT'
              Footer.Alignment = taRightJustify
              Footer.DisplayFormat = '###,###,##0'
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clNavy
              Footer.Font.Height = -15
              Footer.Font.Name = #46027#50880
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'JOB Count|Output'
              Width = 90
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object chkGridInfo: TCheckBox
          Left = 5
          Top = 43
          Width = 14
          Height = 16
          Cursor = crHandPoint
          Hint = 'Select Grid - Excel or Print'
          Checked = True
          Color = 15987699
          Enabled = False
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
          OnClick = chkGridInfoClick
        end
      end
      object Pnl_Main_Client: TPanel
        Left = 325
        Top = 1
        Width = 1256
        Height = 508
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 0
          Top = 256
          Width = 1256
          Height = 7
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          ExplicitWidth = 252
        end
        object Pnl_Sub_Top: TPanel
          Left = 0
          Top = 0
          Width = 1256
          Height = 256
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PnlIn_Put: TPanel
            Left = 0
            Top = 0
            Width = 1256
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
            TabOrder = 0
            object LblIn_Put: TPanel
              Left = 22
              Top = 3
              Width = 180
              Height = 20
              BevelOuter = bvNone
              Caption = '[ '#51077#44256' '#49892#51201' ]'
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
          object dgInfo_In: TDBGridEh
            Left = 0
            Top = 26
            Width = 1256
            Height = 230
            Align = alClient
            BorderStyle = bsNone
            ColumnDefValues.Layout = tlCenter
            DataGrouping.Font.Charset = GB2312_CHARSET
            DataGrouping.Font.Color = clWindowText
            DataGrouping.Font.Height = -11
            DataGrouping.Font.Name = 'Tahoma'
            DataGrouping.Font.Style = []
            DataGrouping.ParentFont = False
            DataSource = dsIn
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
            OnTitleClick = dgInfoTitleClick
            Columns = <
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'TIME_NUM'
                Footers = <>
                Title.Caption = 'Hour'
                Width = 80
              end
              item
                Alignment = taRightJustify
                Color = clWhite
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'TOTAL_DESC'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Total'
                Width = 80
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M00_ID'
                Footers = <>
                Title.Caption = 'Manual|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M00_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Manual|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M01_ID'
                Footers = <>
                Title.Caption = 'M01|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M01_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M01|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M02_ID'
                Footers = <>
                Title.Caption = 'M02|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M02_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M02|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M03_ID'
                Footers = <>
                Title.Caption = 'M03|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M03_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M03|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M04_ID'
                Footers = <>
                Title.Caption = 'M04|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M04_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M04|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M05_ID'
                Footers = <>
                Title.Caption = 'M05|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M05_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M05|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M06_ID'
                Footers = <>
                Title.Caption = 'M06|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M06_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M06|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M07_ID'
                Footers = <>
                Title.Caption = 'M07|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M07_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M07|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M08_ID'
                Footers = <>
                Title.Caption = 'M08|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M08_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M08|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M09_ID'
                Footers = <>
                Title.Caption = 'M09|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M09_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M09|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M10_ID'
                Footers = <>
                Title.Caption = 'M10|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M10_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M10|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M11_ID'
                Footers = <>
                Title.Caption = 'M11|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M11_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M11|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M12_ID'
                Footers = <>
                Title.Caption = 'M12|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M12_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M12|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M13_ID'
                Footers = <>
                Title.Caption = 'M13|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M13_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M13|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M14_ID'
                Footers = <>
                Title.Caption = 'M14|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M14_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M14|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M15_ID'
                Footers = <>
                Title.Caption = 'M15|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M15_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M15|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M16_ID'
                Footers = <>
                Title.Caption = 'M16|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M16_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M16|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M17_ID'
                Footers = <>
                Title.Caption = 'M17|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M17_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M17|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M18_ID'
                Footers = <>
                Title.Caption = 'M18|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M18_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M18|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M19_ID'
                Footers = <>
                Title.Caption = 'M19|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M19_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M19|CNT'
                Visible = False
                Width = 100
              end
              item
                Alignment = taCenter
                AutoFitColWidth = False
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M20_ID'
                Footers = <>
                Title.Caption = 'M20|ID'
                Visible = False
                Width = 100
              end
              item
                Alignment = taRightJustify
                AutoFitColWidth = False
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M20_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M20|CNT'
                Visible = False
                Width = 100
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object chkGridInfo_IN: TCheckBox
            Tag = 1
            Left = 4
            Top = 43
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
            OnClick = chkGridInfoClick
          end
        end
        object Pnl_Sub_Client: TPanel
          Left = 0
          Top = 263
          Width = 1256
          Height = 245
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PnlOut_Put: TPanel
            Left = 0
            Top = 0
            Width = 1256
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
            TabOrder = 0
            object Panel9: TPanel
              Left = 1005
              Top = 1
              Width = 250
              Height = 24
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object Panel4: TPanel
                Left = 15
                Top = 2
                Width = 230
                Height = 20
                BevelOuter = bvNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #46027#50880
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object PnlCuringLine: TPanel
                  Left = 0
                  Top = 0
                  Width = 127
                  Height = 20
                  Align = alLeft
                  BevelOuter = bvNone
                  Caption = #44032#47448#44592' '#46972#51064
                  Color = 14408667
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = #46027#50880
                  Font.Style = []
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 0
                end
                object cbLine: TComboBox
                  Left = 130
                  Top = 0
                  Width = 100
                  Height = 20
                  Align = alRight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #46027#50880
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Text = 'CURE 01-17'
                  OnChange = cbLineChange
                  Items.Strings = (
                    'CURE 01-17'
                    'CURE 18-34'
                    'CURE 35-51'
                    'CURE 52-68')
                end
              end
            end
            object LblOut_Put: TPanel
              Left = 22
              Top = 3
              Width = 180
              Height = 20
              BevelOuter = bvNone
              Caption = '[ '#52636#44256' '#49892#51201' ]'
              Color = 14408667
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = #46027#50880
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
            end
          end
          object dgInfo_Out: TDBGridEh
            Left = 0
            Top = 26
            Width = 1256
            Height = 219
            Align = alClient
            BorderStyle = bsNone
            ColumnDefValues.Layout = tlCenter
            DataGrouping.Font.Charset = GB2312_CHARSET
            DataGrouping.Font.Color = clWindowText
            DataGrouping.Font.Height = -11
            DataGrouping.Font.Name = 'Tahoma'
            DataGrouping.Font.Style = []
            DataGrouping.ParentFont = False
            DataSource = dsOut
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
            OnTitleClick = dgInfoTitleClick
            Columns = <
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'TIME_NUM'
                Footers = <>
                Title.Caption = 'Hour'
                Width = 80
              end
              item
                Alignment = taRightJustify
                Color = clWhite
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'TOTAL_DESC'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Total'
                Width = 80
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M00_ID'
                Footers = <>
                Title.Caption = 'Manual|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M00_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Manual|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M01_ID'
                Footers = <>
                Title.Caption = 'M01|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M01_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M01|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M02_ID'
                Footers = <>
                Title.Caption = 'M02|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M02_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M02|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M03_ID'
                Footers = <>
                Title.Caption = 'M03|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M03_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M03|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M04_ID'
                Footers = <>
                Title.Caption = 'M04|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M04_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M04|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M05_ID'
                Footers = <>
                Title.Caption = 'M05|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M05_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M05|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M06_ID'
                Footers = <>
                Title.Caption = 'M06|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M06_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M06|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M07_ID'
                Footers = <>
                Title.Caption = 'M07|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M07_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M07|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M08_ID'
                Footers = <>
                Title.Caption = 'M08|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M08_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M08|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M09_ID'
                Footers = <>
                Title.Caption = 'M09|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M09_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M09|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M10_ID'
                Footers = <>
                Title.Caption = 'M10|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M10_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M10|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M11_ID'
                Footers = <>
                Title.Caption = 'M11|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M11_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M11|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M12_ID'
                Footers = <>
                Title.Caption = 'M12|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M12_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M12|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M13_ID'
                Footers = <>
                Title.Caption = 'M13|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M13_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M13|CNT'
                Width = 100
              end
              item
                Alignment = taCenter
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M14_ID'
                Footers = <>
                Title.Caption = 'M14|ID'
                Width = 100
              end
              item
                Alignment = taRightJustify
                DisplayFormat = '###,###,##0'
                DynProps = <>
                EditButtons = <>
                FieldName = 'M14_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M14|CNT'
                Width = 100
              end
              item
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M15_ID'
                Footers = <>
                Title.Caption = 'M15|ID'
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'M15_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M15|CNT'
                Width = 100
              end
              item
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M16_ID'
                Footers = <>
                Title.Caption = 'M16|ID'
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'M16_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M16|CNT'
                Width = 100
              end
              item
                Color = 16053492
                DynProps = <>
                EditButtons = <>
                FieldName = 'M17_ID'
                Footers = <>
                Title.Caption = 'M17|ID'
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'M17_CNT'
                Footer.Alignment = taRightJustify
                Footer.DisplayFormat = '###,###,##0'
                Footer.Font.Charset = DEFAULT_CHARSET
                Footer.Font.Color = clNavy
                Footer.Font.Height = -15
                Footer.Font.Name = #46027#50880
                Footer.Font.Style = [fsBold]
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'M17|CNT'
                Width = 100
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object chkGridInfo_OUT: TCheckBox
            Tag = 1
            Left = 4
            Top = 43
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
            OnClick = chkGridInfoClick
          end
        end
      end
    end
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1582
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
        TabOrder = 4
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
            ExplicitTop = -1
            ExplicitHeight = 51
          end
        end
      end
      object Panel6: TPanel
        Left = 213
        Top = 5
        Width = 151
        Height = 23
        BevelOuter = bvNone
        TabOrder = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
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
        TabOrder = 5
        object lblCompleteDate: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 50
          Align = alClient
          Alignment = taCenter
          Caption = #50756#47308#51068#51088
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object Panel2: TPanel
        Left = 213
        Top = 32
        Width = 151
        Height = 23
        BevelOuter = bvNone
        TabOrder = 3
        object Panel18: TPanel
          Left = 0
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
      end
      object Panel5: TPanel
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
        object Panel7: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel12: TPanel
        Left = 213
        Top = 32
        Width = 244
        Height = 23
        BevelOuter = bvNone
        TabOrder = 1
        object Panel14: TPanel
          Left = 150
          Top = 0
          Width = 4
          Height = 23
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
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
      end
    end
    object Panel26: TPanel
      Left = 5
      Top = 65
      Width = 1582
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
      object Panel27: TPanel
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
    Left = 48
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
    Left = 80
    Top = 190
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 15
    Top = 191
  end
  object qryIn: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 831
    Top = 183
  end
  object dsIn: TDataSource
    DataSet = qryIn
    Left = 864
    Top = 183
  end
  object qryOut: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 823
    Top = 439
  end
  object dsOut: TDataSource
    DataSet = qryOut
    Left = 856
    Top = 439
  end
end
