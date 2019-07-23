unit Controllers.Boards;

interface

uses
  Horse, Providers.Authorization;

procedure Boards(App: THorse);

implementation

uses System.JSON, Ragna, Services.Boards, Configs.Login;

procedure DoPostBoard(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Boards: TServiceBoards;
  JSON: TJSONObject;
begin
  Boards := TServiceBoards.Create;
  try
    Boards.Post(Req.Body<TJSONObject>).ToJson(JSON);

    Res.Send(JSON);
  finally
    Boards.Free;
  end;
end;

procedure DoGetBoards(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Boards: TServiceBoards;
  JSON: TJSONArray;
begin
  Boards := TServiceBoards.Create;
  try
    Boards.Get.ToJson(JSON);

    Res.Send(JSON);
  finally
    Boards.Free;
  end;
end;

procedure Boards(App: THorse);
begin
  App.Post('/boards', Authorization(), DoPostBoard);
  App.Get('/boards', Authorization(), DoGetBoards);
end;

end.
