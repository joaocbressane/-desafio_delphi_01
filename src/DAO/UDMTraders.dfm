object DMTraders: TDMTraders
  OldCreateOrder = False
  Height = 292
  Width = 601
  object FDQInserir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'INSERT INTO traders (idtrade, nome)'
      'VALUES (:idtrade, :nome);')
    Left = 16
    Top = 24
    ParamData = <
      item
        Name = 'IDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  object FDQAlterar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'UPDATE traders SET'
      'nome = :nome'
      'WHERE idtrade = :idtrade;')
    Left = 80
    Top = 24
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'IDTRADE'
        ParamType = ptInput
      end>
  end
  object FDQExcluir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'DELETE FROM traders'
      'where idtrade = :idtrade')
    Left = 144
    Top = 24
    ParamData = <
      item
        Name = 'IDTRADE'
        ParamType = ptInput
      end>
  end
  object FDQPesquisar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT * FROM traders')
    Left = 216
    Top = 24
    object FDQPesquisarIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Origin = 'IDTRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object DSPPesquisar: TDataSetProvider
    DataSet = FDQPesquisar
    Left = 216
    Top = 80
  end
  object CDSPesquisar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPesquisar'
    Left = 216
    Top = 144
    object CDSPesquisarIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Required = True
    end
    object CDSPesquisarNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
end
