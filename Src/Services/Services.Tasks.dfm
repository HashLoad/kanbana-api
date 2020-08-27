inherited ServiceTasks: TServiceTasks
  OldCreateOrder = True
  Height = 148
  Width = 304
  object Tasks: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select'
      '  tasks.id,'
      '  tasks.name,'
      '  tasks.section_id'
      'from tasks')
    Left = 200
    Top = 56
    object TasksId: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TasksName: TWideStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 255
    end
    object TasksSectionId: TLargeintField
      FieldName = 'section_id'
      Origin = 'section_id'
      Visible = False
    end
  end
end
