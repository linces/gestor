object UserService: TUserService
  OldCreateOrder = False
  Height = 327
  Width = 412
  object mtUsers: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 56
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:9000/'
    Params = <>
    Left = 232
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    Left = 232
    Top = 168
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = mtUsers
    FieldDefs = <>
    Response = RESTResponse1
    Left = 232
    Top = 224
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 232
    Top = 112
  end
end
