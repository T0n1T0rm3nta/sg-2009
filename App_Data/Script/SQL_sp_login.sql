USE [F:\UNI\S. G. 2009\SVN-SG20019\BRANCHES\PCSYS\APP_DATA\CTA_CTE_COMPRAS.MDF]
GO
/****** Object:  StoredProcedure [dbo].[sp_login_perfiles]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create Procedure [dbo].[sp_login_perfiles]
@idPerfil int  AS 
 Select * from [LOGIN_PERFILES]
 where (id_perfil=@idPerfil)
GO
/****** Object:  StoredProcedure [dbo].[sp_login_PerfilesPaginas_x_perfiles]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login_PerfilesPaginas_x_perfiles]
@Rol varchar(50)
 AS

SELECT     DISTINCT *
FROM         [LOGIN_PAGINAS] INNER JOIN
                      [LOGIN_PERFILES_PAGINAS] ON [LOGIN_PAGINAS].id_pagina= [LOGIN_PERFILES_PAGINAS].id_pagina INNER JOIN
                      [LOGIN_PERFILES] ON [LOGIN_PERFILES_PAGINAS].id_perfil = [LOGIN_PERFILES].id_perfil
Where  [LOGIN_PERFILES].Descripcion IN(@Rol)
GO
/****** Object:  StoredProcedure [dbo].[sp_login_PerfilesPaginas_x_idperfil]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login_PerfilesPaginas_x_idperfil]
@IdPerfil int
 AS

SELECT     *
FROM         [LOGIN_PAGINAS]  INNER JOIN
                      [LOGIN_PERFILES_PAGINAS] ON [LOGIN_PAGINAS].id_pagina = [LOGIN_PERFILES_PAGINAS].id_pagina
Where [LOGIN_PERFILES_PAGINAS].id_perfil = @IdPerfil
GO
/****** Object:  StoredProcedure [dbo].[sp_login_perfilespagina_x_perfiles]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_login_perfilespagina_x_perfiles]
	@opcion varchar(1),
	@id_perfil int,
	@descripcion varchar(50)
	
	AS
	BEGIN
			
		if(@opcion = '1')/*insertar*/
			begin
			
			SELECT     *
			FROM  [LOGIN_PAGINAS]INNER JOIN
				  [LOGIN_PERFILES_PAGINAS] ON [LOGIN_PAGINAS].id_pagina = [LOGIN_PERFILES_PAGINAS].id_pagina
			Where [LOGIN_PERFILES_PAGINAS].id_perfil = @id_perfil
			
			end
		 else if(@opcion = '2')/*editar*/
				begin
				SELECT DISTINCT *
				FROM [LOGIN_PAGINAS] INNER JOIN
					 [LOGIN_PERFILES_PAGINAS] ON [LOGIN_PAGINAS].id_pagina= [LOGIN_PERFILES_PAGINAS].id_pagina INNER JOIN
					 [LOGIN_PERFILES] ON [LOGIN_PERFILES_PAGINAS].id_perfil = [LOGIN_PERFILES].id_perfil
				Where  [LOGIN_PERFILES].Descripcion IN(@descripcion)
		end
		
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_login_usuarios_x_usuario]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login_usuarios_x_usuario]
	@opcion varchar(1),
	@id_usuario int,
	@usuario varchar(50),
	@Clave varchar(20)
 AS
BEGIN
			
	if(@opcion = '1')/*insertar*/
		begin

			SELECT     [LOGIN_PERFILES].id_perfil, [LOGIN_PERFILES].descripcion
			FROM         LOGIN_USUARIO INNER JOIN
								  [LOGIN_PERFILES] ON LOGIN_USUARIO.id_perfil = [LOGIN_PERFILES].id_perfil
			Where LOGIN_USUARIO.usuario = @usuario	
	
	end
	 else if(@opcion = '2')/*editar*/	
	    begin
	    
			 Select * from LOGIN_USUARIO
			 where (id_usuario=@id_usuario)

		end
		
		 else if(@opcion = '3')/*editar*/	
	    begin
	    
			 SELECT LOGIN_PERFILES.id_perfil, LOGIN_PERFILES.descripcion
 			 FROM     LOGIN_USUARIO INNER JOIN
					  LOGIN_PERFILES ON LOGIN_USUARIO.id_perfil = LOGIN_PERFILES.id_perfil
			 Where LOGIN_USUARIO.usuario = @Usuario
			 and LOGIN_USUARIO.clave = @Clave	
		end
		
	 end
GO
/****** Object:  StoredProcedure [dbo].[sp_login_usuarios_x_idusuario]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create Procedure [dbo].[sp_login_usuarios_x_idusuario]
@idUsuario int  AS 
 Select * from LOGIN_USUARIO
 where (id_usuario=@idUsuario)
GO
/****** Object:  StoredProcedure [dbo].[sp_login_perfil_ x_usuarios_clave]    Script Date: 02/09/2010 00:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	<Retor el perfil de un usuario, según (clave-usuario),>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login_perfil_ x_usuarios_clave]
@Usuario varchar(50),
@Clave varchar(7)
 AS


SELECT		LOGIN_PERFILES.id_perfil, LOGIN_PERFILES.descripcion
FROM         LOGIN_USUARIO INNER JOIN
                      LOGIN_PERFILES ON LOGIN_USUARIO.id_perfil = LOGIN_PERFILES.id_perfil
	Where LOGIN_USUARIO.usuario = @Usuario
	and LOGIN_USUARIO.clave = @Clave
GO
