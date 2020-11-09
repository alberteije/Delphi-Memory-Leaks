object F_Principal: TF_Principal
  Left = 397
  Top = 184
  BorderStyle = bsDialog
  Caption = 
    'Gerenciamento de Mem'#243'ria - Swap - Algoritmos de Listas Encadeada' +
    's'
  ClientHeight = 587
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 150
    Height = 512
  end
  object Label6: TLabel
    Left = 158
    Top = 5
    Width = 120
    Height = 22
    Caption = 'Processos....'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label11: TLabel
    Left = 158
    Top = 375
    Width = 94
    Height = 22
    Caption = 'Buracos...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label12: TLabel
    Left = 425
    Top = 375
    Width = 171
    Height = 22
    Caption = 'SO e Proc Ativos...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Bevel3: TBevel
    Left = 3
    Top = 518
    Width = 148
    Height = 63
  end
  object Panel1: TPanel
    Left = -8
    Top = 712
    Width = 792
    Height = 41
    Caption = 'Sistemas Operacionais - Projeto II - O Lance dos Buracos'
    Color = 8421440
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 632
    Top = 0
    Width = 160
    Height = 587
    Align = alRight
    BevelInner = bvLowered
    Color = 14680063
    TabOrder = 1
    object Bevel6: TBevel
      Left = 8
      Top = 170
      Width = 145
      Height = 151
      Shape = bsFrame
    end
    object Bevel5: TBevel
      Left = 6
      Top = 448
      Width = 149
      Height = 72
      Shape = bsFrame
    end
    object Bevel2: TBevel
      Left = 9
      Top = 8
      Width = 145
      Height = 21
    end
    object Label5: TLabel
      Left = 30
      Top = 11
      Width = 102
      Height = 16
      Caption = '..: ENTRADAS :..'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel4: TBevel
      Left = 6
      Top = 36
      Width = 147
      Height = 127
      Shape = bsSpacer
    end
    object Label22: TLabel
      Left = 12
      Top = 428
      Width = 134
      Height = 19
      Caption = 'Tempo (em seg...)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 9
      Top = 463
      Width = 142
      Height = 42
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -35
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 46
      Top = 195
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label26: TLabel
      Left = 9
      Top = 90
      Width = 95
      Height = 14
      Caption = 'Qtde. Processos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 18
      Top = 114
      Width = 85
      Height = 14
      Caption = 'Mem Real (MB):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 60
      Top = 139
      Width = 44
      Height = 14
      Caption = 'MB S.O.:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 46
      Top = 244
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label31: TLabel
      Left = 13
      Top = 172
      Width = 122
      Height = 14
      Caption = 'MB Processo [M1,M2]:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 89
      Top = 195
      Width = 61
      Height = 14
      Caption = 'MegaBytes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 13
      Top = 221
      Width = 130
      Height = 14
      Caption = 'Time Cria'#231#227'o [Tc1, Tc2]:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 89
      Top = 245
      Width = 56
      Height = 14
      Caption = 'Segundos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 17
      Top = 41
      Width = 124
      Height = 14
      Caption = 'Selecione a Estrat'#233'gia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 46
      Top = 292
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label9: TLabel
      Left = 13
      Top = 269
      Width = 135
      Height = 14
      Caption = 'Time Dura'#231#227'o [Td1, Td2]:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 89
      Top = 293
      Width = 56
      Height = 14
      Caption = 'Segundos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 147
      Top = 528
      Width = 5
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 528
      Width = 109
      Height = 14
      Caption = 'Time M'#233'dio Espera:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 147
      Top = 549
      Width = 5
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 549
      Width = 105
      Height = 14
      Caption = '% Utilizado p/ Mem:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BotaoCriarProcessos: TBitBtn
      Left = 15
      Top = 329
      Width = 131
      Height = 25
      Caption = 'Cria Processos...'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 10
      OnClick = BotaoCriarProcessosClick
    end
    object EditTamanhoProcessoInicial: TEdit
      Left = 16
      Top = 192
      Width = 25
      Height = 21
      TabOrder = 4
      Text = '50'
    end
    object EditTamanhoProcessoFinal: TEdit
      Left = 60
      Top = 191
      Width = 25
      Height = 21
      TabOrder = 5
      Text = '300'
      OnExit = EditTamanhoProcessoFinalExit
    end
    object EditQuantidadeProcessos: TEdit
      Left = 106
      Top = 85
      Width = 45
      Height = 21
      TabOrder = 1
      Text = '100'
    end
    object EditMemoriaReal: TEdit
      Left = 106
      Top = 110
      Width = 45
      Height = 21
      TabOrder = 2
      Text = '1024'
      OnExit = EditMemoriaRealExit
    end
    object EditMemoriaSO: TEdit
      Left = 106
      Top = 134
      Width = 45
      Height = 21
      TabOrder = 3
      Text = '300'
      OnExit = EditMemoriaSOExit
    end
    object EditTimeCriacaoInicial: TEdit
      Left = 16
      Top = 241
      Width = 25
      Height = 21
      TabOrder = 6
      Text = '10'
    end
    object EditTimeCriacaoFinal: TEdit
      Left = 60
      Top = 240
      Width = 25
      Height = 21
      TabOrder = 7
      Text = '20'
      OnExit = EditTimeCriacaoFinalExit
    end
    object BotaoInicia: TBitBtn
      Left = 15
      Top = 365
      Width = 131
      Height = 25
      Caption = 'Inicia...'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 11
      OnClick = BotaoIniciaClick
    end
    object ComboBoxAlgoritmoEstrategia: TComboBox
      Left = 16
      Top = 57
      Width = 132
      Height = 21
      TabOrder = 0
      Text = 'First Fit'
      Items.Strings = (
        'First Fit'
        'Best Fit'
        'Worst Fit')
    end
    object EditTimeDuracaoInicial: TEdit
      Left = 16
      Top = 289
      Width = 25
      Height = 21
      TabOrder = 8
      Text = '15'
    end
    object EditTimeDuracaoFinal: TEdit
      Left = 60
      Top = 288
      Width = 25
      Height = 21
      TabOrder = 9
      Text = '60'
      OnExit = EditTimeCriacaoFinalExit
    end
    object BotaoParar: TButton
      Left = 15
      Top = 400
      Width = 60
      Height = 25
      Caption = 'Parar'
      TabOrder = 12
      OnClick = BotaoPararClick
    end
    object BotaoReiniciar: TButton
      Left = 85
      Top = 400
      Width = 60
      Height = 25
      Caption = 'Reiniciar'
      TabOrder = 13
      OnClick = BotaoReiniciarClick
    end
  end
  object Panel3: TPanel
    Left = 159
    Top = 8
    Width = 466
    Height = 569
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 2
    Visible = False
    object Memo2: TMemo
      Left = 4
      Top = 4
      Width = 458
      Height = 520
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Objetivo: Simular as estrat'#233'gias de aloca'#231#227'o de mem'#243'ria: '
        'first fit, best fit e worst fit.'
        ''
        'Descri'#231#227'o: O programa deve medir a utiliza'#231#227'o da mem'#243'ria '
        '(percentual de mem'#243'ria utilizada) e o tempo m'#233'dio de '
        'espera dos processos. O tempo de espera de cada '
        'processo '#233' o intervalo de tempo entre a cria'#231#227'o e a '
        'conclus'#227'o do processo.'
        ''
        '----------------------------------'
        'Entradas:'
        '----------------------------------'
        'Antes de iniciar a simula'#231#227'o, o usu'#225'rio dever'#225' configurar os '
        'seguintes par'#226'metros:'
        ''
        '* Quantidade de processos que ser'#227'o criados;'
        
          '* Estrat'#233'gia de aloca'#231#227'o utilizada: first fit, best fit ou worst' +
          ' '
        'fit;'
        '* Tamanho da mem'#243'ria real (MB);'
        '* Tamanho da '#225'rea de mem'#243'ria ocupada pelo sistema '
        'operacional (MB);'
        '* [M1, M2] - Intervalo para gerar aleatoriamente a '#225'rea '
        'ocupada por cada processo na mem'#243'ria (MB);'
        '* [tc1, tc2] - Intervalo para gerar aleatoriamente o tempo de '
        'cria'#231#227'o de cada processo em rela'#231#227'o ao processo criado '
        'anteriormente (segundos). Portanto, o instante de cria'#231#227'o '
        'do processo '#233' a soma do valor gerado aleatoriamente neste '
        'intervalo com o instante em que foi criado o processo '
        'anterior;'
        '* [td1, td2] - Intervalo para gerar aleatoriamente a dura'#231#227'o '
        'de cada processo (segundos). A dura'#231#227'o representa quanto '
        'tempo o processo fica utilizando a mem'#243'ria a partir do '
        'instante em que ele foi alocado.'
        ''
        '----------------------------------'
        'Sa'#237'das:'
        '----------------------------------'
        'A cada instante, o programa dever'#225' mostrar na tela as '
        'seguintes informa'#231#245'es:'
        ''
        '* Mapa da mem'#243'ria, mostrando a '#225'rea de mem'#243'ria ocupada '
        'por cada processo e as '#225'reas livres;'
        '* Os processos que est'#227'o alocados na mem'#243'ria;'
        '* Os processos que est'#227'o na fila aguardando a libera'#231#227'o de '
        'espa'#231'o de mem'#243'ria para serem alocados;'
        '* Os instantes de tempo em que cada processo foi criado, foi '
        'alocado na mem'#243'ria e concluiu sua execu'#231#227'o;'
        '* Tempo de espera de cada processo (instante de conclus'#227'o '
        'menos o instante de cria'#231#227'o);'
        '* Tempo m'#233'dio de espera dos processos que j'#225' conclu'#237'ram '
        '(m'#233'dia do tempo de espera de cada processo);'
        '* Percentual de mem'#243'ria utilizada.'
        ''
        '----------------------------------'
        'Funcionamento:'
        '----------------------------------'
        'Ao iniciar a execu'#231#227'o, o programa dever'#225' solicitar ao '
        'usu'#225'rio a digita'#231#227'o de todos os dados de entrada. '
        ''
        'Em seguida, dever'#225' gerar aleatoriamente o instante de '
        'cria'#231#227'o, a dura'#231#227'o e '#225'rea de mem'#243'ria ocupada por cada '
        'processo.'
        ''
        'Depois disso, o programa dever'#225' iniciar a simula'#231#227'o '
        'alocando e liberando mem'#243'ria para os processos de acordo '
        'com seus par'#226'metros. '
        ''
        'Vale ressaltar que n'#227'o dever'#225' ser feito nenhum mecanismo '
        'de compacta'#231#227'o, ou seja, um processo, ao ser criado, s'#243' '
        'dever'#225' ser alocado na mem'#243'ria caso exista um buraco na '
        'mem'#243'ria que o caiba. Caso contr'#225'rio, o processo dever'#225' '
        'ficar na fila aguardando a libera'#231#227'o de um espa'#231'o de '
        'mem'#243'ria que o caiba.')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 4
      Top = 524
      Width = 458
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BotaoFecharEspecificacao: TSpeedButton
        Left = 8
        Top = 4
        Width = 441
        Height = 33
        Caption = '..: Fechar :..'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = BotaoFecharEspecificacaoClick
      end
    end
  end
  object BotaoEspecificacao: TBitBtn
    Left = 8
    Top = 523
    Width = 138
    Height = 54
    Caption = 'Especifica'#231#227'o...'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = BotaoEspecificacaoClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 648
    Top = 457
  end
end
