


	
use test
go
create proc NumberOfTheLostTribeInSharpstown
as
begin 
	 /*--1--*/

	select books.bookTitle, libraryBranches.branchName, bookCopies.noOfCopies from books 
	inner join bookCopies 
	on books.bookID = bookCopies.bookID 
	inner join libraryBranches 
	on bookCopies.branchID = libraryBranches.lbID 
	where bookTitle = 'The Lost Tribe'
	and branchName = 'Sharpstown'
end 
go

go
create proc howManyTheLostTribeEachBranchOwns
as
begin 
	/*--2--*/
	select books.bookTitle, libraryBranches.branchName, bookCopies.noOfCopies from books 
	inner join bookCopies 
	on books.bookID = bookCopies.bookID 
	inner join libraryBranches 
	on bookCopies.branchID = libraryBranches.lbID 
	where bookTitle = 'The Lost Tribe'
end
go


go
create proc 
as
begin 
	/*----3. Retrieve the names of all borrowers who do not have any books checked out.------*/
go
create proc namesOfThoseWhoDontHaveBooks
as
begin
	select borrowers.borrowerName from borrowers
	left join bookLoans on borrowers.cardNo = bookLoans.cardNo
	where bookLoans.cardNo = NULL
end
go



	/*--4--*/
go
create proc getTodaysDueBooksInSharpstown
as
begin 
	select borrowers.borrowerName, borrowers.borrowerAddress, books.bookTitle from borrowers
	inner join bookLoans on borrowers.cardNo = bookLoans.cardNo
	inner join books on bookLoans.bookID = books.bookID
	inner join libraryBranches on bookLoans.lbID = libraryBranches.lbID
	where dueDate = '9/27/2017'
	and libraryBranches.branchName = 'Sharpstown'
end
go

go
create proc numberOfLoandedBooksAtEachBranch
as
begin 
	/*--5--*/
	select libraryBranches.branchName, count(bookLoans.bookID) from bookLoans
	inner join libraryBranches on bookLoans.lbID = libraryBranches.lbID
	group by libraryBranches.branchName
	order by libraryBranches.branchName
end
go

go
create proc getNameAndAddressOfBorrowersWith5OrMoreBooks
as
begin 
	/*--6--*/
	select borrowers.borrowerName, borrowers.borrowerAddress, count(bookLoans.bookID) as numberOfBooks from borrowers
	inner join bookLoans on borrowers.cardNo = bookLoans.cardNo
	
	group by borrowers.borrowerName, borrowers.borrowerAddress
	having count(bookLoans.bookID) >= 5
	order by borrowers.borrowerName
end 
go
	
	
go
create proc getBooksByStephankingAtCentral
as
begin 
	/*--7--*/
	select libraryBranches.branchName, books.bookTitle, bookCopies.noOfCopies from books 
	inner join authors on books.authorID = authors.authorID
	inner join bookCopies on books.bookID = bookCopies.bookID
	inner join libraryBranches on  bookCopies.branchID = libraryBranches.lbID
	where authors.authorsName = 'Stephan King'
	and libraryBranches.branchName = 'Central'
end
go