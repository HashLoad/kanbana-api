unit Services.Tasks;

interface

uses
  System.SysUtils, System.Classes, Providers.Connection, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.JSON, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Ragna;

type
  TServiceTasks = class(TProviderConnection)
    Tasks: TFDQuery;
    TasksId: TLargeintField;
    TasksName: TWideStringField;
    TasksSectionId: TLargeintField;
  public
    function Get(BoardId, SectionId: Integer): TFDQuery;
    function Post(BoardId, SectionId: Integer; Task: TJSONObject): TFDQuery;
  end;

var
  ServiceTasks: TServiceTasks;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServiceTasks }

function TServiceTasks.Get(BoardId, SectionId: Integer): TFDQuery;
begin
  Result := Tasks
    .Where(TasksSectionId)
    .Equals(SectionId)
    .OpenUp;
end;

function TServiceTasks.Post(BoardId, SectionId: Integer; Task: TJSONObject): TFDQuery;
begin
  Task.AddPair(TasksSectionId.FieldName, TJSONNumber.Create(SectionId));

  Result := Tasks
    .New(Task)
    .OpenUp;
end;

end.
