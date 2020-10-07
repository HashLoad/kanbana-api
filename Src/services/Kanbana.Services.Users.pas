unit Kanbana.Services.Users;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Ragna, System.Hash, System.JSON, Kanbana.Providers.Connection, FireDAC.VCLUI.Wait;

type
  TServiceUsers = class(TProviderConnection)
    Users: TFDQuery;
    UsersId: TLargeintField;
    UsersName: TWideStringField;
    UsersUsername: TWideStringField;
    UsersPassword: TWideStringField;
  public
    function IsValid(Username, Password: string): Boolean;
    function Post(User: TJSONObject): TFDQuery;
    function Get: TFDQuery;
  end;

implementation

uses Kanbana.Providers.Encrypt;

{$R *.dfm}

function TServiceUsers.Get: TFDQuery;
begin
  UsersPassword.Visible := False;
  Result := Users.OpenUp;
end;

function TServiceUsers.IsValid(Username, Password: string): Boolean;
begin
  Result := not Users.Where(UsersUsername).Equals(Username).&And(UsersPassword).Equals(TProviderEncrypt.Encrypt(Password))
    .OpenUp.IsEmpty;
end;

function TServiceUsers.Post(User: TJSONObject): TFDQuery;
var
  Password: string;
begin
  Password := TProviderEncrypt.Encrypt(User.GetValue<string>('password'));
  User.RemovePair('password').Free;
  User.AddPair('password', Password);
  Users.New(User).OpenUp;
  UsersPassword.Visible := False;
  Result := Users;
end;

end.
