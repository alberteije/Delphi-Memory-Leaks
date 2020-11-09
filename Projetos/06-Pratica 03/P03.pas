unit P03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type

  TFornecedor = class
    Nome: String;
    Endereco: String;
    Numero: Integer;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Bevel1: TBevel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fornecedor: TFornecedor;
    Var11: string;
    Var22: Integer;
    Var33: boolean;
    Var44: double;
  end;

  TCliente = Record
    Nome: String;
    Endereco: String;
    Numero: Integer;
  End;

var
  Form1: TForm1;

implementation

uses
  P03_02;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Var1: string;
  Var2: Integer;
  Var3: boolean;
  Var4: double;
begin
  Memo1.Clear;
  // antes de serem inicializadas as variáveis não tem valor padrão
  Memo1.Lines.Add('Var1=' + Var1);
  Memo1.Lines.Add('Var2=' + IntToStr(Var2));
  Memo1.Lines.Add('Var3=' + BoolToStr(Var3, True));
  Memo1.Lines.Add('Var4=' + FloatToStr(Var4));

  Var1 := 'teste';
  Var2 := 22;
  Var3 := false;
  Var4 := 6.99;

  Memo1.Lines.Add('==============================');
  // após a inicialização
  Memo1.Lines.Add('Var1=' + Var1);
  Memo1.Lines.Add('Var2=' + IntToStr(Var2));
  Memo1.Lines.Add('Var3=' + BoolToStr(Var3, True));
  Memo1.Lines.Add('Var4=' + FloatToStr(Var4));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  // antes de serem inicializadas as variáveis não tem valor padrão
  Memo1.Lines.Add('Var11=' + Var11);
  Memo1.Lines.Add('Var22=' + IntToStr(Var22));
  Memo1.Lines.Add('Var33=' + BoolToStr(Var33, True));
  Memo1.Lines.Add('Var44=' + FloatToStr(Var44));

  Var11 := 'teste';
  Var22 := 22;
  Var33 := false;
  Var44 := 6.99;

  Memo1.Lines.Add('==============================');
  // após a inicialização
  Memo1.Lines.Add('Var11=' + Var11);
  Memo1.Lines.Add('Var22=' + IntToStr(Var22));
  Memo1.Lines.Add('Var33=' + BoolToStr(Var33, True));
  Memo1.Lines.Add('Var44=' + FloatToStr(Var44));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Cliente: TCliente;
begin
  Cliente.Nome := 'Albert';
  Cliente.Endereco := 'Endereço';
  Cliente.Numero := 15;

  Memo1.Clear;
  Memo1.Lines.Add('Cliente.Nome=' + Cliente.Nome);
  Memo1.Lines.Add('Cliente.Endereco=' + Cliente.Endereco);
  Memo1.Lines.Add('Cliente.Numero=' + IntToStr(Cliente.Numero));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Fornecedor := TFornecedor.Create;

  Fornecedor.Nome := 'Albert';
  Fornecedor.Endereco := 'Endereço';
  Fornecedor.Numero := 15;

  Memo1.Clear;
  Memo1.Lines.Add('Fornecedor.Nome=' + Fornecedor.Nome);
  Memo1.Lines.Add('Fornecedor.Endereco=' + Fornecedor.Endereco);
  Memo1.Lines.Add('Fornecedor.Numero=' + IntToStr(Fornecedor.Numero));
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  StringList: TStringList;
  Cores: array [1 .. 2] of String;
begin
  StringList := TStringList.Create;
  StringList.Add('Albert');
  StringList.Add('Eije');
  Memo1.Clear;
  Memo1.Lines.Add(StringList[0]);
  Memo1.Lines.Add(StringList[1]);

//  RegisterExpectedMemoryLeak(StringList);

  //

  Cores[1] := 'Amarelo';
  Cores[2] := 'Azul';
  Memo1.Lines.Add(Cores[1]);
  Memo1.Lines.Add(Cores[2]);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  // FreeAndNil(Fornecedor);
  // Fornecedor.Free;
  Fornecedor := Nil;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  StringList: TStringList;
  Cores: array [1 .. 2] of String;
begin
  try
    try
      Memo1.Clear;

      Fornecedor := TFornecedor.Create;
      Fornecedor.Nome := 'Albert';
      Fornecedor.Endereco := 'Endereço';
      Fornecedor.Numero := 15;
      Memo1.Lines.Add('Fornecedor.Nome=' + Fornecedor.Nome);
      Memo1.Lines.Add('Fornecedor.Endereco=' + Fornecedor.Endereco);
      Memo1.Lines.Add('Fornecedor.Numero=' + IntToStr(Fornecedor.Numero));

      Memo1.Lines.Add('==============================');

      StringList := TStringList.Create;
      StringList.Add('Albert');
      StringList.Add('Eije');
      Memo1.Lines.Add(StringList[0]);
      Memo1.Lines.Add(StringList[1]);

      Memo1.Lines.Add('==============================');

      Cores[1] := 'Amarelo';
      Cores[2] := 'Azul';
      Memo1.Lines.Add(Cores[1]);
      Memo1.Lines.Add(Cores[2]);
    except
      on E: Exception do
      begin
        Memo1.Lines.Add('==============================');
        Memo1.Lines.Add('ERRO');
        Memo1.Lines.Add(E.Message);
        Memo1.Lines.Add('==============================');
      end;
    end;
  finally
    FreeAndNil(Fornecedor);
    FreeAndNil(StringList);
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

end.
