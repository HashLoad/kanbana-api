unit Kanbana.Providers.Connection;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait;

type
  TProviderConnection = class(TDataModule)
    FDConnection: TFDConnection;
    procedure FDConnectionBeforeConnect(Sender: TObject);
  public
    constructor Create; reintroduce;
  end;

var
  ProviderConnection: TProviderConnection;

implementation

{$R *.dfm}

constructor TProviderConnection.Create;
begin
  inherited Create(nil);
end;

procedure TProviderConnection.FDConnectionBeforeConnect(Sender: TObject);
var
  Params: TFDPhysPGConnectionDefParams;
begin
  Params := TFDPhysPGConnectionDefParams(FDConnection.Params);
  Params.UserName := GetEnvironmentVariable('DB_USER');
  Params.Password := GetEnvironmentVariable('DB_PASSWORD');
  Params.Database := GetEnvironmentVariable('DB_DATABASE');
  Params.Port := GetEnvironmentVariable('DB_PORT').ToInteger;
  Params.Server := GetEnvironmentVariable('DB_HOST');
end;

end.
