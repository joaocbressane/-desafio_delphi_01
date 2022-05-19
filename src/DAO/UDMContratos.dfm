object DMContratos: TDMContratos
  OldCreateOrder = False
  Height = 283
  Width = 444
  object FDQInserir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'INSERT INTO contratos ('
      'idcontrato, idprodutor, idgrao,'
      'idtrade, quantidade)'
      'VALUES ('
      ':pidcontrato, :pidprodutor, :pidgrao,'
      ':pidtrade, :pquantidade'
      ');')
    Left = 16
    Top = 24
    ParamData = <
      item
        Name = 'PIDCONTRATO'
        ParamType = ptInput
      end
      item
        Name = 'PIDPRODUTOR'
        ParamType = ptInput
      end
      item
        Name = 'PIDGRAO'
        ParamType = ptInput
      end
      item
        Name = 'PIDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'PQUANTIDADE'
        ParamType = ptInput
      end>
  end
  object FDQAlterar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'UPDATE contratos SET'
      'idprodutor = :idprodutor,'
      'idgrao = :idgrao,'
      'idtrade = :idtrade,'
      'quantidade = :quantidade'
      'WHERE idcontrato = :idcontrato;')
    Left = 80
    Top = 24
    ParamData = <
      item
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end
      item
        Name = 'IDGRAO'
        ParamType = ptInput
      end
      item
        Name = 'IDTRADE'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        Name = 'IDCONTRATO'
        ParamType = ptInput
      end>
  end
  object FDQExcluir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'DELETE FROM contratos WHERE idcontrato = :idcontrato;')
    Left = 152
    Top = 24
    ParamData = <
      item
        Name = 'IDCONTRATO'
        ParamType = ptInput
      end>
  end
  object FDQPesquisar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT c.idcontrato,'
      ' p.idprodutor, p.nome,'
      ' g.idgrao, g.descricao as grao,'
      ' t.idtrade,t.nome nometrade, c.quantidade'
      ' FROM contratos c'
      'INNER JOIN produtores p on p.idprodutor = c.idprodutor'
      'INNER JOIN graos g on g.idgrao = c.idgrao'
      'INNER JOIN traders t on t.idtrade = c.idtrade')
    Left = 232
    Top = 24
    object FDQPesquisarIDCONTRATO: TIntegerField
      FieldName = 'IDCONTRATO'
      Origin = 'IDCONTRATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQPesquisarIDPRODUTOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDPRODUTOR'
      Origin = 'IDPRODUTOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQPesquisarNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQPesquisarIDGRAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDGRAO'
      Origin = 'IDGRAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQPesquisarGRAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object FDQPesquisarIDTRADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDTRADE'
      Origin = 'IDTRADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQPesquisarQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDQPesquisarNOMETRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMETRADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object DSPPesquisar: TDataSetProvider
    DataSet = FDQPesquisar
    Left = 232
    Top = 88
  end
  object CDSPesquisar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPesquisar'
    Left = 232
    Top = 144
    object CDSPesquisarIDCONTRATO: TIntegerField
      FieldName = 'IDCONTRATO'
      Required = True
    end
    object CDSPesquisarIDPRODUTOR: TIntegerField
      FieldName = 'IDPRODUTOR'
      ReadOnly = True
    end
    object CDSPesquisarNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 100
    end
    object CDSPesquisarIDGRAO: TIntegerField
      FieldName = 'IDGRAO'
      ReadOnly = True
    end
    object CDSPesquisarGRAO: TStringField
      FieldName = 'GRAO'
      ReadOnly = True
      Size = 60
    end
    object CDSPesquisarIDTRADE: TIntegerField
      FieldName = 'IDTRADE'
      ReadOnly = True
    end
    object CDSPesquisarQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object CDSPesquisarNOMETRADE: TStringField
      FieldName = 'NOMETRADE'
      ReadOnly = True
      Size = 100
    end
  end
end
