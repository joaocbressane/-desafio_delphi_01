object DMGraos: TDMGraos
  OldCreateOrder = False
  Height = 280
  Width = 401
  object FDQInserir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'INSERT INTO '
      'graos (idgrao, descricao)'
      'VALUES (:idgrao, :descricao);')
    Left = 32
    Top = 32
    ParamData = <
      item
        Name = 'IDGRAO'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end>
  end
  object FDQAlterar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'UPDATE graos SET'
      'descricao = :descricao'
      'WHERE idgrao = :idgrao;')
    Left = 96
    Top = 32
    ParamData = <
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'IDGRAO'
        ParamType = ptInput
      end>
  end
  object FDQExcluir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'DELETE FROM graos'
      'WHERE idgrao = :idgrao;')
    Left = 160
    Top = 32
    ParamData = <
      item
        Name = 'IDGRAO'
        ParamType = ptInput
      end>
  end
  object FDQPesquisar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT * FROM graos;')
    Left = 232
    Top = 32
    object FDQPesquisarIDGRAO: TIntegerField
      FieldName = 'IDGRAO'
      Origin = 'IDGRAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQPesquisarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
  end
  object DSTPesquisar: TDataSetProvider
    DataSet = FDQPesquisar
    Left = 232
    Top = 88
  end
  object CDSPesquisar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSTPesquisar'
    Left = 232
    Top = 152
    object CDSPesquisarIDGRAO: TIntegerField
      FieldName = 'IDGRAO'
      Required = True
    end
    object CDSPesquisarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
end
