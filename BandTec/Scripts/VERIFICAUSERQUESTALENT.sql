ALTER PROCEDURE qlik_UsuarioTalent

AS
BEGIN
DECLARE @name VARCHAR (100), @email VARCHAR(100)

SELECT DISTINCT(qtdEmail)AS qtdEmail,qtdUsuario 
INTO #tblUser
FROM tblQlikTalentData 
WHERE qtdEmail IS NOT NULL

WHILE EXISTS (SELECT TOP 1 1 FROM #tblUser)
BEGIN

SELECT @name = qtdUsuario FROM #tblUser
SELECT @email = qtdEmail FROM #tblUser

IF NOT EXISTS(SELECT usuemail FROM tblUsuario where usuemail = @email)
BEGIN

INSERT INTO tblUsuario (usuNome, usuemail) VALUES (@name,@email)

END

DELETE FROM #tblUser WHERE @email = qtdEmail
END

END