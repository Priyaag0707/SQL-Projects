drop DATABASE db_LibraryManagement;

CREATE DATABASE db_LibraryManagement;


	/* ======================= TABLES ========================*/

use db_LibraryManagement;

	CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL);

	CREATE TABLE tbl_book (
		book_BookID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
		book_Title VARCHAR(100) NOT NULL,
        book_PublisherName VARCHAR(100) NOT NULL, 
		FOREIGN KEY(book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName));

	CREATE TABLE tbl_library_branch (
		library_branch_BranchID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL
	);

	SELECT * FROM tbl_library_branch;

	CREATE TABLE tbl_borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
	);
ALTER TABLE tbl_borrower AUTO_INCREMENT = 100;
	SELECT * FROM tbl_borrower;

	CREATE TABLE tbl_book_loans (
		book_loans_LoansID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		book_loans_BookID INT NOT NULL,
        FOREIGN KEY(book_loans_BookID) REFERENCES tbl_book(book_BookID),
		book_loans_BranchID INT NOT NULL,
        FOREIGN KEY(book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
		book_loans_CardNo INT NOT NULL,
        FOREIGN KEY(book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo),
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_book_loans;
		/* Use GETDATE() to retrieve the date values for Date out. Use DATEADD for the DueDate*/
	 
	CREATE TABLE tbl_book_copies (
		book_copies_CopiesID INT PRIMARY KEY NOT NULL Auto_increment,
		book_copies_BookID INT NOT NULL,
        FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
		book_copies_BranchID INT NOT NULL,
        FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
		book_copies_No_Of_Copies INT NOT NULL
	);

	SELECT * FROM tbl_book_copies;

	CREATE TABLE tbl_book_authors (
		book_authors_AuthorID INT PRIMARY KEY NOT NULL auto_increment,
		book_authors_BookID INT NOT NULL,
        FOREIGN KEY(book_authors_BookID) REFERENCES tbl_book(book_BookID),
		book_authors_AuthorName VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_book_authors;

/*======================== end creating TABLES ======================*/


/*==================== Filling up the data in the TABLES ======================*/
	
	INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
	;

	SELECT * FROM tbl_publisher;

	INSERT INTO tbl_book
		(book_Title, book_PublisherName)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');

	SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin';

	INSERT INTO tbl_library_branch
		(library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104');

	/*UPDATE tbl_library_branch
	SET library_branch_BranchName = 'Central'
	WHERE library_branch_BranchID = 2;*/
	
	SELECT * FROM tbl_library_branch;

	INSERT INTO tbl_borrower
		(borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
	
	SELECT * FROM tbl_borrower;

	INSERT INTO tbl_book_loans
		(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
		VALUES
		('1','1','100','4/1/23','5/2/23'),
		('2','1','100','4/1/23','5/2/23'),
		('3','1','100','4/1/23','5/2/23'),
		('4','1','100','4/1/23','5/10/23'),
		('5','1','102','4/3/23','5/10/23'),
		('6','1','102','4/3/23','5/3/23'),
		('7','1','102','4/3/23','5/3/23'),
		('8','1','102','4/3/23','5/3/23'),
		('9','1','102','4/3/23','5/3/23'),
		('11','1','102','4/3/23','5/3/23'),
		('12','2','105','3/12/23','4/12/23'),
		('10','2','105','3/12/23','4/12/23'),
		('20','2','105','4/3/23','5/3/23'),
		('18','2','105','4/5/23','5/5/23'),
		('19','2','105','4/5/23','5/5/23'),
		('19','2','100','4/3/23','5/3/23'),
		('11','2','106','4/7/23','5/7/23'),
		('1','2','106','4/7/23','5/7/23'),
		('2','2','100','4/7/23','5/7/23'),
		('3','2','100','4/7/23','5/7/23'),
		('5','2','105','3/12/17','4/12/23'),
		('4','3','103','4/9/18','5/9/23'),
		('7','3','102','4/3/18','5/3/23'),
		('17','3','102','4/3/18','5/3/23'),
		('16','3','104','4/3/18','5/3/23'),
		('15','3','104','4/3/18','5/3/23'),
		('15','3','107','4/3/18','5/3/23'),
		('14','3','104','4/3/18','5/3/23'),
		('13','3','107','4/3/18','5/3/23'),
		('13','3','102','4/3/18','5/3/23'),
		('19','3','102','3/12/23','4/12/23'),
		('20','4','103','4/3/23','5/3/23'),
		('1','4','102','4/12/23','5/12/23'),
		('3','4','107','4/3/23','5/3/23'),
		('18','4','107','4/3/23','5/3/23'),
		('12','4','102','4/4/23','5/4/23'),
		('11','4','103','4/15/23','5/15/23'),
		('9','4','103','4/15/23','5/15/23'),
		('7','4','107','4/1/23','5/2/23'),
		('4','4','103','4/1/23','5/10/23'),
		('1','4','103','5/2/23','5/10/23'),
		('20','4','103','4/3/23','5/3/23'),
		('1','4','102','4/12/23','5/12/23'),
		('3','4','107','4/13/23','5/13/23'),
		('18','4','107','4/13/23','5/13/23'),
		('12','4','102','4/14/23','5/14/23'),
		('11','4','103','4/15/23','5/15/23'),
		('9','4','103','4/15/23','5/15/23'),
		('7','4','107','4/19/23','5/19/23'),
		('4','4','103','4/19/23','5/19/23'),
		('1','4','103','4/22/23','5/22/23');

		
	SELECT * FROM tbl_book_loans;

	INSERT INTO tbl_book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');

	SELECT * FROM tbl_book_copies;
 

	INSERT INTO tbl_book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');

	SELECT * FROM tbl_book_authors;
    
/* -----------------Let's now start with some questions ---------------------*/


/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */


select count(*) as Total_copies from tbl_book a
inner join tbl_book_copies b on a.book_BookID = b.book_copies_bookid
inner join tbl_library_branch c on b.book_copies_BranchID = c.library_branch_BranchID
where book_Title = 'The Lost Tribe' and library_branch_BranchName = 'Sharpstown';

/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

select count(*) as Number_of_copies, library_branch_BranchName as Branch_name from tbl_book a
inner join tbl_book_copies b on a.book_BookID = b.book_copies_bookid
inner join tbl_library_branch c on b.book_copies_BranchID = c.library_branch_BranchID
where book_Title = 'The Lost Tribe'
group by library_branch_BranchName;

/* #3- Retrieve the names of all borrowers who do not have any books checked out. */

select borrower_borrowername as Borrower_name from tbl_borrower
where borrower_cardno not in (select book_loans_cardno from tbl_book_loans);

/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
retrieve the book title, the borrower's name, and the borrower's address.  */

select a.borrower_borrowername as Borrower_name, a.borrower_borroweraddress as Borrower_address, 
c.book_title as Book_title from tbl_borrower a
inner join tbl_book_loans b on a.borrower_CardNo = b.book_loans_CardNo
inner join tbl_book c on b.book_loans_BookID = c.book_BookID
inner join tbl_library_branch d on b.book_loans_BranchID = d.library_branch_BranchID
where d.library_branch_BranchName = 'Sharpstown' and b.book_loans_DueDate = current_date();


/* #5- For each library branch, retrieve the branch name and the total number of books 
loaned out from that branch.  */

select library_branch_BranchName as Branch_name, count(b.book_loans_BranchID) as Total_no_of_books_loaned
from tbl_library_branch a 
inner join tbl_book_loans b on a.library_branch_BranchID = b.book_loans_BranchID
group by library_branch_BranchName;

/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers 
who have more than five books checked out. */

select b.borrower_borrowername as Borrower_name, b.borrower_borroweraddress as Borrower_address, 
count(*) as Number_of_book_checkedout from tbl_borrower b
inner join tbl_book_loans c on b.borrower_CardNo = c.book_loans_CardNo
group by b.borrower_borrowername, b.borrower_borroweraddress 
having count(*) > 5;

/* #7- For each book authored by "Stephen King", retrieve the title and the number of copies 
owned by the library branch whose name is "Central".*/

select book_title, book_copies_no_of_copies as number_of_copies from tbl_book a
inner join tbl_book_authors b on a.book_BookID = b.book_authors_BookID 
inner join tbl_book_copies c on a.book_BookID = c.book_copies_BookID
inner join tbl_library_branch d on c.book_copies_BranchID = d.library_branch_BranchID
where b.book_authors_AuthorName = 'Stephen King' and d.library_branch_BranchName = 'Central';


