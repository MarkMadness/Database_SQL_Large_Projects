use finalProject1
go

--========================================================================================================
-- CREATED TABLES
--========================================================================================================
create table Library_Branch(
	BranchID int primary key not null identity (1001,1),
	BranchName varchar(50) not null,
	BranchAddress varchar(50) not null
)

create table Borrower(
	CardNo int primary key not null identity (1,1),
	BorrowerName varchar(50) not null,
	BorrowerAddress varchar(50) not null,
	BorrowerPhone varchar(50) not null
)

create table Publisher(
	PublisherName varchar(50) primary key not null,
	PublisherAddress varchar(50) not null,
	PublisherPhone varchar(50) not null
)

create table Books(
	BookID int primary key not null identity (501,1),
	BookTitle varchar(50) not null,
	PublisherName varchar(50) not null constraint fk_PublisherName foreign key references Publisher(PublisherName)
)

create table Book_Loans(
	BookID int not null constraint fk_BookID foreign key references Books(BookID),
	BranchID int not null constraint fk_BranchID foreign key references Library_Branch(BranchID),
	CardNo int not null constraint fk_CardNo foreign key references Borrower(CardNo),
	DateOut varchar(50) not null,
	DateDue varchar(50) not null
)

create table Book_Authors(
	BookID int not null constraint fk_BookID2 foreign key references Books(BookID),
	AuthorName varchar(50) not null
)

create table Book_Copies(
	BookID int not null constraint fk_BookID3 foreign key references Books(BookID),
	BranchID int not null constraint fk_BranchID2 foreign key references Library_Branch(BranchID),
	Number_Of_Copies int not null
)


--========================================================================================================
-- INSERT DATA INTO TABLES
--========================================================================================================


insert into Library_Branch
	--BranchID primary identity (1001,1)
	(BranchName, BranchAddress)
	values
	('Sharpstown', '111 Street'),
	('Central', '112 Street'),
	('Holding', '113 Street'),
	('Summit', '114 Street');



insert into Borrower
	--CardNo primary identity (1,1)
	(BorrowerName, BorrowerAddress, BorrowerPhone)
	values
	('Kevin Smith', '123 First Street', '111-111-1111'),
	('Sara Colburn', '456 Second Street', '111-111-1111'),
	('Zak Burton', '789 Third Street', '111-111-1111'),
	('Oliver Spencer', '134 Fourth Street', '111-111-1111'),
	('Orlando Morrow', '145 Fifth Street', '111-111-1111'),

	('Alison Chase', '156 Sixth Street', '111-111-1111'),
	('Amanda Witt', '167 Seventh Street', '111-111-1111'),
	('Harley Scott',  '178 Eighth Street', '111-111-1111');



insert into Publisher
	(PublisherName, PublisherAddress, PublisherPhone)
	values
	('Sharphouse Publishing', '1111 Street', '111-111-1111'),
	('Griffin Light', '1111 Street', '111-111-1111'),
	('ShadeArt Pages', '1111 Street', '111-111-1111'),
	('Grizzly Comic Productions', '1111 Street', '111-111-1111'),
	('Turtle Bindings', '1111 Street', '111-111-1111'),

	('Wonderpoly Publishing', '1111 Street', '111-111-1111'),
	('Mermedia Publishing', '1111 Street', '111-111-1111'),
	('Beeway House', '1111 Street', '111-111-1111'),
	('Dream Productions', '1111 Street', '111-111-1111'),
	('Venus Pages', '1111 Street', '111-111-1111'),

	('Author Solutions', '1111 Street', '111-111-1111'),
	('AlphaWalk', '1111 Street', '111-111-1111'),
	('Globeshine', '1111 Street', '111-111-1111'),
	('Apple Brew Publisher', '1111 Street', '111-111-1111'),
	('PaperCorp', '1111 Street', '111-111-1111'),

	('Reading Records', '1111 Street', '111-111-1111'),
	('The Historians Association', '1111 Street', '111-111-1111'),
	('The Devil Advocates', '1111 Street', '111-111-1111'),
	('Mead Publishing', '1111 Street', '111-111-1111'),
	('Drama Pages', '1111 Street', '111-111-1111');



insert into Books
	--BookID primary identity (501,1)
	(BookTitle, PublisherName)
	values
	('The Lost Tribe', 'Sharphouse Publishing'),
	('Sailing for Dummies', 'Griffin Light'),
	('Master Cookbook', 'ShadeArt Pages'),
	('Tips and Advice before Adventuring', 'Grizzly Comic Productions'),
	('Legend of the Mountain King', 'Turtle Bindings'),

	('Mercenary 101', 'Wonderpoly Publishing'),
	('Punished By the Emperor', 'Mermedia Publishing'),
	('How to buy Goats', 'Beeway House'),
	('The Tale of the Brother Soldiers', 'Dream Productions'),
	('Erbis the Sky Maker', 'Venus Pages'),

	('Whispers From Beyond', 'Author Solutions'),
	('SwordFighting: Beginners Guide', 'AlphaWalk'),
	('Who is Jofus?', 'Globeshine'),
	('Mastering the Art of Not Giving a Shit!', 'Apple Brew Publisher'),
	('The Foundation of Money', 'PaperCorp'),

	('Astronomy', 'Reading Records'),
	('The Crimson Syndicate', 'The Historians Association'),
	('Inside the Nine Hells', 'The Devil Advocates'),
	('How to Understand Dwarves', 'Mead Publishing'),
	('The Housewives of the Underdark', 'Drama Pages'),

	('The Dark Tower: The Gunslinger', 'Drama Pages'),
	('Carrie', 'Drama Pages');



insert into Book_Loans 
	(BookId, BranchID, CardNo, DateOut, DateDue)
	values
	(501, 1001, 1, '9-1-19', '9-12-19'),
	(502, 1001, 1, '9-10-19', '9-24-19'),
	(503, 1001, 1, '9-11-19', '9-25-19'),
	(504, 1001, 1, '9-12-19', '9-26-19'),
	(505, 1001, 1, '9-13-19', '9-27-19'),

	(506, 1001, 2, '9-14-19', '9-28-19'),
	(507, 1001, 2, '9-15-19', '9-29-19'),
	(508, 1001, 2, '9-16-19', '9-30-19'),
	(509, 1001, 2, '9-17-19', '9-31-19'),
	(510, 1001, 2, '9-18-19', '10-1-19'),

	(501, 1002, 3, '9-19-19', '10-2-19'),
	(502, 1002, 5, '9-20-19', '10-3-19');



insert into Book_Authors
	(BookID, AuthorName)
	values
	(501, 'James Brendan'),
	(502, 'Sean Stone'),
	(503, 'Taylor Miller'),
	(504, 'Hector Lewes'),
	(505, 'Lucian McCarthy'),

	(506, 'Cora Carter'),
	(507, 'Aliya Butler'),
	(508, 'Sean Cook'),
	(509, 'Roman James'),
	(510, 'Freya Ross'),

	(511, 'Kara Hawkins'),
	(512, 'Chloe Powell'),
	(513, 'Raya Hart'),
	(514, 'Jenson Grant'),
	(515, 'Finn Davis'),

	(516, 'Amira Roberts'),
	(517, 'Clayton Heart'),
	(518, 'Helena Murray'),
	(519, 'Molly Jones'),
	(520, 'Rosie Austin'),

	(521, 'Steven King'),
	(522, 'Steven King');



insert into Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	values
	(501, 1001, 2),(502, 1001, 2),(503, 1001, 2),(504, 1001, 2),(505, 1001, 2),(506, 1001, 2),(507, 1001, 2),(508, 1001, 2),(509, 1001, 2),(510, 1001, 2),
	(511, 1001, 2),(512, 1001, 2),(513, 1001, 2),(514, 1001, 2),(515, 1001, 2),(516, 1001, 2),(517, 1001, 2),(518, 1001, 2),(519, 1001, 2),(520, 1001, 2),
	(511, 1001, 2),(512, 1001, 2),

	(501, 1002, 2),(502, 1002, 2),(503, 1002, 2),(504, 1002, 2),(505, 1002, 2),(506, 1002, 2),(507, 1002, 2),(508, 1002, 2),(509, 1002, 2),(510, 1002, 2),
	(511, 1002, 2),(512, 1002, 2),(513, 1002, 2),(514, 1002, 2),(515, 1002, 2),(516, 1002, 2),(517, 1002, 2),(518, 1002, 2),(519, 1002, 2),(520, 1002, 2),
	(521, 1002, 2),(522, 1002, 2),

	(501, 1003, 2),(502, 1003, 2),(503, 1003, 2),(504, 1003, 2),(505, 1003, 2),(506, 1003, 2),(507, 1003, 2),(508, 1003, 2),(509, 1003, 2),(510, 1003, 2),
	(511, 1003, 2),(512, 1003, 2),(513, 1003, 2),(514, 1003, 2),(515, 1003, 2),(516, 1003, 2),(517, 1003, 2),(518, 1003, 2),(519, 1003, 2),(520, 1003, 2),
	(521, 1003, 2),(522, 1003, 2),

	(501, 1004, 2),(502, 1004, 2),(503, 1004, 2),(504, 1004, 2),(505, 1004, 2),(506, 1004, 2),(507, 1004, 2),(508, 1004, 2),(509, 1004, 2),(510, 1004, 2),
	(511, 1004, 2),(512, 1004, 2),(513, 1004, 2),(514, 1004, 2),(515, 1004, 2),(516, 1004, 2),(517, 1004, 2),(518, 1004, 2),(519, 1004, 2),(520, 1004, 2),
	(521, 1004, 2),(522, 1004, 2);



--========================================================================================================
-- TESTING DATA IN TABLES
--========================================================================================================


	select * from Library_Branch;
	select * from Borrower
		select * from Book_Copies
		select * from Book_Authors
		select * from Books
	select * from Publisher
	select * from Books
	select * from Book_Loans
	select * from Book_Authors
	select * from Book_Copies

