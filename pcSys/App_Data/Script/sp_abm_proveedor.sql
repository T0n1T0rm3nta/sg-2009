set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

/* Procedimiento para alta, baja y modificaciones de la tabla proveedor
   Se utiliza la variable @opcion para identificar el tipo de procedimiento
   1 = insertar
   2 = modificar
*/


CREATE procedure [dbo].[sp_abm_proveedor](@opcion varchar(1),	--not null
										@id_proveedor int,
										@num_doc int, --not null
										@tipo_doc varchar(20),
										@nombre varchar(50),--not null
										@apellido varchar(50) = '-',--valores default
										@direccion varchar(50) = '-',
										@email varchar(50)= '-',
										@nacionalidad	varchar(20))
			as 
			-- INICIO --
			BEGIN
			
			  BEGIN TRY
				BEGIN TRANSACTION  
					if(@opcion = '1')/*insertar*/
						begin
								
								 insert into PCCC_PROVEEDORES (	num_doc, --not null
																tipo_doc,
																nombre,--not null
																apellido,--valores default
																direccion,
																email,
																nacionalidad,
																estado)
														values( @num_doc, --not null
																@tipo_doc,
																@nombre,--not null
																@apellido,--valores default
																@direccion,
																@email,
																@nacionalidad,
																'ACTIVO')
										
						           
						end
						else if(@opcion = '2')/*editar*/
							begin
							
							update PCCC_PROVEEDORES
								set num_doc = @num_doc, --not null
									tipo_doc = @tipo_doc,
									nombre = @nombre,--not null
									apellido = @apellido,--valores default
									direccion = @direccion,
									email = @email,
									nacionalidad = @nacionalidad
							  where id_proveedor = @id_proveedor
							end
							else if(@opcion = '3')/*borrar*/
							begin
							update PCCC_PROVEEDORES
								set estado = 'BORRAdO'
							  where id_proveedor = @id_proveedor
							end

				COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
					ROLLBACK TRANSACTION -- O solo ROLLBACK
					PRINT 'Se ha producido un error!'
		END CATCH


end

