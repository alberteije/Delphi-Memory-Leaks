program Pratica02;

uses
  Forms,
  P02 in 'P02.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
end.
