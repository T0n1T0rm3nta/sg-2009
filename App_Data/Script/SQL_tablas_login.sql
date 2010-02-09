USE [CTA_CTE_COMPRAS.MDF]
GO
/****** Object:  Table [dbo].[LOGIN_PERFILES]    Script Date: 02/09/2010 00:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGIN_PERFILES](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOGIN_PAGINAS]    Script Date: 02/09/2010 00:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGIN_PAGINAS](
	[id_pagina] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[url] [varchar](4000) NULL,
	[es_accion] [bit] NULL,
 CONSTRAINT [PK_Menues] PRIMARY KEY CLUSTERED 
(
	[id_pagina] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOGIN_PERFILES_PAGINAS]    Script Date: 02/09/2010 00:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGIN_PERFILES_PAGINAS](
	[id_perfil] [int] NOT NULL,
	[id_pagina] [int] NOT NULL,
 CONSTRAINT [PK_PerfilesMenues] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC,
	[id_pagina] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGIN_USUARIO]    Script Date: 02/09/2010 00:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGIN_USUARIO](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[clave] [varchar](20) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[borrado] [char](1) NOT NULL,
	[num_doc] [int] NULL,
	[id_tipo_doc] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_LOGIN_USUARIO_borrado]    Script Date: 02/09/2010 00:30:08 ******/
ALTER TABLE [dbo].[LOGIN_USUARIO] ADD  CONSTRAINT [DF_LOGIN_USUARIO_borrado]  DEFAULT ('n') FOR [borrado]
GO
/****** Object:  ForeignKey [FK_PerfilesMenues_Menues]    Script Date: 02/09/2010 00:30:08 ******/
ALTER TABLE [dbo].[LOGIN_PERFILES_PAGINAS]  WITH NOCHECK ADD  CONSTRAINT [FK_PerfilesMenues_Menues] FOREIGN KEY([id_pagina])
REFERENCES [dbo].[LOGIN_PAGINAS] ([id_pagina])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[LOGIN_PERFILES_PAGINAS] CHECK CONSTRAINT [FK_PerfilesMenues_Menues]
GO
/****** Object:  ForeignKey [FK_PerfilesMenues_Perfiles]    Script Date: 02/09/2010 00:30:08 ******/
ALTER TABLE [dbo].[LOGIN_PERFILES_PAGINAS]  WITH NOCHECK ADD  CONSTRAINT [FK_PerfilesMenues_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[LOGIN_PERFILES] ([id_perfil])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[LOGIN_PERFILES_PAGINAS] CHECK CONSTRAINT [FK_PerfilesMenues_Perfiles]
GO
/****** Object:  ForeignKey [FK_PCCC_PERSONA_1]    Script Date: 02/09/2010 00:30:08 ******/
ALTER TABLE [dbo].[LOGIN_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_PCCC_PERSONA_1] FOREIGN KEY([num_doc], [id_tipo_doc])
REFERENCES [dbo].[PCCC_PERSONA_1] ([num_doc], [id_tipo_doc])
GO
ALTER TABLE [dbo].[LOGIN_USUARIO] CHECK CONSTRAINT [FK_PCCC_PERSONA_1]
GO
/****** Object:  ForeignKey [FK_Usuarios_Perfiles]    Script Date: 02/09/2010 00:30:08 ******/
ALTER TABLE [dbo].[LOGIN_USUARIO]  WITH NOCHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[LOGIN_PERFILES] ([id_perfil])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[LOGIN_USUARIO] NOCHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
