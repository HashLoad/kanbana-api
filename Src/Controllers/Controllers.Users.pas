unit Controllers.Users;

interface

uses
  Horse;

procedure Users(App: THorse);

implementation

uses Providers.Mongo, System.JSON;

procedure Users(App: THorse);
begin
  App.Post('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJSONObject>(Mongo('users').InsertOne(Req.Body<TJSONObject>));
    end);

  App.Get('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJSONArray>(Mongo('users').Find);
    end);
end;

end.
