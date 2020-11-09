object Form1: TForm1
  Left = 538
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Escopo de Vari'#225'veis e Memory Leaks'
  ClientHeight = 473
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 176
    Top = 336
    Width = 3
    Height = 87
  end
  object Button1: TButton
    Left = 8
    Top = 336
    Width = 150
    Height = 25
    Caption = 'Vari'#225'veis Locais'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 342
    Height = 321
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 367
    Width = 150
    Height = 25
    Caption = 'Vari'#225'veis Globais'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 398
    Width = 150
    Height = 25
    Caption = 'Records'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 200
    Top = 336
    Width = 150
    Height = 25
    Caption = 'Vari'#225'veis de Classe'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 200
    Top = 367
    Width = 150
    Height = 25
    Caption = 'StringList'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 200
    Top = 398
    Width = 150
    Height = 25
    Caption = 'Liberando Objetos'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 437
    Width = 342
    Height = 25
    Caption = 'Forma Correta para Liberar Objetos'
    TabOrder = 7
    OnClick = Button7Click
  end
end
