object serverservice: Tserverservice
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'serverservice'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
