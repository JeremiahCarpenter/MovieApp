USE [master]
GO
/****** Object:  Database [FlixOnTheNet]    Script Date: 7/9/2019 2:57:30 PM ******/
CREATE DATABASE [FlixOnTheNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NetOnTheFlix', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NetOnTheFlix.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NetOnTheFlix_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NetOnTheFlix_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FlixOnTheNet] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlixOnTheNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlixOnTheNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlixOnTheNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlixOnTheNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlixOnTheNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlixOnTheNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FlixOnTheNet] SET  MULTI_USER 
GO
ALTER DATABASE [FlixOnTheNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlixOnTheNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlixOnTheNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlixOnTheNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlixOnTheNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlixOnTheNet] SET QUERY_STORE = OFF
GO
USE [FlixOnTheNet]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](150) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTrace]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTrace](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](250) NULL,
	[Trace] [varchar](max) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_LogTrace] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Length] [int] NULL,
	[Rating] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Trailer] [nvarchar](250) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieUsers]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieUsers](
	[MovieUserID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[UserID] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_MovieUsers] PRIMARY KEY CLUSTERED 
(
	[MovieUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (1, N'Horror')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (2, N'War')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (3, N'Documentary')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (4, N'Western')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (5, N'Action')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (6, N'Comedy')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (7, N'Science Fiction')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (8, N'Animation')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (9, N'Crime')
INSERT [dbo].[Categories] ([CategoryID], [Category]) VALUES (10, N'Romance')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[LogTrace] ON 

INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (1, N'Attempted to divide by zero.', N'   at MovieWebSite.Controllers.HomeController.DivZero() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 83', CAST(N'2019-06-27T15:45:53.703' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (2, N'Operation is not valid due to the current state of the object.', N'   at MovieWebSite.Controllers.HomeController.InvalidOp() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 96', CAST(N'2019-06-27T15:46:26.123' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (3, N'Specified cast is not valid.', N'   at MovieWebSite.Controllers.HomeController.InvCast() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 109', CAST(N'2019-06-27T15:46:29.290' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (4, N'Attempted to divide by zero.', N'   at MovieWebSite.Controllers.HomeController.DivZero() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 83', CAST(N'2019-06-28T13:23:45.387' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (5, N'Operation is not valid due to the current state of the object.', N'   at MovieWebSite.Controllers.HomeController.InvalidOp() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 96', CAST(N'2019-06-28T13:24:13.520' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (6, N'Specified cast is not valid.', N'   at MovieWebSite.Controllers.HomeController.InvCast() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 109', CAST(N'2019-06-28T13:24:16.270' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (7, N'Object reference not set to an instance of an object.', N'   at MovieWebSite.Controllers.UserController.ForgotPass(String Email, String Password) in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\UserController.cs:line 306', CAST(N'2019-06-28T16:08:58.297' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (8, N'The DELETE statement conflicted with the REFERENCE constraint "FK_MovieUsers_Movies". The conflict occurred in database "FlixOnTheNet", table "dbo.MovieUsers", column ''MovieID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.DeleteCategory(Int32 CategoryID) in C:\Users\Onshore\source\repos\MovieApp\DataAccessLayer\DALContext.cs:line 318
   at BusinessLogicLayer.ContextBLL.DeleteCategory(Int32 CategoryID) in C:\Users\Onshore\source\repos\MovieApp\BusinessLogicLayer\ContextBLL.cs:line 77
   at MovieWebSite.Controllers.CategoryController.Delete(Int32 id, FormCollection collection) in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\CategoryController.cs:line 171', CAST(N'2019-07-03T09:33:06.820' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (9, N'Cannot insert duplicate key row in object ''dbo.Users'' with unique index ''NonClusteredIndex-20190607-151450''. The duplicate key value is (qwer).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateUser(String UserName, String Email, String Password, Int32 RoleID) in C:\Users\Onshore\source\repos\MovieApp\DataAccessLayer\DALContext.cs:line 844', CAST(N'2019-07-08T14:24:24.847' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (10, N'Cannot insert duplicate key row in object ''dbo.Users'' with unique index ''NonClusteredIndex-20190607-151450''. The duplicate key value is (qwer).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateUser(String UserName, String Email, String Password, Int32 RoleID) in C:\Users\Onshore\source\repos\MovieApp\DataAccessLayer\DALContext.cs:line 852
   at BusinessLogicLayer.ContextBLL.CreateUser(String UserName, String Email, String Password, Int32 RoleID) in C:\Users\Onshore\source\repos\MovieApp\BusinessLogicLayer\ContextBLL.cs:line 117
   at MovieWebSite.Controllers.UserController.Register(UserBLL u) in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\UserController.cs:line 208', CAST(N'2019-07-08T14:24:25.190' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (11, N'Attempted to divide by zero.', N'   at MovieWebSite.Controllers.HomeController.DivZero() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 89', CAST(N'2019-07-08T15:12:36.293' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (12, N'Operation is not valid due to the current state of the object.', N'   at MovieWebSite.Controllers.HomeController.InvalidOp() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 104', CAST(N'2019-07-08T15:12:40.243' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (13, N'Specified cast is not valid.', N'   at MovieWebSite.Controllers.HomeController.InvCast() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 118', CAST(N'2019-07-08T15:12:42.740' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (14, N'Attempted to divide by zero.', N'   at MovieWebSite.Controllers.HomeController.DivZero() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 89', CAST(N'2019-07-09T09:56:57.837' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (15, N'Attempted to divide by zero.', N'   at MovieWebSite.Controllers.HomeController.DivZero() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 89', CAST(N'2019-07-09T09:57:34.010' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (16, N'Attempted to divide by zero.', N'   at MovieWebSite.Controllers.HomeController.DivZero() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 89', CAST(N'2019-07-09T10:46:28.370' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (17, N'Operation is not valid due to the current state of the object.', N'   at MovieWebSite.Controllers.HomeController.InvalidOp() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 104', CAST(N'2019-07-09T10:46:31.590' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (18, N'Specified cast is not valid.', N'   at MovieWebSite.Controllers.HomeController.InvCast() in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\HomeController.cs:line 118', CAST(N'2019-07-09T10:46:33.770' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (19, N'Procedure or function ''CreateUser'' expects parameter ''@Email'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateUser(String UserName, String Email, String Password, Int32 RoleID) in C:\Users\Onshore\source\repos\MovieApp\DataAccessLayer\DALContext.cs:line 844', CAST(N'2019-07-09T11:15:12.230' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (20, N'Procedure or function ''CreateUser'' expects parameter ''@Email'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateUser(String UserName, String Email, String Password, Int32 RoleID) in C:\Users\Onshore\source\repos\MovieApp\DataAccessLayer\DALContext.cs:line 852
   at BusinessLogicLayer.ContextBLL.CreateUser(String UserName, String Email, String Password, Int32 RoleID) in C:\Users\Onshore\source\repos\MovieApp\BusinessLogicLayer\ContextBLL.cs:line 117
   at MovieWebSite.Controllers.UserController.Register(UserBLL u) in C:\Users\Onshore\source\repos\MovieApp\MovieWebSite\Controllers\UserController.cs:line 208', CAST(N'2019-07-09T11:15:12.320' AS DateTime))
SET IDENTITY_INSERT [dbo].[LogTrace] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (1, N'The Godfather', 175, N'R', N'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', N'https://cdn11.bigcommerce.com/s-cfnl8/images/stencil/1280x1280/products/804/1468/the-godfather-don-movie-poster-lg__83004.1386572899.jpg?c=2&imbypass=on', 9)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (2, N'Forrest Gump', 142, N'PG-13', N'Watch history unfold through the perspective of an Alabama man with an IQ of 75.', N'https://images-na.ssl-images-amazon.com/images/I/71CHZi4vhWL._SY679_.jpg', 10)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (3, N'Unbreakable', 106, N'PG-13', N'A man learns something extraordinary about himself after a devastating accident.', N'https://images-na.ssl-images-amazon.com/images/I/41-6emk6g6L.jpg', 7)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (4, N'The Lord of the Rings: The Fellowship of the Ring', 178, N'PG-13', N'A Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', N'https://d8mkdcmng3.imgix.net/b3a6/gifts-posters-lord-of-the-rings-fellowship-of-the-ring-one-sheet-maxi-poster.png?auto=format&bg=0FFF&fit=fill&h=600&q=100&w=600&s=4c29b6b64b90627c3b23b4cb04115752', 5)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (5, N'The Lego Movie 2: The Second Part', 107, N'PG', N'It has been five years since everything was awesome and the citizens are facing a huge new threat', N'https://is5-ssl.mzstatic.com/image/thumb/Video124/v4/a1/f7/7f/a1f77f25-bcc3-7c6f-9ca6-69940606f4b2/pr_source.lsr/268x0w.png', 8)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (6, N'Happy Death Day 2U', 100, N'PG-13', N'Tree Gelbman discovers that dying over and over was surprisingly easier than the dangers that lie ahead.', N'https://fullmovieis.com/happydeathday2/images/happy-death-day-2-movie-poster-logo-big.png', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (7, N'Captain Marvel', 123, N'PG-13', N'Carol Danvers becomes one of the universes most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.', N'https://s3.amazonaws.com/com.marvel.terrigen/prod/captainmarvel_lob_crd_06.jpg', 5)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (8, N'Us', 116, N'R', N'A familys serene beach vacation turns to chaos when their doppelgängers appear and begin to terrorize them.', N'https://upload.wikimedia.org/wikipedia/en/thumb/0/00/Us_%282019%29_theatrical_poster.png/220px-Us_%282019%29_theatrical_poster.png', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (9, N'Pet Sematary', 101, N'R', N'A couple soon discovers a mysterious burial ground hidden deep in the woods near their new home.', N'https://is5-ssl.mzstatic.com/image/thumb/Video123/v4/94/78/a7/9478a7dc-50e7-1605-2745-b8e4ce555b95/pr_source.lsr/268x0w.png', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (10, N'Avengers: Endgame', 181, N'PG-13', N'The Avengers assemble once more in order to undo the actions of Thanos and restore order to the universe.', N'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg', 5)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (11, N'Pokémon Detective Pikachu', 104, N'PG', N'In a world where people collect Pokémon to do battle, a boy comes across an intelligent talking Pikachu who seeks to be a detective.', N'https://m.media-amazon.com/images/M/MV5BNDU4Mzc3NzE5NV5BMl5BanBnXkFtZTgwMzE1NzI1NzM@._V1_.jpg', 6)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (12, N'John Wick: Chapter 3 - Parabellum', 131, N'R', N'Super-assassin John Wick is on the run after killing a member of the international assassins guild', N'https://upload.wikimedia.org/wikipedia/en/thumb/9/94/John_Wick_Chapter_3_Parabellum.png/220px-John_Wick_Chapter_3_Parabellum.png', 5)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (13, N'Aladdin', 128, N'PG', N'A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.', N'https://imaging.broadway.com/images/custom/w735/103188-10.png', 6)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (14, N'Toy Story 4', 100, N'G', N'A road trip alongside old and new friends reveals how big the world can be for a toy.', N'https://images.fandango.com/ImageRenderer/200/0/redesign/static/img/default_poster.png/0/images/masterrepository/Fandango/185803/TS4_NeonBg_Trio_1s_v10_Mech2a.jpg', 8)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (15, N'The Secret Life of Pets 2', 86, N'PG', N'Continuing the story of Max and his pet friends, following their secret lives after their owners leave them for work or school each day.', N'https://movies.universalpictures.com/media/pt2-teaser1sheet-rgb-1sm-5be33cf7d2435-1.jpg', 8)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (16, N'Rocketman', 121, N'R', N'A musical fantasy about the fantastical human story of Elton Johns breakthrough years.', N'https://i.pinimg.com/originals/22/bd/07/22bd074c2e5223afb0b808c1c9773e4b.png', 3)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (17, N'Brightburn', 90, N'R', N'What if a child from another world crash-landed on Earth, but instead of becoming a hero to mankind, he proved to be something far more sinister?', N'https://upload.wikimedia.org/wikipedia/en/f/fa/Brightburn_film_poster.png', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (18, N'The Hustle', 93, N'PG-13', N'Female scam artists, one low rent and the other high class, who team up to take down the men who have wronged them.', N'https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/The_Hustle_film_poster.png/220px-The_Hustle_film_poster.png', 6)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (19, N'UglyDolls', 87, N'PG', N'An animated adventure in which the free-spirited UglyDolls confront what it means to be different.', N'https://upload.wikimedia.org/wikipedia/en/thumb/0/06/UglyDolls_%282019%29_theatrical_poster.png/220px-UglyDolls_%282019%29_theatrical_poster.png', 8)
INSERT [dbo].[Movies] ([MovieID], [Title], [Length], [Rating], [Description], [Trailer], [CategoryID]) VALUES (20, N'Shazam!', 132, N'PG-13', N'A streetwise fourteen-year-old foster kid can turn into the grown-up superhero Shazam.', N'https://m.media-amazon.com/images/M/MV5BYTE0Yjc1NzUtMjFjMC00Y2I3LTg3NGYtNGRlMGJhYThjMTJmXkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_.jpg', 6)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[MovieUsers] ON 

INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (1, 1, 5, CAST(N'2019-06-28T11:45:40.137' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (3, 6, 6, CAST(N'2019-06-28T11:45:40.137' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (6, 1, 1, CAST(N'2019-06-24T10:58:21.117' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (7, 13, 1, CAST(N'2019-06-24T15:22:05.803' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (8, 1, 9, CAST(N'2019-06-25T11:25:04.797' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (9, 6, 18, CAST(N'2019-06-28T13:17:14.410' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (10, 1, 18, CAST(N'2019-06-28T13:17:47.893' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (11, 1, 23, CAST(N'2019-07-08T15:10:26.680' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (12, 1, 24, CAST(N'2019-07-09T10:42:40.920' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (13, 2, 24, CAST(N'2019-07-09T10:43:13.897' AS DateTime))
INSERT [dbo].[MovieUsers] ([MovieUserID], [MovieID], [UserID], [Date]) VALUES (14, 1, 6, CAST(N'2019-07-09T11:19:07.327' AS DateTime))
SET IDENTITY_INSERT [dbo].[MovieUsers] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (2, N'Verified')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (3, N'Guest')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (1, N'spentoed', N'spentoed78@yahoo.com', N'jazzycircle33', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (2, N'vainbasement', N'27vainbasement@gmail.com', N'lazypump15', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (3, N'dashravine', N'7dashravine6@protonmail.com', N'hotgoose48', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (4, N'pilotquail', N'pilotquail86@mail.com', N'brownbunny75', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (5, N'arrivething', N'19arrivething@outlook.com', N'happycopper56', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (6, N'wiredcloud', N'wiredcloud57@yahoo.com', N'wireadmin09', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (7, N'Testing', N'Testing', N'Testing', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (8, N'Unverifed:68526508', N'Unverified', N'password', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (9, N'test:72862901', N'test@email.com', N'test', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (10, N'a', N'a', N'a', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (11, N'qwerty', N'qwerty@gmail.com', N'qwerty', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (12, N'a', N'qwed', N'qwed', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (14, N'qwer', N'qwer', N'qwer', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (15, N'1', N'1', N'1', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (16, N'x', N'x', N'x', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (17, N'mkiuy:1806835467', N'mkiuy', N'mkiuy', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (18, N'qw', N'qw@mail.com', N'qw', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (19, N'mav:1367663936', N'mV@mav.com', N'ww', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (20, N'cvn:1366064276', N'cnv', N'cvbn', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (22, N'asd:199015668', N'asd', N'asd', 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (23, N'qwed', N'qwed@qqwed', N'qwertf', 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [RoleID]) VALUES (24, N'poiu', N'poiu@mail.com', N'mkiu0', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20190607-151450]    Script Date: 7/9/2019 2:57:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20190607-151450] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20190610-130528]    Script Date: 7/9/2019 2:57:31 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190610-130528] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Categories]
GO
ALTER TABLE [dbo].[MovieUsers]  WITH CHECK ADD  CONSTRAINT [FK_MovieUsers_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieUsers] CHECK CONSTRAINT [FK_MovieUsers_Movies]
GO
ALTER TABLE [dbo].[MovieUsers]  WITH CHECK ADD  CONSTRAINT [FK_MovieUsers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MovieUsers] CHECK CONSTRAINT [FK_MovieUsers_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[CreateCategory]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateCategory]
	
@CategoryID int output,
@Category nvarchar(150)

AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO Categories
	(Category)
	values 
	(@Category)
	select @CategoryID=@@IDENTITY; /* contains last id value generated by the statement */
	
END
GO
/****** Object:  StoredProcedure [dbo].[CreateMovie]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateMovie]
	
@MovieID int output,
@Title nvarchar(150),
@Length int,
@Rating nvarchar(50),
@Description nvarchar(150),
@Trailer nvarchar(250),
@CategoryID int

AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO Movies
	(Title,Length,Rating,Description,Trailer,CategoryID)
	values 
	(@Title, @Length, @Rating, @Description, @Trailer, @CategoryID)
	select @MovieID=@@IDENTITY;
	
END
GO
/****** Object:  StoredProcedure [dbo].[CreateMovieUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateMovieUser] 
	-- Add the parameters for the stored procedure here
@MovieUserID int output,
@MovieID int,
@UserID int,
@Date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into MovieUsers
	(MovieID,UserID,Date)
	values
	(@MovieID,@UserID,@Date)
	select @MovieUserID=@@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateRole] 
	
	@RoleID int output, 
	@Role nvarchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

   
	INSERT INTO Roles
	(Role)
           
    VALUES 
	(@Role)
           

select @RoleID = @@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser]
	-- Add the parameters for the stored procedure here
	@UserID int output,
	@UserName nvarchar(150),
	@Email nvarchar(150),
	@Password nvarchar(150),
	@RoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Users
	(Username, Email, Password, RoleID)
	values
	(@UserName, @Email, @Password, @RoleID)
	select @UserID=@@IDENTITY; /* contains last id value generated by the statement */

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCategory]
	-- Add the parameters for the stored procedure here
@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Categories where @CategoryID=CategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMovie]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMovie]
	-- Add the parameters for the stored procedure here
	@MovieID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Movies where @MovieID=MovieID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMovieUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMovieUser]
	-- Add the parameters for the stored procedure here
	@MovieUserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from MovieUsers where @MovieUserID=MovieUserID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteRole]
	-- Add the parameters for the stored procedure here
	@RoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Roles where @RoleID=RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser] 
	-- Add the parameters for the stored procedure here
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Users where @UserID=UserID
END
GO
/****** Object:  StoredProcedure [dbo].[FindCategoryByID]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindCategoryByID] 
	-- Add the parameters for the stored procedure here
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryID,Category from Categories
	where @CategoryID=CategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[FindMovieByID]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindMovieByID]
	-- Add the parameters for the stored procedure here
	@MovieID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MovieID,Title,Length,Rating,Description,Trailer,Movies.CategoryID,
	Category
	From Movies
	inner join Categories on Movies.CategoryID=Categories.CategoryID
	where @MovieID=MovieID

END
GO
/****** Object:  StoredProcedure [dbo].[FindMovieUserByID]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindMovieUserByID] 
	-- Add the parameters for the stored procedure here
@MovieUserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MovieUserID,MovieUsers.MovieID,MovieUsers.UserID,Date,
	Username,
	Title,Length
	From MovieUsers
	inner join Users on Users.UserID=MovieUsers.UserID
	inner join Movies on Movies.MovieID=MovieUsers.MovieID
	where MovieUserID=@MovieUserID
END
GO
/****** Object:  StoredProcedure [dbo].[FindRoleByID]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindRoleByID] 
	-- Add the parameters for the stored procedure here
@RoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoleID, Role from Roles
	Where @RoleID=RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[FindUserByEmail]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUserByEmail]
	-- Add the parameters for the stored procedure here
	@Email nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID,Username,Email,Password,Users.RoleID,
	Role
	from Users
	inner join Roles on Users.RoleID=Roles.RoleID
	where @Email=Email
END
GO
/****** Object:  StoredProcedure [dbo].[FindUserByID]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUserByID] 
	-- Add the parameters for the stored procedure here
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID,UserName,Email,Password,Users.RoleID,
	Role /*related record*/
	from Users /*same shape as get*/
	inner join Roles on Users.RoleID=Roles.RoleID /*inner join*/
	where @UserID=UserID
END
GO
/****** Object:  StoredProcedure [dbo].[FindUserByUserName]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUserByUserName]
	-- Add the parameters for the stored procedure here
	@UsernName nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID,Username,Email,Password,Users.RoleID,
	Role
	from Users /*same format as other finds*/
	inner join Roles on Users.RoleID=Roles.RoleID
	where @UsernName=UserName
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategories]
	-- Add the parameters for the stored procedure here
	@skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	select CategoryID, Category from Categories
	order by CategoryID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetMovies]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMovies] 
	-- Add the parameters for the stored procedure here
	   @skip int,
	   @take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MovieID,Title,Length,Rating,Description,Trailer,Movies.CategoryID,
	Category
	from Movies
	inner join Categories on Movies.CategoryID=Categories.CategoryID
	order by MovieID offset @skip rows fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[GetMovieUsers]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMovieUsers]
	-- Add the parameters for the stored procedure here
	@skip int,
	@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MovieUserID,MovieUsers.MovieID,MovieUsers.UserID,Date,
	Username,
	Title,Length
	From MovieUsers
	inner join Users on Users.UserID=MovieUsers.UserID
	inner join Movies on Movies.MovieID=MovieUsers.MovieID
	order by MovieUserID offset @skip rows fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoles] 
	-- Add the parameters for the stored procedure here
	  @skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	select RoleID, Role from Roles 
	order by RoleID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUsers]
	-- Add the parameters for the stored procedure here
	@skip int,
	@take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID,UserName,Email,Password,Users.RoleID,
	Role
	from Users
	inner join Roles on Users.RoleID=Roles.RoleID
	order by UserID offset @skip rows fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertLogItem]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertLogItem] 
        @message varchar(250), 
        @stacktrace varchar(max)
AS
BEGIN
        INSERT INTO LogTrace
           ([Message]
           ,[Trace]
           ,[Time])
     VALUES
           (@message
           ,@stacktrace
           ,GetDate())
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateCategory]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateCategory]
	-- Add the parameters for the stored procedure here
	@CategoryID int,
	@Category nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Categories set Category=@Category
	where @CategoryID=CategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateMovie]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateMovie] 
	-- Add the parameters for the stored procedure here
	@MovieID int,
	@Title nvarchar(150),
	@Length int,
	@Rating nvarchar(50),
	@Description nvarchar(150),
	@Trailer nvarchar(250),
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Movies set Title=@Title,Length=@Length,Rating=@Rating,Description=@Description,Trailer=@Trailer,CategoryID=@CategoryID
	where @MovieID=MovieID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateMovieUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateMovieUser] 
	-- Add the parameters for the stored procedure here
@MovieUserID int,
@MovieID int,
@UserID int,
@Date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update MovieUsers set MovieID=@MovieID,UserID=@UserID,Date=@Date
	where MovieUserID=@MovieUserID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateRole]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateRole] 
	-- Add the parameters for the stored procedure here
	@RoleID int,
	@Role nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Roles set Role=@Role
	where @RoleID=RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateUser]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@UserName nvarchar(150),
	@Email nvarchar(150),
	@Password nvarchar(150),
	@RoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set UserName=@UserName, Email=@Email, Password=@Password, RoleID=@RoleID
	where @UserID=UserID
END
/*different from safe*/
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateCategory]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateCategory]
	@CategoryID int,
	@OldCategory nvarchar(150),
	@NewCategory nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @rv int
	SET NOCOUNT ON;
	 select @rv =  count(*) from Categories       where @CategoryID = CategoryID AND Category = @OldCategory
    -- Insert statements for procedure here
	update Categories set Category = @NewCategory where @CategoryID = CategoryID AND Category = @OldCategory
    return @rv
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateMovie]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateMovie] 
	-- Add the parameters for the stored procedure here
	@MovieID int,
	@NewTitle nvarchar(150),
	@OldTitle nvarchar(150),
	@NewLength int,
	@OldLength int,
	@NewRating nvarchar(50),
	@OldRating nvarchar(50),
	@NewDescription nvarchar(150),
	@OldDescription nvarchar(150),
	@NewTrailer nvarchar(250),
	@OldTrailer nvarchar(250),
	@NewCategoryID int,
	@OldCategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @rv int
	select @rv = count(*) from Movies where MovieID=@MovieID and Title=@OldTitle and Length=@OldLength and Rating=@OldRating and Description=@OldDescription and Trailer=@OldTrailer and CategoryID=@OldCategoryID
    -- Insert statements for procedure here
	update Movies set Title=@NewTitle,Length=@NewLength,Rating=@NewRating,Description=@NewDescription,Trailer=@NewTrailer,CategoryID=@NewCategoryID
	where MovieID=@MovieID and Title=@OldTitle and Length=@OldLength and Rating=@OldRating and Description=@OldDescription and Trailer=@OldTrailer and CategoryID=@OldCategoryID
	return @rv;
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateMovieUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateMovieUser] 
	-- Add the parameters for the stored procedure here
	@MovieUserID int,
	@NewMovieID int,
	@OldMovieID int,
	@NewUserID int,
	@OldUserID int,
	@NewDate datetime,
	@OldDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @rv int
	select @rv = count(*) from MovieUsers where MovieUserID=@MovieUserID and MovieID=@OldMovieID and UserID=@OldUserID and Date=@OldDate
	update MovieUsers set MovieID=@NewMovieID,UserID=@NewUserID,Date=@NewDate
	where MovieUserID=@MovieUserID and MovieID=@OldMovieID and UserID=@OldUserID and Date=@OldDate

	return @rv;
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateRole]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateRole] 
	-- Add the parameters for the stored procedure here
	@RoleID int,
	@OldRole nvarchar(100),
	@NewRole nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @rv int
	select @rv = count(*) from Roles where @RoleID = RoleID AND Role = @OldRole

    -- Insert statements for procedure here
	update Roles set Role = @NewRole where @RoleID = RoleID AND Role = @OldRole
	return @rv
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateUser]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateUser]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@OldUserName nvarchar(150),
	@NewUserName nvarchar(150),
	@OldEmail nvarchar(150),
	@NewEmail nvarchar(150),
	@OldPassword nvarchar(150),
	@NewPassword nvarchar(150),
	@OldRoleID int,
	@NewRoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET NOCOUNT ON;
	declare @rv int
	select @rv = count(*) from Users where UserID=@UserID and UserName=@OldUserName and Email=@OldEmail and Password=@OldPassword and RoleID=@OldRoleID

    -- Insert statements for procedure here
	Update Users set UserName=@NewUserName, Email=@NewEmail,Password=@NewPassword,RoleID=@NewRoleID
	where UserID=@UserID and UserName=@OldUserName and Email=@OldEmail and Password=@OldPassword and RoleID=@OldRoleID
	return @rv;
END
GO
/****** Object:  StoredProcedure [dbo].[TEST_Create]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TEST_Create] 

AS
BEGIN
/* @id is place holder for all storedproc auto incremented id's*/
	declare @id int;
/* create roles */
	exec CreateRole @id,'Admin';
	exec CreateRole @id,'Verified';
	exec CreateRole @id,'Guest';
/* create categories */
	exec CreateCategory @id,'Horror';
	exec CreateCategory @id,'War';
	exec CreateCategory @id,'Documentary';
	exec CreateCategory @id,'Western';
	exec CreateCategory @id,'Action';
	exec CreateCategory @id,'Comedy';
	exec CreateCategory @id,'Science Fiction';
	exec CreateCategory @id,'Animation';
	exec CreateCategory @id,'Crime';
	exec CreateCategory @id,'Romance';
/* create users */
	--exec CreateUser @id,'rivermud','rivermud97@gmail.com','happyclass17',3;
	--exec CreateUser @id,'olivestate','olivestate32@yahoo.com','angrysea52',3;
	--exec CreateUser @id,'rockwellsprawl','rockwellsprawl13@yahoo.com','loudstart22',3;
	--exec CreateUser @id,'lyneconsoling','777lyneconsoling@live.com','longsnake66',3;

	exec CreateUser @id,'spentoed','spentoed78@yahoo.com','jazzycircle33',2;
	exec CreateUser @id,'vainbasement','27vainbasement@gmail.com','lazypump15',2;
	exec CreateUser @id,'dashravine','7dashravine6@protonmail.com','hotgoose48',2;
	exec CreateUser @id,'pilotquail','pilotquail86@mail.com','brownbunny75',2;
	exec CreateUser @id,'arrivething','19arrivething@outlook.com','happycopper56',2;

	exec CreateUser @id,'wiredcloud','wiredcloud57@yahoo.com','wireadmin09',1;
/* create movies */
	exec CreateMovie @id,'The Godfather',175,'R','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.','https://cdn11.bigcommerce.com/s-cfnl8/images/stencil/1280x1280/products/804/1468/the-godfather-don-movie-poster-lg__83004.1386572899.jpg?c=2&imbypass=on',9;
	exec CreateMovie @id,'Forrest Gump',142,'PG-13','Watch history unfold through the perspective of an Alabama man with an IQ of 75.','https://images-na.ssl-images-amazon.com/images/I/71CHZi4vhWL._SY679_.jpg',10;
	exec CreateMovie @id,'Unbreakable',106,'PG-13','A man learns something extraordinary about himself after a devastating accident.','https://images-na.ssl-images-amazon.com/images/I/41-6emk6g6L.jpg',7;
	exec CreateMovie @id,'The Lord of the Rings: The Fellowship of the Ring',178,'PG-13','A Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.','https://d8mkdcmng3.imgix.net/b3a6/gifts-posters-lord-of-the-rings-fellowship-of-the-ring-one-sheet-maxi-poster.png?auto=format&bg=0FFF&fit=fill&h=600&q=100&w=600&s=4c29b6b64b90627c3b23b4cb04115752',5;
	exec CreateMovie @id,'The Lego Movie 2: The Second Part',107,'PG','It has been five years since everything was awesome and the citizens are facing a huge new threat','https://is5-ssl.mzstatic.com/image/thumb/Video124/v4/a1/f7/7f/a1f77f25-bcc3-7c6f-9ca6-69940606f4b2/pr_source.lsr/268x0w.png',8;
	exec CreateMovie @id,'Happy Death Day 2U',100,'PG-13','Tree Gelbman discovers that dying over and over was surprisingly easier than the dangers that lie ahead.','https://fullmovieis.com/happydeathday2/images/happy-death-day-2-movie-poster-logo-big.png',1;
	exec CreateMovie @id,'Captain Marvel',123,'PG-13','Carol Danvers becomes one of the universes most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.','https://s3.amazonaws.com/com.marvel.terrigen/prod/captainmarvel_lob_crd_06.jpg',5;
	exec CreateMovie @id,'Us',116,'R','A familys serene beach vacation turns to chaos when their doppelgängers appear and begin to terrorize them.','https://upload.wikimedia.org/wikipedia/en/thumb/0/00/Us_%282019%29_theatrical_poster.png/220px-Us_%282019%29_theatrical_poster.png',1;
	exec CreateMovie @id,'Pet Sematary',101,'R','A couple soon discovers a mysterious burial ground hidden deep in the woods near their new home.','https://is5-ssl.mzstatic.com/image/thumb/Video123/v4/94/78/a7/9478a7dc-50e7-1605-2745-b8e4ce555b95/pr_source.lsr/268x0w.png',1;
	exec CreateMovie @id,'Avengers: Endgame',181,'PG-13','The Avengers assemble once more in order to undo the actions of Thanos and restore order to the universe.','https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',5;
	exec CreateMovie @id,'Pokémon Detective Pikachu',104,'PG','In a world where people collect Pokémon to do battle, a boy comes across an intelligent talking Pikachu who seeks to be a detective.','https://m.media-amazon.com/images/M/MV5BNDU4Mzc3NzE5NV5BMl5BanBnXkFtZTgwMzE1NzI1NzM@._V1_.jpg',6;
	exec CreateMovie @id,'John Wick: Chapter 3 - Parabellum',131,'R','Super-assassin John Wick is on the run after killing a member of the international assassins guild','https://upload.wikimedia.org/wikipedia/en/thumb/9/94/John_Wick_Chapter_3_Parabellum.png/220px-John_Wick_Chapter_3_Parabellum.png',5;
	exec CreateMovie @id,'Aladdin',128,'PG','A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.','https://imaging.broadway.com/images/custom/w735/103188-10.png',6;
	exec CreateMovie @id,'Toy Story 4',100,'G','A road trip alongside old and new friends reveals how big the world can be for a toy.','https://images.fandango.com/ImageRenderer/200/0/redesign/static/img/default_poster.png/0/images/masterrepository/Fandango/185803/TS4_NeonBg_Trio_1s_v10_Mech2a.jpg',8;
	exec CreateMovie @id,'The Secret Life of Pets 2',86,'PG','Continuing the story of Max and his pet friends, following their secret lives after their owners leave them for work or school each day.','https://movies.universalpictures.com/media/pt2-teaser1sheet-rgb-1sm-5be33cf7d2435-1.jpg',8;
	exec CreateMovie @id,'Rocketman',121,'R','A musical fantasy about the fantastical human story of Elton Johns breakthrough years.','https://i.pinimg.com/originals/22/bd/07/22bd074c2e5223afb0b808c1c9773e4b.png',3;
	exec CreateMovie @id,'Brightburn',90,'R','What if a child from another world crash-landed on Earth, but instead of becoming a hero to mankind, he proved to be something far more sinister?','https://upload.wikimedia.org/wikipedia/en/f/fa/Brightburn_film_poster.png',1;
	exec CreateMovie @id,'The Hustle',93,'PG-13','Female scam artists, one low rent and the other high class, who team up to take down the men who have wronged them.','https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/The_Hustle_film_poster.png/220px-The_Hustle_film_poster.png',6;
	exec CreateMovie @id,'UglyDolls',87,'PG','An animated adventure in which the free-spirited UglyDolls confront what it means to be different.','https://upload.wikimedia.org/wikipedia/en/thumb/0/06/UglyDolls_%282019%29_theatrical_poster.png/220px-UglyDolls_%282019%29_theatrical_poster.png',8;
	exec CreateMovie @id,'Shazam!',132,'PG-13','A streetwise fourteen-year-old foster kid can turn into the grown-up superhero Shazam.','https://m.media-amazon.com/images/M/MV5BYTE0Yjc1NzUtMjFjMC00Y2I3LTg3NGYtNGRlMGJhYThjMTJmXkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_.jpg',6;
/* create movieusers */
	declare @date datetime 
	 select @Date = dateadd(dd,7,getdate()) /* needed or else exception is thrown */
	exec CreateMovieUser @id,1,5,@date;
	exec CreateMovieUser @id,5,9,@date;
	exec CreateMovieUser @id,6,6,@date;
	exec CreateMovieUser @id,3,7,@date;
	exec CreateMovieUser @id,10,8,@date;







END

GO
/****** Object:  StoredProcedure [dbo].[TEST_ResetDatabase]    Script Date: 7/9/2019 2:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TEST_ResetDatabase] 
AS
BEGIN
	/* Detele all records from all tables */
	delete from Categories;
	delete from Roles;
	delete from Movies;
	delete from Users;
	delete from MovieUsers;
	
	/* Reseed all id numbers back to 0 */
	DBCC CHECKIDENT ('Categories', RESEED, 0)  
    DBCC CHECKIDENT ('Movies', RESEED, 0)  
	DBCC CHECKIDENT ('MovieUsers', RESEED, 0)  
	DBCC CHECKIDENT ('Roles', RESEED, 0)  
	DBCC CHECKIDENT ('Users', RESEED, 0)  	
END
GO
USE [master]
GO
ALTER DATABASE [FlixOnTheNet] SET  READ_WRITE 
GO
