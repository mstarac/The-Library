/** Final SQL Project - Library Management System **/


CREATE DATABASE library_drill

USE library_drill

CREATE TABLE tbl_branch (
	branch_address varchar(400),
	branch_name varchar(200) NOT NULL,
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1) 
);

CREATE TABLE tbl_publisher (
	phone varchar (50),
	address varchar (400),
	publisher_name varchar (200) PRIMARY KEY NOT NULL 
);

CREATE TABLE tbl_books (
	title varchar (400) NOT NULL,
	publisher_name varchar(200) NOT NULL,
	book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1) 
); 

CREATE TABLE tbl_authors (
	book_id INT NOT NULL CONSTRAINT fk_author_name FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name varchar(300) NOT NULL
);

CREATE TABLE tbl_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	amount_of_copies INT NOT NULL DEFAULT 1
);

CREATE TABLE tbl_borrower (
	card_number INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
	borrower_name varchar(300) NOT NULL,
	borrower_address varchar(400),
	borrower_phone varchar(50)
);


CREATE TABLE tbl_loans (
	book_id INT NOT NULL CONSTRAINT fk_bookloan_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL  CONSTRAINT fk_branchloan_id FOREIGN KEY REFERENCES tbl_branch(branch_id)  ON UPDATE CASCADE ON DELETE CASCADE,
	card_number INT NOT NULL CONSTRAINT fk_card_number FOREIGN KEY REFERENCES tbl_borrower(card_number) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut DATE NOT NULL,
	dateDue DATE NOT NULL,
);


/******************************************************
	 * Now that the tables are built, we populate them
	 ***************************************************/

INSERT INTO tbl_branch
		(branch_name, branch_address)
		VALUES 
		('Central','205 Lake Street, Reno, NV 89509'),
		('Sharpstown', '458 Center Road, Reno, NV 89523'),
		('Skyline', '735 California Avenue, Reno, NV 85509'),
		('Montreux', '635 Spinner Way, Reno, NV 89511'),
		('Mount Rose', '964 Gentry Way, Reno, NV 89509'),
		('Damonte', '120 Meadows Parkway, Reno, NV 89511')
;

INSERT INTO tbl_publisher
		(publisher_name, address, phone)
		VALUES
		('Chatto & Windus Charles L. Webster And Company','370 Seventh Avenue Suite 1200 New York NY', '212-345-4312'),
		('AuthorHouse', '300 N. Zeeb Rd. Ann Arbor MI 48106-1346', '402-625-0909'),
		('Thomas Cautley Newby', '25 Beacon St. Boston MA 02108', '301-563-6798'),
		('Hachette', '2929 24th St. San Francisco, CA 94110', '925-564-1278'),
		('HarperCollins', '1747 Shawnee Rd. Indianapolis IN 46260', '773-452-0976'),
		('Macmillan', '908 Southgate Ave. Daly City CA 94001', '925-345-6745'),
		('Penguin Random House', '562 W. 113th St. New York NY 10025', '212-643-4562'),
		('Simon & Schuster', '453 Michigan Avenue Chicago IL 60608', '312-340-1234'),
		('Thomas Egerton', '201 E. 50th St. New York NY 10022', '212-477-7162'),
		('Double Day', '200 Saw Mill River Rd. Hawthorne NY 10532', '212-567-7432'),
		('Chapman & Hall', '1540 Broadway New York, NY 10036-4094', '212-387-3400'),
		('Bradbury and Evans', '11 Penn Plaza New York NY 1000', '212-751-2600'),
		('Little, Brown and Company', '125 Cranberry Way Boston MA 03456', '301-457-9012')
;

INSERT INTO tbl_books
	(title, publisher_name)
	 VALUES
	('The Lost Tribe', 'MacMillan'),
	('In Search of Lost Time', 'HarperCollins'),
	('Don Quixote', 'AuthorHouse'),
	('The Great Gatsby', 'Hachette'),
	('The Shining', 'Double Day'),
	('Misery', 'Double Day'),
	('Moby Dick', 'Penguin Random House'),
	('Hamlet', 'Simon & Schuster'),
	('War and Peace', 'Bradbury and Evans'),
	('The Adventures of Huckleberry Finn', 'Chatto & Windus / Charles L. Webster And Company'),
	('Pride and Prejudice', 'Thomas Egerton'),
	('Wuthering Heights', 'Thomas Cautley Newby'),
	('The Catcher in the Rye', 'Little, Brown and Company'),
	('Anna Karenina', 'HarperCollins'),
	('Nineteen Eighty Four', 'Double Day'),
	('Great Expectations', 'Chapman & Hall'),
	('Gullivers Travels', 'Chatto & Windus / Charles L. Webster And Company'),
	('The Grapes of Wrath', 'Chatto & Windus / Charles L. Webster And Company'),
	('Jane Eyre', 'Simon & Schuster'),
	('David Copperfield', 'Bradbury and Evans'),
	('To Kill a Mockingbird', 'Double Day'),
	('Heart of Darkness', 'Thomas Cautley Newby'),
	('To the Lighthouse', 'Chapman & Hall')
;

INSERT INTO tbl_authors
	(author_name, book_id)
	VALUES
	('Mark Lee', 1),
	('Marcel Proust', 2),
	('Miguel de Cervantes', 3),
	('F. Scott Fitzgerald', 4),
	('Stephen King', 5),
	('Stephen King', 6),
	('Herman Melville', 7),
	('William Shakespeare', 8),
	('Leo Tolstoy', 9),
	('Mark Twain', 10),
	('Jane Austen', 11),
	('Emily Brontë', 12),
	('J. D. Salinger', 13),
	('Leo Tolstoy', 14),
	('George Orwell', 15),
	('Charles Dickens', 16),
	('Jonathan Swift', 17),
	('John Steinbeck', 18),
	('Charlotte Brontë', 19),
	('Charles Dickens', 20),
	('Harper Lee', 21),
	('Joseph Conrad', 22),
	('Virginia Woolf', 23)
;

INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Barbara Coates', '101 Heritage Square Las Vegas NV 89044', '702-344-0982'),
	('Marla Weiner', '294 Archer Avenue NewYork NY 10004', '212-568-0987'),
	('Penny Lane', '385 Halsted Street San Francisco CA 94014', '925-798-0276'),
	('Brad Pitt', '476 North Avenue Los Angeles CA 90210', '310-456-0876'),
	('Hugh Jackman', '567 Leamington Road Walnut Creek CA 95023', '925-725-7709'),
	('James Delaney', '658 Sharon Street Chicago, IL 60608', '312-654-0123'),
	('Tom Hardy', '749 Macrory Drive South Lake Tahoe, NV 96150', '775-815-8882'),
	('Elizabeth Moss', '830 Caughlin Pkwy Grass Valley CA 94562', '925-546-1278'),
	('Joseph Fiennes', '921 Mountainshyre Road Sparks NV 89523', '775-255-0999'),
	('Keanu Reeves', '108 Cashill Blvd Reno NV 89509', '775-813-7676')
;

INSERT INTO tbl_copies
	(book_id, branch_id, amount_of_copies)
	VALUES
	(1, 1, 5),
	(2, 1, 4),
	(3, 1, 5),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 4),
	(7, 1, 5),
	(8, 1, 4),
	(9, 1, 5),
	(10, 1, 4),
	(11, 1, 5),
	(12, 1, 4),
	(13, 1, 5),
	(14, 1, 4),
	(15, 1, 5),
	(16, 1, 4),
	(17, 1, 5),
	(18, 1, 4),
	(19, 1, 5),
	(20, 1, 4),
	(21, 1, 5),
	(22, 1, 4),
	(23, 1, 5),
	
	(1, 2, 3),
	(2, 2, 4),
	(3, 2, 4),
	(4, 2, 3),
	(5, 2, 4),
	(6, 2, 3),
	(7, 2, 4),
	(8, 2, 3),
	(9, 2, 4),
	(10, 2, 3),
	(11, 2, 4),
	(12, 2, 3),
	(13, 2, 4),
	(14, 2, 3),
	(15, 2, 4),
	(16, 2, 3),
	(17, 2, 4),
	(18, 2, 3),
	(19, 2, 4),
	(20, 2, 3),
	(21, 2, 4),
	(22, 2, 3),
	(23, 2, 4),
	 
	(1, 3, 4),
	(2, 3, 3),
	(3, 3, 4),
	(4, 3, 3),
	(5, 3, 4),
	(6, 3, 3),
	(7, 3, 4),
	(8, 3, 3),
	(9, 3, 4),
	(10, 3, 3),
	(11, 3, 4),
	(12, 3, 3),
	(13, 3, 4),
	(14, 3, 3),
	(15, 3, 4),
	(16, 3, 3),
	(17, 3, 4),
	(18, 3, 3),
	(19, 3, 4),
	(20, 3, 3),
	(21, 3, 4),
	(22, 3, 3),
	(23, 3, 4),
	 
	(1, 4, 3),
	(2, 4, 4),
	(3, 4, 3),
	(4, 4, 4),
	(5, 4, 3),
	(6, 4, 4),
	(7, 4, 3),
	(8, 4, 4),
	(9, 4, 3),
	(10, 4, 4),
	(11, 4, 3),
	(12, 4, 4),
	(13, 4, 3),
	(14, 4, 4), 
	(15, 4, 3),
	(16, 4, 4),
	(17, 4, 3),
	(18, 4, 4),
	(19, 4, 3),
	(20, 4, 4),
	(21, 4, 3),
	(22, 4, 4),
	(23, 4, 3),

	(1, 5, 4),
	(2, 5, 3),
	(3, 5, 4),
	(4, 5, 3),
	(5, 5, 4),
	(6, 5, 3),
	(7, 5, 4),
	(8, 5, 3),
	(9, 5, 4),
	(10, 5, 3),
	(11, 5, 4),
	(12, 5, 3),
	(13, 5, 4),
	(14, 5, 3),
	(15, 5, 4),
	(16, 5, 3),
	(17, 5, 4),
	(18, 5, 3),
	(19, 5, 4),
	(20, 5, 3),
	(21, 5, 4),
	(22, 5, 3),
	(23, 5, 4),

	(1, 6, 3),
	(2, 6, 4),
	(3, 6, 3),
	(4, 6, 4),
	(5, 6, 3),
	(6, 6, 4),
	(7, 6, 3), 
	(8, 6, 4),
	(9, 6, 3),
	(10, 6, 4),
	(11, 6, 3),
	(12, 6, 4),
	(13, 6, 3),
	(14, 6, 4),
	(15, 6, 3),
	(16, 6, 4),
	(17, 6, 3),
	(18, 6, 4),
	(19, 6, 3), 
	(20, 6, 4),
	(21, 6, 3),
	(22, 6, 4),
	(23, 6, 3)
;

	INSERT INTO tbl_loans
		(book_id, branch_id, card_number, dateOut, dateDue)
		VALUES
		(1, 6, 5001, '08-11-2018', '11-15-2018'),
		(2, 5, 5002, '11-01-2018', '12-28-2018'),
		(3, 4, 5004, '08-12-2018', '11-15-2018'),
		(4, 3, 5006, '11-02-2018', '12-27-2018'),
		(5, 2, 5007, '08-13-2018', '11-15-2018'),
		(6, 1, 5008, '11-03-2018', '12-28-2018'),
		(7, 2, 5009, '10-04-2018', '12-28-2018'),
		(8, 3, 5001, '10-05-2018', '12-26-2018'),
		(9, 4, 5002, '08-14-2018', '11-15-2018'),
		(10, 5, 5004, '08-15-2018', '11-15-2018'),
		(11, 6, 5006, '08-16-2018', '11-15-2018'),
		(12, 1, 5007, '08-17-2018', '11-15-2018'),
		(13, 2, 5008, '08-17-2018', '11-15-2018'),
		(14, 3, 5009, '08-18-2018', '11-15-2018'),
		(15, 4, 5001, '08-19-2018', '11-15-2018'),
		(16, 5, 5001, '08-20-2018', '11-15-2018'),
		(17, 6, 5002, '11-02-2018', '12-28-2018'),
		(18, 5, 5004, '11-03-2018', '12-28-2018'),
		(19, 4, 5004, '11-04-2018', '12-27-2018'),
		(20, 3, 5006, '08-21-2018', '11-15-2018'),
		(21, 2, 5007, '11-10-2018', '12-27-2018'),
		(22, 1, 5008, '08-22-2018', '11-15-2018'),
		(23, 2, 5009, '10-22-2018', '12-28-2018'),
		(1, 3, 5001, '08-23-2018', '11-15-2018'),
		(2, 4, 5002, '10-22-2018', '12-28-2018'),
		(3, 5, 5006, '10-18-2018', '12-28-2018'),
		(4, 6, 5007, '10-11-2018', '12-27-2018'),
		(5, 1, 5007, '08-24-2018', '11-15-2018'),
		(6, 2, 5008, '08-25-2018', '11-15-2018'),
		(7, 3, 5008, '10-17-2018', '12-27-2018'),
		(8, 4, 5009, '08-26-2018', '11-15-2018'),
		(9, 5, 5001, '10-22-2018', '12-29-2018'),
		(10, 6, 5002, '08-27-2018', '11-15-2018'),
		(11, 1, 5004, '10-14-2018', '12-27-2018'),
		(12, 2, 5006, '08-28-2018', '11-15-2018'),
		(13, 3, 5007, '10-09-2018', '12-28-2018'),
		(14, 4, 5008, '10-15-2018', '12-18-2018'),
		(15, 5, 5009, '08-29-2018', '11-15-2018'),
		(16, 6, 5001, '08-21-2018', '11-15-2018'),
		(17, 1, 5002, '10-31-2018', '12-28-2018'),
		(18, 2, 5004, '08-25-2018', '11-15-2018'),
		(19, 3, 5006, '08-12-2018', '11-15-2018'),
		(20, 4, 5007, '10-25-2018', '12-28-2018'),
		(21, 4, 5008, '10-17-2018', '12-27-2018'),
		(22, 5, 5009, '08-15-2018', '11-15-2018'),
		(23, 6, 5002, '10-19-2018', '12-27-2018')
;

/**CREATE STORED PROCEDURES**/

/**1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?**/
 

CREATE PROC getBookCopies

@bookCopies  INT
AS
BEGIN
	SELECT

	branch_name, title, amount_of_copies

FROM tbl_branch 
INNER JOIN tbl_copies ON tbl_copies.branch_id = tbl_branch.branch_id
INNER JOIN tbl_books ON tbl_books.book_id = tbl_copies.book_id
WHERE title = 'The Lost Tribe' AND branch_name = 'Sharpstown'

END

/**2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?**/

CREATE PROC getBranchCopies

@branchCopies INT
AS 
BEGIN
	SELECT

	branch_name, title, amount_of_copies

FROM tbl_branch
INNER JOIN tbl_copies ON tbl_copies.branch_id = tbl_branch.branch_id
INNER JOIN tbl_books ON tbl_books.book_id = tbl_copies.book_id
WHERE title = 'The Lost Tribe'
;

END

/** 3.) Retrieve the names of all borrowers who do not have any books checked out **/

CREATE PROC getBorrowersInfoNotChecked


@getBorrowers varchar(300)
AS
BEGIN
	SELECT 

	borrower_name

FROM tbl_borrower
INNER JOIN tbl_loans ON tbl_loans.card_number = tbl_borrower.card_number
WHERE tbl_loans.card_number IS NULL 

END


/**4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address**/

CREATE PROC getCurrentDueBooks

@dueBooksToday = SELECT CONVERT(datetime, 11/17/2018);

BEGIN
	SELECT

	title, borrower_name, borrower_address

FROM tbl_borrower
INNER JOIN tbl_branch ON tbl_branch.branch_name= tbl_borrower.borrower_name
INNER JOIN tbl_books ON tbl_books.book_id = tbl_branch.branch_id
INNER JOIN tbl_loans ON tbl_loans.card_number = tbl_books.title
WHERE tbl_branch.branch_name = 'Sharpstown' AND tbl_loans.dateDue =  @dueBooksToday
END

/**5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch**/

CREATE PROC getTotalBranchBooks

@getBranchTotals varchar(300)

BEGIN
	SELECT

	branch_name, book_id

FROM tbl_loans
INNER JOIN tbl_branch ON tbl_branch.branch_id= tbl_loans.book_id
GROUP BY branch_name

END

/**6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out**/

CREATE PROC getCheckedBooks

@getCheckedBks varchar(300)

BEGIN
	SELECT

	borrower_name, borrower_address, book_id

FROM tbl_borrower
INNER JOIN tbl_loans ON tbl_loans.card_number= tbl_borrower.card_number
GROUP BY borrower_name, borrower_address
HAVING COUNT(tbl_loans.card_number) >5 

END

/**7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central"**/

CREATE PROC getStephenKing

@StephenKingCentral varchar(300)

BEGIN
	SELECT title, amount_of_copies
FROM tbl_books
INNER JOIN tbl_copies ON tbl_copies.book_id = tbl_books.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_copies.branch_id
INNER JOIN tbl_authors ON tbl_authors.book_id = tbl_books.book_id
WHERE author_name = 'Stephen King' AND title = 'Central'
;

END	 

	
