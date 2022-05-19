object DMArmazenamento: TDMArmazenamento
  OldCreateOrder = False
  Height = 282
  Width = 613
  object FDQInserir: TFDQuery
    SQL.Strings = (
      'INSERT INTO armazenamento ('
      'idarmazenamento, idsilo, idtrade,'
      'idcontrato, quantidade'
      ')'
      'VALUES ('
      ':idarmazenamento, :idsilo, :idtrade,'
      ':idcontrato, :quantidade'
      ')')
    Left = 32
    Top = 40
    ParamData = <
      item
        Name = 'IDARMAZENAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'IDSILO'
        ParamType = ptInput
      end
      item
        Name = 'IDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'IDCONTRATO'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end>
  end
  object FDQAlterar: TFDQuery
    Left = 96
    Top = 40
  end
  object FDQExcluir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'DELETE FROM armazenamento'
      'WHERE idcontrato = :idcontrato')
    Left = 168
    Top = 40
    ParamData = <
      item
        Name = 'IDCONTRATO'
        ParamType = ptInput
      end>
  end
  object FDQSilos: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'select * from silos'
      'where idtrade = :idtrade;')
    Left = 456
    Top = 40
    ParamData = <
      item
        Name = 'IDTRADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQSilosIDSILO: TIntegerField
      FieldName = 'IDSILO'
      Origin = 'IDSILO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQSilosIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Origin = 'IDTRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQSilosCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
    end
  end
  object FDQtdArmazenada: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'select idtrade,idsilo, sum(quantidade) quantidade'
      'from armazenamento'
      'where idtrade = :idtrade group by idsilo, idtrade')
    Left = 352
    Top = 40
    ParamData = <
      item
        Name = 'IDTRADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQtdArmazenadaIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Origin = 'IDTRADE'
    end
    object FDQtdArmazenadaIDSILO: TIntegerField
      FieldName = 'IDSILO'
      Origin = 'IDSILO'
    end
    object FDQtdArmazenadaQUANTIDADE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object DSPQtdArmazenada: TDataSetProvider
    DataSet = FDQtdArmazenada
    Left = 344
    Top = 104
  end
  object CDSQtdArmazenada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPQtdArmazenada'
    Left = 344
    Top = 168
    object CDSQtdArmazenadaIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
    end
    object CDSQtdArmazenadaIDSILO: TIntegerField
      FieldName = 'IDSILO'
    end
    object CDSQtdArmazenadaQUANTIDADE: TLargeintField
      FieldName = 'QUANTIDADE'
      ReadOnly = True
    end
  end
  object DSPSilos: TDataSetProvider
    DataSet = FDQSilos
    Left = 456
    Top = 104
  end
  object CDSSilos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSilos'
    Left = 456
    Top = 168
    object CDSSilosIDSILO: TIntegerField
      FieldName = 'IDSILO'
      Required = True
    end
    object CDSSilosIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      Required = True
    end
    object CDSSilosCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
    end
  end
end
