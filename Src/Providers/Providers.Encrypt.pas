unit Providers.Encrypt;

interface

uses System.SysUtils, System.Hash;

type
  TProviderEncrypt = class
    class function Encrypt(Value: string): string;
  end;

implementation

uses Configs.Encrypt;

class function TProviderEncrypt.Encrypt(Value: string): string;
var
  Config: TConfigEncrypt;
  Encrypted: string;
begin
  Encrypted := THashSHA2.GetHashString(Value + '.' + Config.Secret);
  Result := Encrypted;
end;

end.
