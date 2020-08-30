unit Kanbana.Controllers.Boards;

interface

procedure Registry;

implementation

uses Horse, Kanbana.Providers.Authorization, System.JSON, Ragna, Kanbana.Services.Boards, Kanbana.Configs.Login;

procedure DoPostBoard(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Boards: TServiceBoards;
begin
  Boards := TServiceBoards.Create;
  try
    Res.Send(Boards.Post(Req.Body<TJSONObject>).ToJSONObject()).Status(THTTPStatus.Created);
  finally
    Boards.Free;
  end;
end;

procedure DoGetBoards(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Boards: TServiceBoards;
begin
  Boards := TServiceBoards.Create;
  try
    Res.Send(Boards.Get.ToJSONArray());
  finally
    Boards.Free;
  end;
end;

procedure Registry;
begin
  THorse.Post('/boards', Authorization(), DoPostBoard);
  THorse.Get('/boards', Authorization(), DoGetBoards);
end;

end.
