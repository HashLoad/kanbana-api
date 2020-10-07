unit Kanbana.Services.Tasks;

interface

uses System.SysUtils, System.Classes, Kanbana.Providers.Connection, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client, System.JSON, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Ragna, FireDAC.VCLUI.Wait;

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

implementation

{$R *.dfm}

function TServiceTasks.Get(BoardId, SectionId: Integer): TFDQuery;
begin
  Result := Tasks.Where(TasksSectionId).Equals(SectionId).OpenUp;
end;

function TServiceTasks.Post(BoardId, SectionId: Integer; Task: TJSONObject): TFDQuery;
begin
  TasksSectionId.Visible := True;
  Task.RemovePair('sectionId').Free;
  Task.AddPair('sectionId', TJSONNumber.Create(SectionId));
  Result := Tasks.New(Task).OpenUp;
  TasksSectionId.Visible := False;
end;

end.
