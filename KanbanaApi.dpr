program KanbanaApi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Controllers.Boards in 'Src\Controllers\Controllers.Boards.pas',
  Providers.Connection in 'Src\Providers\Providers.Connection.pas' {ProviderConnection: TDataModule},
  Services.Boards in 'Src\Services\Services.Boards.pas' {ServiceBoards: TDataModule},
  Controllers.Sections in 'Src\Controllers\Controllers.Sections.pas',
  Services.Sections in 'Src\Services\Services.Sections.pas' {ServiceSections: TDataModule},
  Controllers.Tasks in 'Src\Controllers\Controllers.Tasks.pas',
  Services.Tasks in 'Src\Services\Services.Tasks.pas' {ServiceTasks: TDataModule};

var
  App: THorse;

begin
  ReportMemoryLeaksOnShutdown := True;

  App := THorse.Create(9000);
  try
    App.Use(Jhonson);

    Boards(App);
    Sections(App);
    Tasks(App);

    App.Start;
  finally
    App.Free;
  end;

end.
