unit Kanbana.Controllers.Sections;

interface

procedure Registry;

implementation

uses Horse, Kanbana.Providers.Authorization, System.JSON, Ragna, Kanbana.Services.Sections, SysUtils;

procedure DoPostSection(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  BoardId: Integer;
  Sections: TServiceSections;
begin
  Sections := TServiceSections.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;
    Res.Send(Sections.Post(BoardId, Req.Body<TJSONObject>).ToJSONObject()).Status(THTTPStatus.Created);
  finally
    Sections.Free;
  end;
end;

procedure DoGetSections(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  BoardId: Integer;
  Sections: TServiceSections;
begin
  Sections := TServiceSections.Create;
  try
    BoardId := Req.Params['board_id'].ToInteger;
    Res.Send(Sections.Get(BoardId).ToJSONArray());
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
