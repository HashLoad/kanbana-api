unit Kanbana.Controllers.Tasks;

interface

procedure Registry;

implementation

uses Horse, Kanbana.Providers.Authorization, System.JSON, Ragna, Kanbana.Services.Tasks, SysUtils;

procedure DoPostTask(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Tasks: TServiceTasks;
  BoardId, SectionId: Integer;
begin
  Tasks := TServiceTasks.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;
    SectionId := Req.Params['section_id'].ToInteger;
    Res.Send(Tasks.Post(BoardId, SectionId, Req.Body<TJSONObject>).ToJSONObject()).Status(THTTPStatus.Created);
  finally
    Tasks.Free;
  end;
end;

procedure DoGetTasks(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Tasks: TServiceTasks;
  BoardId, SectionId: Integer;
begin
  Tasks := TServiceTasks.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;
    SectionId := Req.Params['section_id'].ToInteger;
    Res.Send(Tasks.Get(BoardId, SectionId).ToJSONArray());
  finally
    Tasks.Free;
  end;
end;

procedure Registry;
begin
  THorse.Post('/boards/:board_id/sections/:section_id/tasks', Authorization(), DoPostTask);
  THorse.Get('/boards/:board_id/sections/:section_id/tasks', Authorization(), DoGetTasks);
end;

end.
