unit Controllers.Tasks;

interface

procedure Registry;

implementation

uses Horse, Providers.Authorization, System.JSON, Ragna, Services.Tasks, SysUtils;

procedure DoPostTask(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Tasks: TServiceTasks;
  JSON: TJSONObject;
  BoardId, SectionId: Integer;
begin
  Tasks := TServiceTasks.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;
    SectionId := Req.Params['section_id'].ToInteger;

    Tasks.Post(BoardId, SectionId, Req.Body<TJSONObject>).ToJson(JSON);

    Res.Send(JSON);
  finally
    Tasks.Free;
  end;
end;

procedure DoGetTasks(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Tasks: TServiceTasks;
  JSON: TJSONArray;
  BoardId, SectionId: Integer;
begin
  Tasks := TServiceTasks.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;
    SectionId := Req.Params['section_id'].ToInteger;

    Tasks.Get(BoardId, SectionId).ToJson(JSON);

    Res.Send(JSON);
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
