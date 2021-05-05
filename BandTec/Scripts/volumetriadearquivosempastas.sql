declare @sql VARCHAR(1000)

set @sql = 'powershell -command "Get-ChildItem C:/Users/mikazevedo/Documents -Filter * -Recurse| Select-Object {$_.name,$_.length,$_directory,$_.LastWriteTime}"'

insert into result
exec xp_cmdshell @SQL

delete from result

select * from result3


select CHARINDEX('%.%',cmd1) as resultado from result
where resultado >0

select * from result3
where cmd1 like '%script.sql'

select PATINDEX('%.%',CMD1) as resultado FROM result

select SUBSTRING('.txt',1,10) AS RESULTADO FROM result


select	--caminhoupload, 
		--substring (caminhoupload,1,charindex ('.',caminhoupload,4)-1 ), 
		cmd1 AS arquivo,
		substring (cmd1, 
	charindex ('.',cmd1,4), 4) as extensão,
		--substring (cmd1, charindex (', ',cmd1,4), 15) as coluna2,
		--substring(cmd1,charindex(replace(replace(replace (cmd1,', ',' '),'{',''),'}',''),4),30),

		replace(replace(replace (cmd1,', ',' '),'{',''),'}','') AS ultimaModificao

--into #tblArquivos2
from result

select replace(cmd1,'{','') as nomeArquivo,substring (cmd1,charindex ('.',replace(cmd1,'{',' '),4),4)as [extensão],replace(cmd1,'{','') as arquivo,cmd2 as tamanho,cmd3 as path, replace(cmd4,'}','') as ultimaModificao into archiveTest from result4

drop table archiveTest

select sum(tamanho) as qtd, [extensão] from archiveTest
group by [extensão]
order by qtd desc

select * from result4

select nomeArquivo,CASE WHEN TAMANHO = 1 THEN CONCAT(tamanho, ' bit') WHEN TAMANHO > 1 THEN CONCAT(tamanho, ' bits') end AS tamanho,[path],ultimaModificao from archiveTest

select * from teste 
where tamanho like '%C:\Users\mikazevedo\Documents%'

delete from archiveTest where path like '%null%'
alter table archiveTest alter column tamanho bigINT

drop table teste
select * from #tblTemp3
group by [extensão]
bulk insert result4 from 'C:/Users/mikazevedo/Desktop/tamanhoarquivos3.csv' with (firstrow = 4, fieldterminator = ',')

SELECT * FROM RESULT4
	delete from result2

create table result4(
cmd1 VARCHAR(MAX),
cmd2 VARCHAR(MAX),
cmd3 VARCHAR(MAX),
cmd4 VARCHAR(MAX)
)	

group by coluna

select sum(cmd1) from #tblArquivos
group by coluna

select * from #tblArquivos



exec xp_cmdshell 'powershell -command "Get-ChildItem C:/Users/mikazevedo/Documents -Filter * -Recurse| %{$_.length,$_.name}"'