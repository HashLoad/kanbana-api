program KanbanaApi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Controllers.Boards in 'Src\Controllers\Controllers.Boards.pas',
  Providers.Connection in 'Src\Providers\Providers.Connection.pas' {ProviderConnection: TDataModule},
  Services.Boards in 'Src\Services\Services.Boards.pas' {ServiceBoards: TDataModule},
  Controllers.Sections in 'Src\Controllers\Controllers.Sections.pas',
  Services.Sections in 'Src\Services\Services.Sections.pas' {ServiceSections: TDataModule},
  Controllers.Tasks in 'Src\Controllers\Controllers.Tasks.pas',
  Services.Tasks in 'Src\Services\Services.Tasks.pas' {ServiceTasks: TDataModule},
  Controllers.Login in 'Src\Controllers\Controllers.Login.pas',
  Configs.Login in 'Src\Configs\Configs.Login.pas',
  Providers.Authorization in 'Src\Providers\Providers.Authorization.pas',
  Services.Users in 'Src\Services\Services.Users.pas' {ServiceUsers: TDataModule},
  Providers.Encrypt in 'Src\Providers\Providers.Encrypt.pas',
  Configs.Encrypt in 'Src\Configs\Configs.Encrypt.pas',
  Controllers.Users in 'Src\Controllers\Controllers.Users.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

  THorse.Use(Jhonson);

  Controllers.Login.Registry;
  Controllers.Users.Registry;
  Controllers.Boards.Registry;
  Controllers.Sections.Registry;
  Controllers.Tasks.Registry;

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + THorse.Port.ToString);
      Write('Press return to stop...');
      ReadLn;
      THorse.StopListen;
    end);
end.
