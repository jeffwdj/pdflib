object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'pdf demo'
  ClientHeight = 213
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 213
    Align = alClient
    TabOrder = 0
    object btnCreatePdf: TButton
      Left = 232
      Top = 18
      Width = 105
      Height = 65
      Caption = #21019#24314'PDF'
      TabOrder = 0
      OnClick = btnCreatePdfClick
    end
    object btnNested_tables: TButton
      Left = 40
      Top = 101
      Width = 113
      Height = 65
      Caption = #23884#22871#34920#21152#36827#24230#26465
      TabOrder = 1
      OnClick = btnNested_tablesClick
    end
    object btnHello: TButton
      Left = 40
      Top = 22
      Width = 113
      Height = 58
      Caption = 'Hello'
      TabOrder = 2
      OnClick = btnHelloClick
    end
  end
end
