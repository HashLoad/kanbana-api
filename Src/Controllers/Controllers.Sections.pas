unit Controllers.Sections;

interface

procedure Registry;

implementation

uses Horse, Providers.Authorization, System.JSON, Ragna, Services.Sections, SysUtils;

procedure DoPostSection(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Sections: TServiceSections;
  JSON: TJSONObject;
  BoardId: Integer;
begin
  Sections := TServiceSections.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;

    Sections.Post(BoardId, Req.Body<TJSONObject>).ToJson(JSON);

    Res.Send(JSON);
  finally
    Sections.Free;
  end;
end;

procedure DoGetSections(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Sections: TServiceSections;
  JSON: TJSONArray;
  BoardId: Integer;
begin
  Sections := TServiceSections.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;

    Sections.Get(BoardId).ToJson(JSON);

    Res.Send(JSON);
  finally
    Sections.Free;
  end;
end;

procedure Registry;
begin
  THorse.Post('/boards/:board_id/sections', Authorization(), DoPostSection);
  THorse.Get('/boards/:board_id/sections', Authorization(), DoGetSections);
end;

end.
