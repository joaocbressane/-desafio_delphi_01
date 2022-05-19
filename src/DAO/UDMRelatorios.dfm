object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  Height = 349
  Width = 555
  object FDQRelatorio: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      
        'SELECT  p.nome produtor, t.nome trade, g.descricao as grao, c.qu' +
        'antidade'
      'FROM contratos c'
      'INNER JOIN produtores p on p.idprodutor = c.idprodutor'
      'INNER JOIN graos g on g.idgrao = c.idgrao'
      'INNER JOIN traders t on t.idtrade = c.idtrade'
      'ORDER BY c.idcontrato;')
    Left = 64
    Top = 40
    object FDQRelatorioPRODUTOR: TStringField
      FieldName = 'PRODUTOR'
      Origin = 'PRODUTOR'
      Size = 100
    end
    object FDQRelatorioTRADE: TStringField
      FieldName = 'TRADE'
      Origin = 'TRADE'
      Size = 100
    end
    object FDQRelatorioGRAO: TStringField
      FieldName = 'GRAO'
      Origin = 'GRAO'
      Size = 60
    end
    object FDQRelatorioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
  end
  object DSPRelatorio: TDataSetProvider
    DataSet = FDQRelatorio
    Left = 64
    Top = 96
  end
  object CDSRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRelatorio'
    Left = 64
    Top = 152
    object CDSRelatorioPRODUTOR: TStringField
      FieldName = 'PRODUTOR'
      Size = 100
    end
    object CDSRelatorioTRADE: TStringField
      FieldName = 'TRADE'
      Size = 100
    end
    object CDSRelatorioGRAO: TStringField
      FieldName = 'GRAO'
      Size = 60
    end
    object CDSRelatorioQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,###0.00'
    end
  end
end
