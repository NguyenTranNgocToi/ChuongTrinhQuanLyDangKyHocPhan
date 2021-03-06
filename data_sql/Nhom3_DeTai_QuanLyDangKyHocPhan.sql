USE [master]
GO
/****** Object:  Database [SQLQuanLyHocPhan]    Script Date: 6/1/2021 12:47:55 PM ******/
CREATE DATABASE [SQLQuanLyHocPhan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLQuanLyHocPhan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLQuanLyHocPhan.mdf' , SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SQLQuanLyHocPhan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLQuanLyHocPhan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLQuanLyHocPhan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET RECOVERY FULL 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET  MULTI_USER 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SQLQuanLyHocPhan', N'ON'
GO
USE [SQLQuanLyHocPhan]
GO
/****** Object:  Table [dbo].[ChuongTrinhKhung]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuongTrinhKhung](
	[MachuyenNganh] [varchar](10) NOT NULL,
	[MaMHP] [varchar](10) NOT NULL,
	[HocKy] [int] NULL,
 CONSTRAINT [ChuongTrinhKhung_pk] PRIMARY KEY CLUSTERED 
(
	[MachuyenNganh] ASC,
	[MaMHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuyenNganh](
	[MaChuyenNganh] [varchar](10) NOT NULL,
	[TenChuyenNganh] [nvarchar](50) NULL,
	[MaKhoa] [varchar](10) NULL,
 CONSTRAINT [PK_ChuyenNganh] PRIMARY KEY CLUSTERED 
(
	[MaChuyenNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [date] NULL,
	[SoDt] [varchar](10) NULL,
	[Makhoa] [varchar](10) NOT NULL,
 CONSTRAINT [PK_GiangVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[HocKy] [int] NOT NULL,
 CONSTRAINT [PK_HocKy] PRIMARY KEY CLUSTERED 
(
	[HocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LopBienChe]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LopBienChe](
	[MaLopBienChe] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
	[MaGV] [varchar](10) NOT NULL,
	[KhoaHoc] [int] NOT NULL,
	[SiSo] [int] NOT NULL,
 CONSTRAINT [PK_LopBienChe] PRIMARY KEY CLUSTERED 
(
	[MaLopBienChe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LopHocPhan]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LopHocPhan](
	[MaLopHP] [varchar](10) NOT NULL,
	[SiSo] [int] NULL,
	[MaMHP] [varchar](10) NULL,
	[Nam] [varchar](10) NULL,
	[HocKy] [int] NULL,
	[DaDangKy] [int] NULL,
 CONSTRAINT [PK_LopHocPhan] PRIMARY KEY CLUSTERED 
(
	[MaLopHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonHocPhan]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonHocPhan](
	[MaMHP] [varchar](10) NOT NULL,
	[TenMHHP] [nvarchar](50) NULL,
	[SoTinChi] [int] NULL,
	[HinhThucThi] [nvarchar](50) NULL,
	[BatBuoc] [nvarchar](50) NULL,
	[MaKhoa] [varchar](10) NULL,
	[HocPhanYeuCau] [varchar](10) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nam]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nam](
	[Nam] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Nam] PRIMARY KEY CLUSTERED 
(
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVienPhongDaoTao]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVienPhongDaoTao](
	[MaNV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDT] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[MaKhoa] [varchar](10) NULL,
 CONSTRAINT [PK_NhanVienPhongDaoTao] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nhom]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhom](
	[MaNhom] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Nhom] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuDangKyLHP]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuDangKyLHP](
	[MSSV] [varchar](10) NOT NULL,
	[MaLopHP] [varchar](10) NOT NULL,
	[Nhom] [nvarchar](20) NOT NULL,
 CONSTRAINT [PhieuDangKyLHP_pk] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC,
	[MaLopHP] ASC,
	[Nhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhongHoc]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhongHoc](
	[PhongHoc] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PhongHoc] PRIMARY KEY CLUSTERED 
(
	[PhongHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MSSV] [varchar](10) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[SoDT] [varchar](10) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien_Thuoc_Lop_Bien_Che]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien_Thuoc_Lop_Bien_Che](
	[MSSV] [varchar](10) NOT NULL,
	[MaLopBienChe] [varchar](10) NOT NULL,
 CONSTRAINT [PK_DS_SinhVien_Trong_Lop_Bien_Che] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien_Thuoc_Nganh]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien_Thuoc_Nganh](
	[MSSV] [varchar](10) NOT NULL,
	[MaChuyenNganh] [varchar](10) NOT NULL,
 CONSTRAINT [PK_DS_SinhVien_Theo_Nganh] PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoanNV]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoanNV](
	[MaTaiKhoan] [varchar](10) NOT NULL,
	[Pass] [nvarchar](16) NULL,
 CONSTRAINT [PK_TaiKhoanNV] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoanSV]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoanSV](
	[MaTaiKhoan] [varchar](10) NOT NULL,
	[Pass] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThoiGian_PhongHoc_GiangVien]    Script Date: 6/1/2021 12:47:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThoiGian_PhongHoc_GiangVien](
	[MaNhom] [nvarchar](20) NOT NULL,
	[MaLopHP] [varchar](10) NOT NULL,
	[TietHoc] [varchar](10) NULL,
	[NgayHoc] [nvarchar](10) NULL,
	[PhongHoc] [varchar](10) NULL,
	[MaGV] [varchar](10) NULL,
	[NgayBatDau] [date] NULL,
 CONSTRAINT [ThoiGian_PhongHoc_pk] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC,
	[MaLopHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP01', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP02', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP03', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP04', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP05', 3)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP06', 3)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP07', 4)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP08', 4)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP09', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP10', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP11', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'KTPM', N'MHP25', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP12', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP13', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP14', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP15', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP16', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP17', 1)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP19', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP20', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP21', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP22', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP23', 2)
INSERT [dbo].[ChuongTrinhKhung] ([MachuyenNganh], [MaMHP], [HocKy]) VALUES (N'NNA', N'MHP24', 2)
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CNCTM', N'Công nghệ chế tạo máy', N'CNCKH')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CNKTCDT', N'Công nghệ kỹ thuật cơ điện tử', N'CNCKH')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CNKTCK', N'Công nghệ kĩ thuật cơ khí', N'CNCKH')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'CNTT', N'Công nghệ thông tin', N'CNTT')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'HTTT', N'Hệ thống thông tin', N'CNTT')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'KHMT', N'Khoa học máy tính', N'CNTT')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'KTPM', N'Kỹ Thuật Phần Mềm', N'CNTT')
INSERT [dbo].[ChuyenNganh] ([MaChuyenNganh], [TenChuyenNganh], [MaKhoa]) VALUES (N'NNA', N'Ngôn ngữ anh', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV1', N'Nguyễn Văn A', N'20 Phan Huy, Gò Vấp , tpHCM', N'Nam', CAST(N'1950-09-06' AS Date), N'0988455154', N'CNTT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV10', N'Nguyễn Văn Hùng', N'Đồng Nai', N'Nam', CAST(N'1996-08-15' AS Date), N'0912345678', N'CNTT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV11', N'Nguyễn Đinh Hoàng Mỹ', N'Đồng Nai', N'Nam', CAST(N'1996-07-12' AS Date), N'0342759034', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV12', N'Cao Thành Danh', N'Đồng Nai', N'Nam', CAST(N'1996-09-13' AS Date), N'0978945612', N'CNCKH')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV13', N'Nguyễn Việt Tiến', N'Xã Tam Phú, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'Nam', CAST(N'1990-08-16' AS Date), N'0312345687', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV14', N'Phạm Anh Tuấn', N'Xã Tam Đông, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'Nam', CAST(N'1990-08-18' AS Date), N'0312345645', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV15', N'Đỗ Thị Thu Diệp', N'Xã Mỹ Hòa, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'Nữ', CAST(N'1991-08-18' AS Date), N'0312345665', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV16', N'Nguyễn Ngọc Bảo Duy', N'Xã Mỹ Hòa, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'Nam', CAST(N'1989-08-18' AS Date), N'0312345612', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV17', N'Đặng Trường An', N'Khối phố Mỹ Hòa, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'Nam', CAST(N'1989-08-18' AS Date), N'0312345632', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV18', N'Nguyễn Trần Ngọc Tới', N'Khối phố Mỹ Hòa, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'Nam', CAST(N'1985-08-18' AS Date), N'0312345614', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV19', N'Lê An Thịnh Phát', N'Tam Phú,Thành phố Tam Kỳ,Tỉnh Quảng Nam', N'Nam', CAST(N'1985-08-18' AS Date), N'0312345615', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV2', N'Nguyễn Văn B', N'13 Nguyễn Bảo, Gò Vấp, tpHCM', N'Nam', CAST(N'1950-09-10' AS Date), N'0988343124', N'CNTT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV20', N'Lê Thị Nguyên', N'Phường Hoà Khê, Quận Thanh Khê, Đà Nẵng', N'Nữ', CAST(N'1985-08-18' AS Date), N'0312345616', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV21', N'Bùi Thị Mỹ Duyên', N'Phường Hoà Khê, Quận Thanh Khê, Đà Nẵng', N'Nữ', CAST(N'1990-08-18' AS Date), N'0312345617', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV22', N'Trần Cao Tường', N'Phường Hoà Minh, Quận Liên Chiểu, Đà Nẵng', N'Nam', CAST(N'1990-08-18' AS Date), N'0312345618', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV23', N'Thái Huy Hoàng', N'Phường Hoà Thuận Đông, Quận Hải Châu, Đà Nẵng', N'Nam', CAST(N'1990-08-18' AS Date), N'0312345619', N'NN')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV3', N'Nguyễn Văn C', N'14 Nguyễn Bảo, Gò Vấp, tpHCM', N'Nam', CAST(N'1950-09-11' AS Date), N'0988343125', N'CT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV4', N'Nguyễn Văn D', N'15 Nguyễn Bảo, Gò Vấp, tpHCM ', N'Nam', CAST(N'1950-09-12' AS Date), N'0988343126', N'CT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV5', N'Nguyễn Thị A', N'16 Nguyễn Bảo, Gò Vấp, tpHCM', N'Nữ', CAST(N'1950-09-15' AS Date), N'0988343127', N'DT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV6', N'Nguyễn Thị B', N'17 Nguyễn Bảo, Gò Vấp, tpHCM', N'Nữ', CAST(N'1950-09-16' AS Date), N'0988343128', N'DT')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV7', N'Nguyễn Thị C', N'1 Phan Văn Trị, Gò Vấp, tbHCM', N'Nữ', CAST(N'1950-09-17' AS Date), N'0988343129', N'KHCB')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [DiaChi], [GioiTinh], [NgaySinh], [SoDt], [Makhoa]) VALUES (N'GV8', N'Nguyễn Thị D', N'2 Phan Văn Trị, Gò Vấp, tbHCM', N'Nữ', CAST(N'1950-09-18' AS Date), N'0988343110', N'NN')
INSERT [dbo].[HocKy] ([HocKy]) VALUES (1)
INSERT [dbo].[HocKy] ([HocKy]) VALUES (2)
INSERT [dbo].[HocKy] ([HocKy]) VALUES (3)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNCKH', N'Công nghệ cơ khí')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CND', N'Công nghệ điện')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNDL', N'Công nghệ động lực')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNHH', N'Công nghệ hóa học')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNMTTR', N'Công nghệ may thời trang')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNNHL', N'Công nghệ nhiệt lạnh')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CNTT', N'Công Nghệ Thông Tin')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'CT', N'Chính Trị')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'DT', N'Điện Tử')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KHCB', N'Khoa Học Cơ Bản')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KL', N'Luật')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KTKT', N'Kế toán kiểm toán')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'KTXD', N'Kỹ thuật xây dựng')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'NN', N'Ngoại Ngữ')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'QP', N'Quốc Phòng')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'QTKD', N'Quản trị kinh doanh')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'TCNN', N'Tài chính ngân hàng')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'TD', N'Thể Dục')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'TMDL', N'Thương mại du lịch')
INSERT [dbo].[LopBienChe] ([MaLopBienChe], [TenLop], [MaGV], [KhoaHoc], [SiSo]) VALUES (N'MLBC1', N'Lớp biên chế 1', N'GV3', 2016, 40)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP01', 60, N'MHP01', N'2020-2021', 1, 49)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP02', 60, N'MHP01', N'2020-2021', 1, 30)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP03', 60, N'MHP01', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP04', 60, N'MHP02', N'2020-2021', 1, 42)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP05', 60, N'MHP02', N'2020-2021', 1, 40)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP10', 70, N'MHP10', N'2020-2021', 1, 40)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP11', 70, N'MHP10', N'2020-2021', 1, 70)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP12', 70, N'MHP10', N'2020-2021', 1, 15)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP13', 70, N'MHP10', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP14', 70, N'MHP10', N'2020-2021', 1, 30)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP15', 70, N'MHP09', N'2020-2021', 1, 51)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP16', 70, N'MHP09', N'2020-2021', 1, 70)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP17', 70, N'MHP09', N'2020-2021', 1, 40)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP18', 70, N'MHP11', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP19', 70, N'MHP11', N'2020-2021', 1, 30)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP20', 70, N'MHP11', N'2020-2021', 1, 20)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP21', 70, N'MHP11', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP22', 70, N'MHP11', N'2020-2021', 1, 30)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP23', 70, N'MHP11', N'2020-2021', 1, 40)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP24', 70, N'MHP11', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP25', 70, N'MHP12', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP26', 70, N'MHP12', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP27', 70, N'MHP12', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP28', 70, N'MHP12', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP29', 70, N'MHP12', N'2020-2021', 1, 10)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP30', 70, N'MHP13', N'2020-2021', 1, 15)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP31', 70, N'MHP13', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP32', 70, N'MHP13', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP33', 70, N'MHP13', N'2020-2021', 1, 15)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP34', 70, N'MHP14', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP35', 70, N'MHP14', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP36', 70, N'MHP14', N'2020-2021', 1, 10)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP37', 70, N'MHP14', N'2020-2021', 1, 25)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP38', 70, N'MHP15', N'2020-2021', 1, 30)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP39', 70, N'MHP15', N'2020-2021', 1, 27)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP40', 70, N'MHP15', N'2020-2021', 1, 26)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP41', 70, N'MHP15', N'2020-2021', 1, 23)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP42', 70, N'MHP16', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP43', 70, N'MHP16', N'2020-2021', 1, 50)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP44', 70, N'MHP16', N'2020-2021', 1, 10)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP45', 70, N'MHP16', N'2020-2021', 1, 2)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP46', 70, N'MHP17', N'2020-2021', 1, 60)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP47', 70, N'MHP17', N'2020-2021', 1, 70)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP48', 70, N'MHP17', N'2020-2021', 1, 10)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP49', 70, N'MHP17', N'2020-2021', 1, 3)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP50', 50, N'MHP03', N'2020-2021', 2, 0)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP51', 60, N'MHP01', N'2020-2021', 1, 0)
INSERT [dbo].[LopHocPhan] ([MaLopHP], [SiSo], [MaMHP], [Nam], [HocKy], [DaDangKy]) VALUES (N'LHP52', 60, N'MHP01', N'2020-2021', 1, 0)
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP01', N'Toán Cao Cấp 1', 3, N'Lý Thuyết', N'Có', N'KHCB', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP02', N'Lập trình cơ bản', 2, N'Thực hành', N'Có', N'CNTT', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP03', N'Toán Cao Cấp 2', 3, N'Lý Thuyết', N'Có', N'KHCB', N'MHP01')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP04', N'Kỹ thuật lập trình', 2, N'Thực hành', N'Có', N'CNTT', N'MHP02')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP05', N'Hệ quản trị cơ sở dữ liệu', 3, N'Lý thuyết', N'Có', N'CNTT', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP06', N'Toán rời rạc', 3, N'Lý thuyết', N'Có', N'CNTT', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP07', N'Phân tích thiết kế hệ thống', 3, N'Lý thuyết', N'Có', N'CNTT', N'MHP05')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP08', N'Lập trình hướng đối tượng', 3, N'Thực hành', N'Có', N'CNTT', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP09', N'Nhập môn tin học', 3, N'Lý thuyết', N'Có', N'CNTT', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP10', N'Những nguyên lý của chủ nghĩa mác lênin', 3, N'Lý thuyết', N'Có', N'KHCB', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP11', N'Anh Văn 1', 2, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP12', N'Ngữ pháp', 2, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP13', N'Nghe 1', 3, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP14', N'Nói 1', 3, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP15', N'Đọc 1', 3, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP16', N'Viết 1', 3, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP17', N'Ngữ âm', 3, N'Lý thuyết', N'Có', N'NN', N'')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP18', N'Toán cao cấp 3', 2, N'Lý thuyết', N'Có', N'CNCKH', N'MHP03')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP19', N'Ngữ âm 2', 2, N'Lý thuyết', N'Có', N'NN', N'MHP17')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP20', N'Ngữ pháp 2', 2, N'Lý thuyết', N'Có', N'NN', N'MHP12')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP21', N'Nghe 2', 3, N'Lý thuyết', N'Có', N'NN', N'MHP13')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP22', N'Nói 2', 2, N'Lý thuyết', N'Có', N'NN', N'MHP14')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP23', N'Đọc 2', 2, N'Lý thuyết', N'Có', N'NN', N'MHP15')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP24', N'Viết 2', 3, N'Lý thuyết', N'Có', N'NN', N'MHP16')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP25', N'Anh Văn 2', 2, N'Lý thuyết', N'Có', N'NN', N'MHP11')
INSERT [dbo].[MonHocPhan] ([MaMHP], [TenMHHP], [SoTinChi], [HinhThucThi], [BatBuoc], [MaKhoa], [HocPhanYeuCau]) VALUES (N'MHP26', N'Nghe 3', 2, N'Lý thuyết', N'Có', N'NN', N'MHP21')
INSERT [dbo].[Nam] ([Nam]) VALUES (N'2020-2021')
INSERT [dbo].[Nam] ([Nam]) VALUES (N'2021-2022')
INSERT [dbo].[Nam] ([Nam]) VALUES (N'2022-2023')
INSERT [dbo].[Nam] ([Nam]) VALUES (N'2023-2024')
INSERT [dbo].[NhanVienPhongDaoTao] ([MaNV], [HoTen], [DiaChi], [SoDT], [NgaySinh], [GioiTinh], [MaKhoa]) VALUES (N'01', N'Văn B', N'1  Nguyên Thái Sơn, Gò Vấp, tpHCM', N'2334445642', CAST(N'1990-07-09' AS Date), N'Nam', NULL)
INSERT [dbo].[NhanVienPhongDaoTao] ([MaNV], [HoTen], [DiaChi], [SoDT], [NgaySinh], [GioiTinh], [MaKhoa]) VALUES (N'02', N'Văn A', N'57 Nguyên Thái Sơn, Gò Vấp, tpHCM', N'2334445641', CAST(N'1990-03-09' AS Date), N'Nam', NULL)
INSERT [dbo].[NhanVienPhongDaoTao] ([MaNV], [HoTen], [DiaChi], [SoDT], [NgaySinh], [GioiTinh], [MaKhoa]) VALUES (N'03', N'Văn C', N'2  Nguyên Thái Sơn, Gò Vấp, tpHCM', N'2334445644', CAST(N'1990-07-09' AS Date), N'Nam', NULL)
INSERT [dbo].[NhanVienPhongDaoTao] ([MaNV], [HoTen], [DiaChi], [SoDT], [NgaySinh], [GioiTinh], [MaKhoa]) VALUES (N'04', N'Văn D', N'3  Nguyên Thái Sơn, Gò Vấp, tpHCM', N'2334445645', CAST(N'1990-07-09' AS Date), N'Nữ', NULL)
INSERT [dbo].[NhanVienPhongDaoTao] ([MaNV], [HoTen], [DiaChi], [SoDT], [NgaySinh], [GioiTinh], [MaKhoa]) VALUES (N'05', N'Văn G', N'5  Nguyên Thái Sơn, Gò Vấp, tpHCM', N'2334445643', CAST(N'1990-07-09' AS Date), N'Nữ', NULL)
INSERT [dbo].[NhanVienPhongDaoTao] ([MaNV], [HoTen], [DiaChi], [SoDT], [NgaySinh], [GioiTinh], [MaKhoa]) VALUES (N'06', N'Văn UI', N'6  Nguyên Thái Sơn, Gò Vấp, tpHCM', N'2334445648', CAST(N'1990-07-09' AS Date), N'Nữ', NULL)
INSERT [dbo].[Nhom] ([MaNhom]) VALUES (N'Lý Thuyết')
INSERT [dbo].[Nhom] ([MaNhom]) VALUES (N'Thực Hành 1')
INSERT [dbo].[Nhom] ([MaNhom]) VALUES (N'Thực Hành 2')
INSERT [dbo].[PhieuDangKyLHP] ([MSSV], [MaLopHP], [Nhom]) VALUES (N'0001', N'LHP04', N'Lý Thuyết')
INSERT [dbo].[PhieuDangKyLHP] ([MSSV], [MaLopHP], [Nhom]) VALUES (N'0001', N'LHP04', N'Thực Hành 1')
INSERT [dbo].[PhieuDangKyLHP] ([MSSV], [MaLopHP], [Nhom]) VALUES (N'0001', N'LHP15', N'Lý Thuyết')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A0.1(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A0.2(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A0.3(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A0.4(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A1.1(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A1.2(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A1.3(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A1.4(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'A1.5(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'B0.1(TH)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'B0.2(TH)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'B0.3(TH)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'B0.4(TH)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C0.1(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C0.2(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C0.3(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C0.4(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C1.1(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C1.2(LT)')
INSERT [dbo].[PhongHoc] ([PhongHoc]) VALUES (N'C1.3(LT)')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0001', N'số 1 đường Quang Trung, Gò Vấp, tpHCM', N'Nam', N'Nguyễn Văn Trung', CAST(N'2000-02-03' AS Date), N'1234567890')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0002', N'số 2 đường Quang Trung, Gò Vấp, tpHCM', N'Nữ', N'Phạm Thị Lệ', CAST(N'2000-07-07' AS Date), N'1234556770')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0003', N'số 3 đường Quang Trung, Gò Vấp, tpHCM', N'Nam', N'Nguyễn Văn Tùng', CAST(N'2000-07-08' AS Date), N'1234556790')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0004', N'số 4 đường Quang Trung, Gò Vấp, tpHCM', N'Nam', N'Nguyễn Văn Hùng', CAST(N'2000-02-03' AS Date), N'2234556770')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0005', N'số 5 đường Quang Trung, Gò Vấp, tpHCM', N'Nam', N'Nguyễn Văn Toàn', CAST(N'2000-07-09' AS Date), N'1234556771')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0006', N'số 6 đường Quang Trung, Gò Vấp, tpHCM', N'Nam', N'Nguyễn Văn Pháp', CAST(N'2000-11-12' AS Date), N'1234556773')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0007', N'số 7 đường Quang Trung, Gò Vấp, tpHCM', N'Nữ', N'Phạm Thị Yến', CAST(N'2000-11-12' AS Date), N'1234556774')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0008', N'số 8 đường Quang Trung, Gò Vấp, tpHCM', N'Nữ', N'Phạm Thị Hương', CAST(N'2002-08-14' AS Date), N'1234556778')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0009', N'số 9 đường Quang Trung, Gò Vấp, tpHCM', N'Nữ', N'Phạm Thị Duyên', CAST(N'2000-12-13' AS Date), N'1234556779')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0010', N'Đồng Nai ', N'Nam', N'Cao Thành Danh', CAST(N'2000-07-15' AS Date), N'0312345678')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0011', N'42/3D Ấp Tây Nam, Xã Gia Kiệm, Huyện Thống Nhất,Tỉnh Đồng Nai', N'Nam', N'Nguyễn Đinh Hoàng Mỹ', CAST(N'2000-07-09' AS Date), N'0342759034')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0012', N'42/3D Ấp Tây Nam, Xã Gia Kiệm, Huyện Thống Nhất,Tỉnh Đồng Nai', N'Nam', N'Nguyễn Huy Hảo', CAST(N'2000-07-09' AS Date), N'0312345678')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0013', N'Đồng Nai', N'Nam', N'Nguyễn Việt Tiến', CAST(N'2000-02-03' AS Date), N'0312345679')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0014', N'Đồng Nai', N'Nam', N'Đinh Ngọc Thảo Vy', CAST(N'2000-02-03' AS Date), N'0312365498')
INSERT [dbo].[SinhVien] ([MSSV], [DiaChi], [GioiTinh], [HoTen], [NgaySinh], [SoDT]) VALUES (N'0015', N'Ha Tinh', N'Nam', N'Nguyễn Văn Bảo', CAST(N'2000-02-03' AS Date), N'0911099009')
INSERT [dbo].[SinhVien_Thuoc_Lop_Bien_Che] ([MSSV], [MaLopBienChe]) VALUES (N'0001', N'MLBC1')
INSERT [dbo].[SinhVien_Thuoc_Lop_Bien_Che] ([MSSV], [MaLopBienChe]) VALUES (N'0002', N'MLBC1')
INSERT [dbo].[SinhVien_Thuoc_Lop_Bien_Che] ([MSSV], [MaLopBienChe]) VALUES (N'0003', N'MLBC1')
INSERT [dbo].[SinhVien_Thuoc_Lop_Bien_Che] ([MSSV], [MaLopBienChe]) VALUES (N'0004', N'MLBC1')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0001', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0002', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0003', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0004', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0005', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0006', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0007', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0008', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0009', N'KTPM')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0010', N'NNA')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0011', N'NNA')
INSERT [dbo].[SinhVien_Thuoc_Nganh] ([MSSV], [MaChuyenNganh]) VALUES (N'0015', N'NNA')
INSERT [dbo].[TaiKhoanNV] ([MaTaiKhoan], [Pass]) VALUES (N'01', N'123')
INSERT [dbo].[TaiKhoanNV] ([MaTaiKhoan], [Pass]) VALUES (N'02', N'123')
INSERT [dbo].[TaiKhoanNV] ([MaTaiKhoan], [Pass]) VALUES (N'03', N'123')
INSERT [dbo].[TaiKhoanNV] ([MaTaiKhoan], [Pass]) VALUES (N'04', N'123')
INSERT [dbo].[TaiKhoanNV] ([MaTaiKhoan], [Pass]) VALUES (N'05', N'123')
INSERT [dbo].[TaiKhoanNV] ([MaTaiKhoan], [Pass]) VALUES (N'06', N'123')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0001', N'123')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0002', N'2')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0003', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0004', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0005', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0006', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0007', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0008', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0009', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0010', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0011', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0012', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0013', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0014', N'1')
INSERT [dbo].[TaiKhoanSV] ([MaTaiKhoan], [Pass]) VALUES (N'0015', N'1')
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP01', N'01-03', N'Thứ 2', N'A0.1(LT)', N'GV1', CAST(N'2020-07-06' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP02', N'01-03', N'Thứ 3', N'A0.1(LT)', N'GV2', CAST(N'2020-07-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP03', N'01-03', N'Thứ 4', N'A0.1(LT)', N'GV2', CAST(N'2020-07-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP04', N'04-06', N'Thứ 4', N'A0.4(LT)', N'GV7', CAST(N'2020-07-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP05', N'07-09', N'Thứ 2', N'A0.4(LT)', N'GV8', CAST(N'2020-07-05' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP10', N'01-03', N'Thứ 2', N'A0.2(LT)', N'GV3', CAST(N'2020-07-06' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP11', N'01-03', N'Thứ 3', N'A0.2(LT)', N'GV3', CAST(N'2020-07-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP12', N'01-03', N'Thứ 4', N'A0.2(LT)', N'GV4', CAST(N'2020-07-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP13', N'01-03', N'Thứ 5', N'A0.2(LT)', N'GV4', CAST(N'2020-07-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP14', N'01-03', N'Thứ 6', N'A0.2(LT)', N'GV3', CAST(N'2020-07-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP15', N'04-06', N'Thứ 2', N'A0.3(LT)', N'GV5', CAST(N'2020-07-06' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP16', N'04-06', N'Thứ 3', N'A0.3(LT)', N'GV5', CAST(N'2020-07-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP17', N'04-06', N'Thứ 4', N'A0.3(LT)', N'GV6', CAST(N'2020-07-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP18', N'07-09', N'Thứ 2', N'A0.1(LT)', N'GV11', CAST(N'2020-07-06' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP19', N'04-06', N'Thứ 3', N'A1.1(LT)', N'GV13', CAST(N'2020-07-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP20', N'04-06', N'Thứ 4', N'A0.1(LT)', N'GV11', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP21', N'04-06', N'Thứ 5', N'A0.1(LT)', N'GV13', CAST(N'2020-12-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP22', N'01-03', N'Thứ 6', N'A1.1(LT)', N'GV11', CAST(N'2020-12-11' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP23', N'07-09', N'Thứ 6', N'A1.1(LT)', N'GV11', CAST(N'2020-12-11' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP24', N'01-03', N'Thứ 5', N'A1.1(LT)', N'GV13', CAST(N'2020-12-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP25', N'01-03', N'Thứ 2', N'C1.1(LT)', N'GV14', CAST(N'2020-12-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP26', N'04-06', N'Thứ 2', N'C1.1(LT)', N'GV14', CAST(N'2020-12-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP27', N'07-09', N'Thứ 2', N'C1.1(LT)', N'GV14', CAST(N'2020-12-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP28', N'01-03', N'Thứ 2', N'C1.2(LT)', N'GV15', CAST(N'2020-12-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP29', N'04-06', N'Thứ 3', N'C1.1(LT)', N'GV15', CAST(N'2020-12-07' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP30', N'01-03', N'Thứ 4', N'C0.3(LT)', N'GV16', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP31', N'04-06', N'Thứ 4', N'C0.3(LT)', N'GV16', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP32', N'01-03', N'Thứ 5', N'C0.3(LT)', N'GV17', CAST(N'2020-12-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP33', N'04-06', N'Thứ 5', N'C0.3(LT)', N'GV17', CAST(N'2020-12-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP34', N'01-03', N'Thứ 4', N'A1.4(LT)', N'GV18', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP35', N'10-12', N'Thứ 4', N'A1.4(LT)', N'GV18', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP36', N'01-03', N'Thứ 3', N'A1.4(LT)', N'GV19', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP37', N'07-09', N'Thứ 3', N'A1.4(LT)', N'GV19', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP38', N'07-09', N'Thứ 6', N'A1.2(LT)', N'GV20', CAST(N'2020-12-11' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP39', N'10-12', N'Thứ 6', N'A1.2(LT)', N'GV20', CAST(N'2020-12-11' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP40', N'10-12', N'Thứ 5', N'A1.3(LT)', N'GV21', CAST(N'2020-12-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP41', N'13-15', N'Thứ 5', N'A1.3(LT)', N'GV21', CAST(N'2020-12-10' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP42', N'10-12', N'Thứ 3', N'C1.3(LT)', N'GV22', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP43', N'13-15', N'Thứ 3', N'C1.3(LT)', N'GV22', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP44', N'04-06', N'Thứ 4', N'C1.3(LT)', N'GV23', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP45', N'01-03', N'Thứ 4', N'C1.3(LT)', N'GV23', CAST(N'2020-12-09' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP46', N'01-03', N'Chủ nhật', N'C1.3(LT)', N'GV11', CAST(N'2020-12-13' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP47', N'04-06', N'Chủ nhật', N'C1.3(LT)', N'GV11', CAST(N'2020-12-13' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP48', N'07-09', N'Thứ 7', N'A0.4(LT)', N'GV13', CAST(N'2020-12-12' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP49', N'01-03', N'Thứ 7', N'A0.4(LT)', N'GV13', CAST(N'2020-12-12' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP50', N'01-03', N'Thứ 2', N'A0.1(LT)', N'GV1', CAST(N'2021-01-04' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Lý Thuyết', N'LHP51', N'07-09', N'Thứ 2', N'B0.2(TH)', N'GV10', CAST(N'2020-11-18' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Thực Hành 1', N'LHP04', N'07-09', N'Thứ 6', N'B0.1(TH)', N'GV7', CAST(N'2020-07-31' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Thực Hành 1', N'LHP05', N'07-09', N'Thứ 5', N'B0.2(TH)', N'GV8', CAST(N'2020-07-30' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Thực Hành 2', N'LHP04', N'10-12', N'Thứ 6', N'B0.1(TH)', N'GV7', CAST(N'2020-07-31' AS Date))
INSERT [dbo].[ThoiGian_PhongHoc_GiangVien] ([MaNhom], [MaLopHP], [TietHoc], [NgayHoc], [PhongHoc], [MaGV], [NgayBatDau]) VALUES (N'Thực Hành 2', N'LHP05', N'10-12', N'Thứ 5', N'B0.2(TH)', N'GV8', CAST(N'2020-07-30' AS Date))
ALTER TABLE [dbo].[ChuongTrinhKhung]  WITH CHECK ADD  CONSTRAINT [FK_ChuongTrinhKhung_ChuyenNganh1] FOREIGN KEY([MachuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([MaChuyenNganh])
GO
ALTER TABLE [dbo].[ChuongTrinhKhung] CHECK CONSTRAINT [FK_ChuongTrinhKhung_ChuyenNganh1]
GO
ALTER TABLE [dbo].[ChuongTrinhKhung]  WITH CHECK ADD  CONSTRAINT [FK_ChuongTrinhKhung_MonHoc] FOREIGN KEY([MaMHP])
REFERENCES [dbo].[MonHocPhan] ([MaMHP])
GO
ALTER TABLE [dbo].[ChuongTrinhKhung] CHECK CONSTRAINT [FK_ChuongTrinhKhung_MonHoc]
GO
ALTER TABLE [dbo].[ChuyenNganh]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenNganh_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[ChuyenNganh] CHECK CONSTRAINT [FK_ChuyenNganh_Khoa]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVien_Khoa] FOREIGN KEY([Makhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [FK_GiangVien_Khoa]
GO
ALTER TABLE [dbo].[LopBienChe]  WITH CHECK ADD  CONSTRAINT [FK_LopBienChe_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[LopBienChe] CHECK CONSTRAINT [FK_LopBienChe_GiangVien]
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD  CONSTRAINT [FK_LopHocPhan_HocKy] FOREIGN KEY([HocKy])
REFERENCES [dbo].[HocKy] ([HocKy])
GO
ALTER TABLE [dbo].[LopHocPhan] CHECK CONSTRAINT [FK_LopHocPhan_HocKy]
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD  CONSTRAINT [FK_LopHocPhan_MonHoc] FOREIGN KEY([MaMHP])
REFERENCES [dbo].[MonHocPhan] ([MaMHP])
GO
ALTER TABLE [dbo].[LopHocPhan] CHECK CONSTRAINT [FK_LopHocPhan_MonHoc]
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD  CONSTRAINT [FK_LopHocPhan_Nam] FOREIGN KEY([Nam])
REFERENCES [dbo].[Nam] ([Nam])
GO
ALTER TABLE [dbo].[LopHocPhan] CHECK CONSTRAINT [FK_LopHocPhan_Nam]
GO
ALTER TABLE [dbo].[MonHocPhan]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[MonHocPhan] CHECK CONSTRAINT [FK_MonHoc_Khoa]
GO
ALTER TABLE [dbo].[NhanVienPhongDaoTao]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienPhongDaoTao_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[NhanVienPhongDaoTao] CHECK CONSTRAINT [FK_NhanVienPhongDaoTao_Khoa]
GO
ALTER TABLE [dbo].[PhieuDangKyLHP]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDangKyLHP_LopHocPhan] FOREIGN KEY([MaLopHP])
REFERENCES [dbo].[LopHocPhan] ([MaLopHP])
GO
ALTER TABLE [dbo].[PhieuDangKyLHP] CHECK CONSTRAINT [FK_PhieuDangKyLHP_LopHocPhan]
GO
ALTER TABLE [dbo].[PhieuDangKyLHP]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDangKyLHP_Nhom] FOREIGN KEY([Nhom])
REFERENCES [dbo].[Nhom] ([MaNhom])
GO
ALTER TABLE [dbo].[PhieuDangKyLHP] CHECK CONSTRAINT [FK_PhieuDangKyLHP_Nhom]
GO
ALTER TABLE [dbo].[PhieuDangKyLHP]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDangKyLHP_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[PhieuDangKyLHP] CHECK CONSTRAINT [FK_PhieuDangKyLHP_SinhVien]
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Lop_Bien_Che]  WITH CHECK ADD  CONSTRAINT [FK_DS_SinhVien_Trong_Lop_Bien_Che_LopBienChe1] FOREIGN KEY([MaLopBienChe])
REFERENCES [dbo].[LopBienChe] ([MaLopBienChe])
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Lop_Bien_Che] CHECK CONSTRAINT [FK_DS_SinhVien_Trong_Lop_Bien_Che_LopBienChe1]
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Lop_Bien_Che]  WITH CHECK ADD  CONSTRAINT [FK_DS_SinhVien_Trong_Lop_Bien_Che_SinhVien] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Lop_Bien_Che] CHECK CONSTRAINT [FK_DS_SinhVien_Trong_Lop_Bien_Che_SinhVien]
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Nganh]  WITH CHECK ADD  CONSTRAINT [FK_DS_SinhVien_Theo_Nganh_ChuyenNganh] FOREIGN KEY([MaChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([MaChuyenNganh])
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Nganh] CHECK CONSTRAINT [FK_DS_SinhVien_Theo_Nganh_ChuyenNganh]
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Nganh]  WITH CHECK ADD  CONSTRAINT [FK_DS_SinhVien_Theo_Nganh_SinhVien1] FOREIGN KEY([MSSV])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[SinhVien_Thuoc_Nganh] CHECK CONSTRAINT [FK_DS_SinhVien_Theo_Nganh_SinhVien1]
GO
ALTER TABLE [dbo].[TaiKhoanNV]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanNV_NhanVienPhongDaoTao] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[NhanVienPhongDaoTao] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoanNV] CHECK CONSTRAINT [FK_TaiKhoanNV_NhanVienPhongDaoTao]
GO
ALTER TABLE [dbo].[TaiKhoanSV]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_SinhVien] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[SinhVien] ([MSSV])
GO
ALTER TABLE [dbo].[TaiKhoanSV] CHECK CONSTRAINT [FK_TaiKhoan_SinhVien]
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_ThoiGian_PhongHoc_GiangVien_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien] CHECK CONSTRAINT [FK_ThoiGian_PhongHoc_GiangVien_GiangVien]
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_ThoiGian_PhongHoc_LopHocPhan] FOREIGN KEY([MaLopHP])
REFERENCES [dbo].[LopHocPhan] ([MaLopHP])
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien] CHECK CONSTRAINT [FK_ThoiGian_PhongHoc_LopHocPhan]
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_ThoiGian_PhongHoc_Nhom] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[Nhom] ([MaNhom])
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien] CHECK CONSTRAINT [FK_ThoiGian_PhongHoc_Nhom]
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_ThoiGian_PhongHoc_PhongHoc] FOREIGN KEY([PhongHoc])
REFERENCES [dbo].[PhongHoc] ([PhongHoc])
GO
ALTER TABLE [dbo].[ThoiGian_PhongHoc_GiangVien] CHECK CONSTRAINT [FK_ThoiGian_PhongHoc_PhongHoc]
GO
USE [master]
GO
ALTER DATABASE [SQLQuanLyHocPhan] SET  READ_WRITE 
GO
