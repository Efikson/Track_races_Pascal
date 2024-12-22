unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Timer3: TTimer;
    Label3: TLabel;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Timer2: TTimer;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure kontroluj (Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    procedure UpdatePlayer(var X, Y: Integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
  public
    X1, X2, Y1, Y2, mes, score: Integer;
    angle1,angle2, prom: Real;
    L1, R1, L2, R2,start: Boolean;
  end;

var
  Form1: TForm1;
  bod,bod1,bod2 : tpoint;
implementation

uses Unit2;

{$R *.dfm}

////////////////////////
// Vykreslov�n� hr��� //
procedure TForm1.UpdatePlayer(var X, Y: Integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
begin
  Image1.Canvas.MoveTo(X, Y);
  X := Round(X + speed * Cos(angle));
  Y := Round(Y + speed * Sin(angle));
  Image1.Canvas.Pen.Color := color;
  Image1.Canvas.LineTo(X, Y);

  if LControl then
    angle := angle - 0.2;
  if RControl then
    angle := angle + 0.2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // Hr�� 1 (�erven�)
  UpdatePlayer(X1, Y1, angle1, L1, R1, clRed);

  // Hr�� 2 (modr�)
  UpdatePlayer(X2, Y2, angle2, L2, R2, clBlue);

  // Zavol�n� kontroly
  kontroluj(Sender);
end;

////////////////////
// Ovl�d�n� hr��� //
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 81 then // Q
  begin
    if CheckBox1.State = cbChecked then
    begin
      X1 := Round(X1 + 60 * Cos(angle1));
      Y1 := Round(Y1 + 60 * Sin(angle1));
      CheckBox1.State := cbUnchecked;
    end;
  end;

  if Key = 96 then // 0
  begin
    if CheckBox2.State = cbChecked then
    begin
      X2 := Round(X2 + 60 * Cos(angle2));
      Y2 := Round(Y2 + 60 * Sin(angle2));
      CheckBox2.State := cbUnchecked;
    end;
  end;

  // Ovl�d�n� pohybu a ot��en�
  if Key = 65 then L1 := True;  // A
  if Key = 68 then R1 := True;  // D
  if Key = 37 then L2 := True;  // �ipka vlevo
  if Key = 39 then R2 := True;  // �ipka vpravo
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin  
  if Key = 65 then L1 := False;
  if Key = 68 then R1 := False;
  if Key = 37 then L2 := False;
  if Key = 39 then R2 := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 speed:=prom;
 button1.Enabled:=false;
 button3.visible:=false;
 button3.Top:=30 + random(500);
 button3.left:=30 + random(630);
 timer2.Enabled:=true;
 timer3.Enabled:=true;
 label3.Visible:=true;
 label3.Top:=trunc(image1.Height/2) - 50;
 label3.left:=trunc(image1.Width/2) - 30;
 label3.Font.size:=80;
 label3.Caption:=INTTOSTR(3);
 label4.Caption:=INTTOSTR(5);
 checkbox1.State:=cbunchecked;
 checkbox2.State:=cbunchecked;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 randomize;
 edit1.Text:= '0';
 edit2.Text:= '0';
 label5.Caption:=name1;
 label6.Caption:=name2;

 label8.Caption:= 'Limit vyhran�ch kol = ' + INTTOSTR(konec);   

 prom:=speed;
 button3.Top:=30 + random(470);
 button3.left:=30 + random(630);
 Image1.canvas.pen.color:=clgreen;
 Image1.canvas.pen.width:=15;
 image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

 timer2.Enabled:=true;
 timer3.Enabled:=true;
 label3.Top:=trunc(image1.Height/2) - 50;
 label3.left:=trunc(image1.Width/2) - 30;
 label3.Font.size:=80;
 label3.Caption:=INTTOSTR(3);
 label3.Caption:= INTTOSTR(STRTOINT(label3.Caption) -1);
  if label3.Caption=INTTOSTR(0) THEN
  begin
  X1:= Image1.Width div 4;
  X2:= Image1.Width div 4 + 2*Image1.Width div 4;

  Y1:= Image1.Height div 2;
  Y2:= Image1.Height div 2;

  angle1:= random (700)/100;
  angle2:= random (700)/100;

  L1:= False;
  R1:= False;

  L2:= False;
  R2:= False;
  Image1.Canvas.Pen.Width:= cara;
  timer1.enabled:= true;
  button1.enabled:=false;
  button2.enabled:=false;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.hide;
form2.Show;
end;

procedure TForm1.kontroluj(Sender: TObject);
begin
bod1.X:=Round(X1+(cara*3/4)*cos(angle1));
bod1.y:=Round(Y1+(cara*3/4)*sin(angle1));
IF Ptinrect(image1.BoundsRect,bod1) THEN
else
begin
timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Visible:=true;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  Showmessage(label5.caption + ' cht�l zbab�le ut�ct');
  edit2.Text:= INTTOSTR(STRTOINT(edit2.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
end;

bod2.X:=Round(X2+(cara*3/4)*cos(angle2));
bod2.y:=Round(Y2+(cara*3/4)*sin(angle2));
IF Ptinrect(image1.BoundsRect,bod2) THEN
else
begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Visible:=true;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  Showmessage(label6.caption + ' cht�l zbab�le ut�ct');
  edit1.Text:= INTTOSTR(STRTOINT(edit1.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
end;


CASE image1.Canvas.Pixels[Round(X1+(cara*3/4)*cos(angle1)),Round(Y1+(cara*3/4)*sin(angle1))] OF
  255: begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Visible:=true;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  mes:= random(2);
  case mes of
  0: Showmessage(label5.caption + ' ochutnal s�m sebe');
  1: Showmessage(label5.caption + ' narazil do svoji dr�hy');
  end;
  edit2.Text:= INTTOSTR(STRTOINT(edit2.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
        end;
  16711680: begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Visible:=true;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  mes:= random(2);
  case mes of
  0: Showmessage(label5.caption + ' se nechal nap�lit');
  1: Showmessage(label5.caption + ' narazil do modr� dr�hy');
  end;
  edit2.Text:= INTTOSTR(STRTOINT(edit2.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
         end;
  32768: begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Visible:=true;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  mes:= random(2);
  case mes of
  0: Showmessage(label5.caption + ' cht�l vyjet do windows�');
  1: Showmessage(label5.caption + ' narazil do zelen� dr�hy');
  end;
  edit2.Text:= INTTOSTR(STRTOINT(edit2.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
         end;
   end;
  CASE image1.Canvas.Pixels[Round(X2+(cara*3/4)*cos(angle2)),Round(Y2+(cara*3/4)*sin(angle2))] OF
  16711680: begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Visible:=true;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  mes:= random(2);
  case mes of
  0: Showmessage(label6.caption + ' ochutnal s�m sebe');
  1: Showmessage(label6.caption + ' narazil do svoji dr�hy');
  end;
  edit1.Text:= INTTOSTR(STRTOINT(edit1.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
        end;
  255: begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Visible:=true;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  mes:= random(2);
  case mes of
  0: Showmessage(label6.caption + ' se nechal nap�lit');
  1: Showmessage(label6.caption + ' narazil do �erven� dr�hy');
  end;
  edit1.Text:= INTTOSTR(STRTOINT(edit1.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
         end;
  32768: begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  label3.Top:=trunc(image1.Height/2) - 20;
  label3.left:=trunc(image1.Width/2) - 160;
  label3.Visible:=true;
  label3.Font.Size:=20;
  label3.caption:='Pro nove kolo stiskni ENTER';
  mes:= random(2);
  case mes of
  0: Showmessage(label6.caption + ' cht�l vyjet do windows�');
  1: Showmessage(label6.caption + ' narazil do zelen� dr�hy');
  end;
  edit1.Text:= INTTOSTR(STRTOINT(edit1.Text) + 1);
  button1.enabled:=true;
  button2.enabled:=true;
         end;
   end;

  bod.X:=Round(X1+(cara*3/4)*cos(angle1));
  bod.y:=Round(Y1+(cara*3/4)*sin(angle1));
  IF Ptinrect(button3.BoundsRect,bod) THEN
  begin
  button3.visible:=false;
  checkbox1.State:=cbchecked;
  end;

  bod.X:=Round(X2+(cara*3/4)*cos(angle2));
  bod.y:=Round(Y2+(cara*3/4)*sin(angle2));
  IF Ptinrect(button3.BoundsRect,bod) THEN
  begin
  button3.visible:=false;
  checkbox2.State:=cbchecked;
  end;

  IF edit1.Text=INTTOSTR(konec) THEN
  begin     
  showmessage(label5.caption + ' zv�t�zil');
  button1.enabled:=false;
  end;

  IF edit2.Text=INTTOSTR(konec) THEN
  begin
  showmessage(label6.caption + ' zv�t�zil');
  button1.enabled:=false;
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin 
  label3.Caption:= INTTOSTR(STRTOINT(label3.Caption) -1);
  if label3.Caption=INTTOSTR(0) THEN
  begin
  timer3.Enabled:=false;
  label3.visible:=false;
 Image1.canvas.pen.color:=clgreen;
 Image1.canvas.pen.width:=15;
 image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

  X1:= Image1.Width div 4;
  X2:= Image1.Width div 4 + 2*Image1.Width div 4;

  Y1:= Image1.Height div 2;
  Y2:= Image1.Height div 2;

  angle1:= random (700)/100;
  angle2:= random (700)/100;

  L1:= False;
  R1:= False;

  L2:= False;
  R2:= False;
  Image1.Canvas.Pen.Width:= cara;
  timer1.enabled:= true; 
  button1.enabled:=false;
  button2.enabled:=false;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
label4.Caption:= INTTOSTR(STRTOINT(label4.Caption) - 1);
IF label4.Caption =INTTOSTR(0) THEN
begin
label4.Caption:=INTTOSTR(5);
button3.Top:=30 + random(470);
button3.left:=30 + random(660);
button3.Visible:=true;

end;

end;
end.
