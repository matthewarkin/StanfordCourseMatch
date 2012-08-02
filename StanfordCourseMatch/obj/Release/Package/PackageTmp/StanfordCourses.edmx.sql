
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 08/01/2012 23:54:46
-- Generated from EDMX file: C:\Users\Matthew Arkin\documents\visual studio 11\Projects\StanfordCourseMatch\StanfordCourseMatch\StanfordCourses.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [StanfordCourseMatch];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_LectureSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sections] DROP CONSTRAINT [FK_LectureSection];
GO
IF OBJECT_ID(N'[dbo].[FK_SectionUser_Section]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SectionUser] DROP CONSTRAINT [FK_SectionUser_Section];
GO
IF OBJECT_ID(N'[dbo].[FK_SectionUser_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SectionUser] DROP CONSTRAINT [FK_SectionUser_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Lectures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lectures];
GO
IF OBJECT_ID(N'[dbo].[Sections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sections];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[SectionUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SectionUser];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Lectures'
CREATE TABLE [dbo].[Lectures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Faculty] nvarchar(max)  NULL,
    [Time] nvarchar(max)  NULL,
    [Location] nvarchar(max)  NULL
);
GO

-- Creating table 'Sections'
CREATE TABLE [dbo].[Sections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SectionNumber] nvarchar(max)  NOT NULL,
    [Fellow] nvarchar(max)  NULL,
    [Time] nvarchar(max)  NULL,
    [Location] nvarchar(max)  NULL,
    [LectureId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [FacebookPhoto] nvarchar(max)  NOT NULL,
    [FacebookUrl] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SectionUser'
CREATE TABLE [dbo].[SectionUser] (
    [Sections_Id] int  NOT NULL,
    [Users_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Lectures'
ALTER TABLE [dbo].[Lectures]
ADD CONSTRAINT [PK_Lectures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [PK_Sections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Sections_Id], [Users_Id] in table 'SectionUser'
ALTER TABLE [dbo].[SectionUser]
ADD CONSTRAINT [PK_SectionUser]
    PRIMARY KEY NONCLUSTERED ([Sections_Id], [Users_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LectureId] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [FK_LectureSection]
    FOREIGN KEY ([LectureId])
    REFERENCES [dbo].[Lectures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LectureSection'
CREATE INDEX [IX_FK_LectureSection]
ON [dbo].[Sections]
    ([LectureId]);
GO

-- Creating foreign key on [Sections_Id] in table 'SectionUser'
ALTER TABLE [dbo].[SectionUser]
ADD CONSTRAINT [FK_SectionUser_Section]
    FOREIGN KEY ([Sections_Id])
    REFERENCES [dbo].[Sections]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_Id] in table 'SectionUser'
ALTER TABLE [dbo].[SectionUser]
ADD CONSTRAINT [FK_SectionUser_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionUser_User'
CREATE INDEX [IX_FK_SectionUser_User]
ON [dbo].[SectionUser]
    ([Users_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------