unit Controllers.Boards;

interface

uses
  Horse;

procedure Boards(App: THorse);

implementation

uses System.JSON, Ragna, Services.Boards;

procedure Boards(App: THorse);
begin
  App.Post('/boards',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var Boards := TServiceBoards.Create;
      try
        var JSON: TJSONArray;

        Boards
          .Post(Req.Body<TJSONObject>)
          .ToJson(JSON);

        Res.Send(JSON);
      finally
        Boards.Free;
      end;
    end);

  App.Get('/boards',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var Boards := TServiceBoards.Create;
      try
        var JSON: TJSONArray;

        Boards
          .Get
          .ToJson(JSON);

        Res.Send(JSON);
      finally
        Boards.Free;
      end;
    end);
end;

end.
