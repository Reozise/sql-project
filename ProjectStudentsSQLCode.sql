CREATE DATABASE"Students"

USE [Students];
GO

CREATE TABLE [dbo].[Time] (
    [time_id] INT NOT NULL PRIMARY KEY,
    [date] DATE NOT NULL,
    [hour] INT NOT NULL,
    [year] INT NOT NULL,
    [month] VARCHAR(50) NOT NULL,
    [season] VARCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[Person] (
    [person_id] INT NOT NULL PRIMARY KEY,
    [first_name] NCHAR(255) NOT NULL,
    [last_name] NCHAR(255) NOT NULL,
    [gender] NCHAR(255) NOT NULL,
    [education_type] NCHAR(255) NOT NULL,
    [birth_date] DATE NOT NULL,
    [residence_city] NCHAR(255) NOT NULL,
    [study_city] NCHAR(255) NOT NULL,
    [student_index] DECIMAL NOT NULL
);


CREATE TABLE [dbo].[City] (
    [city_id] INT NOT NULL PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
);

CREATE TABLE [dbo].[Payment_Method] (
    [payment_method_id] INT NOT NULL PRIMARY KEY,
    [name] NCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[Expense_Category] (
    [category_id] INT NOT NULL PRIMARY KEY,
    [name] NCHAR(255) NOT NULL,
    [type] NCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[Income_Type] (
    [income_type_id] INT NOT NULL PRIMARY KEY,
    [name] NCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[Student_Expenses] (
    [expense_id] BIGINT NOT NULL PRIMARY KEY,
    [time_id] INT NOT NULL REFERENCES [dbo].[Time](time_id),
    [person_id] INT NOT NULL REFERENCES [dbo].[Person](person_id),
    [payment_method_id] INT NOT NULL REFERENCES [dbo].[Payment_Method](payment_method_id),
    [category_id] INT NOT NULL REFERENCES [dbo].[Expense_Category](category_id),
    [city_id] INT NOT NULL REFERENCES [dbo].[City](city_id),
    [amount] FLOAT NOT NULL,
    [quantity] INT NOT NULL
);

CREATE TABLE [dbo].[Student_Income] (
    [income_id] BIGINT NOT NULL PRIMARY KEY,
    [time_id] INT NOT NULL REFERENCES [dbo].[Time](time_id),
    [person_id] INT NOT NULL REFERENCES [dbo].[Person](person_id),
    [income_type_id] INT NOT NULL REFERENCES [dbo].[Income_Type](income_type_id),
    [amount] FLOAT NOT NULL,
    [quantity] INT NOT NULL
);

CREATE TABLE [dbo].[Place] (
    [place_id] INT NOT NULL PRIMARY KEY,
    [name] NCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[Activity_Type] (
    [type_id] INT NOT NULL PRIMARY KEY,
    [name] NCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[Hour] (
    [hour_id] INT NOT NULL PRIMARY KEY,
    [start_time] TIME NOT NULL,
    [hour_count] INT NOT NULL
);

CREATE TABLE [dbo].[Activities] (
    [activity_id] BIGINT NOT NULL PRIMARY KEY,
    [time_id] INT NOT NULL REFERENCES [dbo].[Time](time_id),
    [city_id] INT NOT NULL REFERENCES [dbo].[City](city_id),
    [place_id] INT NOT NULL REFERENCES [dbo].[Place](place_id),
    [type_id] INT NOT NULL REFERENCES [dbo].[Activity_Type](type_id),
    [person_id] INT NOT NULL REFERENCES [dbo].[Person](person_id),
    [hour_id] INT NOT NULL REFERENCES [dbo].[Hour](hour_id),
    [hours_spent] DECIMAL NOT NULL,
    [calories_burned] DECIMAL NOT NULL
);

INSERT INTO [dbo].[Time] VALUES 
(1, '2025-04-01', 10, 2025, 'April', 'Spring'),
(2, '2025-04-02', 14, 2025, 'April', 'Spring'),
(3, '2025-05-10', 9, 2025, 'May', 'Spring'),
(4, '2025-06-01', 18, 2025, 'June', 'Summer');

INSERT INTO [dbo].[Person] VALUES 
(1, N'Anna', N'Kowalska', N'Female', N'Bachelor', '2001-05-10', N'Warsaw', N'Warsaw', 123456),
(2, N'Jan', N'Nowak', N'Male', N'Master', '2000-02-15', N'Gdañsk', N'Poznañ', 234567),
(3, N'Maria', N'Zieliñska', N'Female', N'Bachelor', '2002-08-20', N'Lublin', N'Wroc³aw', 345678),
(4, N'Piotr', N'Wiœniewski', N'Male', N'Engineer', '1999-12-01', N'Rzeszów', N'Warsaw', 456789);

INSERT INTO [dbo].[City] VALUES 
(1, 'Krakow'),
(2, 'Warsaw'),
(3, 'Gdañsk'),
(4, 'Lublin');

INSERT INTO [dbo].[Payment_Method] VALUES 
(1, N'Card'),
(2, N'Cash'),
(3, N'Blik'),
(4, N'Bank Transfer');

INSERT INTO [dbo].[Expense_Category] VALUES 
(1, N'Food', N'Essential'),
(2, N'Transport', N'Essential'),
(3, N'Entertainment', N'Optional'),
(4, N'Books', N'Education');

INSERT INTO [dbo].[Income_Type] VALUES 
(1, N'Scholarship'),
(2, N'Part-time Job'),
(3, N'Family Support'),
(4, N'Grant');

INSERT INTO [dbo].[Student_Expenses] VALUES 
(1, 1, 1, 1, 1, 1, 50.0, 1),
(2, 2, 2, 2, 2, 2, 20.0, 2),
(3, 3, 3, 3, 3, 3, 100.0, 1),
(4, 4, 4, 4, 4, 4, 35.5, 3);

INSERT INTO [dbo].[Student_Income] VALUES 
(1, 1, 1, 1, 1000.0, 1),
(2, 2, 2, 2, 1500.0, 1),
(3, 3, 3, 3, 500.0, 1),
(4, 4, 4, 4, 800.0, 1);

INSERT INTO [dbo].[Place] VALUES 
(1, N'Gym'),
(2, N'Library'),
(3, N'Student Club'),
(4, N'Park');

INSERT INTO [dbo].[Activity_Type] VALUES 
(1, N'Sport'),
(2, N'Studying'),
(3, N'Chilling'),
(4, N'Running');

INSERT INTO [dbo].[Hour] VALUES 
(1, '18:00:00', 2),
(2, '12:00:00', 1),
(3, '20:30:00', 3),
(4, '07:00:00', 2);

INSERT INTO [dbo].[Activities] VALUES 
(1, 1, 1, 1, 1, 1, 1, 2.0, 500.0),
(2, 2, 2, 2, 2, 2, 2, 1.5, 200.0),
(3, 3, 3, 3, 3, 3, 3, 2.0, 100.0),
(4, 4, 4, 4, 4, 4, 4, 3.0, 450.0);

