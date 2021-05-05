ALTER procedure dbGot_RotinaProc

AS

BEGIN


declare
       @cmd varchar(max),
       @dbname varchar(20),
       @cmd2 VARCHAR(MAX)



	   SET @dbname = 'dbGOT_MESTRE'
	   

	    

  --     SELECT @cmd = modz.definition
  --      FROM DATABASE_EVENTS.sys.sql_modules modz 
		--WHERE object_id  = 1362103893

       
        

  --     SELECT @cmd4 = 'USE ' + @dbname  

  --      EXEC(@cmd4)

		--EXEC(@cmd)
	          
			  
		/*	  SELECT @cmd3 = modz.definition
			  FROM DATABASE_EVENTS.sys.sql_modules modz 
			WHERE object_id  = 1346103836
			
	   SELECT @cmd3
	   */

	  -- SET @cmd = '
	  -- USE '+@dbname+'
	  -- GO

	  --     CREATE PROCEDURE eGot_CreateLogin       
		 --   AS    
			--BEGIN        
			--DECLARE @CHAVE nvarchar(30)            
			--SET @chave = ''I4eJDOhXfoCB4OPPvo0z''               
			--SELECT coxUsuario = CONVERT(VARCHAR,DecryptByAsymKey(AsymKey_ID(''eGotAsync''),coxUsuario,@chave)),         
			--coxNomeBase            
			--into #tblConexao       
			--FROM dbGot_Mestre.dbo.tblConexao A   
			--INNER JOIN sys.databases b   
			--on a.coxNomeBase = b.name collate SQL_Latin1_General_CP850_CI_AI                
			
			--SELECT A.COXUSUARIO,a.coxNomeBase       
			--INTO #tblLogins       
			--FROM  #tblconexao A        
			--LEFT JOIN MASTER..sysLOGINS B        
			--ON A.coxUsuario = B.[NAME] COLLATE SQL_Latin1_General_CP850_CI_AI       
			--WHERE B.[NAME] IS NULL                  
			
			--DECLARE @LOGIN VARCHAR(MAX), @CMD1 VARCHAR(MAX), @SENHALOGIN VARCHAR(MAX), @BASE VARCHAR(MAX)           
			
			--WHILE EXISTS (SELECT TOP 1 coxUsuario FROM #tblLogins)      
			--BEGIN     
			
			--SELECT TOP 1 @LOGIN = coxUsuario, @BASE = coxNomeBase FROM #tblLogins          
			--SET @CMD1= ''      
			--use master      
			--CREATE LOGIN [''+@LOGIN+''] WITH PASSWORD = ''''+@LOGIN+''@1234'''' ,DEFAULT_DATABASE = ''+@BASE+'', DEFAULT_LANGUAGE=us_english, CHECK_POLICY = OFF      
			
			--USE [''+@BASE+'']      
			--EXEC sp_change_users_login ''Auto_Fix'' , ''+@LOGIN+''
			--''      
			--EXEC (@CMD1)            
			
			--DELETE FROM #tbllogins where coxusuario= @login AND coxNomeBase = @BASE            
			
			--END              
			
			
			--drop table #tblConexao      
			--drop table #tblLogins         
			
			--END
			--'

			--EXEC(@cmd)


		SET @cmd2 ='
		USE '+@dbname+'
		
      
CREATE PROCEDURE eGot_RotinaUsuario_Nova  
  
AS  
BEGIN  
   
  
  
DECLARE @CHAVE nvarchar(30)  
  
    SET @chave = ''I4eJDOhXfoCB4OPPvo0z''  
      
   SELECT coxUsuario = CONVERT(VARCHAR,DecryptByAsymKey(AsymKey_ID(''eGotAsync''),coxUsuario,@chave)),  
     coxNomeBase       
   into #tblConexao  
   FROM dbGot_Mestre.dbo.tblConexao    A
     	INNER JOIN sys.databases b
	on a.coxNomeBase = b.name collate SQL_Latin1_General_CP850_CI_AI
  
     
  
     
  
     
   DECLARE @USER VARCHAR(MAX), @CMD VARCHAR(MAX),  @BASE VARCHAR(MAX)     
 WHILE EXISTS (SELECT TOP 1 coxUsuario FROM #tblConexao)  
  BEGIN  
  SELECT TOP 1 @USER = coxUsuario, @BASE = coxNomeBase FROM #tblConexao  
  
  SET @CMD = ''  
  USE [''+@BASE+'']  
  EXEC sp_change_users_login ''Auto_Fix'', ''+@USER+''
  ''
  EXEC (@CMD)  
    
  DELETE FROM #tblConexao where coxUsuario= @USER AND coxNomeBase = @BASE    
  end  
  
    
  drop table #tblConexao  
  
  END'

	   EXEC(@cmd2)




	END


	