select * from tblMailing

select * from tblEmail

select * from tblComunicado

ALTER TABLE [dbo].[tblMailing]  WITH CHECK ADD FOREIGN KEY([emlCodigo])
REFERENCES [dbo].[tblEmail] ([emlCodigo])
GO 

alter table tblMailing add emlCodigo int

create table tblLog(
logCodigo int primary key identity(1,1),
emlCodigo int foreign key references tblEmail(emlCodigo),
emlData datetime default GETDATE(),
comCodigo int foreign key references tblComunicado(comCodigo)
)

drop table tblLog

use dbSendMail

insert into tblLog (emlCodigo, comCodigo) values (1,1)


delete from tblLog where logCodigo = 2


select * from tblLog