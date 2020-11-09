{ *******************************************************************************
  Title: Gerenciamento de Mem�ria - Swap - Algoritmos de Listas Encadeadas
  Description: Exemplo que simula o gerencimento de mem�ria com Swap utilizando
  os algoritmos first fit, best fit e worst fit.

  The MIT License

  Copyright: Copyright (C) 2010 T2Ti.COM

  Permission is hereby granted, free of charge, to any person
  obtaining a copy of this software and associated documentation
  files (the "Software"), to deal in the Software without
  restriction, including without limitation the rights to use,
  copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the
  Software is furnished to do so, subject to the following
  conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.

  The author may be contacted at:
  alberteije@gmail.com

  @author Albert Eije Barreto Mouta
  @version 1.0
  ******************************************************************************* }
unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, math, Grids;

type
  TF_Principal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BotaoCriarProcessos: TBitBtn;
    Bevel2: TBevel;
    Label5: TLabel;
    Bevel4: TBevel;
    Label22: TLabel;
    Label23: TLabel;
    Bevel5: TBevel;
    EditTamanhoProcessoInicial: TEdit;
    Label25: TLabel;
    EditTamanhoProcessoFinal: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EditQuantidadeProcessos: TEdit;
    EditMemoriaReal: TEdit;
    EditMemoriaSO: TEdit;
    Label30: TLabel;
    EditTimeCriacaoInicial: TEdit;
    EditTimeCriacaoFinal: TEdit;
    Label31: TLabel;
    Label24: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Bevel6: TBevel;
    BotaoInicia: TBitBtn;
    Panel3: TPanel;
    Memo2: TMemo;
    Panel4: TPanel;
    BotaoFecharEspecificacao: TSpeedButton;
    ComboBoxAlgoritmoEstrategia: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditTimeDuracaoInicial: TEdit;
    EditTimeDuracaoFinal: TEdit;
    Timer1: TTimer;
    BotaoParar: TButton;
    Bevel1: TBevel;
    BotaoReiniciar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BotaoEspecificacao: TBitBtn;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel3: TBevel;
    procedure atualizaBuracos;
    procedure primeiroBuraco;
    procedure melhorBuraco;
    procedure piorBuraco;
    procedure alocaSO;
    procedure alocaProcesso(tam, id, topo: integer);
    procedure retiraProcesso(id: integer);
    procedure desenhaGrade;
    procedure desenhaGradeBuracos(linhas: integer);
    procedure desenhaGradeBotoes(linhas: integer);
    procedure BotaoFecharEspecificacaoClick(Sender: TObject);
    procedure BotaoEspecificacaoClick(Sender: TObject);
    procedure EditTamanhoProcessoFinalExit(Sender: TObject);
    procedure EditTimeCriacaoFinalExit(Sender: TObject);
    procedure BotaoCriarProcessosClick(Sender: TObject);
    procedure BotaoIniciaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditMemoriaRealExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BotaoPararClick(Sender: TObject);
    procedure ordenaGrid(Grid: TStringGrid; SortCol: integer; by: byte);
    procedure BotaoReiniciarClick(Sender: TObject);
    procedure EditMemoriaSOExit(Sender: TObject);
  private
  public
  end;

var
  F_Principal: TF_Principal;
  tempoCriacao: integer;
  tempoDuracao: integer;
  tempoPassado: integer;
  tamanhoProcesso: integer;
  ultimaPosicao: integer;
  ultimaPosicaoSo: integer;
  pixelPorMB: integer;
  MBPorPixel: integer;
  grade: TStringGrid;
  gradeBuracos: TStringGrid;
  gradeBotoes: TStringGrid;
  botoes: array of TPanel;
  cores: array [1 .. 20] of TColor;
  botaoSO: TPanel;
  alturaProcesso: integer;

implementation

{$R *.dfm}

// fun��o para converter horas para segundos
function Hora_Seg(Horas: string): LongInt;
Var
  Hor, Min, Seg: LongInt;
begin
  Horas[Pos(':', Horas)] := '[';
  Horas[Pos(':', Horas)] := ']';
  Hor := StrToInt(Copy(Horas, 1, Pos('[', Horas) - 1));
  Min := StrToInt(Copy(Horas, Pos('[', Horas) + 1, (Pos(']', Horas) - Pos('[', Horas) - 1)));
  if Pos(':', Horas) > 0 then
    Seg := StrToInt(Copy(Horas, Pos(']', Horas) + 1, (Pos(':', Horas) - Pos(']', Horas) - 1)))
  else
    Seg := StrToInt(Copy(Horas, Pos(']', Horas) + 1, 2));
  Result := Seg + (Hor * 3600) + (Min * 60);
end;

// verifica se o valor passado para a memoria � v�lido
function potenciaDeDois(Numero: Double): Boolean;
begin
  // pega o tamanho passado para a mem�ria e sai dividindo por 2. Se conseguir
  // chegar at� 2 � porque o n�mero � v�lido
  while Numero > 1 do
  begin
    Numero := Numero / 2;
    if Numero = 2 then
    begin
      Result := true;
      break;
    end
    else
      Result := false;
  end;
end;

// Fun��o para ordernar um vetor (no caso a StringGrid)
procedure TF_Principal.ordenaGrid(Grid: TStringGrid; SortCol: integer; by: byte);
var
  i, j: integer;
  temp: TStringList;
begin
  temp := TStringList.Create;
  with Grid do
  begin
    for i := FixedRows to RowCount - 2 do
    begin
      for j := i + 1 to RowCount - 1 do
      begin
        if (by = 0) then
        begin // ascendente
          if AnsiCompareText(Cells[SortCol, i], Cells[SortCol, j]) < 0 then
          begin
            temp.assign(rows[j]);
            rows[j].assign(rows[i]);
            rows[i].assign(temp);
          end;
        end
        else
        begin // descendente
          if AnsiCompareText(Cells[SortCol, i], Cells[SortCol, j]) > 0 then
          begin
            temp.assign(rows[j]);
            rows[j].assign(rows[i]);
            rows[i].assign(temp);
          end;
        end;
      end;
    end;
  end;
  temp.free;
end;

procedure TF_Principal.BotaoFecharEspecificacaoClick(Sender: TObject);
begin
  Panel3.Visible := false;
  Panel2.Enabled := true;
end;

procedure TF_Principal.BotaoEspecificacaoClick(Sender: TObject);
begin
  Panel3.Visible := true;
  Panel2.Enabled := false;
  Panel3.BringToFront;
end;

procedure TF_Principal.EditMemoriaSOExit(Sender: TObject);
begin
  if EditMemoriaSO.Text = '' then
    EditMemoriaSO.Text := '128';
  if StrToInt(EditMemoriaSO.Text) > StrToInt(EditMemoriaReal.Text) then
  begin
    ShowMessage('Tamanho do SO maior que o tamanho da mem�ria - corrija.');
    EditMemoriaSO.clear;
    EditMemoriaSO.SetFocus;
  end;
end;

procedure TF_Principal.EditTamanhoProcessoFinalExit(Sender: TObject);
begin
  if StrToInt(EditTamanhoProcessoFinal.Text) < StrToInt(EditTamanhoProcessoInicial.Text) then
  begin
    ShowMessage('Intervalo incorreto - insira novamente');
    EditTamanhoProcessoFinal.Text := '0';
    EditTamanhoProcessoInicial.Text := '0';
    EditTamanhoProcessoInicial.SetFocus;
  end;
end;

procedure TF_Principal.EditTimeCriacaoFinalExit(Sender: TObject);
begin
  if StrToInt(EditTimeCriacaoFinal.Text) < StrToInt(EditTimeCriacaoInicial.Text) then
  begin
    ShowMessage('Intervalo incorreto - insira novamente');
    EditTimeCriacaoFinal.Text := '0';
    EditTimeCriacaoInicial.Text := '0';
    EditTimeCriacaoInicial.SetFocus;
  end;
end;

procedure TF_Principal.desenhaGrade;
begin
  {
    Desenha a grade dos processos.

    colunas utilizadas:
    0 - id do processo
    1 - Tamanho do processo
    2 - Instante de cria��o
    3 - Dura��o do processo
    4 - Instante de Aloca��o
    5 - Momento em que o processo entrou na fila
    6 - Momento em que o processo saiu da fila
    7 - Instante de conclus�o do processo
    8 - Tempo de espera
    9 - Status do processo
    10 - Posi��o de in�cio da mem�ria
    11 - Posi��o final da mem�ria
    }
  grade := TStringGrid.Create(F_Principal);
  grade.Parent := F_Principal;

  grade.BorderStyle := bsSingle;
  grade.ColCount := 12;
  grade.FixedCols := 0;
  grade.FixedRows := 1;
  grade.Height := 340;
  grade.Left := 158;
  grade.RowCount := StrToInt(EditQuantidadeProcessos.Text) + 1;
  grade.ScrollBars := ssBoth;
  grade.Top := 30;
  grade.Visible := true;
  grade.Width := 467;
  grade.DefaultColWidth := 52;
  grade.DefaultRowHeight := 20;

  grade.ColWidths[0] := 30;
  grade.ColWidths[5] := 30;
  grade.ColWidths[6] := 30;

  grade.Cells[0, 0] := 'id';
  grade.Cells[1, 0] := 'Tamanho';
  grade.Cells[2, 0] := 'Cria��o';
  grade.Cells[3, 0] := 'Dura��o';
  grade.Cells[4, 0] := 'Aloca��o';
  grade.Cells[5, 0] := 'E.Fila';
  grade.Cells[6, 0] := 'S.Fila';
  grade.Cells[7, 0] := 'Conclus�o';
  grade.Cells[8, 0] := 'Espera';
  grade.Cells[9, 0] := 'Status';
  grade.Cells[10, 0] := 'In�cio';
  grade.Cells[11, 0] := 'Fim';
end;

procedure TF_Principal.desenhaGradeBuracos(linhas: integer);
begin
  {
    Desenha a grade dos buracos.

    colunas necess�rias:
    0 - id do Buraco
    1 - Posi��o inicial
    2 - Posi��o final
    3 - Tamanho
    }
  gradeBuracos := TStringGrid.Create(F_Principal);
  gradeBuracos.Parent := F_Principal;

  gradeBuracos.BorderStyle := bsSingle;
  gradeBuracos.ColCount := 4;
  gradeBuracos.FixedCols := 0;
  gradeBuracos.FixedRows := 1;
  gradeBuracos.Height := 180;
  gradeBuracos.Left := 158;
  gradeBuracos.RowCount := linhas;
  gradeBuracos.ScrollBars := ssBoth;
  gradeBuracos.Top := 400;
  gradeBuracos.Visible := true;
  gradeBuracos.Width := 200;
  gradeBuracos.DefaultColWidth := 40;
  gradeBuracos.DefaultRowHeight := 20;

  gradeBuracos.Cells[0, 0] := 'id';
  gradeBuracos.Cells[1, 0] := 'In�cio';
  gradeBuracos.Cells[2, 0] := 'Fim';
  gradeBuracos.Cells[3, 0] := 'Tam.';
end;

procedure TF_Principal.desenhaGradeBotoes(linhas: integer);
begin
  {
    Desenha a grade dos panels (que representa os processos)
    � necess�rio saber em que posi��o est�o os processos para
    atualizar a grade dos buracos.

    colunas necess�rias:
    0 - id do Bot�o (panel)
    1 - Posi��o inicial
    2 - Posi��o final
    3 - Tamanho
    }
  gradeBotoes := TStringGrid.Create(F_Principal);
  gradeBotoes.Parent := F_Principal;

  gradeBotoes.BorderStyle := bsSingle;
  gradeBotoes.ColCount := 4;
  gradeBotoes.FixedCols := 0;
  gradeBotoes.FixedRows := 1;
  gradeBotoes.Height := 180;
  gradeBotoes.Left := 425;
  gradeBotoes.RowCount := linhas + 1;
  gradeBotoes.ScrollBars := ssBoth;
  gradeBotoes.Top := 400;
  gradeBotoes.Visible := true;
  gradeBotoes.Width := 200;
  gradeBotoes.DefaultColWidth := 40;
  gradeBotoes.DefaultRowHeight := 20;

  gradeBotoes.Cells[0, 0] := 'Cod.';
  gradeBotoes.Cells[1, 0] := 'In�cio';
  gradeBotoes.Cells[2, 0] := 'Fim';
  gradeBotoes.Cells[3, 0] := 'Tam.';
end;

procedure TF_Principal.BotaoCriarProcessosClick(Sender: TObject);
var
  i, tempoAnterior: integer;
begin
  // seta o tamanho do array de processos para a quantidade de processos informada
  // pelo usu�rio do sistema
  SetLength(botoes, StrToInt(EditQuantidadeProcessos.Text));

  // desenha a grade de processos
  desenhaGrade;
  BotaoCriarProcessos.Enabled := false;

  tempoAnterior := 0;
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    // vai sortear os tempos e o tamanho dos processos
    Randomize;
    tamanhoProcesso := randomRange(StrToInt(EditTamanhoProcessoInicial.Text), StrToInt(EditTamanhoProcessoFinal.Text));
    tempoCriacao := randomRange(StrToInt(EditTimeCriacaoInicial.Text), StrToInt(EditTimeCriacaoFinal.Text)) + tempoAnterior;
    tempoDuracao := randomRange(StrToInt(EditTimeDuracaoInicial.Text), StrToInt(EditTimeDuracaoFinal.Text));
    grade.Cells[0, i] := IntToStr(i);
    grade.Cells[1, i] := IntToStr(tamanhoProcesso);
    grade.Cells[2, i] := IntToStr(tempoCriacao);
    grade.Cells[3, i] := IntToStr(tempoDuracao);
    grade.Cells[5, i] := '0';
    grade.Cells[6, i] := '0';
    grade.Cells[9, i] := 'Inexistente';

    tempoAnterior := tempoCriacao;
  end;

  BotaoInicia.Enabled := true;
  Label6.Visible := true;
end;

procedure TF_Principal.BotaoIniciaClick(Sender: TObject);
begin
  Label11.Visible := true;
  Label12.Visible := true;
  // num primeiro momento desenha-se a grade dos buracos com 2 linhas:
  // uma para os t�tulos e outra para o primeiro buraco
  desenhaGradeBuracos(2);

  Timer1.Enabled := true;
  BotaoInicia.Enabled := false;

  // chama o procedimento que aloca o Sistema Operacional
  alocaSO;
end;

procedure TF_Principal.Timer1Timer(Sender: TObject);
begin
  // este procedimento � executado de 1 em 1 segundo

  inc(tempoPassado);
  Label23.Caption := IntToStr(tempoPassado);

  if ComboBoxAlgoritmoEstrategia.Text = 'First Fit' then
    primeiroBuraco
  else if ComboBoxAlgoritmoEstrategia.Text = 'Best Fit' then
    melhorBuraco
  else if ComboBoxAlgoritmoEstrategia.Text = 'Worst Fit' then
    piorBuraco;
end;

procedure TF_Principal.alocaSO;
var
  cor: integer;
begin
  {
    Defini��o das vari�veis MBPorPixel e pixelPorMB

    A altura real em pixels da �rea reservada para mostrar a mem�ria � 512.
    Se o usu�rio entrar com um valor at� 512, n�s podemos representar um
    pixel por um MB, de acordo com os valores abaixo. Lembrando que 1 pixel
    � sempre um valor inteiro, por isso usa-se a fun��o Trunc.

    64MB de Ram Real - Fica 8 Pixels por MB ---> 512/64
    128MB de Ram Real - Fica 4 Pixels por MB ---> 512/128
    256MB de Ram Real - Fica 2 Pixels por MB ---> 512/256
    512MB de Ram Real - Fica 1 Pixels por MB ---> 512/512

    Se o usu�rio entrar com um valor maior que 512 n�o vai dar pra representar
    a mem�ria em pixels, porque a menor unidade de um pixel � 1.

    Para isso teremos que usar a vari�vel MBPorPixel para informar ao programa
    quantos megas um pixel vai representar.

    1024MB de Ram Real - Fica 2 MB sendo representados por 1 pixel ---> 1024/512
    2048MB de Ram Real - Fica 4 MB sendo representados por 1 pixel ---> 2048/512
    }
  if StrToInt(EditMemoriaReal.Text) <= 512 then
  begin
    pixelPorMB := trunc(512 / StrToInt(EditMemoriaReal.Text));
    MBPorPixel := 0;
  end
  else
  begin
    MBPorPixel := trunc(StrToInt(EditMemoriaReal.Text) / 512);
    pixelPorMB := 0;
  end;

  {
    Aloca��o do S.O. na mem�ria

    Neste momento vamos utilizar as vari�veis MBPorPixel ou pixelPorMB.

    � um simples c�lculo para desenhar o processo dentro da �rea que foi
    definida para representar a mem�ria real.
    }

  {
    se a mem�ria for menor que 512 a ultima posi��o do SO, ou seja, o primeiro
    buracao ser� calculado com base no tamanho do SO vezes a vari�vel pixelPorMB
    sen�o, a altura do processo ser� o tamanho do SO dividido pela variavel
    MBPorPixel, e ent�o o �ltima posi��o do SO ser� a altura do processo.
    }
  if MBPorPixel = 0 then
    ultimaPosicaoSo := (StrToInt(EditMemoriaSO.Text) * pixelPorMB)
  else
  begin
    alturaProcesso := trunc(StrToInt(EditMemoriaSO.Text) / MBPorPixel);
    ultimaPosicaoSo := alturaProcesso;
  end;

  // botaoSO representa um processo especial criado para o SO que se mant�m
  // fixo at� o aplicativo ser finalizado
  botaoSO := TPanel.Create(F_Principal);
  botaoSO.Parent := F_Principal;
  botaoSO.ParentBackground := False;

  botaoSO.Top := 1;
  botaoSO.Left := 0;
  botaoSO.Width := 150;
  botaoSO.Height := ultimaPosicaoSo;
  botaoSO.Font.Size := 11;
  botaoSO.Font.Style := [fsbold];
  botaoSO.Font.Name := 'Arial';
  botaoSO.Caption := 'Sistema Operacional';

  // sorteia a cor para o bot�o do SO
  Randomize;
  cor := randomRange(1, 20);
  botaoSO.Color := cores[cor];

  // chama o procedimento que atualiza a grade dos buracos
  atualizaBuracos;
end;

procedure TF_Principal.primeiroBuraco;
var
  i, j: integer;
begin
  // esse procedimento � chamado a cada segundo pelo m�todo do Timer

  // esse primeiro la�o verifica os processos a sair
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    if grade.Cells[7, i] = Label23.Caption then
    begin
      retiraProcesso(StrToInt(grade.Cells[0, i]));
      grade.Cells[9, i] := 'Conclu�do';
    end;
  end;

  // esse segundo la�o verifica os processos a entrar
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    // se o momento de cria��o do processo � igual ao tempo atual ou o processo est� na fila
    if (grade.Cells[2, i] = Label23.Caption) or (grade.Cells[9, i] = 'Fila') then
    begin
      // varre a grade dos buracos
      for j := 1 to gradeBuracos.RowCount - 1 do
      begin
        // se o tamanho do buraco � maior que o tamanho do processo (pegou logo o primeiro buraco)
        if (StrToInt(gradeBuracos.Cells[3, j]) >= StrToInt(grade.Cells[1, i])) then
        begin
          // posi��o inicial do processo: � o inicio do buraco
          grade.Cells[10, i] := gradeBuracos.Cells[1, j];
          // posi��o final do processo: � a posi��o inicial do buraco + Tamanho do Processo - 1
          grade.Cells[11, i] := IntToStr(StrToInt(gradeBuracos.Cells[1, j]) + StrToInt(grade.Cells[1, i]) - 1);
          // aloca o processo passando 3 parametros: Tamanho, Id, Inicio que � o topo
          alocaProcesso(StrToInt(grade.Cells[1, i]), StrToInt(grade.Cells[0, i]), StrToInt(grade.Cells[10, i]));
          // grava na grade de processos o momento da aloca��o do processo:
          // Momento da Cria��o + (E.Fila - S.Fila)
          // faz um teste para verificar se o processo j� est� na fila
          if grade.Cells[5, i] <> '0' then
          begin
            grade.Cells[6, i] := Label23.Caption;
          end;
          // Instante de aloca��o: instante de cria��o + (Sa�da da Fila - Entrada na fila)
          grade.Cells[4, i] := IntToStr(StrToInt(grade.Cells[2, i]) + (StrToInt(grade.Cells[6, i]) - StrToInt(grade.Cells[5, i])));
          // grava na grade de processos o momento da conclus�o do processo:
          // Tempo de dura��o + Momento de aloca��o
          grade.Cells[7, i] := IntToStr(StrToInt(grade.Cells[3, i]) + StrToInt(grade.Cells[4, i]));
          // grava o status do processo
          grade.Cells[9, i] := 'Rodando';
          break;
        end
        // se chegou no final da grade dos buracos e n�o achou um buraco compat�vel
        // coloca o processo na fila
        else if (j = gradeBuracos.RowCount - 1) or (gradeBuracos.Cells[3, j + 1] = '') then
        begin
          if grade.Cells[5, i] = '0' then
          begin
            grade.Cells[9, i] := 'Fila';
            grade.Cells[5, i] := Label23.Caption;
          end;
          break;
        end;
      end;
    end;
  end;
end;

procedure TF_Principal.melhorBuraco;
var
  i, j, escolha, tEscolha: integer;
begin
  // para o melhor buraco vamos ter que usar uma vari�vel escolha
  escolha := 0;

  // la�o para verificar processos a sair
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    if grade.Cells[7, i] = Label23.Caption then
    begin
      retiraProcesso(StrToInt(grade.Cells[0, i]));
      grade.Cells[9, i] := 'Conclu�do';
    end;
  end;

  // la�o para verificar processoa a entrar
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    // tEscolha � setada para o tamanho da mem�ria
    tEscolha := StrToInt(EditMemoriaReal.Text);

    // se chegou o momento do processo ou ele est� na fila
    if (grade.Cells[2, i] = Label23.Caption) or (grade.Cells[9, i] = 'Fila') then
    begin

      // procura pelo melhor buraco
      for j := 1 to gradeBuracos.RowCount - 1 do
      begin
        // se n�o chegou no final da grade dos buracos
        if gradeBuracos.Cells[3, j] <> '' then
        begin
          // se (tamanho do buraco >= tamanho do processo) e (o tamanho do buraco for menor que tEscolha)
          if (StrToInt(gradeBuracos.Cells[3, j]) >= StrToInt(grade.Cells[1, i])) and (StrToInt(gradeBuracos.Cells[3, j]) <= tEscolha) then
          begin
            // aponta escolha para o �ndice do melhor buraco
            escolha := j;
            // atualiza tEscolha para o tamanho do melhor buraco
            tEscolha := StrToInt(gradeBuracos.Cells[3, escolha]);
          end;
        end;
      end;

      // se achou um buraco para o processo, tEscolha ser� diferente do tamanho da mem�ria
      // e ent�o o programa vai entrar nesse SE
      if tEscolha <> StrToInt(EditMemoriaReal.Text) then
      begin
        // posi��o inicial: inicio do buraco
        grade.Cells[10, i] := gradeBuracos.Cells[1, escolha];
        // posi��o final: posi��o inicial do buraco + Tamanho do Processo - 1
        grade.Cells[11, i] := IntToStr(StrToInt(gradeBuracos.Cells[1, escolha]) + StrToInt(grade.Cells[1, i]) - 1);
        // aloca o processo passando 3 parametros: Tamanho, Id, Inicio que � o topo
        alocaProcesso(StrToInt(grade.Cells[1, i]), StrToInt(grade.Cells[0, i]), StrToInt(grade.Cells[10, i]));
        // grava na grade de processos o momento da aloca��o do processo:
        // Momento da Cria��o + (E.Fila - S.Fila)
        // faz um teste para verificar se o processo j� est� na fila
        if grade.Cells[5, i] <> '0' then
        begin
          grade.Cells[6, i] := Label23.Caption;
        end;
        // Instante de aloca��o: instante de cria��o + (Sa�da da Fila - Entrada na fila)
        grade.Cells[4, i] := IntToStr(StrToInt(grade.Cells[2, i]) + (StrToInt(grade.Cells[6, i]) - StrToInt(grade.Cells[5, i])));
        // grava na grade de processos o momento da conclus�o do processo:
        // Tempo de dura��o + Momento de aloca��o
        grade.Cells[7, i] := IntToStr(StrToInt(grade.Cells[3, i]) + StrToInt(grade.Cells[4, i]));
        // grava o status do processo
        grade.Cells[9, i] := 'Rodando';
        // break;
      end
      // se chegou no final da grade dos buracos e n�o achou um buraco compat�vel
      // coloca o processo na fila
      else
      begin
        if grade.Cells[5, i] = '0' then
        begin
          grade.Cells[9, i] := 'Fila';
          grade.Cells[5, i] := Label23.Caption;
        end;
        // break;
      end;
    end;
  end;
end;

procedure TF_Principal.piorBuraco;
var
  i, j, escolha, tEscolha: integer;
begin
  // para o pior buraco vamos ter que usar uma vari�vel escolha
  escolha := 0;

  // la�o para verificar processos a sair
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    if grade.Cells[7, i] = Label23.Caption then
    begin
      retiraProcesso(StrToInt(grade.Cells[0, i]));
      grade.Cells[9, i] := 'Conclu�do';
    end;
  end;

  // la�o para verificar processos a entrar
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    // tEscolha � setada para zero
    tEscolha := 0;

    // se chegou o momento do processo ou ele est� na fila
    if (grade.Cells[2, i] = Label23.Caption) or (grade.Cells[9, i] = 'Fila') then
    begin

      // procura pelo pior buraco
      for j := 1 to gradeBuracos.RowCount - 1 do
      begin
        // se n�o chegou no final da grade dos buracos
        if gradeBuracos.Cells[3, j] <> '' then
        begin
          // se (tamanho do buraco >= tamanho do processo) e (o tamanho do buraco for maior que tEscolha)
          if (StrToInt(gradeBuracos.Cells[3, j]) >= StrToInt(grade.Cells[1, i])) and (StrToInt(gradeBuracos.Cells[3, j]) >= tEscolha) then
          begin
            // aponta escolha para o �ndice do pior buraco
            escolha := j;
            // atualiza tEscolha para o tamanho do pior buraco
            tEscolha := StrToInt(gradeBuracos.Cells[3, escolha]);
          end;
        end;
      end;

      // se achou um buraco para o processo, tEscolha ser� diferente de zero
      // e ent�o o programa vai entrar nesse SE
      if tEscolha <> 0 then
      begin
        // posi��o inicial: inicio do buraco
        grade.Cells[10, i] := gradeBuracos.Cells[1, escolha];
        // posi��o final: posi��o inicial do buraco + Tamanho do Processo - 1
        grade.Cells[11, i] := IntToStr(StrToInt(gradeBuracos.Cells[1, escolha]) + StrToInt(grade.Cells[1, i]) - 1);
        // aloca o processo passando 3 parametros: Tamanho, Id, Inicio que � o topo
        alocaProcesso(StrToInt(grade.Cells[1, i]), StrToInt(grade.Cells[0, i]), StrToInt(grade.Cells[10, i]));
        // grava na grade de processos o momento da aloca��o do processo:
        // Momento da Cria��o + (E.Fila - S.Fila)
        // faz um teste para verificar se o processo j� est� na fila
        if grade.Cells[5, i] <> '0' then
        begin
          grade.Cells[6, i] := Label23.Caption;
        end;
        // Instante de aloca��o: instante de cria��o + (Sa�da da Fila - Entrada na fila)
        grade.Cells[4, i] := IntToStr(StrToInt(grade.Cells[2, i]) + (StrToInt(grade.Cells[6, i]) - StrToInt(grade.Cells[5, i])));
        // grava na grade de processos o momento da conclus�o do processo:
        // Tempo de dura��o + Momento de aloca��o
        grade.Cells[7, i] := IntToStr(StrToInt(grade.Cells[3, i]) + StrToInt(grade.Cells[4, i]));
        // grava o status do processo
        grade.Cells[9, i] := 'Rodando';
        // break;
      end
      // se chegou no final da grade dos buracos e n�o achou um buraco compat�vel
      // coloca o processo na fila
      else
      begin
        if grade.Cells[5, i] = '0' then
        begin
          grade.Cells[9, i] := 'Fila';
          grade.Cells[5, i] := Label23.Caption;
        end;
        // break;
      end;
    end;
  end;
end;

procedure TF_Principal.alocaProcesso(tam, id, topo: integer);
var
  i, j, cor: integer;
begin
  // se ainda n�o tem processos UltimaPosicao ser� zero, neste caso ser�
  // atualizada para a Ultima posic�o do SO que � o in�cio do primeiro buraco
  if ultimaPosicao = 0 then
    ultimaPosicao := ultimaPosicaoSo;

  // preenchimento do vetor de bot�es (panels) com os processos
  botoes[id] := TPanel.Create(F_Principal);
  botoes[id].Parent := F_Principal;

  botoes[id].ParentBackground := False;

  botoes[id].Left := 0;
  botoes[id].Width := 150;

  Randomize;
  cor := randomRange(1, 20);
  botoes[id].Color := cores[cor];

  // se a memoria for <= 512
  if MBPorPixel = 0 then
  begin
    alturaProcesso := tam;
    ultimaPosicao := ultimaPosicao + tam;
  end
  // se a mem�ria for maior que 512
  else
  begin
    // se topo for um valor par faz a divis�o direta com  o trunc e nada ser� perdido
    if topo mod 2 = 0 then
      topo := trunc(topo / MBPorPixel)
      // se topo for um valor impar faz a divis�o e soma com 1
    else
      topo := trunc(topo / MBPorPixel) + 1;

    // altura do processo � o tamanh dividido por MBPorPixel
    alturaProcesso := trunc(tam / MBPorPixel);

    // ultima posicao ser� a ultima posicao + altura do processo - serve para saber
    // o inicio de um buraco
    ultimaPosicao := ultimaPosicao + alturaProcesso;
  end;

  botoes[id].Top := topo;
  botoes[id].Font.Style := [fsbold];
  botoes[id].Font.Name := 'Arial';
  botoes[id].Height := alturaProcesso;
  botoes[id].Caption := 'Processo ' + IntToStr(id);

  // atualiza a grade dos buracos
  atualizaBuracos;
end;

procedure TF_Principal.retiraProcesso(id: integer);
var
  i, somaEspera, processosConcluidos: integer;
begin
  somaEspera := 0;

  // retira o processo da tela
  botoes[id].free;

  // Tempo de espera do processo: alocacao - criacao + duracao
  grade.Cells[8, id] := IntToStr(StrToInt(grade.Cells[4, id]) - StrToInt(grade.Cells[2, id]) + StrToInt(grade.Cells[3, id]));

  // la�o para somar os tempos de espera de todos os processos conclu�dos
  for i := 1 to StrToInt(EditQuantidadeProcessos.Text) do
  begin
    if grade.Cells[8, i] <> '' then
    begin
      inc(processosConcluidos);
      somaEspera := somaEspera + StrToInt(grade.Cells[8, i]);
    end;
  end;

  // atualiza o tempo m�dio de espera
  Label1.Caption := FloatToStr(roundto(somaEspera / processosConcluidos, -2));

  // atualiza a grade dos buracos
  atualizaBuracos;
end;

procedure TF_Principal.EditMemoriaRealExit(Sender: TObject);
begin
  if potenciaDeDois(StrToFloat(EditMemoriaReal.Text)) = false then
  begin
    ShowMessage('Esse n�o � um valor v�lido para o tamanho da mem�ria');
    EditMemoriaReal.SetFocus;
  end;
end;

procedure TF_Principal.atualizaBuracos;
var
  i, j, somaMem: integer;
begin
  somaMem := 0;

  gradeBotoes.free;

  // gera a grade de bot�es baseada no n�mero de bot�es que existem na posi��o
  // left=0
  j := 0;
  for i := 1 to ComponentCount - 1 do
  begin
    if (Components[i] is TPanel) then
      if (Components[i] as TPanel).Left = 0 then
      begin
        j := j + 1;
      end;
  end;

  // desenha a grade de bot�es passando o n�mero de linhas
  desenhaGradeBotoes(j);

  // la�o para preencher a grade dos bot�es
  j := 0;
  for i := 1 to ComponentCount - 1 do
  begin
    if (Components[i] is TPanel) then
      if (Components[i] as TPanel).Left = 0 then
      begin
        j := j + 1;

        // ap�s testar se � um processo

        // insere o indice na grade
        gradeBotoes.Cells[0, j] := IntToStr(j);

        // se a mem�ria for maior que 512
        if MBPorPixel <> 0 then
        begin
          // posicao inicial do processo ativo: topo do bot�o * MBPorpixel - 1
          gradeBotoes.Cells[1, j] := IntToStr(((Components[i] as TPanel).Top * MBPorPixel) - 1);
          // posicao final do processo ativo (: (altura do bot�o * MBPorPixel) + ((topo do bot�o - 1)*MBPorPixel)
          gradeBotoes.Cells[2, j] := IntToStr(((Components[i] as TPanel).Height * MBPorPixel) + ((Components[i] as TPanel).Top - 1) * MBPorPixel);
        end
        // se a mem�ria for menor ou igual a 512
        else
        begin
          // posicao inicial: topo do bot�o
          gradeBotoes.Cells[1, j] := IntToStr((Components[i] as TPanel).Top);
          // posicao final: (altura do bot�o + topo do bot�o - 1)
          gradeBotoes.Cells[2, j] := IntToStr((Components[i] as TPanel).Height + (Components[i] as TPanel).Top - 1);
        end;
        // se mem�ria for <= 512 o tamanho do processo ativo ser� igual a altura do bot�o
        if MBPorPixel = 0 then
          gradeBotoes.Cells[3, j] := IntToStr((Components[i] as TPanel).Height)
          // gradeBotoes.Cells[3,j] := IntToStr(trunc((Components[i] as TPanel).Height / PixelPorMB))
          // sen�o ser� a altura do bot�o * MBPorPixel
        else
          gradeBotoes.Cells[3, j] := IntToStr((Components[i] as TPanel).Height * MBPorPixel);

        // atualiza a variavel que cacula a quantidade de mem�ria oculpada no momento
        somaMem := somaMem + StrToInt(gradeBotoes.Cells[3, j]);
      end;
  end;

  // mostra na tela a % de mem�ria utilizada
  Label3.Caption := FloatToStr(roundto(somaMem / StrToInt(EditMemoriaReal.Text), -2) * 100);

  // ordena a grade dos processos ativos
  ordenaGrid(gradeBotoes, 1, 1);

  gradeBuracos.free;
  desenhaGradeBuracos(gradeBotoes.RowCount);

  // la�o para preencher a grade dos buracos
  j := 0;
  for i := 1 to gradeBotoes.RowCount - 1 do
  begin
    // se ainda n�o chegou no �ltimo registro
    if i <> gradeBotoes.RowCount - 1 then
    begin
      // se a posi��o inicial do bot�o posterior-1 for direfente da posi��o final do bot�o atual
      // neste caso existe um buraco
      if StrToInt(gradeBotoes.Cells[1, i + 1]) - 1 <> StrToInt(gradeBotoes.Cells[2, i]) then
      begin
        j := j + 1;
        // insere o indice na grade
        gradeBuracos.Cells[0, j] := IntToStr(j);
        // posicao inicial do buraco
        gradeBuracos.Cells[1, j] := IntToStr(StrToInt(gradeBotoes.Cells[2, i]) + 1);
        // posicao final do buraco
        gradeBuracos.Cells[2, j] := IntToStr(StrToInt(gradeBotoes.Cells[1, i + 1]) - 1);
        // tamanho do buraco
        gradeBuracos.Cells[3, j] := IntToStr((StrToInt(gradeBotoes.Cells[1, i + 1]) - 1) - (StrToInt(gradeBotoes.Cells[2, i])));
      end;
    end
    // se chegou no �ltimo registro
    else
    begin
      j := j + 1;
      // insere o indice na grade
      gradeBuracos.Cells[0, j] := IntToStr(j);
      // posicao inicial do buraco
      gradeBuracos.Cells[1, j] := IntToStr(StrToInt(gradeBotoes.Cells[2, i]) + 1);
      // posicao final do buraco
      gradeBuracos.Cells[2, j] := EditMemoriaReal.Text;
      // tamanho do buraco ser�
      gradeBuracos.Cells[3, j] := IntToStr(StrToInt(EditMemoriaReal.Text) - (StrToInt(gradeBotoes.Cells[2, i])));
    end;
  end;
end;

procedure TF_Principal.BotaoPararClick(Sender: TObject);
begin
  Timer1.Enabled := false;
end;

procedure TF_Principal.BotaoReiniciarClick(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TF_Principal.FormCreate(Sender: TObject);
begin
  // define as cores do array de cores
  cores[1] := $0088BCF7;
  cores[2] := $0080FFFF;
  cores[3] := $0080FF80;
  cores[4] := $00FFFF80;
  cores[5] := $00FF8000;
  cores[6] := $00C080FF;
  cores[7] := $00C08000;
  cores[8] := $00C08080;
  cores[9] := $007C7CBE;
  cores[10] := $008CB1FF;
  cores[11] := $00FFC6C6;
  cores[12] := $0000E8E8;
  cores[13] := $00DCFFB9;
  cores[14] := $00FF62FF;
  cores[15] := $00DFBFFF;
  cores[16] := $00CAFFFF;
  cores[17] := $00CADBFF;
  cores[18] := $00DFBDBD;
  cores[19] := $00769771;
  cores[20] := $00987093;
  ultimaPosicao := 0;
end;

procedure TF_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  botaoSO.free;
  grade.free;
  gradeBotoes.free;
  gradeBuracos.free;
end;

end.
