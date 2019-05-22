unit Services.Boards;

interface

uses
  System.SysUtils, System.Classes, Providers.Connection, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Ragna,
  System.JSON;

type
  TServiceBoards = class(TProviderConnection)
    Boards: TFDQuery;
    BoardsId: TLargeintField;
    BoardsName: TWideStringField;
  public
    function Get: TFDQuery;
    function Post(Board: TJSONObject): TFDQuery;
  end;

var
  ServiceBoards: TServiceBoards;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

{ TServiceBoards }

function TServiceBoards.Get: TFDQuery;
begin
  Result := Boards
    .OpenUp;
end;

function TServiceBoards.Post(Board: TJSONObject): TFDQuery;
begin
  Result := Boards
    .New(Board)
    .OpenUp;
end;

end.
