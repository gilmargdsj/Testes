object MainDM: TMainDM
  OldCreateOrder = False
  Height = 359
  Width = 479
  object conn: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'WeBuy'
    Username = 'postgres'
    Server = '192.168.0.68'
    LoginPrompt = False
    Left = 128
    Top = 40
    EncryptedPassword = '9DFF96FF8BFF91FF9EFF92FF96FF'
  end
  object usuarios: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO usuarios.usuarios'
      '  (id_usuario, nome, nasc, email)'
      'VALUES'
      '  (:id_usuario, :nome, :nasc, :email)')
    SQLDelete.Strings = (
      'DELETE FROM usuarios.usuarios'
      'WHERE'
      '  email = :Old_email')
    SQLUpdate.Strings = (
      'UPDATE usuarios.usuarios'
      'SET'
      
        '  id_usuario = :id_usuario, nome = :nome, nasc = :nasc, email = ' +
        ':email'
      'WHERE'
      '  email = :Old_email')
    SQLLock.Strings = (
      'SELECT * FROM usuarios.usuarios'
      'WHERE'
      '  email = :Old_email'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id_usuario, nome, nasc, email FROM usuarios.usuarios'
      'WHERE'
      '  email = :email')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM usuarios.usuarios'
      ''
      ') t')
    Connection = conn
    SQL.Strings = (
      'SELECT * FROM USUARIOS.USUARIOS')
    Left = 128
    Top = 96
    object usuariosid_usuario: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_usuario'
    end
    object usuariosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 300
    end
    object usuariosnasc: TDateField
      FieldName = 'nasc'
      Required = True
    end
    object usuariosemail: TStringField
      FieldName = 'email'
      Size = 200
    end
  end
  object PostgreSQLUniProvider1: TPostgreSQLUniProvider
    Left = 256
    Top = 64
  end
end
