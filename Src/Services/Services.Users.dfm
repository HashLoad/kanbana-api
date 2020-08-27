inherited ServiceUsers: TServiceUsers
  OldCreateOrder = True
  Height = 160
  Width = 320
  object Users: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select '
      '  users.id,'
      '  users.name,'
      '  users.username,'
      '  users.password'
      'from users')
    Left = 208
    Top = 56
    object UsersId: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object UsersName: TWideStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 64
    end
    object UsersUsername: TWideStringField
      FieldName = 'username'
      Origin = 'username'
      Size = 64
    end
    object UsersPassword: TWideStringField
      FieldName = 'password'
      Origin = '"password"'
      Size = 64
    end
  end
end
