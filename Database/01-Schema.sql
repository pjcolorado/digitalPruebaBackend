/****** Object:  Table [dbo].[TblClientes]    Script Date: 28/03/2022 8:48:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblClientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](5) NOT NULL,
	[NumeroDocumento] [varchar](30) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_TblClientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblFacturaProductos]    Script Date: 28/03/2022 8:48:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblFacturaProductos](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdFactura] [bigint] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[ValorUnitario] [money] NOT NULL,
	[ValorTotal] [money] NOT NULL,
 CONSTRAINT [PK_TblFacturaProductos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblFacturas]    Script Date: 28/03/2022 8:48:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblFacturas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[TotalVenta] [money] NOT NULL,
 CONSTRAINT [PK_TblFacturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProductos]    Script Date: 28/03/2022 8:48:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProductos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](20) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[ExistenciaActual] [int] NOT NULL,
 CONSTRAINT [PK_TblProductos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblFacturaProductos]  WITH CHECK ADD  CONSTRAINT [FK_TblFacturaProductos_TblFacturas] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[TblFacturas] ([Id])
GO
ALTER TABLE [dbo].[TblFacturaProductos] CHECK CONSTRAINT [FK_TblFacturaProductos_TblFacturas]
GO
ALTER TABLE [dbo].[TblFacturaProductos]  WITH CHECK ADD  CONSTRAINT [FK_TblFacturaProductos_TblProductos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[TblProductos] ([Id])
GO
ALTER TABLE [dbo].[TblFacturaProductos] CHECK CONSTRAINT [FK_TblFacturaProductos_TblProductos]
GO
ALTER TABLE [dbo].[TblFacturas]  WITH CHECK ADD  CONSTRAINT [FK_TblFacturas_TblClientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[TblClientes] ([Id])
GO
ALTER TABLE [dbo].[TblFacturas] CHECK CONSTRAINT [FK_TblFacturas_TblClientes]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de documento del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'TipoDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de documento del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'NumeroDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de nacimiento del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'FechaNacimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefono del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblClientes', @level2type=N'COLUMN',@level2name=N'Telefono'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturaProductos', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la factura a la cual pertenecen los productos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturaProductos', @level2type=N'COLUMN',@level2name=N'IdFactura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturaProductos', @level2type=N'COLUMN',@level2name=N'IdProducto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de producto vendido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturaProductos', @level2type=N'COLUMN',@level2name=N'Cantidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor unitario del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturaProductos', @level2type=N'COLUMN',@level2name=N'ValorUnitario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor total del producto (Cantidad x PrecioUnitario)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturaProductos', @level2type=N'COLUMN',@level2name=N'ValorTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturas', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de generacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturas', @level2type=N'COLUMN',@level2name=N'Fecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturas', @level2type=N'COLUMN',@level2name=N'IdCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor total de la venta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblFacturas', @level2type=N'COLUMN',@level2name=N'TotalVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblProductos', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblProductos', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblProductos', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del producto (1=activo, 0=inactivo)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblProductos', @level2type=N'COLUMN',@level2name=N'Estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio de venta del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblProductos', @level2type=N'COLUMN',@level2name=N'PrecioVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Existencia del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblProductos', @level2type=N'COLUMN',@level2name=N'ExistenciaActual'
GO
