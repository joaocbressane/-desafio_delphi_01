object DMConexao: TDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 390
  Width = 513
  object FDConexao: TFDConnection
    Params.Strings = (
      'ConnectionDef=ConexaoMVC')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
end
