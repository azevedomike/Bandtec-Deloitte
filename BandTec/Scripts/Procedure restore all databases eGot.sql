use master 
go

create or alter procedure eGot_RestoreAllDatabases
-- declaração de variáveis
as begin

create table #bkp (out varchar (1000))

declare @arquivo varchar (1000),

@caminho varchar (1000),

@sql varchar (1000)

-- caminho do backup



-- recupera os arquivos

insert into #bkp

exec xp_cmdshell 'dir \\BRDCVMEGOTDB\Replicação\*.bak'

-- a linha com o nome do arquivo
declare @arquivo varchar (1000)
declare @caminho varchar (1000)
set @caminho = '\\BRDCVMEGOTDB\Replicação\'
select @arquivo = out from #bkp where out like '%got%'
PRINT (@arquivo)


-- retorna somente o nome do arquivo

select @arquivo = right (@arquivo, patindex ('% %', reverse (@arquivo)) -1)

print (@arquivo)

-- monta o caminho

select @caminho = @caminho + @arquivo
print (@caminho)

-- monta o restore da database com o caminho

select @sql = 'restore database '''+@arquivo+''' from disk = ''' + @caminho + ''''


-- faz o restore

exec (@sql)

drop table #bkp

end


-- verifica se o banco de dados é novo para fazer o restore
IF NOT EXISTS(SELECT NAME = @arquivo FROM SYS.DATABASES WHERE NAME = @arquivo)
BEGIN
select @sql = 'restore database '''+@arquivo+''' from disk = ''' + @caminho + ''',
move '''+@arquivo+''' to ''E:\Program Files\Microsoft SQL Server\MSSQL13.EGOT\MSSQL\DATA\''''''+@arquivo+'''.mdf,
move '''+@arquivo+'''_log to ''E:\Program Files\Microsoft SQL Server\MSSQL13.EGOT\MSSQL\DATA\''''''+@arquivo+'''.ldf'
END

select * from #bkp
order by out desc