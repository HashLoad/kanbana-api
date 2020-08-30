inherited ServiceSections: TServiceSections
  OldCreateOrder = True
  Height = 152
  Width = 300
  object Sections: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select'
      '  sections.id,'
      '  sections.name,'
      '  sections.board_id'
      'from sections')
    Left = 200
    Top = 56
    object SectionsId: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SectionsName: TWideStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 255
    end
    object SectionsBoardId: TLargeintField
      FieldName = 'board_id'
      Origin = 'board_id'
      Visible = False
    end
  end
end
