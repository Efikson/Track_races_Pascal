object Form1: TForm1
  Left = 459
  Top = 180
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Track races'
  ClientHeight = 550
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 750
    Height = 550
    Align = alClient
  end
  object Label3: TLabel
    Left = 344
    Top = 200
    Width = 65
    Height = 119
    Caption = '3'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -107
    Font.Name = 'Britannic Bold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 750
    Top = 0
    Width = 134
    Height = 550
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 16
      Width = 134
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = 'Red'
      Font.Charset = BALTIC_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 0
      Top = 152
      Width = 134
      Height = 29
      Alignment = taCenter
      AutoSize = False
      Caption = 'Blue'
      Font.Charset = BALTIC_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 48
      Top = 464
      Width = 37
      Height = 75
      Caption = '5'
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 0
      Top = 48
      Width = 134
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Player 1'
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 0
      Top = 184
      Width = 134
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Player 2'
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 448
      Width = 104
      Height = 20
      Caption = 'Time to bonus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 22
      Top = 392
      Width = 75
      Height = 23
      Caption = 'Race to '
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 56
      Top = 72
      Width = 25
      Height = 21
      AutoSelect = False
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object Edit2: TEdit
      Left = 56
      Top = 208
      Width = 25
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object Button1: TButton
      Left = 16
      Top = 296
      Width = 105
      Height = 33
      Caption = 'New round'
      Default = True
      Enabled = False
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 344
      Width = 105
      Height = 25
      Caption = 'Back to menu'
      Enabled = False
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object CheckBox1: TCheckBox
      Left = 40
      Top = 96
      Width = 65
      Height = 17
      Caption = 'jump'
      Enabled = False
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object CheckBox2: TCheckBox
      Left = 40
      Top = 232
      Width = 65
      Height = 17
      Caption = 'jump'
      Enabled = False
      Font.Charset = BALTIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Button3: TButton
    Left = 320
    Top = 248
    Width = 25
    Height = 25
    Caption = 'X'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 40
    Top = 8
  end
end
