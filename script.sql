USE [master]
GO
/****** Object:  Database [DB49]    Script Date: 5/4/2019 2:18:21 AM ******/
CREATE DATABASE [DB49]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB49', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB49.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB49_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB49_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB49] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB49].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB49] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB49] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB49] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB49] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB49] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB49] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB49] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB49] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB49] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB49] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB49] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB49] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB49] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB49] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB49] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB49] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB49] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB49] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB49] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB49] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB49] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB49] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB49] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB49] SET  MULTI_USER 
GO
ALTER DATABASE [DB49] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB49] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB49] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB49] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB49] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB49]
GO
/****** Object:  Table [dbo].[ClassAttendance]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassAttendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Semester] [nvarchar](50) NOT NULL,
	[StudentID] [int] NULL,
	[DepartmentID] [int] NULL,
	[SessionID] [int] NULL,
	[CourseId] [int] NOT NULL,
	[statusid] [int] NOT NULL,
 CONSTRAINT [PK_ClassAttendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[CreditHours] [int] NOT NULL,
	[Semester] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NULL,
	[CNIC] [nvarchar](50) NOT NULL,
	[Designation] [varchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[EmailID] [nvarchar](50) NOT NULL,
	[MonthlySalary] [int] NOT NULL,
	[DOB] [datetime] NOT NULL,
	[LoginID] [int] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[ExamDate] [datetime] NOT NULL,
	[SessionID] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenditure]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenditure](
	[FeeID] [int] NOT NULL,
	[SalaryID] [int] NOT NULL,
	[ExpenditureID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fe]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fe](
	[FeeID] [int] IDENTITY(1,1) NOT NULL,
	[ScholarshipID] [int] NULL,
	[StudentID] [int] NOT NULL,
	[LookupID] [int] NOT NULL,
	[NewFee] [float] NOT NULL,
 CONSTRAINT [PK_Fe] PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fees]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[FeeId] [int] IDENTITY(1,1) NOT NULL,
	[Fees] [int] NOT NULL,
	[Semester] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Fees] PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredCourses](
	[RegisteredCourseID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Semester] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
 CONSTRAINT [PK_RegisteredCourses] PRIMARY KEY CLUSTERED 
(
	[RegisteredCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
	[CreditHours] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[RegisteredCourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[EmployeeID] [int] NOT NULL,
	[Salary] [int] NOT NULL,
	[Month] [datetime] NOT NULL,
	[SalaryID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SalaryID] PRIMARY KEY CLUSTERED 
(
	[SalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scholar]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scholar](
	[ScholarshipID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[ScholarID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Scholar] PRIMARY KEY CLUSTERED 
(
	[ScholarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scholarshipss]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scholarshipss](
	[ScholarshipID] [int] IDENTITY(1,1) NOT NULL,
	[Scholarship] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Scholarshipss] PRIMARY KEY CLUSTERED 
(
	[ScholarshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[DepartmentID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[EmployeeID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sectionss]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sectionss](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sectionss] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[Session] [nvarchar](50) NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[RegistrationNumber] [nvarchar](50) NOT NULL,
	[CNIC] [nvarchar](50) NULL,
	[DepartmentID] [int] NOT NULL,
	[SessionId] [int] NOT NULL,
	[DOB] [datetime] NOT NULL,
	[LoginID] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[SectionID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[AttendanceID] [int] NOT NULL,
	[StudentID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[StudentID] [int] NOT NULL,
	[ResultID] [int] NOT NULL,
	[GPA] [float] NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 5/4/2019 2:18:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[CoursesID] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[SectionID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ClassAttendance] ON 

INSERT [dbo].[ClassAttendance] ([AttendanceID], [SectionID], [Date], [Semester], [StudentID], [DepartmentID], [SessionID], [CourseId], [statusid]) VALUES (6, 1, CAST(N'2019-05-04 12:43:08.833' AS DateTime), N'8', 3, NULL, NULL, 9, 2)
SET IDENTITY_INSERT [dbo].[ClassAttendance] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (1, N'Web Technology', 10, 2, 3, N'3')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (2, N'Software Engineering', 5, 2, 3, N'4')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (3, N'PRV', 1, 1, 3, N'2')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (4, N'DBMS', 5, 1, 3, N'6')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (5, N'CSEAIL', 5, 2, 1, N'4')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (6, N'EM', 2, 3, 2, N'1')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (7, N'PM', 3, 2, 3, N'7')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (8, N'PM', 3, 2, 3, N'7')
INSERT [dbo].[Course] ([CourseID], [CourseName], [DepartmentID], [SessionID], [CreditHours], [Semester]) VALUES (9, N'tw', 5, 1, 3, N'8')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'Electrical')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (2, N'Mechanical')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (3, N'Civil')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (4, N'Enviromental')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (5, N'CSE')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (6, N'Architecture')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (7, N'Transportation')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (8, N'Geological')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (9, N'Polymer')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (10, N'IME')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (11, N'Mechatronics')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (12, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (13, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (14, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (15, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (16, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (17, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (18, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (19, NULL)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (20, NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([ExamID], [ExamDate], [SessionID], [DepartmentId], [CourseID]) VALUES (3, CAST(N'2019-04-29 00:00:00.000' AS DateTime), 2, 5, 1)
INSERT [dbo].[Exam] ([ExamID], [ExamDate], [SessionID], [DepartmentId], [CourseID]) VALUES (4, CAST(N'2019-07-29 00:00:00.000' AS DateTime), 3, 4, 2)
INSERT [dbo].[Exam] ([ExamID], [ExamDate], [SessionID], [DepartmentId], [CourseID]) VALUES (5, CAST(N'2015-07-29 00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[Exam] ([ExamID], [ExamDate], [SessionID], [DepartmentId], [CourseID]) VALUES (6, CAST(N'2019-04-10 00:00:00.000' AS DateTime), 3, 7, 1)
INSERT [dbo].[Exam] ([ExamID], [ExamDate], [SessionID], [DepartmentId], [CourseID]) VALUES (7, CAST(N'2019-04-19 00:00:00.000' AS DateTime), 2, 8, 2)
SET IDENTITY_INSERT [dbo].[Exam] OFF
SET IDENTITY_INSERT [dbo].[Fe] ON 

INSERT [dbo].[Fe] ([FeeID], [ScholarshipID], [StudentID], [LookupID], [NewFee]) VALUES (1, 3, 3, 6, 0)
INSERT [dbo].[Fe] ([FeeID], [ScholarshipID], [StudentID], [LookupID], [NewFee]) VALUES (2, 2, 2, 6, 0)
INSERT [dbo].[Fe] ([FeeID], [ScholarshipID], [StudentID], [LookupID], [NewFee]) VALUES (3, 4, 2, 5, 0)
INSERT [dbo].[Fe] ([FeeID], [ScholarshipID], [StudentID], [LookupID], [NewFee]) VALUES (4, 2, 2, 5, 0)
INSERT [dbo].[Fe] ([FeeID], [ScholarshipID], [StudentID], [LookupID], [NewFee]) VALUES (5, 1, 3, 5, 17000)
SET IDENTITY_INSERT [dbo].[Fe] OFF
SET IDENTITY_INSERT [dbo].[Fees] ON 

INSERT [dbo].[Fees] ([FeeId], [Fees], [Semester], [Date]) VALUES (2, 34000, N'8', CAST(N'2019-05-01' AS Date))
INSERT [dbo].[Fees] ([FeeId], [Fees], [Semester], [Date]) VALUES (3, 34000, N'6', CAST(N'2019-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[Fees] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([LoginID], [Email], [Type], [Password]) VALUES (1, N'ayitabtt@gmail.com', N'stu', N'123')
INSERT [dbo].[Login] ([LoginID], [Email], [Type], [Password]) VALUES (2, N'Heenairfan@gmail.com', N'stu', N'1234')
INSERT [dbo].[Login] ([LoginID], [Email], [Type], [Password]) VALUES (3, N'b@gmail.com', N'stu', N'rahat')
INSERT [dbo].[Login] ([LoginID], [Email], [Type], [Password]) VALUES (4, N'rahatattique8989891@gmailcom', N'stu', N'A123')
INSERT [dbo].[Login] ([LoginID], [Email], [Type], [Password]) VALUES (5, N'rayharohi181@gmailcom', N'stu', N'1234')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Lookup] ON 

INSERT [dbo].[Lookup] ([LookupID], [Name], [Category]) VALUES (1, N'Present', N'Attendance_status')
INSERT [dbo].[Lookup] ([LookupID], [Name], [Category]) VALUES (2, N'Absent', N'Attendance_status')
INSERT [dbo].[Lookup] ([LookupID], [Name], [Category]) VALUES (3, N'Leave', N'Attendance_status')
INSERT [dbo].[Lookup] ([LookupID], [Name], [Category]) VALUES (4, N'Late', N'Attendance_status')
INSERT [dbo].[Lookup] ([LookupID], [Name], [Category]) VALUES (5, N'Paid', N'Fee_Status')
INSERT [dbo].[Lookup] ([LookupID], [Name], [Category]) VALUES (6, N'Unpaid', N'Fee_Status')
SET IDENTITY_INSERT [dbo].[Lookup] OFF
SET IDENTITY_INSERT [dbo].[RegisteredCourses] ON 

INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (1, 2, 1, 4, 3)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (2, 3, 2, 4, 2)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (3, 3, 1, 4, 2)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (4, 3, 2, 4, 3)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (5, 3, 2, 3, 3)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (6, 2, 5, 3, 3)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (7, 2, 6, 2, 4)
INSERT [dbo].[RegisteredCourses] ([RegisteredCourseID], [StudentID], [CourseID], [Semester], [SectionID]) VALUES (8, 3, 7, 7, 3)
SET IDENTITY_INSERT [dbo].[RegisteredCourses] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ResultID], [Grade], [CreditHours], [Date], [RegisteredCourseID], [StudentID]) VALUES (1, N'A', N'3', CAST(N'2019-05-04 00:00:00.000' AS DateTime), 4, 4)
INSERT [dbo].[Result] ([ResultID], [Grade], [CreditHours], [Date], [RegisteredCourseID], [StudentID]) VALUES (2, N'B', N'2', CAST(N'2019-05-05 00:00:00.000' AS DateTime), 2, 6)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Scholar] ON 

INSERT [dbo].[Scholar] ([ScholarshipID], [StudentID], [ScholarID]) VALUES (3, 2, 0)
INSERT [dbo].[Scholar] ([ScholarshipID], [StudentID], [ScholarID]) VALUES (4, 2, 1)
INSERT [dbo].[Scholar] ([ScholarshipID], [StudentID], [ScholarID]) VALUES (3, 2, 2)
INSERT [dbo].[Scholar] ([ScholarshipID], [StudentID], [ScholarID]) VALUES (4, 2, 3)
INSERT [dbo].[Scholar] ([ScholarshipID], [StudentID], [ScholarID]) VALUES (2, 3, 4)
SET IDENTITY_INSERT [dbo].[Scholar] OFF
SET IDENTITY_INSERT [dbo].[Scholarshipss] ON 

INSERT [dbo].[Scholarshipss] ([ScholarshipID], [Scholarship]) VALUES (1, N'FACS')
INSERT [dbo].[Scholarshipss] ([ScholarshipID], [Scholarship]) VALUES (2, N'PEEF')
INSERT [dbo].[Scholarshipss] ([ScholarshipID], [Scholarship]) VALUES (3, N'HEC')
INSERT [dbo].[Scholarshipss] ([ScholarshipID], [Scholarship]) VALUES (4, N'USAID')
SET IDENTITY_INSERT [dbo].[Scholarshipss] OFF
SET IDENTITY_INSERT [dbo].[Sectionss] ON 

INSERT [dbo].[Sectionss] ([SectionID], [SectionName]) VALUES (1, N'A')
INSERT [dbo].[Sectionss] ([SectionID], [SectionName]) VALUES (2, N'B')
INSERT [dbo].[Sectionss] ([SectionID], [SectionName]) VALUES (3, N'C')
INSERT [dbo].[Sectionss] ([SectionID], [SectionName]) VALUES (4, N'D')
SET IDENTITY_INSERT [dbo].[Sectionss] OFF
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionID], [Session]) VALUES (1, N'2016')
INSERT [dbo].[Session] ([SessionID], [Session]) VALUES (2, N'2017')
INSERT [dbo].[Session] ([SessionID], [Session]) VALUES (3, N'2018')
INSERT [dbo].[Session] ([SessionID], [Session]) VALUES (4, N'2019')
INSERT [dbo].[Session] ([SessionID], [Session]) VALUES (13, NULL)
SET IDENTITY_INSERT [dbo].[Session] OFF
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([ID], [Status]) VALUES (1, N'Absent')
INSERT [dbo].[status] ([ID], [Status]) VALUES (2, N'Present')
INSERT [dbo].[status] ([ID], [Status]) VALUES (3, N'Leave')
SET IDENTITY_INSERT [dbo].[status] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [Name], [FatherName], [Address], [PhoneNumber], [EmailId], [RegistrationNumber], [CNIC], [DepartmentID], [SessionId], [DOB], [LoginID], [Password], [Type], [SectionID]) VALUES (2, N'Ayita', N'Muneer', N'House no 14', N'090078601', N'ayitabutt@gmail.com', N'2016-CS-261', N'127572368798', 1, 1, CAST(N'1998-04-29 00:00:00.000' AS DateTime), 1, N'123', NULL, 3)
INSERT [dbo].[Student] ([StudentId], [Name], [FatherName], [Address], [PhoneNumber], [EmailId], [RegistrationNumber], [CNIC], [DepartmentID], [SessionId], [DOB], [LoginID], [Password], [Type], [SectionID]) VALUES (3, N'Heena', N'Irfan', N'House no 15', N'09008601', N'Heenairfan@gmail.com', N'2016-CS-273', N'5678905356782', 8, 4, CAST(N'1998-03-30 00:00:00.000' AS DateTime), 2, N'1234', N'stu', 2)
INSERT [dbo].[Student] ([StudentId], [Name], [FatherName], [Address], [PhoneNumber], [EmailId], [RegistrationNumber], [CNIC], [DepartmentID], [SessionId], [DOB], [LoginID], [Password], [Type], [SectionID]) VALUES (4, N'bakhtawar', N'bhtti', N'hu4', N'2132456787', N'b@gmail.com', N'2016cs261', N'1234567890-8', 6, 1, CAST(N'1998-03-04 00:00:00.000' AS DateTime), 3, N'rahat', N'stu', 3)
INSERT [dbo].[Student] ([StudentId], [Name], [FatherName], [Address], [PhoneNumber], [EmailId], [RegistrationNumber], [CNIC], [DepartmentID], [SessionId], [DOB], [LoginID], [Password], [Type], [SectionID]) VALUES (6, N'fatima', N'attique', N'asdfsgsfda', N'12345678', N'rayharohi181@gmailcom', N'2016cs2366', N'1234567890-8', 6, 1, CAST(N'1996-05-23 00:00:00.000' AS DateTime), 5, N'1234', N'stu', NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
ALTER TABLE [dbo].[ClassAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAttendance_ClassAttendance] FOREIGN KEY([statusid])
REFERENCES [dbo].[status] ([ID])
GO
ALTER TABLE [dbo].[ClassAttendance] CHECK CONSTRAINT [FK_ClassAttendance_ClassAttendance]
GO
ALTER TABLE [dbo].[ClassAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAttendance_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[ClassAttendance] CHECK CONSTRAINT [FK_ClassAttendance_Course]
GO
ALTER TABLE [dbo].[ClassAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAttendance_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[ClassAttendance] CHECK CONSTRAINT [FK_ClassAttendance_Department]
GO
ALTER TABLE [dbo].[ClassAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAttendance_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[ClassAttendance] CHECK CONSTRAINT [FK_ClassAttendance_Session]
GO
ALTER TABLE [dbo].[ClassAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAttendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[ClassAttendance] CHECK CONSTRAINT [FK_ClassAttendance_Student]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Session]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Login] FOREIGN KEY([LoginID])
REFERENCES [dbo].[Login] ([LoginID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Login]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Department]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Session]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_SalaryID] FOREIGN KEY([SalaryID])
REFERENCES [dbo].[Salary] ([SalaryID])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_SalaryID]
GO
ALTER TABLE [dbo].[Fe]  WITH CHECK ADD  CONSTRAINT [FK_Fe_Lookup] FOREIGN KEY([LookupID])
REFERENCES [dbo].[Lookup] ([LookupID])
GO
ALTER TABLE [dbo].[Fe] CHECK CONSTRAINT [FK_Fe_Lookup]
GO
ALTER TABLE [dbo].[Fe]  WITH CHECK ADD  CONSTRAINT [FK_Fe_Scholarshipss] FOREIGN KEY([ScholarshipID])
REFERENCES [dbo].[Scholarshipss] ([ScholarshipID])
GO
ALTER TABLE [dbo].[Fe] CHECK CONSTRAINT [FK_Fe_Scholarshipss]
GO
ALTER TABLE [dbo].[Fe]  WITH CHECK ADD  CONSTRAINT [FK_Fe_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Fe] CHECK CONSTRAINT [FK_Fe_Student]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_Course]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_Sectionss] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sectionss] ([SectionID])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_Sectionss]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_Student]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_RegisteredCourses] FOREIGN KEY([RegisteredCourseID])
REFERENCES [dbo].[RegisteredCourses] ([RegisteredCourseID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_RegisteredCourses]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Employee]
GO
ALTER TABLE [dbo].[Scholar]  WITH CHECK ADD  CONSTRAINT [FK_Scholar_Scholarshipss] FOREIGN KEY([ScholarshipID])
REFERENCES [dbo].[Scholarshipss] ([ScholarshipID])
GO
ALTER TABLE [dbo].[Scholar] CHECK CONSTRAINT [FK_Scholar_Scholarshipss]
GO
ALTER TABLE [dbo].[Scholar]  WITH CHECK ADD  CONSTRAINT [FK_Scholar_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Scholar] CHECK CONSTRAINT [FK_Scholar_Student]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Sectionss] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sectionss] ([SectionID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Sectionss]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Session]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Login] FOREIGN KEY([LoginID])
REFERENCES [dbo].[Login] ([LoginID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Login]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Sectionss] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sectionss] ([SectionID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Sectionss]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Sectionss1] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sectionss] ([SectionID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Sectionss1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Session]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_ClassAttendance] FOREIGN KEY([AttendanceID])
REFERENCES [dbo].[ClassAttendance] ([AttendanceID])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_ClassAttendance]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_Student]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Result] FOREIGN KEY([ResultID])
REFERENCES [dbo].[Result] ([ResultID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Result]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Course] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Course]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Employee]
GO
USE [master]
GO
ALTER DATABASE [DB49] SET  READ_WRITE 
GO
