object DMSilos: TDMSilos
  OldCreateOrder = False
  Height = 300
  Width = 560
  object FDQInserir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'INSERT INTO silos (idsilo, idtrade, capacidade)'
      'VALUES (:pidsilo, :pidtrade, :pcapacidade);')
    Left = 32
    Top = 24
    ParamData = <
      item
        Name = 'PIDSILO'
        ParamType = ptInput
      end
      item
        Name = 'PIDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'PCAPACIDADE'
        ParamType = ptInput
      end>
  end
  object FDQAlterar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'UPDATE silos SET'
      'capacidade = :pcapacidade'
      'WHERE idtrade = :pidtrade AND idsilo = :pidsilo;')
    Left = 96
    Top = 24
    ParamData = <
      item
        Name = 'PCAPACIDADE'
        ParamType = ptInput
      end
      item
        Name = 'PIDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'PIDSILO'
        ParamType = ptInput
      end>
  end
  object FDQExcluir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'DELETE FROM silos'
      'WHERE idtrade =:pidtrade AND idsilo = :pidsilo')
    Left = 160
    Top = 24
    ParamData = <
      item
        Name = 'PIDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'PIDSILO'
        ParamType = ptInput
      end>
  end
  object FDQPesquisar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'select * from silos')
    Left = 232
    Top = 24
    object FDQPesquisarIDSILO: TIntegerField
      FieldName = 'IDSILO'
      Origin = 'IDSILO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQPesquisarIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Origin = 'IDTRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQPesquisarCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
    end
  end
  object DSPPesquisar: TDataSetProvider
    DataSet = FDQPesquisar
    Left = 232
    Top = 80
  end
  object CDSPesquisar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPesquisar'
    Left = 232
    Top = 136
    object CDSPesquisarIDSILO: TIntegerField
      FieldName = 'IDSILO'
      Required = True
    end
    object CDSPesquisarIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Required = True
    end
    object CDSPesquisarCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
      DisplayFormat = '#,###0.00'
    end
  end
end
