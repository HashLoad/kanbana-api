unit Controllers.Users;

interface

procedure Registry;

implementation

uses Horse, System.JSON, Ragna, Providers.Authorization, Services.Users;

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

procedure Registry;
begin
  THorse.Get('/users', Authorization(), DoGetUsers);
  THorse.Post('/users', Authorization(), DoPostUser);
end;

end.
