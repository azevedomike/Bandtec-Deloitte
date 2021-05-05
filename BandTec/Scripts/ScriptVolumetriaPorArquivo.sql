-- comando powershell

--ForEach-Object{ Get-ChildItem C:/Users/mikazevedo/Documents -Filter * -Recurse| Select-Object {$_.name,$_.length,$_.directory,$_.LastWriteTime}} | Out-File C:/Users/mikazevedo/Desktop/tamanhoarquivos3.csv

-- Para rodar o powershell direto do sql poderá ser de duas formas

-- 1º forma

/*

DECLARE @SQL VARCHAR(MAX)

SET @SQL = ' powershell -command "ForEach-Object{ Get-ChildItem CaminhoAondeVaiPuxarAsInfos-Filter * -Recurse| Select-Object {$_.name,$_.length,$_.directory,$_.LastWriteTime}} | Out-File CaminhoAondeVaiSalvarOArquivo/tamanhoarquivos3.csv"'

EXEC @SQL
*/

-- 2º forma

/*

ABRIR UM NOTEPAD OU BLOCO DE NOTAS;
COPIAR O SEGUINTE COMANDO: ForEach-Object{ Get-ChildItem CaminhoAondeVaiPuxarAsInfos-Filter * -Recurse| Select-Object {$_.name,$_.length,$_.directory,$_.LastWriteTime}} | Out-File CaminhoAondeVaiSalvarOArquivo/nomeArquivo.csv
SALVAR COM A EXTENSÃO .ps1, ou renomear com essa extensão no final após salvar o arquivo em .txt;
CRIAR UM JOB PARA RODAR EM POWERSHELL ESSE ARQUIVO.
*/

bulk insert nomeTabela from 'C:/Users/mikazevedo/Desktop/tamanhoarquivos3.csv' with (firstrow = 4, fieldterminator = ',')

select replace(cmd1,'{','') as nomeArquivo,substring (cmd1,charindex ('.',replace(cmd1,'{',' '),4),4)as [extensão],
replace(cmd1,'{','') as arquivo,cmd2 as tamanho,cmd3 as path, replace(cmd4,'}','') as ultimaModificao 
into archiveTest 
from result4

select sum(tamanho) as qtd, [extensão] from archiveTest
group by [extensão]
order by qtd desc


select nomeArquivo,CASE WHEN TAMANHO = 1 THEN CONCAT(tamanho, ' bit') WHEN TAMANHO > 1 THEN CONCAT(tamanho, ' bits') end AS tamanho,[path],ultimaModificao 
from archiveTest
