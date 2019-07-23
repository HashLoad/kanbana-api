inherited ServiceTasks: TServiceTasks
  OldCreateOrder = True
  Height = 281
  Width = 383
  object Tasks: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select'
      '  tasks.id,'
      '  tasks.name,'
      '  tasks.section_id'
      'from tasks')
    Left = 192
    Top = 112
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
