USE [master]
GO
/****** Object:  Database [DB49]    Script Date: 4/27/2019 11:08:54 PM ******/
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
/****** Object:  Table [dbo].[ClassAttendance]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassAttendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassAttendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/27/2019 11:08:54 PM ******/
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
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/27/2019 11:08:54 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 4/27/2019 11:08:54 PM ******/
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
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[ExamDate] [datetime] NOT NULL,
	[CourseID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenditure]    Script Date: 4/27/2019 11:08:54 PM ******/
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
/****** Object:  Table [dbo].[Fe]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fe](
	[FeeID] [int] IDENTITY(1,1) NOT NULL,
	[ScholarshipID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Fe] PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredCourses](
	[RegisteredCourseID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_RegisyeredCourses] PRIMARY KEY CLUSTERED 
(
	[RegisteredCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NULL,
	[Grade] [nvarchar](50) NULL,
	[CreditHours] [nvarchar](50) NOT NULL,
	[SessionId] [int] NULL,
	[Date] [datetime] NULL,
	[RegisteredCourseID] [int] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary]    Script Date: 4/27/2019 11:08:54 PM ******/
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
/****** Object:  Table [dbo].[Scholarship]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scholarship](
	[ScholarshipID] [int] IDENTITY(1,1) NOT NULL,
	[ScholarshipName] [nvarchar](max) NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_Scholarship] PRIMARY KEY CLUSTERED 
(
	[ScholarshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](50) NULL,
	[DepartmentID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_SectionID] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[Session] [int] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/27/2019 11:08:54 PM ******/
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
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 4/27/2019 11:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[AttendanceID] [int] NOT NULL,
	[StudentID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 4/27/2019 11:08:54 PM ******/
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
/****** Object:  Table [dbo].[TimeTable]    Script Date: 4/27/2019 11:08:54 PM ******/
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
ALTER TABLE [dbo].[ClassAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ClassAttendance_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[ClassAttendance] CHECK CONSTRAINT [FK_ClassAttendance_Section]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
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
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Session]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_Fe] FOREIGN KEY([FeeID])
REFERENCES [dbo].[Fe] ([FeeID])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_Fe]
GO
ALTER TABLE [dbo].[Expenditure]  WITH CHECK ADD  CONSTRAINT [FK_Expenditure_SalaryID] FOREIGN KEY([SalaryID])
REFERENCES [dbo].[Salary] ([SalaryID])
GO
ALTER TABLE [dbo].[Expenditure] CHECK CONSTRAINT [FK_Expenditure_SalaryID]
GO
ALTER TABLE [dbo].[Fe]  WITH CHECK ADD  CONSTRAINT [FK_Fe_Scholarship] FOREIGN KEY([ScholarshipID])
REFERENCES [dbo].[Scholarship] ([ScholarshipID])
GO
ALTER TABLE [dbo].[Fe] CHECK CONSTRAINT [FK_Fe_Scholarship]
GO
ALTER TABLE [dbo].[Fe]  WITH CHECK ADD  CONSTRAINT [FK_Fe_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Fe] CHECK CONSTRAINT [FK_Fe_Student]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisyeredCourses_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisyeredCourses_Course]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisyeredCourses_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisyeredCourses_Student]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_RegisteredCourses] FOREIGN KEY([RegisteredCourseID])
REFERENCES [dbo].[RegisteredCourses] ([RegisteredCourseID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_RegisteredCourses]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_SectionID] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_SectionID]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Session]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Employee]
GO
ALTER TABLE [dbo].[Scholarship]  WITH CHECK ADD  CONSTRAINT [FK_Scholarship_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Scholarship] CHECK CONSTRAINT [FK_Scholarship_Student]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Department]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Employee]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Session] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Session] ([SessionID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Session]
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
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Section]
GO
USE [master]
GO
ALTER DATABASE [DB49] SET  READ_WRITE 
GO
