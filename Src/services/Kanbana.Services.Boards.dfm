inherited ServiceBoards: TServiceBoards
  OldCreateOrder = True
  Height = 156
  Width = 317
  object Boards: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select '
      '  boards.id,'
      '  boards.name'
      'from boards')
    Left = 208
    Top = 56
    object BoardsId: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object BoardsName: TWideStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 255
    end
  end
end
