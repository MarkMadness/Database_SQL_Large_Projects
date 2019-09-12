use finalProject1
--STORED PROCEDURES

--===== 1 ===== 
create procedure dbo.uspGetTitleplusBranch @Title int, @Branch int
as
select * from Book_Copies
where BookID = @Title and BranchID = @Branch

exec dbo.uspGetTitleplusBranch @Title = 501, @Branch = 1001


--===== 2 ===== 
alter procedure dbo.uspGetTitle @Title int
as
select * from Book_Copies
where BookID = @Title

exec dbo.uspGetTitle @Title = 501


--===== 3 =====
alter procedure dbo.uspNonCheckedBorrowers 
as
select Borrower.CardNo
from Borrower 
left join Book_Loans on Borrower.CardNo = Book_Loans.CardNo
where Book_Loans.CardNo is null

exec dbo.uspNonCheckedBorrowers


--===== 4 ===== 
alter procedure dbo.uspDueToday @Due nvarchar(50)
as
select Borrower.BorrowerName, Borrower.BorrowerAddress, Books.BookTitle, Book_Loans.DateDue
from Borrower
inner join Book_Loans on Book_Loans.CardNo = Borrower.CardNo 
inner join Books on Books.BookID = Book_Loans.BookID
where DateDue = @Due
group by BookTitle, BorrowerName, BorrowerAddress, DateDue


exec dbo.uspDueToday @Due = '9-12-19'


--===== 5 ===== 
alter procedure dbo.uspGetBranchLoans 
as
select Library_Branch.BranchName, count(Book_Loans.BookID)
from (Book_Loans 
inner join Library_Branch on Book_Loans.BranchID = Library_Branch.BranchID)
group by BranchName
having count(Book_Loans.BranchID) >0

exec dbo.uspGetBranchLoans 



--===== 6 ===== 
alter procedure dbo.uspGetBorrowersFiveBooks
as
select Borrower.BorrowerName, Borrower.BorrowerAddress, count(Book_Loans.BranchID) 
from (Book_Loans 
inner join Borrower on Book_Loans.CardNo = Borrower.CardNo)
group by BorrowerName, BorrowerAddress
having count(Book_Loans.CardNo) > 4

exec dbo.uspGetBorrowersFiveBooks


--===== 7 =====
alter procedure dbo.uspAllStephenKing
as
select Books.BookTitle, Book_Copies.Number_Of_Copies, Book_Authors.AuthorName
from (Book_Authors 
inner join Books on Book_Authors.BookID = Books.BookID 
inner join Book_Copies on Books.BookID = Book_Copies.BookID)
where AuthorName = 'Steven King' and BranchID = 1002
group by BookTitle, Number_Of_Copies, AuthorName

exec dbo.uspAllStephenKing