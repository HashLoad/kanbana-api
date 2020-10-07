unit Kanbana.Services.Sections;

interface

uses System.SysUtils, System.Classes, Kanbana.Providers.Connection, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client, System.JSON, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Ragna, FireDAC.VCLUI.Wait;

type
  TServiceSections = class(TProviderConnection)
    Sections: TFDQuery;
    SectionsId: TLargeintField;
    SectionsName: TWideStringField;
    SectionsBoardId: TLargeintField;
  public
    function Get(BoardId: Integer): TFDQuery;
    function Post(BoardId: Integer; Section: TJSONObject): TFDQuery;
  end;

implementation

{$R *.dfm}

function TServiceSections.Get(BoardId: Integer): TFDQuery;
begin
  Result := Sections.Where(SectionsBoardId).Equals(BoardId).OpenUp;
end;

function TServiceSections.Post(BoardId: Integer; Section: TJSONObject): TFDQuery;
begin
  SectionsBoardId.Visible := True;
  Section.RemovePair('boardId').Free;
  Section.AddPair('boardId', TJSONNumber.Create(BoardId));
  Result := Sections.New(Section).OpenUp;
  SectionsBoardId.Visible := False;
end;

end.
