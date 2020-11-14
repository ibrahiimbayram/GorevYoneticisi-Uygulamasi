USE [ProjectDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[SurName] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskDate]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskDate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaskDate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 8.11.2020 22:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[TaskDate] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[FinishDate] [datetime2](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201107112937_First', N'3.1.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201107212811_Second', N'3.1.9')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201108162153_Seco', N'3.1.9')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'User', N'USER', N'4289083b-45c3-4e2b-96b6-b6762d050302')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (10, 1)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (11, 1)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [SurName], [ImagePath], [Password]) VALUES (10, N'admin', N'ADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEG7OJaqXM2sDoi1ISPBXHp2HRl6xQXJgx0U0qVLTyfZupfgASegDH4ZupHrdr3AcEw==', N'KHR7KU7CHKFIBINEQCGBH3C2IF4CEFUR', N'c768fbec-62a4-4661-8e3b-ae6e02ca31f6', NULL, 0, 0, NULL, 1, 0, N'admin', N'admin', NULL, N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [SurName], [ImagePath], [Password]) VALUES (11, N'ibrahim', N'IBRAHIM', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEMfPisNDc7vWzuMu6vRZzr1xu6+q8XLIn37uQTaAxDGnaQjhnM+TzN3UycFFJcCmBg==', N'WQBR7WARHFQVV6H7JZU2MBVM3VG7CSEC', N'fadca268-33d0-494c-af9e-b7b939debfb6', NULL, 0, 0, NULL, 1, 0, N'ibrahim', N'ibrahim', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskDate] ON 
GO
INSERT [dbo].[TaskDate] ([Id], [Name]) VALUES (1, N'Günlük')
GO
INSERT [dbo].[TaskDate] ([Id], [Name]) VALUES (2, N'Haftalık')
GO
INSERT [dbo].[TaskDate] ([Id], [Name]) VALUES (3, N'Aylık')
GO
SET IDENTITY_INSERT [dbo].[TaskDate] OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (2, N'Proje Ödevi', N'Kitap Oku', N'Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;
<h3>Doğru uyku</h3>
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;', 2, CAST(N'2020-11-07T16:00:48.3185328' AS DateTime2), CAST(N'2020-11-07T16:00:48.3197760' AS DateTime2), 10, N'Active')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (6, N'Projeyi Tamamla', N'Projeyi Tamamla', N'Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;
<h3>Doğru uyku</h3>
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;', 3, CAST(N'2020-11-07T16:33:04.0498591' AS DateTime2), CAST(N'2020-12-07T16:33:04.0498676' AS DateTime2), 10, N'Completed')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (7, N'Ders Çalış', N'Uzun süredir menajer, kariyer danışmanı', N'Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;
<h3>Doğru uyku</h3>
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;', 2, CAST(N'2020-11-07T20:08:45.0871981' AS DateTime2), CAST(N'2020-11-08T20:08:45.0872841' AS DateTime2), 10, N'Completed')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (8, N'Toplantı Yap', N'Uzun süredir menajer, kariyer danışmanı,', N'Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;
<h3>Doğru uyku</h3>
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Doğru uyku ve doğru dinlenmenin sahadaki kararlarını olumlu y&ouml;nde etkilediğini ifade eden Yusuf, bir g&uuml;n&uuml;n&uuml;n nasıl ge&ccedil;tiğini ş&ouml;yle anlattı: &ldquo;Genelde sabah uyanıp evde kendime yarım saatlik bir zaman yaratıyorum d&uuml;nyadaki gelişmeleri takip etmek i&ccedil;in. Ardından tesislere ge&ccedil;iyorum, kahvaltı ve antrenman i&ccedil;in. İdman sonrasında dinlenmem var. Arkasından o haftaki programa g&ouml;re fitness ve ekstra antrenmanlarımı yapıyorum. Bu aralarda uygun zamanlara beslenmeyi koyuyoruz. İngilizce ve Fransızca derslerimi akşam saatlerine planlıyoruz. D&uuml;zenli aralıklarla spor psikoloğumla seanslar yapıyorum.&rdquo;<br />
<br />
Uzun s&uuml;redir menajer, kariyer danışmanı, spor psikoloğu ve diyetisyenden oluşan bir ekiple &ccedil;alıştığını belirten 23 yaşındaki futbolcu, &ldquo;Her alanın profesyonellerinden oluşan bir ekibimiz var. Sadece bug&uuml;n&uuml;, yarını değil, bundan 10-15 sene sonrayı da planlıyoruz&rdquo; dedi. Uyku ko&ccedil;u Nick Littlehales&rsquo;ın 2 ay &ouml;nce ekibe dahil olduğunu ifade eden Yusuf, &ldquo;Nick&rsquo;le başta iki toplantı yaptık. G&uuml;nl&uuml;k rutinim, alışkanlıklarım kayıt altına alındı. Sonra 80 soruluk bir test &ccedil;&ouml;zd&uuml;k. Evin sıcaklık derecesinden, g&uuml;nl&uuml;k beslenmeye kadar bir&ccedil;ok veriye dayanarak bir uyku sistemi belirledik. Dinlendiğim ortamı da Nick&rsquo;in tavsiyelerine g&ouml;re revize ettik. Havalandırması, ışıklandırması, kullandığım yastık vs&rdquo; diye konuştu.&nbsp;', 2, CAST(N'2020-11-07T20:09:42.5857463' AS DateTime2), CAST(N'2020-11-14T20:09:42.5857530' AS DateTime2), 10, N'Completed')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (12, N'b', N'b', N'b', 2, CAST(N'2020-11-07T21:19:17.5047185' AS DateTime2), CAST(N'2020-11-14T21:19:17.5047248' AS DateTime2), 10, N'Completed')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (15, N'deneme', N'deneme', N'deneme', 1, CAST(N'2020-11-08T15:04:21.6399352' AS DateTime2), CAST(N'2020-11-09T15:04:21.6401723' AS DateTime2), 11, N'Active')
GO
INSERT [dbo].[Tasks] ([Id], [Title], [ShortDescription], [Description], [TaskDate], [StartDate], [FinishDate], [AppUserId], [Status]) VALUES (16, N'Proje Yap', N'Proje Yap', N'Proje Yap', 1, CAST(N'2020-11-08T22:08:43.2628355' AS DateTime2), CAST(N'2020-11-09T22:08:43.2629430' AS DateTime2), 10, N'Active')
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
