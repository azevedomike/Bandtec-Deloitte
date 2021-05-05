USE [database_events]
GO

/****** Object:  Table [dbo].[tblLogAcessosBases]    Script Date: 15/10/2020 10:24:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblLogAcessosBases](
	[idAcesso] [int] IDENTITY(1,1) NOT NULL,
	[base] [varchar](255) NULL,
	[ultimaModificacao] [datetime] NULL,
	[startSQL] [datetime] NULL,
	[dataLog] [datetime] NULL,
	[sizeMDF(MB)] [int] NULL,
	[sizeLDF(MB)] [int] NULL,
	[somaMDFeLDF(MB)] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAcesso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


