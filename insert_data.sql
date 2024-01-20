USE GreenRoom
GO

-- Insert data into [dbo].[Account]
INSERT INTO [GreenRoom].[dbo].[Account] ([userMail], [userPassword], [userRole])
VALUES
('hungdog@gmail.com', '12345678', 1),
('hungtoiloi@gmail.com', '12345678', 1),
('phamthang@gmail.com', '12345678', 1),
('quocviet@gmail.com', '12345678', 1),
('maitu@gmail.com', '12345678', 1),
('hung@gmail.com', '12345678', 1),
('Baove@gmail.com', '12345678', 2),
('maitu2@gmail.com', '12345678', 2),
('jhungdog@gmail.com', '12345678', 3),
('admingreenroom@gmail.com', 'admin123', 4);


-- Insert data into [dbo].[User]
INSERT INTO [GreenRoom].[dbo].[User] ([userName], [userGender], [userBirth], [userAddress], [userPhone], [userAvatar])
VALUES
('Hung Dog', 'Female', '1992-08-22', '69 Tran Duy Hung, Ha Noi', '12345678902', '/Image/avatar1.jpg'),
('Hung Bat Luc', 'Male', '1988-03-10', '156 Pho Co, Ha Noi', '98765432110', '/Image/avatar2.jpg'),
('Eva Smith', 'Female', '1993-12-05', '123 Pine St, Townsville', '87654321099', '/Image/avatar3.jpg'),
('David Miller', 'Male', '1997-05-18', '789 Oak St, Cityville', '23456789012', '/Image/avatar4.jpg'),
('Grace Davis', 'Female', '1990-11-30', '456 Cedar St, Villagetown', '34567890123', '/Image/avatar5.jpg'),
('Frank White', 'Male', '1985-09-14', '123 Elm St, Townsville', '45678901234', '/Image/avatar6.jpg'),
('Helen Wilson', 'Female', '1995-02-25', '789 Walnut St, Citytown', '56789012345', '/Image/avatar7.jpg'),
('George Adams', 'Male', '1989-07-07', '456 Oak St, Villagetown', '67890123456', '/Image/avatar8.jpg'),
('Ivy Turner', 'Female', '1994-04-12', '123 Pine St, Cityville', '78901234567', '/Image/avatar9.jpg'),
('John Smith', 'Male', '1987-01-03', '789 Maple St, Townsville', '89012345678', '/Image/avatar10.jpg');


-- Insert data into [dbo].[Room_Item]
INSERT INTO [GreenRoom].[dbo].[Room_Item] ([singleBed], [bunk], [chair], [ceilingFans], [airConditional])
VALUES
(2, 3, 4, 1, 1),
(1, 2, 3, 0, 1),
(3, 1, 2, 1, 0);

-- Insert data into [dbo].[Room]
INSERT INTO [GreenRoom].[dbo].[Room] ([roomFloor], [roomNumber], [roomItemID], [roomSize], [roomImg])
VALUES
(1, '101', 1, 'Large', '/Image/room1.jpg'),
(2, '202', 2, 'Medium', '/Image/room2.jpg'),
(3, '303', 3, 'Small', '/Image/room3.jpg');

-- Insert data into [dbo].[Renter]
INSERT INTO [GreenRoom].[dbo].[Renter] ([userID], [roomID], [renterStatus], [renterHaveRoom])
VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1),
(4, null, 0, 0),
(5, 2, 1, 1),
(6, 3, 1, 1);

-- Insert data into [dbo].[Bill]
INSERT INTO [GreenRoom].[dbo].[Bill] ([billService], [roomID], [billElectric], [billWater], [billRoom], [billPenalty], [billStatus])
VALUES
(1, 1, 100, 50, 500, NULL, 1),
(2, 2, 150, 75, 600, 25, 0),
(3, 3, 120, 60, 550, NULL, 1);

-- Insert data into [dbo].[Penalty]
INSERT INTO [GreenRoom].[dbo].[Penalty] ([userID], [title], [description], [penMoney], [penStatus])
VALUES
(1, 'Late Payment', 'The rent was paid after the due date.', 300000, 0),
(1, 'Damages', 'Damage to property during the stay.', 500000, 0),
(2, 'Violation', 'Violation of community rules.', 200000, 0);

-- Insert data into [dbo].[GuideOrRule]
INSERT INTO [GreenRoom].[dbo].[GuideOrRule] ([userID], [guideOrRule], [grName], [grImg])
VALUES
(1, 1, 'Community Guidelines', '/Image/guide1.jpg'),
(2, 1, 'House Rules', '/Image/guide2.jpg'),
(3, 0, 'Emergency Procedures', '/Image/guide3.jpg');

-- Insert data into [dbo].[News]
INSERT INTO [GreenRoom].[dbo].[News] ([ownerID], [newsTitle], [newsDes])
VALUES
(1, 'Community Event', 'Join us for a community gathering on Saturday.'),
(2, 'Important Update', 'Read the latest updates on property maintenance.'),
(3, 'Emergency Alert', 'Important information regarding emergency procedures.');

-- Insert data into [dbo].[Security]
INSERT INTO [GreenRoom].[dbo].[Security] ([userID], [sShift])
VALUES
(1, 1),
(2, 0),
(3, 1);

-- Insert data into [dbo].[Service]
INSERT INTO [GreenRoom].[dbo].[Service] ([userID], [seClean], [seWifi])
VALUES
(1, 1, 1),
(2, 0, 1),
(3, 1, 0);

-- Insert data into [dbo].[Task]
INSERT INTO [GreenRoom].[dbo].[Task] ([from], [to], [title], [des], [date])
VALUES
(1, 2, 'Maintenance Request', 'Fix the leaky faucet in Room 101.', '2024-01-16'),
(2, 3, 'Security Check', 'Inspect security cameras and alarms.', '2024-01-17'),
(3, 1, 'Cleaning Duty', 'Clean common areas and hallways.', '2024-01-18');
