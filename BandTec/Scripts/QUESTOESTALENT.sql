ALTER PROCEDURE qlik_QuestoesTalentCovid

AS
BEGIN
DECLARE @qst VARCHAR (160)

SELECT qtdQuestao
INTO #tblQuestao
FROM tblQlikTalentData

WHILE EXISTS(SELECT TOP 1 1 FROM #tblQuestao)
BEGIN

SELECT @qst = qtdQuestao FROM #tblQuestao

IF NOT EXISTS (SELECT qstQuestao FROM tblQuestao WHERE qstQuestao = @qst)
BEGIN

INSERT INTO tblQuestao (proCodigo,qstQuestao) VALUES (1,@qst)

END

DELETE FROM #tblQuestao WHERE @qst = qtdQuestao
END



END
