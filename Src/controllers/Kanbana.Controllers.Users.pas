unit Kanbana.Controllers.Users;

interface

procedure Registry;

implementation

uses Horse, System.JSON, Ragna, Kanbana.Providers.Authorization, Kanbana.Services.Users;

procedure DoGetUsers(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Users: TServiceUsers;
begin
  Users := TServiceUsers.Create;
  try
    Res.Send(Users.Get.ToJSONArray());
  finally
    Users.Free;
  end;
end;

procedure DoPostUser(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Users: TServiceUsers;
begin
  Users := TServiceUsers.Create;
  try
    Res.Send(Users.Post(Req.Body<TJSONObject>).ToJSONObject()).Status(THTTPStatus.Created);
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
