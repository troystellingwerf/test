CREATE TABLE [dbo].[Users] (
    [UserId]     VARCHAR (30) NOT NULL,
    [First_Name] VARCHAR (30) NOT NULL,
    [Last_Name]  VARCHAR (30) NOT NULL,
    [role]       VARCHAR (30) NULL,
    CONSTRAINT [Pk_dbo.Users] PRIMARY KEY CLUSTERED ([UserId] ASC)
);

CREATE TABLE [dbo].[Courses] (
    [Course_Code] VARCHAR (30)  NOT NULL,
    [topic]       VARCHAR (30)  NOT NULL,
    [Description] VARCHAR (100) NULL,
    [Semester]    VARCHAR (5)   NOT NULL,
    [Pre_Req]     VARCHAR (30)  NULL,
    [Compulsory]  VARCHAR (1)   NOT NULL,
    CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED ([Course_Code] ASC)
);

CREATE TABLE [dbo].[Planning] (
    [UserId]         VARCHAR (30) NOT NULL,
    [Course_Code]    VARCHAR (30) NOT NULL,
    [Year]           INT          NOT NULL,
    [Semester_taken] VARCHAR (5)  NOT NULL,
    [Grade]          VARCHAR (5)  NULL,
    CONSTRAINT [PK_dbo.Planning] PRIMARY KEY CLUSTERED ([UserId] ASC, [Course_Code] ASC, [Year] ASC, [Semester_taken] ASC),
    CONSTRAINT [FK_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]),
    CONSTRAINT [FK_Coursecode] FOREIGN KEY ([Course_Code]) REFERENCES [dbo].[Courses] ([Course_Code])
);

CREATE TABLE [dbo].[Attendance] (
    [Course_Code] VARCHAR (30) NOT NULL,
    [UserId]      VARCHAR (30) NOT NULL,
    [Date/Time]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_dbo.Attendance] PRIMARY KEY CLUSTERED ([Course_Code] ASC, [UserId] ASC, [Date/Time] ASC),
    CONSTRAINT [FK_Coursescode] FOREIGN KEY ([Course_Code]) REFERENCES [dbo].[Courses] ([Course_Code]),
    CONSTRAINT [FK_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
);

