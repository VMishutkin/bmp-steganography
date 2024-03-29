unit Pr1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StegoFunc, StdCtrls, ExtDlgs;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    SavePictureDialog1: TSavePictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Bmp: TBitmap;
    List: TStringList;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  If OpenPictureDialog1.Execute then
    begin
      Caption := OpenPictureDialog1.FileName;
      Bmp := TBitmap.Create;
      Bmp.LoadFromFile(Caption);
      List := TStringList.Create;
      Label1.Caption := '�������� ��� ������:: ' + IntToStr((Bmp.Width * Bmp.Height * 2) div 8) + '����';
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    List.Add(OpenDialog1.FileName);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  FS: TFileStream;
  MS, MS1: TMemoryStream;
  Buf: shortstring;
  BufI, Ind: integer;
  CurPos: integer;
begin
  MS := TMemoryStream.Create;//������� �����
  Buf := 'Walde';     {���������� ���� �������, �������������� ��, ��� �� ���������� ���������� � ������ ��������}
  MS.Write(Buf, 7); //��������������� ������ � �����
  MS.Position := 0;
  WriteBufToBmp(MS, 0, 7, 2, Bmp);
  MS.Clear;
  BufI := List.Count;
  Ms.Write(BufI, SizeOf(integer));
  for Ind := 0 to List.Count - 1 do
    begin
      FS := TFileStream.Create(List.Strings[Ind], fmOpenRead);
      BufI := Length(ExtractFileName(List.Strings[Ind]))+1;
      Buf := ExtractFileName(List.Strings[Ind]);
      MS.Write(BufI, SizeOf(Integer));
      MS.Write(Buf, BufI);
      BufI := FS.Size;
      MS.Write(BufI, SizeOf(Integer));
      MS.CopyFrom(FS, FS.Size);
      FS.Free;
    end;
  MS1 := TMemoryStream.Create;//������� �����
  BufI := MS.Size;
  MS1.Write(BufI, 4);
  MS1.Position := 0;
  MS.Position := 0;
  WriteBufToBmp(MS1, 7, 4, 2, Bmp);
  WriteBufToBmp(MS, 11, MS.Size, 2, Bmp);
  IF SavePictureDialog1.Execute then
    begin
      Bmp.SaveToFile(SavePictureDialog1.FileName);
    end;
  MS.Free;
  MS1.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  FS: TFileStream;
  MS: TMemoryStream;
  Buf: shortstring;
  BufI, Ind, Indx: integer;
  CurPos: integer;
  FName: string;
begin
  MS := TMemoryStream.Create;
  ReadBufFromBmp(Bmp, 0, 7, 2, TStream(MS));
  MS.Position := 0;
  MS.Read(Buf, 7);
  MS.Clear;
  If Buf <> 'Walde' then
    begin
      Messagedlg('������ �� ���������', mtConfirmation, [mbOK], 0);
      Exit;
    end;
  ReadBufFromBmp(Bmp, 7, 4, 2, TStream(MS));
  MS.Position := 0;
  MS.Read(BufI, 4);
  MS.Clear;
  ReadBufFromBmp(Bmp, 11, BufI, 2, TStream(MS));
  MS.Position := 0;
  MS.Read(BufI, 4);
  Indx := BufI;
  for Ind := 0 to Indx - 1 do
    begin
      MS.Read(BufI, 4);
      MS.Read(Buf, BufI);

      FName := Edit1.Text + '\' + Buf;
      FS := TFileStream.Create(FName, fmCreate);

      MS.Read(BufI, 4);

      FS.CopyFrom(MS, BufI);
      FS.Free;
    end;
  MS.Free;  
end;

end.
