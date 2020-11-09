program Pratica03;

uses
  FastMM4, FastMM4Messages,
  Forms,
  P03_02 in 'P03_02.pas' {Form2},
  P03 in 'P03.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
