unit Providers.Mongo;

interface

uses
  Ugar;

var
  Mongo: TUgarDatabase;

implementation

initialization

Mongo := TUgar.Init('mongo', 27017, 'kanbana');

end.
