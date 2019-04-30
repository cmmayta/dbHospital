create database dbHospital
go

use dbHospital
go


create schema PACIENTE
go
create schema MEDICO
go
create schema HOSPITAL
go



create table PACIENTE
(
	CODPAC INT NOT NULL IDENTITY(1, 1),
	NOMPAC VARCHAR(120) NOT NULL,
	APEPATPAC VARCHAR(120) NOT NULL,
	APEMATPAC VARCHAR(120) NOT NULL
	FECNACPAC DATE NOT NULL,
	SEXPAC CHAR(1) NOT NULL,
	DNIPAC CHAR(8) NOT NULL,
	TELEFPAC VARCHAR(9),
	EMAILPAC VARCHAR(100),
	DOMPAC VARCHAR(120) NOT NULL,
	UBIGEOPAC CHAR(6) NOT NULL,
	FECRGPAC DATETIME ,
	OBSERVPAC VARCHAR(250)
	CONSTRAINT PK_CODPAC
	PRIMARY KEY (CODPAC)
);
GO



SELECT*FROM PACIENTE
GO

CREATE TABLE HISTORIA_PACIENTE
(
	CODHIST INT NOT NULL IDENTITY(1,1),
	FECHIS DATETIME NOT NULL,
	OBSHIS VARCHAR(1800) NOT NULL,
	CONSTRAINT PK_CODHIST
	PRIMARY KEY (CODHIST)
)
GO


CREATE TABLE TURNO
(
	CODTUR INT NOT NULL IDENTITY(1,1),
	FECTUR DATETIME,
	ESTTUR SMALLINT,
	OBSTUR VARCHAR(500),
	CONSTRAINT PK_CODTUR
	PRIMARY KEY (CODTUR)
  )
GO

CREATE TABLE PACIENTE.TURNO_PACIENTE
(
	CODTUR INT NOT NULL
	CODPAC INT NOT NULL,
	CODMED INT NOT NULL,
	CONSTRAINT PK_CODTUR
	PRIMARY KEY(CODTUR,CODPAC,CODMED)
)
GO


CREATE TABLE UBIGEO
(
	CODUB CHAR(6) NOT NULL,
	DISTUB VARCHAR(60),
	PROVUB VARCHAR(60),
	PAISUB VARCHAR(60),
	CONSTRAINT PK_CODUB
	PRIMARY KEY (CODUB)
)
GO

CREATE TABLE ESPECIALIDAD
(
	CODESP INT NOT NULL
	NOMESP VARCHAR(80) NOT NULL,
	OBSESP VARCHAR(100),
	CONSTRAINT PK_CODESP
	PRIMARY KEY (CODESP)
)
GO


CREATE TABLE MEDICO
(
	CODMED INT NOT NULL,
	NOMMED VARCHAR(120) NOT NULL,
	APEPATMED VARCHAR(120) NOT NULL,
	APEMATPER VARCHAR(120) NOT NULL,
	FECNACMED DATE NOT NULL,
	SEXMED CHAR(1) NOT NULL,
	DNIMED CHAR(8) NOT NULL,
	TELEFMED VARCHAR(9),
	EMAILMED VARCHAR(120),
	DOMMED VARCHAR(120) NOT NULL,
	UBIGEOMED CHAR(6) NOT NULL,
	FECREGMED DATETIME,
	OBSERVMED VARCHAR(180),
	CONSTRAINT PK_CODMED
	PRIMARY KEY (CODMED)
)
GO

 
CREATE TABLE MEDICO_ESPECIALIDAD
(
	CODMED INT NOT NULL,
	CODESP INT NOT NULL,
	DESCESP VARCHAR(1000),
	CONSTRAINT PK_CODMED
	PRIMARY KEY (CODMED,CODESP)
)
GO
















INSERT INTO HISTORIA
(CODHIST, FECHIST, OBSHIST)
VALUES
('1','2000-03-01','El paciente se atendio sin problemas'),
('2','2002-04-05','El pacient tiene que llevar controles permanentes'),
('3','2007-10-04','El paciente debe ytomar los medicamentos indicados en la consulta'),
('4','2010-12-10','El paciente debe der transferido a lima')
GO



INSERT INTO TURNO
(CODTUR,FECTUR,ESTTUR,OBSTUR)
VALUES
('1','1979-11-07 10:30:20.000','1','Primer turno del dia'),
('2','1979-11-07 11:00:20:000','1','Segundo turno del dia'),
('3','1979-11-07 11:30:20:000','1','Tercer turno del dia'),
('4','1979-11-07 11:00:20:000','1','Cuarto turno del dia'),
('5','1979-11-07 11:00:20:000','1','Quinto turno del dia'),
('6','1979-11-07 11:30:20:000','1','Sexto turno del dia')
GO



INSERT INTO MEDICO
(CODMED, NOMMED,APEPATMED,APEMATPER,FECNACMED,SEXMED,DNIMED,TELEFMED,EMAILMED,DOMMED,UBIGEOMED,FECREGMED,OBSERVMED)
VALUES
('1','Esperanza','Ramirez','Tadeo','1979-07-11','F','47586914','','Esperanza@yahoo.com','Av. Los Laureles','150512','2019-04-30 07:09:07.713','Medico procedente de ola ciudad de lima'),
('2','Alberto','Ramirez','Pasache','1976-06-06','M','58261435','','alberto@gmail.com','jrn. Los Laureles','150508','2019-04-30 07:09:07.713','Medico muy trabajador'),
('3','Gloria','Martinez','Osorio','1980-10-05','F','58531469','','rosa@outlook.com','Av. Los Laureles','150510','2019-04-30 07:09:07.713','Medico muy responsable'),
('4','Rosa','Ceballos','Pachas','1974-12-25','F','67482598','','gloria@hotmail.com','jrn. Los Laureles','150514','2019-04-30 07:09:07.713','Medico local. Muy proactivo'),
GO




INSERT INTO ESPECIALIDAD
(CODESP,NOMESP,OBSESP)
VALUES
('1','Medicina general','Es para atencion de enfermedades en general'),
('2','Odontologia','Atencion dental'),
('3','Pediatria','Atencion para niños'),
('4','Oftalmologia','Atencion vista'),
('5','Nutricion','Relacionado con temas de alimentacion')
GO


INSERT INTO MEDICO_ESPECIALIDAD
(CODMED,CODESP,DESCESP)
VALUES
('1','2','Atiende todo el dia'),
('1','2','Atiende todo el dia')
('2','2','Atiende todo el dia')
('2','2','Atiende todo el dia')
('3','2','Atiende todo el dia')
GO