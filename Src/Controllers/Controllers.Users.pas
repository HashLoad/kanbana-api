unit Controllers.Users;

interface

uses
  Horse, System.JSON, Ragna;

procedure Users(App: THorse);

implementation

uses Providers.Authorization, Services.Users;

procedure DoGetUsers(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Users: TServiceUsers;
  JSON: TJSONArray;
begin
  Users := TServiceUsers.Create;
  try
    Users
      .Get
      .ToJson(JSON);

    Res.Send(JSON);
  finally
    Users.Free;
  end;
end;

procedure DoPostUser(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Users: TServiceUsers;
  JSON: TJSONObject;
begin
  Users := TServiceUsers.Create;
  try
    Users
      .Post(Req.Body<TJSONObject>)
      .ToJson(JSON);

    Res.Send(JSON);
  finally
    Users.Free;
  end;
end;

procedure Users(App: THorse);
begin
  App.Get('/users', Authorization(), DoGetUsers);
  App.Post('/users', Authorization(), DoPostUser);
end;

end.
