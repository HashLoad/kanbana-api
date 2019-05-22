unit Controllers.Tasks;

interface

uses
  Horse;

procedure Tasks(App: THorse);

implementation

uses System.JSON, Ragna, Services.Tasks, SysUtils;

procedure Tasks(App: THorse);
begin
  App.Post('/boards/:board_id/sections/:section_id/tasks',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var Tasks := TServiceTasks.Create;
      try
        var JSON: TJSONArray;
        var BoardId := Req.Params['board_id'].ToInteger;
        var SectionId := Req.Params['section_id'].ToInteger;

        Tasks
          .Post(BoardId, SectionId, Req.Body<TJSONObject>)
          .ToJson(JSON);

        Res.Send(JSON);
      finally
        Tasks.Free;
      end;
    end);

  App.Get('/boards/:board_id/sections/:section_id/tasks',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var Tasks := TServiceTasks.Create;
      try
        var JSON: TJSONArray;
        var BoardId := Req.Params['board_id'].ToInteger;
        var SectionId := Req.Params['section_id'].ToInteger;

        Tasks
          .Get(BoardId, SectionId)
          .ToJson(JSON);

        Res.Send(JSON);
      finally
        Tasks.Free;
      end;
    end);
end;

end.
