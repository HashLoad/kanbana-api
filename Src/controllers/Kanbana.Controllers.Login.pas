unit Kanbana.Controllers.Login;

interface

procedure Registry;

implementation

uses Horse, Kanbana.Providers.Authorization, JOSE.Core.JWT, Kanbana.Configs.Login, System.JSON, System.SysUtils, System.DateUtils,
  JOSE.Core.Builder;

procedure DoGetLogin(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  JWT: TJWT;
  Claims: TJWTClaims;
  Config: TConfigLogin;
begin
  JWT := TJWT.Create;
  Claims := JWT.Claims;
  Claims.JSON := TJSONObject.Create;
  Claims.IssuedAt := Now;
  Claims.Expiration := IncHour(Now, Config.Expires);
  Res.Send(TJSONObject.Create.AddPair('token', TJOSE.SHA256CompactToken(Config.Secret, JWT)));
end;

procedure Registry;
begin
  THorse.Get('/login', BasicAuthorization(), DoGetLogin);
end;

end.
