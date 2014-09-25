unit StegoFunc;

interface
uses
  Windows, Classes, Graphics, Math;

procedure WriteBufToBmp(MS: TStream; StartPos, Count, Val: integer; var Bmp: TBitmap);
procedure ReadBufFromBmp(Bmp: TBitmap; StartPos, Count, Val: integer; var MS: TStream);
implementation
procedure WriteBufToBmp(MS: TStream; StartPos, Count, Val: integer; var Bmp: TBitmap);
var
  Ind, Indx, Indy, Indz, Ind1, FreeSpace, Divider, NewVal: integer;
  CurVal, MByte, R: byte;
begin
  If Val > 8 then
    Exit;
  If (Val mod 2 <> 0) and (Val <> 1)  then
    Exit;
  If (MS.Size - MS.Position) < (Count - StartPos) then
    Exit;
  FreeSpace := (Bmp.Width * Bmp.Height * Val) div 8;
  StartPos := StartPos * 8 div Val + 1;
  If (Count - StartPos) > FreeSpace then
    Exit;
  MByte := Round(Power(2, Val) - 1);
  Indz := Val;
  MS.Read(CurVal, 1);
  If Bmp.Width > Bmp.Height then
    Divider := Bmp.Height
  else
    Divider := Bmp.Width;
  for Ind1 := 0 to (Count * 8 div Val) do
    begin
      NewVal := 0;
      Ind := 16;
      Indx := StartPos div Divider;
      Indy := StartPos mod Divider;
      while (Ind >= 0) and (MS.Position <= StartPos + Count) do
        begin
          R := Byte(Bmp.Canvas.Pixels[Indx, Indy] shr Ind);
          R := R and (255 - MByte);
          R := R or (CurVal and MByte);
          NewVal := NewVal shl 8;
          NewVal := NewVal or R;
          CurVal := CurVal shr Val;
          Inc(Indz, Val);
          If Indz > 8 then
            begin
              Indz := Val;
              MS.Read(CurVal, 1);
            end;
          Dec(Ind, 8);
        end;
      Bmp.Canvas.Pixels[Indx, Indy] := NewVal;
      Inc(StartPos);
    end;
end;

procedure ReadBufFromBmp(Bmp: TBitmap; StartPos, Count, Val: integer; var MS: TStream);
var
  Ind, Indx, Indy, Indz, Ind1, Divider: integer;
  CurVal, MByte, R: byte;
begin
  If Val > 8 then
    Exit;
  If (Val mod 2 <> 0) and (Val <> 1)  then
    Exit;
  If MS = nil then
    MS := TMemoryStream.Create;
  MByte := Round(Power(2, Val) - 1);
  Indz := Val;
  CurVal := 0;
  If Bmp.Width > Bmp.Height then
    Divider := Bmp.Height
  else
    Divider := Bmp.Width;
  StartPos := StartPos * 8 div Val + 1;
  for Ind1 := 0 to (Count * 8 div Val) do
    begin
      Ind := 16;
      Indx := StartPos div Divider;
      Indy := StartPos mod Divider;
      while (Ind >= 0) and (MS.Position <= StartPos + Count) do
        begin
          R := Byte(Bmp.Canvas.Pixels[Indx, Indy] shr Ind);
          R := R and MByte;
          CurVal := CurVal or (R shl (Indz - Val));
          Inc(Indz, Val);
          If Indz > 8 then
            begin
              Indz := Val;
              MS.Write(CurVal, 1);
              CurVal := 0;
            end;
          Dec(Ind, 8);
        end;
      Inc(StartPos);
    end;
end;

end.
