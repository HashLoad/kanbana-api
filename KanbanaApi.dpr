program KanbanaApi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.SysUtils,
  Kanbana.Controllers.Boards in 'Src\Controllers\Kanbana.Controllers.Boards.pas',
  Kanbana.Providers.Connection in 'Src\Providers\Kanbana.Providers.Connection.pas' {ProviderConnection: TDataModule},
  Kanbana.Services.Boards in 'Src\Services\Kanbana.Services.Boards.pas' {ServiceBoards: TDataModule},
  Kanbana.Controllers.Sections in 'Src\Controllers\Kanbana.Controllers.Sections.pas',
  Kanbana.Services.Sections in 'Src\Services\Kanbana.Services.Sections.pas' {ServiceSections: TDataModule},
  Kanbana.Controllers.Tasks in 'Src\Controllers\Kanbana.Controllers.Tasks.pas',
  Kanbana.Services.Tasks in 'Src\Services\Kanbana.Services.Tasks.pas' {ServiceTasks: TDataModule},
  Kanbana.Controllers.Login in 'Src\Controllers\Kanbana.Controllers.Login.pas',
  Kanbana.Configs.Login in 'Src\Configs\Kanbana.Configs.Login.pas',
  Kanbana.Providers.Authorization in 'Src\Providers\Kanbana.Providers.Authorization.pas',
  Kanbana.Services.Users in 'Src\Services\Kanbana.Services.Users.pas' {ServiceUsers: TDataModule},
  Kanbana.Providers.Encrypt in 'Src\Providers\Kanbana.Providers.Encrypt.pas',
  Kanbana.Configs.Encrypt in 'Src\Configs\Kanbana.Configs.Encrypt.pas',
  Kanbana.Controllers.Users in 'Src\Controllers\Kanbana.Controllers.Users.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

  THorse.Use(Jhonson);

  Kanbana.Controllers.Login.Registry;
  Kanbana.Controllers.Users.Registry;
  Kanbana.Controllers.Boards.Registry;
  Kanbana.Controllers.Sections.Registry;
  Kanbana.Controllers.Tasks.Registry;

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + THorse.Port.ToString);
      Write('Press return to stop...');
      ReadLn;
      THorse.StopListen;
    end);
end.
