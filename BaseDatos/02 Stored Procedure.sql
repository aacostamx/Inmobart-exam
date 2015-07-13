USE Examenes
GO

IF OBJECT_ID('[dbo].[spInsertaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spInsertaEmpleado]
GO

CREATE PROCEDURE [dbo].[spInsertaEmpleado](@Nombre nvarchar(50), @Titulo CHAR(50), @FechaNacimiento nvarchar(50))
AS

DECLARE @msgError VARCHAR(100);

SET NOCOUNT ON

	INSERT INTO dbo.Empleado
	VALUES (@Nombre,@Titulo,@FechaNacimiento,GETDATE())
	IF @@ERROR<>0
	BEGIN
		SET @msgError = 'Erro al insertar en la tabla Empleado';
		GOTO Error;
	END


SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO

IF OBJECT_ID('[dbo].[spConsultaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spConsultaEmpleado]
GO

CREATE PROCEDURE [dbo].[spConsultaEmpleado](@Empleado INT = 0)
AS

DECLARE @msgError VARCHAR(100);

SET NOCOUNT ON


		IF(@Empleado = 0)
		BEGIN
			SELECT EmpleadoID, Nombre, Titulo, FechaNacimiento FROM dbo.Empleado
		END
		ELSE
		BEGIN
			SELECT EmpleadoID, Nombre, Titulo, FechaNacimiento 
			FROM dbo.Empleado WHERE EmpleadoID = @Empleado
			IF @@ERROR<>0
			BEGIN
				SET @msgError = 'Erro al consutar en la tabla Empleado';
				GOTO Error;
			END
		END
SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO


IF OBJECT_ID('[dbo].[spActualizaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spActualizaEmpleado]
GO

CREATE PROCEDURE [dbo].[spActualizaEmpleado](@EmpleadoID int, @Nombre nvarchar(50), @Titulo CHAR(50), @FechaNacimiento nvarchar(50))
AS

DECLARE @msgError VARCHAR(100);
SET NOCOUNT ON

	IF(@EmpleadoID <> 0 AND @Nombre<>'' AND @Titulo<>'')
	BEGIN
		UPDATE Empleado
		SET Nombre=@Nombre, Titulo=@Titulo, FechaNacimiento=@FechaNacimiento
		WHERE EmpleadoID = @EmpleadoID
		IF @@ERROR<>0
		BEGIN
			SET @msgError = 'Erro al actualizar al empleado en la tabla Empleado';
			GOTO Error;
		END
	END

SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO

IF OBJECT_ID('[dbo].[spEliminaEmpleado]','P') IS NOT NULL
DROP PROCEDURE [dbo].[spEliminaEmpleado]
GO

CREATE PROCEDURE [dbo].[spEliminaEmpleado](@Empleado INT)
AS

DECLARE @msgError VARCHAR(100);

SET NOCOUNT ON

	DELETE FROM dbo.Empleado WHERE EmpleadoID=@Empleado
	IF @@ERROR<>0
	BEGIN
		SET @msgError = 'Erro al eliminar en la tabla Empleado';
		GOTO Error;
	END

SET NOCOUNT OFF
RETURN 0

Error:    
   SET NOCOUNT OFF    
   RAISERROR(@msgError,18,1);    
   RETURN -1     

GO