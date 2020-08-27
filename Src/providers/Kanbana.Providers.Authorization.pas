unit Kanbana.Providers.Authorization;

interface

uses Horse, Horse.JWT, Horse.BasicAuthentication;

function Authorization: THorseCallback;
function BasicAuthorization: THorseCallback;

implementation

uses Kanbana.Configs.Login, Kanbana.Services.Users;

function DoBasicAuthentication(const Username, Password: string): Boolean;
var
  Users: TServiceUsers;
begin
  Users := TServiceUsers.Create;
  try
    Result := Users.IsValid(Username, Password);
  finally
    Users.Free;
  end;
end;

function BasicAuthorization: THorseCallback;
begin
  Result := HorseBasicAuthentication(DoBasicAuthentication);
end;

function Authorization: THorseCallback;
var
  Config: TConfigLogin;
begin
  Result := HorseJWT(Config.Secret);
end;

end.
