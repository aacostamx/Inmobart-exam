--USE master
--GO

--CREATE DATABASE Examenes;
--GO

USE Examenes
GO

IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE NAME = 'EMPLEADO')
BEGIN
	DROP TABLE dbo.Empleado;
END
GO

CREATE TABLE dbo.Empleado(
          EmpleadoID int IDENTITY(1,1) PRIMARY KEY,
          Nombre nvarchar(50) NOT NULL,
          Titulo nvarchar(50) NOT NULL,
          FechaNacimiento nvarchar(50) NOT NULL,
          FechaContratacion datetime NOT NULL DEFAULT GETDATE())

GO

SELECT * FROM dbo.Empleado

spInsertaEmpleado 'Antonio Acosta Murillo' , 'Desarrollador Sistemas' , '05/01/1988'