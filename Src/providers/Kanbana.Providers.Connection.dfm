object ProviderConnection: TProviderConnection
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=kanbana'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 88
    Top = 56
  end
end
