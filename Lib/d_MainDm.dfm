object MainDm: TMainDm
  OldCreateOrder = False
  Height = 247
  Width = 272
  object MainDatabase: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    AfterConnect = MainDatabaseAfterConnect
    AfterDisconnect = MainDatabaseAfterDisconnect
    Left = 40
    Top = 24
  end
  object qrySearch: TADOQuery
    Connection = MainDatabase
    Parameters = <>
    Left = 96
    Top = 24
  end
  object saveDlg: TSaveDialog
    Left = 144
    Top = 24
  end
  object PD_INS_PGM_HIST: TADOStoredProc
    Connection = MainDatabase
    ProcedureName = 'PD_INS_PGM_HIST'
    Parameters = <
      item
        Name = 'I_MENU_ID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_HIST_TYPE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_PGM_FUNCTION'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_EVENT_NAME'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_EVENT_DESC'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_COMMAND_TYPE'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_COMMAND_TEXT'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_PARAM'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_ERROR_MSG'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'I_USER_ID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'O_ERR_CD'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end
      item
        Name = 'O_ERR_MSG'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdOutput
        Size = 4000
        Value = Null
      end>
    Left = 40
    Top = 88
  end
end
