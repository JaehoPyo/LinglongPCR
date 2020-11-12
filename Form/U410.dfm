object frmU410: TfrmU410
  Left = 331
  Top = 141
  ClientHeight = 586
  ClientWidth = 1504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #46027#50880
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
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
  TextHeight = 11
  object shpB: TShape
    Left = 0
    Top = 585
    Width = 1504
    Height = 1
    Align = alBottom
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitTop = 3000
    ExplicitWidth = 1264
  end
  object shpR: TShape
    Left = 1503
    Top = 0
    Width = 1
    Height = 585
    Align = alRight
    Brush.Color = clNavy
    Pen.Color = 9408913
    ExplicitLeft = 213
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object Pnl_Base: TPanel
    Left = 0
    Top = 0
    Width = 1503
    Height = 585
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = 15198183
    ParentBackground = False
    TabOrder = 0
    object Pnl_Top: TPanel
      Left = 5
      Top = 5
      Width = 1493
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
        TabOrder = 0
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
            Height = 50
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #44160#49353#51312#44148
            Color = 14540253
            ParentColor = False
            Layout = tlCenter
            WordWrap = True
            ExplicitTop = -1
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
      object CellStatus10: TPanel
        Left = 473
        Top = 6
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = 15263976
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
      object CellStatus1: TPanel
        Left = 473
        Top = 32
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clYellow
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object CellStatus3: TPanel
        Left = 807
        Top = 32
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clLime
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
      end
      object CellStatus11: TPanel
        Left = 640
        Top = 6
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = 10837019
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
      end
      object CellStatus5: TPanel
        Left = 974
        Top = 6
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clRed
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
      end
      object CellStatus6: TPanel
        Left = 1141
        Top = 6
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clFuchsia
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
      end
      object CellStatus2: TPanel
        Left = 640
        Top = 32
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clPurple
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
      end
      object pnlCellStatus10: TPanel
        Left = 534
        Top = 6
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #48712' '#47001
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object pnlCellStatus1: TPanel
        Left = 534
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #51077#44256#51473
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object pnlCellStatus3: TPanel
        Left = 868
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #50696' '#50557
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object pnlCellStatus11: TPanel
        Left = 701
        Top = 6
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #51228' '#54408
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object pnlCellStatus2: TPanel
        Left = 701
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #52636#44256#51473
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object pnlCellStatus6: TPanel
        Left = 1202
        Top = 6
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #44277#52636#44256
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object pnlCellStatus5: TPanel
        Left = 1035
        Top = 6
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #51060#51473#51077#44256
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object CellStatus8: TPanel
        Left = 1141
        Top = 32
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clBlack
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 15
      end
      object pnlCellStatus8: TPanel
        Left = 1202
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #44552' '#51648
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object CellStatus12: TPanel
        Left = 807
        Top = 6
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = clGreen
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 17
      end
      object pnlCellStatus12: TPanel
        Left = 868
        Top = 6
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #54028#47112#53944
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
      object CellStatus4: TPanel
        Left = 1308
        Top = 32
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = 33023
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 19
        Visible = False
      end
      object pnlCellStatus4: TPanel
        Left = 1369
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #54588' '#53433
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        Visible = False
      end
      object PnlRemark: TPanel
        Left = 389
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
        TabOrder = 21
        object lblRemark: TLabel
          Left = 0
          Top = 0
          Width = 80
          Height = 50
          Align = alClient
          Alignment = taCenter
          Caption = #48276#47168
          Layout = tlCenter
          WordWrap = True
          ExplicitWidth = 30
          ExplicitHeight = 15
        end
      end
      object Panel14: TPanel
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
        TabOrder = 22
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
      object Panel15: TPanel
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
        TabOrder = 23
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
        Left = 213
        Top = 5
        Width = 170
        Height = 23
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        Text = 'Stacker Crane 1'
        OnChange = cbHogiChange
        Items.Strings = (
          'Stacker Crane 1'
          'Stacker Crane 2'
          'Stacker Crane 3'
          'Stacker Crane 4'
          'Stacker Crane 5'
          'Stacker Crane 7'
          'Stacker Crane 8'
          'Stacker Crane 9'
          'Stacker Crane 10'
          'Stacker Crane 11')
      end
      object Panel16: TPanel
        Left = 213
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
        TabOrder = 25
        object cbCBank: TComboBox
          Tag = 1
          Left = 0
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'ALL'
          OnChange = cbCChange
          Items.Strings = (
            'ALL'
            '1'
            '2')
        end
        object cbCBay: TComboBox
          Tag = 2
          Left = 58
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'ALL'
          OnChange = cbCChange
          Items.Strings = (
            'ALL'
            '001'
            '002')
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
          Tag = 3
          Left = 116
          Top = 0
          Width = 54
          Height = 23
          Align = alLeft
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #46027#50880
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'ALL'
          OnChange = cbCChange
          Items.Strings = (
            'ALL'
            '01'
            '02'
            '03')
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
      object CellStatus99: TPanel
        Left = 1308
        Top = 6
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Caption = 'X'
        Color = 13553358
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 26
      end
      object pnlCellStatus99: TPanel
        Left = 1369
        Top = 6
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #47001' '#50630#51020
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 27
      end
      object CellStatus98: TPanel
        Left = 974
        Top = 32
        Width = 55
        Height = 23
        ParentCustomHint = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BiDiMode = bdLeftToRight
        Color = 10837019
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 28
        object Label1: TLabel
          Left = 43
          Top = 1
          Width = 7
          Height = 13
          Caption = 's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
      object pnlCellStatus98: TPanel
        Left = 1035
        Top = 32
        Width = 100
        Height = 23
        BevelOuter = bvNone
        Caption = #49828#54532#47112#51060
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 29
      end
    end
    object Pnl_Main: TPanel
      Left = 5
      Top = 69
      Width = 1493
      Height = 324
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #46027#50880
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object PnlRackBase: TPanel
        Left = 0
        Top = 0
        Width = 1493
        Height = 324
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object Pnl_Bottom: TPanel
      Left = 5
      Top = 397
      Width = 1493
      Height = 183
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Splitter1: TSplitter
        Left = 1100
        Top = 0
        Width = 7
        Height = 183
        Beveled = True
        ExplicitLeft = 625
        ExplicitTop = 30
        ExplicitHeight = 125
      end
      object Pnl_Bottom_Right: TPanel
        Left = 1107
        Top = 0
        Width = 386
        Height = 183
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 386
          Height = 26
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Color = 15198183
          ParentBackground = False
          TabOrder = 0
          object LblChart: TPanel
            Left = 22
            Top = 3
            Width = 180
            Height = 20
            BevelOuter = bvNone
            Caption = '[ '#47001' '#49324#50857#54788#54889' ]'
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
        object DBChart1: TDBChart
          Left = 0
          Top = 26
          Width = 386
          Height = 157
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
          TabOrder = 1
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
            XLabelsSource = 'STATUS_DESC'
            BarStyle = bsBevel
            BarWidthPercent = 30
            Sides = 25
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            YValues.ValueSource = 'STATUS_SUM'
          end
        end
      end
      object Pnl_Bottom_Left: TPanel
        Left = 0
        Top = 0
        Width = 1100
        Height = 183
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1100
          Height = 26
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Color = 15198183
          ParentBackground = False
          TabOrder = 0
          object LblInfo: TPanel
            Left = 22
            Top = 3
            Width = 180
            Height = 20
            BevelOuter = bvNone
            Caption = '[ '#47001' '#51221#48372' ]'
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
          Width = 1100
          Height = 157
          Align = alClient
          BorderStyle = bsNone
          ColumnDefValues.Layout = tlCenter
          DataGrouping.Font.Charset = GB2312_CHARSET
          DataGrouping.Font.Color = clWindowText
          DataGrouping.Font.Height = -11
          DataGrouping.Font.Name = 'Tahoma'
          DataGrouping.Font.Style = []
          DataGrouping.ParentFont = False
          DataSource = dsCell
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
          OnDblClick = dgInfoDblClick
          OnTitleClick = dgInfoTitleClick
          Columns = <
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Color = 16053492
              DynProps = <>
              EditButtons = <>
              FieldName = 'LOCATION'
              Footers = <>
              Title.Caption = 'Location'
              Width = 120
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              Color = clWhite
              DynProps = <>
              EditButtons = <>
              FieldName = 'S'
              Footers = <>
              Title.Caption = 'SC'
              Visible = False
              Width = 60
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'Z'
              Footers = <>
              Title.Caption = 'Bank'
              Visible = False
              Width = 60
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'X'
              Footers = <>
              Title.Caption = 'Bay'
              Visible = False
              Width = 60
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'Y'
              Footers = <>
              Title.Caption = 'Level'
              Visible = False
              Width = 60
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
              Width = 120
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
              DynProps = <>
              EditButtons = <>
              FieldName = 'GT_MAT_SPEC'
              Footers = <>
              Title.Caption = 'MAT Spec'
              Width = 150
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
              FieldName = 'MCH_NO'
              Footers = <>
              Title.Caption = 'TBM No'
              Width = 100
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
              Width = 110
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
              Width = 110
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
              Width = 110
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
                'O')
              Title.Caption = 'Spray'
              Width = 80
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
              DynProps = <>
              EditButtons = <>
              FieldName = 'PALLET_CODE'
              Footers = <>
              Title.Caption = 'Pallet Code'
              Width = 100
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'UPDATE_DT'
              Footers = <>
              Title.Caption = 'Update Date'
              Width = 250
            end
            item
              Alignment = taCenter
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'CREATE_DT'
              Footers = <>
              Title.Caption = 'Create Date'
              Width = 250
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 5
      Top = 65
      Width = 1493
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
      TabOrder = 3
      object Panel9: TPanel
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
    object Panel26: TPanel
      Left = 5
      Top = 393
      Width = 1493
      Height = 4
      ParentCustomHint = False
      Align = alBottom
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
  object qryCell: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 56
    Top = 241
  end
  object qryInfo: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    Left = 56
    Top = 200
  end
  object tmrQry: TTimer
    Enabled = False
    OnTimer = tmrQryTimer
    Left = 24
    Top = 200
  end
  object dsCell: TDataSource
    DataSet = qryCell
    Left = 24
    Top = 241
  end
  object qrySummary: TADOQuery
    Connection = MainDm.MainDatabase
    Parameters = <>
    SQL.Strings = (
      'Select STATUS, Count(STATUS) as STATUS_SUM,'
      
        '                      fn_getRack_str(LUGG, STATUS) as STATUS_DES' +
        'C'
      '                 From C_RACK_I'
      '                Where S = 3'
      '                Group by LUGG, STATUS'
      'ORDER BY STATUS_SUM')
    Left = 88
    Top = 241
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
    Top = 200
  end
end
