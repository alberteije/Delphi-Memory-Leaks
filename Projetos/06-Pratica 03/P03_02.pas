unit P03_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Button5: TButton;
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button5Click(Sender: TObject);
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  StringList.Add('Albert');
  StringList.Add('Eije');
  Memo1.Clear;
  Memo1.Lines.Add(StringList[0]);
  Memo1.Lines.Add(StringList[1]);

  //RegisterExpectedMemoryLeak(StringList);
end;

end.
