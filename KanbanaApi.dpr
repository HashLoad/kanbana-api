program KanbanaApi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Controllers.Users in 'Src\Controllers\Controllers.Users.pas',
  Providers.Mongo in 'Src\Providers\Providers.Mongo.pas',
  ugar.connection.Imp in '..\ugar\src\ugar.connection.Imp.pas',
  ugar.db.mongo.Enum in '..\ugar\src\ugar.db.mongo.Enum.pas',
  ugar.db.mongo.Func in '..\ugar\src\ugar.db.mongo.Func.pas',
  ugar.db.mongo.Imp in '..\ugar\src\ugar.db.mongo.Imp.pas',
  ugar.db.mongo.internals in '..\ugar\src\ugar.db.mongo.internals.pas',
  ugar.db.Mongo in '..\ugar\src\ugar.db.Mongo.pas',
  ugar.db.mongo.Protocol in '..\ugar\src\ugar.db.mongo.Protocol.pas',
  ugar.db.mongo.protocol.Types in '..\ugar\src\ugar.db.mongo.protocol.Types.pas',
  ugar.db.mongo.Query in '..\ugar\src\ugar.db.mongo.Query.pas',
  Ugar in '..\ugar\src\Ugar.pas';

var
  App: THorse;

begin
  ReportMemoryLeaksOnShutdown := True;

  App := THorse.Create(9000);
  try
    App.Use(Jhonson);

    Users(App);

    App.Start;
  finally
    App.Free;
  end;

end.
