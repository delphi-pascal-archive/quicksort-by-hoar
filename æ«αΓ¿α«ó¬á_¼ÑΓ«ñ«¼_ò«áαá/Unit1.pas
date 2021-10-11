unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Gauges, ComCtrls, Buttons;

type
  mas = array[1..100000] of integer;
  TForm1 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    UpDown1: TUpDown;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    UpDown2: TUpDown;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    MMTimer1 : integer; // Код мультимедийного таймера
  end;

var
  Form1: TForm1;
  i,j,n,k,t1,t2:integer;
  t3:extended;
  aa:mas;

implementation

{$R *.dfm}

Procedure hoar(l,r:integer; Var a:mas);
var i,j,m,tmp:integer;
begin
	if l < r then
		begin
			i:=l; j:=r;
			m:=a[i];
			repeat
        k:=k+1;
				while m<a[j] do
					j:=j-1;
					if  i<=j then
							begin
							tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
							i:=i+1;
							end;
				while m>a[i] do
					i:=i+1;
					if  i<=j then
							begin
              tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
							j:=j-1;
							end;
			until i>j;
			hoar(l, j, a);
			hoar(i, r, a);
		end;
  for i:=0 to n-1 do
    form1.stringgrid2.Cells[i,0]:=inttostr(a[i+1]);
end;

procedure karman(var a:mas; n:integer);
var c:array[1..1000] of integer;
    i,j,t:integer;
begin
  for i:=1 to 1000 do
    c[i]:=0;
  for i:=1 to n do begin
    c[a[i]]:=c[a[i]]+1;
    inc(k);
  end;  
  t:=0;
  for i:=1 to 1000 do
    for j:=1 to c[i] do
      begin
        inc(k);
        inc(t);
        a[t]:=i;
      end;
  for i:=0 to n-1 do
    form1.stringgrid3.Cells[i,0]:=inttostr(a[i+1]);
end;

procedure TForm1.Button1Click(Sender: TObject);
 var max:integer;
begin
  n:=strtoint(labeledEdit1.text);
  randomize;
  stringgrid1.ColCount:=n;
  stringgrid2.ColCount:=n;
  stringgrid3.ColCount:=n;
  max:=StrToInt(Edit2.text);
    for i:=0 to n-1 do begin aa[i]:=random(max)+1;
    stringgrid1.Cells[i,0]:=inttostr(aa[i]);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  n:=strtoint(labeledEdit1.text);
  randomize;
  stringgrid1.ColCount:=n;
  stringgrid2.ColCount:=n;
  stringgrid3.ColCount:=n;
  for i:=0 to n-1 do
    stringgrid1.Cells[i,0]:=inttostr(random(99)+1);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  t1:=GetTickCount;
  t3:=GetTime;
  for i:=1 to n do
    aa[i]:=strtoint(stringgrid1.cells[i-1,0]);
  k:=0;
  hoar(1,n,aa);
  label3.Caption:=('Повторений цикла=>'+inttostr(k));
  label3.Caption:=label3.Caption+' Тактов=>'+inttostr(GetTickCount-t1);
  label3.caption:=label3.Caption+' Время=>'+floattostrf((Gettime-t3)*100000,fffixed,7,12);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  t2:=GetTickCount;
  t3:=GetTime;
  for i:=1 to n do
    aa[i]:=strtoint(stringgrid1.cells[i-1,0]);
  k:=0;
  karman(aa,n);
  label4.Caption:='Повторений цикла=>'+inttostr(k);
  label4.Caption:=label4.Caption+' Тактов=>'+inttostr(GetTickCount-t2);
  label4.caption:=label4.Caption+' Время=>'+floattostrf((Gettime-t3)*100000,fffixed,7,12);
end;

end.
