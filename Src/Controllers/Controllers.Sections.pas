unit Controllers.Sections;

interface

uses
  Horse;

procedure Sections(App: THorse);

implementation

uses System.JSON, Ragna, Services.Sections, SysUtils;

procedure Sections(App: THorse);
begin
  App.Post('/boards/:board_id/sections',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var Sections := TServiceSections.Create;
      try
        var JSON: TJSONArray;
        var BoardId := Req.Params['board_id'].ToInteger;

        Sections
          .Post(BoardId, Req.Body<TJSONObject>)
          .ToJson(JSON);

        Res.Send(JSON);
      finally
        Sections.Free;
      end;
    end);

  App.Get('/boards/:board_id/sections',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      var Sections := TServiceSections.Create;
      try
        var JSON: TJSONArray;
        var BoardId := Req.Params['board_id'].ToInteger;

        Sections
          .Get(BoardId)
          .ToJson(JSON);

        Res.Send(JSON);
      finally
        Sections.Free;
      end;
    end);
end;

end.
