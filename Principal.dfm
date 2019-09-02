object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 403
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 604
    Height = 403
    Align = alClient
    Caption = 'Registro'
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 2
      Top = 15
      Width = 600
      Height = 90
      Align = alTop
      Caption = 'Dados Pessoais'
      TabOrder = 0
      object LbNome: TLabel
        Left = 16
        Top = 22
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object LbRg: TLabel
        Left = 16
        Top = 44
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object LbCpf: TLabel
        Left = 227
        Top = 44
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object LbTelefone: TLabel
        Left = 416
        Top = 44
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object LbEmail: TLabel
        Left = 16
        Top = 66
        Width = 28
        Height = 13
        Caption = 'e-mail'
      end
      object EdNome: TEdit
        Left = 68
        Top = 18
        Width = 517
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object EdRg: TEdit
        Left = 68
        Top = 40
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object EdCpf: TEdit
        Left = 275
        Top = 40
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object EdTelefone: TEdit
        Left = 464
        Top = 40
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object EdEmail: TEdit
        Left = 68
        Top = 62
        Width = 517
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 105
      Width = 600
      Height = 296
      Align = alClient
      Caption = 'Logradouro'
      TabOrder = 1
      object LbEndereco: TLabel
        Left = 36
        Top = 42
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endereco'
      end
      object LbNumero: TLabel
        Left = 482
        Top = 41
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Numero'
      end
      object LbBairro: TLabel
        Left = 53
        Top = 65
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bairro'
      end
      object LbCidade: TLabel
        Left = 48
        Top = 112
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade'
      end
      object LbEstado: TLabel
        Left = 488
        Top = 111
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object LbCep: TLabel
        Left = 143
        Top = 19
        Width = 73
        Height = 13
        Caption = 'Informe o CEP:'
      end
      object LbPais: TLabel
        Left = 62
        Top = 136
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pa'#237's'
      end
      object Label1: TLabel
        Left = 16
        Top = 88
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Complemento'
      end
      object EdEndereco: TEdit
        Left = 99
        Top = 38
        Width = 351
        Height = 21
        TabOrder = 0
      end
      object EdNumero: TEdit
        Left = 525
        Top = 38
        Width = 53
        Height = 21
        TabOrder = 1
        OnExit = EdNumeroExit
      end
      object EdBairro: TEdit
        Left = 99
        Top = 61
        Width = 351
        Height = 21
        TabOrder = 2
      end
      object EdCidade: TEdit
        Left = 99
        Top = 108
        Width = 351
        Height = 21
        TabOrder = 3
      end
      object EdEstado: TEdit
        Left = 527
        Top = 108
        Width = 53
        Height = 21
        TabOrder = 4
      end
      object EdCep: TEdit
        Left = 222
        Top = 15
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object BtCep: TButton
        Left = 349
        Top = 15
        Width = 79
        Height = 21
        Caption = 'Localizar CEP'
        TabOrder = 6
        OnClick = BtCepClick
      end
      object EdPais: TEdit
        Left = 99
        Top = 132
        Width = 351
        Height = 21
        TabOrder = 7
      end
      object EdComplemento: TEdit
        Left = 99
        Top = 84
        Width = 351
        Height = 21
        TabOrder = 8
      end
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://viacep.com.br/ws/'
    Params = <>
    HandleRedirects = True
    Left = 40
    Top = 352
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Resource = '68903869/json/'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 128
    Top = 352
  end
  object RESTResponse1: TRESTResponse
    Left = 216
    Top = 352
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 408
    Top = 304
  end
end
