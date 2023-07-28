
-- Create DATABASE STG_NAYA:
USE [master]
GO

CREATE DATABASE [STG_NAYA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STG_NAYA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\STG_NAYA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'STG_NAYA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\STG_NAYA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STG_NAYA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [STG_NAYA] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [STG_NAYA] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [STG_NAYA] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [STG_NAYA] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [STG_NAYA] SET ARITHABORT OFF 
GO

ALTER DATABASE [STG_NAYA] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [STG_NAYA] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [STG_NAYA] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [STG_NAYA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [STG_NAYA] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [STG_NAYA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [STG_NAYA] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [STG_NAYA] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [STG_NAYA] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [STG_NAYA] SET  DISABLE_BROKER 
GO

ALTER DATABASE [STG_NAYA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [STG_NAYA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [STG_NAYA] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [STG_NAYA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [STG_NAYA] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [STG_NAYA] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [STG_NAYA] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [STG_NAYA] SET RECOVERY FULL 
GO

ALTER DATABASE [STG_NAYA] SET  MULTI_USER 
GO

ALTER DATABASE [STG_NAYA] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [STG_NAYA] SET DB_CHAINING OFF 
GO

ALTER DATABASE [STG_NAYA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [STG_NAYA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [STG_NAYA] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [STG_NAYA] SET QUERY_STORE = OFF
GO

ALTER DATABASE [STG_NAYA] SET  READ_WRITE 
GO

USE STG_NAYA
GO

-- Creating all the tables:

-- CREATE KStudentsExtractLog Table:

CREATE TABLE KStudentsExtractLog (
[LastExtract] datetime
)
INSERT INTO [STG_NAYA].[dbo].[KStudentsExtractLog]
VALUES (01/01/1900);


-- CREATE RegionsTbl:
CREATE TABLE [RegionsTbl] (
    [CityName] nvarchar(255),
    [DistrictName] nvarchar(255),
    [AreaName] nvarchar(255)
)

-- Create CitiesTbl:
CREATE TABLE [CitiesTbl] (
    [id] int,
    [KNameFld] nvarchar(50),
    [Update Date] datetime
)

-- Create KStuentsTbl:
CREATE TABLE [KStudentsTbl] (
    [id] int,
    [KFirstNameFld] nvarchar(50),
    [KLastNameFld] nvarchar(50),
    [KBirthDateFld] datetime,
    [KAddressFld] nvarchar(4000),
    [KCityFld] int,
    [KStatusFld] nvarchar(50),
    [KCustomerFld] nvarchar(2),
    [KGenderFld] nvarchar(50),
    [KEducationsFld] nvarchar(50),
    [updateddate] datetime,
    [LastExtract] datetime
)

-- Create KCoursesTbl:
CREATE TABLE [KCoursesTbl] (
    [id] int,
    [KStartDateFld] datetime,
    [KEndDateFld] datetime,
    [KTitleFld] int,
    [KMinStudentsNumFld] int,
    [KMaxStudentsNumFld] int,
    [KpriceFld] float,
    [KRegistrationOpenFld] nvarchar(1),
    [containerid] int,
    [KLecturersTbl] nvarchar(4000),
    [KDayPartFld] nvarchar(6),
    [KHoursFld] int,
    [KNoOfStudentsFld] int,
    [KCourseFormatFld] nvarchar(50),
    [KBusinessPriceFld] float,
    [KOriginalPriceFld] float,
    [Update Date] datetime
)

-- Create KCourseTypesTbl:
CREATE TABLE [KCourseTypesTbl] (
    [id] int,
    [KTitleFld] nvarchar(255),
    [KActiveFld] nvarchar(15),
    [KHoursFld] int,
    [KPassingGradeFld] int,
    [KCategoryFld] int,
    [Update Date] datetime
)

-- Create Categories:
CREATE TABLE [Categories] (
    [id] int,
    [KActiveFld] nvarchar(1),
    [KNameFld] nvarchar(20),
    [Update Date] datetime
)

-- Create KLecturers:
CREATE TABLE [KLecturers] (
    [id] int,
    [KLastNameFld] nvarchar(50),
    [KFirstNameFld] nvarchar(50),
    [KBirthDateFld] datetime,
    [KGenderFld] nvarchar(50),
    [KActiveFld] nvarchar(50),
    [KWorkHourFld] int,
    [KEmployeeOrIndependentFld] nvarchar(5),
    [KCourseTypesFld] nvarchar(4000),
    [Update Date] datetime
)

-- Create KRegistrationsTbl:
CREATE TABLE [KRegistrationsTbl] (
    [id] int,
    [KRegistrationStatusFld] nvarchar(50),
    [KRegisteredToFld] int,
    [KCourseFld] int,
    [KCoursepriceFld] float,
    [KDiscountFld] int,
    [containerid] int,
    [KDiscountInNisFld] int,
    [KRegistrationDateFld] datetime,
    [KCategoryFld] int,
    [KDropoutReasonFld] nvarchar(50),
    [KTotalAmountFld] float,
    [Update Date] datetime
)

-- Create KRefusalReasonsTbl:
CREATE TABLE [KRefusalReasonsTbl] (
    [id] int,
    [KRefusalReasonFld] nvarchar(50),
    [Update Date] datetime
)

-- Create KGradesTbl:
CREATE TABLE [KGradesTbl] (
    [id] int,
    [KDateFld] datetime,
    [KStudentIdFld] int,
    [KGradeFld] float,
    [KAssignmentTypeFld] int,
    [KAssignmentFld] int,
    [KCourseFld] int,
    [Update Date] datetime
)

-- Create KAssigmentsTbl:
CREATE TABLE [KAssigmentsTbl] (
   [id] int,
    [KDateFld] datetime,
    [KActiveFld] nvarchar(50),
    [KLecturerFld] int,
    [containerid] int,
    [KTitleFld] nvarchar(4000),
    [Update Date] datetime
)

-- Create KAssigmentsTypesTbl:
CREATE TABLE [KAssigmentsTypesTbl] (
    [KNameFld] nvarchar(50),
    [id] int,
    [Update Date] datetime
)

-- Create KAttendancesTbl:
CREATE TABLE [KAttendancesTbl] (
    [id] int,
    [KStudentIdFld] int,
    [KPresenceFld] nvarchar(255),
    [KCourseFld] int,
    [K_Absence] int,
    [containerid] int,
    [Update Date] datetime
)

-- Create KMeetingsTbl:
CREATE TABLE [KMeetingsTbl] (
    [id] int,
    [KTitleFld] nvarchar(4000),
    [KTimeStartFld] datetime,
    [KStartHourFld] nvarchar(50),
    [KEndHourFld] nvarchar(50),
    [KTypeFld] nvarchar(50),
    [KActiveFld] nvarchar(50),
    [KLecturerFld] int,
    [Update Date] datetime
)

-- Create KAbsenceReasonsTbl:
CREATE TABLE [KAbsenceReasonsTbl] (
    [id] int,
    [KReasonFld] nvarchar(15),
    [Update Date] datetime
)

-- Create StudentsPayments table:
CREATE TABLE [StudentsPayments] (
    [StudentId] int,
    [Courseld] int,
    [PaymentDate] datetime,
    [PaymentNo] float,
    [PaymentAmount] float,
    [PaymentFileName] nvarchar(200),
    [LoadDate] datetime
)

-- Create Storno table:
CREATE TABLE [StornoTbl] (
    [StudentId] int,
    [Courseld] int,
    [PaymentDate] datetime,
    [STORNO] nvarchar(255)
)

-- Create Regions Table:
CREATE TABLE [RegionsTable] (
    [CityName] nvarchar(255),
    [DistrictName] nvarchar(255),
    [AreaName] nvarchar(255),
    [CityID] int,
    [Update Date] datetime
)

-- Create STG_Dim_Date
CREATE TABLE [STG_Dim_Date] (
    [Date] datetime,
    [Year] float,
    [Month] float,
    [MonthName] nvarchar(255),
    [Weekday] nvarchar(255),
    [Quarter] nvarchar(255)
)


-- Creating the DWH DATABASE:

USE [master]
GO

CREATE DATABASE [DWH_NAYA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWH_NAYA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DWH_NAYA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWH_NAYA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DWH_NAYA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWH_NAYA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DWH_NAYA] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DWH_NAYA] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DWH_NAYA] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DWH_NAYA] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DWH_NAYA] SET ARITHABORT OFF 
GO

ALTER DATABASE [DWH_NAYA] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DWH_NAYA] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DWH_NAYA] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DWH_NAYA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DWH_NAYA] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DWH_NAYA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DWH_NAYA] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DWH_NAYA] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DWH_NAYA] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DWH_NAYA] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DWH_NAYA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DWH_NAYA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DWH_NAYA] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DWH_NAYA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DWH_NAYA] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DWH_NAYA] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DWH_NAYA] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DWH_NAYA] SET RECOVERY FULL 
GO

ALTER DATABASE [DWH_NAYA] SET  MULTI_USER 
GO

ALTER DATABASE [DWH_NAYA] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DWH_NAYA] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DWH_NAYA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DWH_NAYA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DWH_NAYA] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DWH_NAYA] SET QUERY_STORE = OFF
GO

ALTER DATABASE [DWH_NAYA] SET  READ_WRITE 
GO

USE DWH_NAYA
GO


-- Creating Dim & Fact tables:

-- Create Fact_Attendance:
CREATE TABLE [Fact_Attendance] (
    [AttendanceID] int,
    [StudentID] int,
    [Presence] nvarchar(255),
    [CourseID] int,
    [AbsenceID] int,
    [MeetingID] int,
    [MeetingDate] datetime,
    [StartHour] nvarchar(50),
    [EndHour] nvarchar(50),
    [MeetingType] nvarchar(50),
    [IsActive] nvarchar(50),
    [LecturerID] int,
    [MeetingTitle] nvarchar(4000),
    [AbsenceReason] nvarchar(15),
    [Update Date] datetime
)

-- Create Fact_Payments:
CREATE TABLE [Fact_Payments](
    [StudentId] int,
    [Courseld] int,
    [PaymentDate] datetime,
    [PaymentNo] int,
    [PaymentAmount] float,
    [PaymentFileName] nvarchar(200),
    [LoadDate] datetime,
    [Storno] nvarchar(255),
    [Update Date] datetime
)

-- Create Fact_Grades:
CREATE TABLE [Fact_Grades] (
    [GradeID] int,
    [GradeDate] date,
    [StudentID] int,
    [Grade] float,
    [AssignmentID] int,
    [AssigmentDate] datetime,
    [IsActive] nvarchar(50),
    [LecturerID] int,
    [CourseID] int,
    [AssigmentTypeID] nvarchar(4000),
    [AssigmentType] nvarchar(50),
    [Update Date] datetime
)

-- Create Fact_Registrations:
CREATE TABLE [Fact_Registrations] (
    [RegistrationID] int,
    [Registration Status] nvarchar(50),
    [CourseTypeID] int,
    [CourseID] int,
    [CoursePrice] float,
    [Discount] int,
    [StudentID] int,
    [CourseCategoryID] int,
    [DiscountInNIS] int,
    [TotalAmount] float,
    [RegistrationDate] datetime,
    [RefusalReasonID] nvarchar(50),
    [RefusalReason] nvarchar(50),
    [LecturerID] nvarchar(4000),
    [Update Date] datetime
)


-- Create DIM_Students:
CREATE TABLE [Dim_Students] (
    [StudentID] int,
    [FullName] nvarchar(101),
    [StudentBirthDate] datetime,
    [StudentAddress] nvarchar(4000),
    [StudentEducation] nvarchar(50),
    [StudentStatus] nvarchar(50),
    [IsCustomer] nvarchar(2),
    [Gender] nvarchar(50),
    [CityID] int,
    [CityName] nvarchar(255),
    [AreaName] nvarchar(255),
    [DistrictName] nvarchar(255),
    [Update Date] datetime
)

-- Create Dim_Courses:
CREATE TABLE [Dim_Courses] (
    [CourseID] int,
    [CourseStartDate] datetime,
    [CourseEndDate] datetime,
    [CoursePrice] float,
    [RegistrationOpen] nvarchar(1),
    [MinStudents] int,
    [MaxStudents] int,
    [OrganizationID] int,
    [LectureID] nvarchar(4000),
    [DayPart] nvarchar(6),
    [TotalHours] int,
    [NumOfStudents] int,
    [CourseFormat] nvarchar(50),
    [BusinessPrice] float,
    [OriginalPrice] float,
    [CourseTypeID] int,
    [CourseTypeName] nvarchar(255),
    [CourseTypeActive] nvarchar(15),
    [CourseTypeHours] int,
    [PassingGrade] int,
    [CourseCategoryActive] nvarchar(1),
    [CourseCategoryName] nvarchar(20),
    [CategoryID] int,
    [Update Date] datetime
)

-- Create Dim_Date:
CREATE TABLE [Dim_Date] (
    [Date] datetime,
    [Year] float,
    [Month] float,
    [MonthName] nvarchar(255),
    [Weekday] nvarchar(255),
    [Quarter] nvarchar(255)
)

-- Create Dim_Lecturers:
CREATE TABLE [DIM_Lecturers] (
    [LecturerID] int,
    [FullName] nvarchar(101),
    [BirthDate] datetime,
    [Gender] nvarchar(50),
    [IsActive] nvarchar(50),
    [WorkHours] int,
    [EmployeeOrIndependent] nvarchar(5),
    [CourseTypes] nvarchar(4000)
)