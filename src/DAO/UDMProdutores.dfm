object DMProdutores: TDMProdutores
  OldCreateOrder = False
  Height = 393
  Width = 589
  object FDQInserir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'INSERT INTO '
      'produtores (idprodutor, nome, cnpj)'
      'VALUES (:idprodutor, :nome, :cnpj);')
    Left = 24
    Top = 32
    ParamData = <
      item
        Name = 'IDPRODUTOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CNPJ'
        ParamType = ptInput
      end>
  end
  object FDQAlterar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'UPDATE produtores SET'
      'nome = :nome,'
      'cnpj = :cnpj'
      'WHERE idprodutor = :idprodutor;')
    Left = 96
    Top = 32
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end
      item
        Name = 'CNPJ'
        ParamType = ptInput
      end
      item
        Name = 'IDPRODUTOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQExcluir: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'DELETE FROM produtores'
      'WHERE idprodutor = :idprodutor;')
    Left = 176
    Top = 32
    ParamData = <
      item
        Name = 'IDPRODUTOR'
        ParamType = ptInput
      end>
  end
  object FDQPesquisar: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'select idprodutor, nome'
      'from produtores'
      'where nome like :pnome;')
    Left = 248
    Top = 32
    ParamData = <
      item
        Name = 'PNOME'
        ParamType = ptInput
      end>
  end
  object DSPPesquisar: TDataSetProvider
    DataSet = FDQPesquisar
    Left = 248
    Top = 96
  end
  object CDSPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'DSPPesquisar'
    Left = 248
    Top = 168
    object CDSPesquisarIDPRODUTOR: TIntegerField
      FieldName = 'IDPRODUTOR'
      Origin = 'IDPRODUTOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
end
