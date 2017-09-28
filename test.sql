

create database test 
use test
create table publishers (
	pubID int primary key not null identity (200,1),
	pubName varchar(100) not null,
	pubAddress varchar(200) not null,
	pubPhone varchar(20) not null
);
	insert into publishers
	(pubName, pubAddress, pubPhone)
	values
	('World Class Books','9152 Longfellow Court Grand Island, NE 68801','(202)-555-0199'),
	('Andy And Ally','19 Indian Summer Street Hempstead, NY 11550','(426)-535-4861'),
	('Penguin Random House','7506 Fifth Court Holyoke, MA 01040','(202)-555-0148'),
	('Hachette Livre ','58 Corona Ave. Kaukauna, WI 54130','(339)237-1422'),
	('HarperCollins','9292 E. Cardinal Street West Lafayette, IN 47906','(361)474-5931'),
	('Pan Macmillan','7002 Hillcrest Street Vernon Rockville, CT 06066','(713)515-6501'),
	('Bloomsbury','9332 Ohio Ave. Copperas Cove, TX 76522','(219)738-8246'),
	('Simon & Schuste','8464 Jockey Hollow Street Goldsboro, NC 27530','(610)921-2491'),
	('Scholastic','47 West Heritage St. Henderson, KY 42420','(609)354-2678')
;
create table authors (
	authorID int primary key not null identity (100,1),
	authorsName varchar(50) not null
);

insert into authors
	(authorsName)
	values						
	('Mark lee'),				/*100 */
	('Stephan King'),			/*101 */
	('J.R.R Tolkien'),			/*102 */
	('Dr. Seuss'),				/*103 */
	('Christopher Paolini'),	/*104 */
	('C.S Lewis'),				/*105 */
	('Patrick Rothfuss'),		/*106 */
	('George R.R. Martin'),		/*107 */
	('Brandon Sanderson'),		/*108 */
	('Arthur C. Clarke'),		/*109 */
	('Joe Haldeman'),			/*110 */
	('Dan Simmons'),			/*111 */
	('Karen Marie Moning'),		/*112 */
	('Harper Lee'),				/*113 */
	('Lois Lowry'),				/*114 */
	('F. Scott Fitzgerald'),	/*115 */
	('Jane Austen')				/*116 */
;	

create table books (
	bookID int primary key not null identity (1,1),
	pubID int not null constraint pubID foreign key references publishers(pubID) on update cascade on delete cascade,
	authorID int not null constraint authorID foreign key references authors(authorID) on update cascade on delete cascade,
	bookTitle varchar(50) not null
	);

insert into books 
	(bookTitle, pubID, authorID)
	values 
	('The Lost Tribe','200','100'),
	('Misery','201','101'),
	('The Silmarillion','202','102'),
	('The Hobbit','202','102'),
	('The Fellowship of the Ring','202','102'),
	('Two Towers','202','102'),
	('Return of the King','202','102'),
	('One Fish Two Fish Red Fish Blue Fish','203','103'),
	('The Cat in the Hat','203','103'),
	('Eragon','204','104'),
	('The Megicians Nephew','204','105'),
	('The Name Of The WInd','205','106'),
	('A Game of Thrones','205','107'),
	('Mistborn','205','108'),
	('2001 A Space Odyssey','206','109'),
	('The Forever War','206','110'),
	('Hyperion','206','111'),
	('Beyond the High Mist','202','112'),
	('To Kill a Mockingbird','207','113'),
		('The Giver','207','114'),
		('Gathering Blue','207','114'),
		('Messenger','207','114'),
		('Son','207','114'),
		('The Great Gatsby','208','115'),
		('Pride and Prejudice','208','116')
	;


	create table borrowers (
		cardNo int primary key not null identity (500,1),
		borrowerName varchar(40) not null,
		borrowerAddress varchar(100) not null,
		borrowerPhone varchar(20) not null
	);

	insert into borrowers
		(borrowerName, borrowerAddress, borrowerPhone)
		values
		('Harley Moore','19 Charles St. Brentwood, NY 11717','(610)872-2938'),
		('Jay Berry','95 Mill Pond Lane Torrance, CA 90505','(219)880-8441'),
		('James Davis','7235 High Ridge Drive Woodstock, GA 30188','(248)413-8772'),
		('Matthew Poole','7441 Smoky Hollow Street Franklin, MA 02038','(254)522-7463'),
		('Gabriel Reynolds','9168 Sulphur Springs Avenue Valparaiso, IN 46383','(425)707-7795'),
		('Noah Foreman','4 Rockwell St. Merrick, NY 11566','(507)984-3259'),
		('Holden Wells','854 Wilson St. Yuba City, CA 95993','(684)633-2320'),
		('Elias Rojas','894 Wakehurst Rd. Fayetteville, NC 28303','(551)333-4745'),
		('Jessie Bartlett','37 N. Division Rd. Apt 810 ','(614)386-5213'),
		('Brennan Raymond','Franklin, MA 020389053 SW. Fairground Drive Palm Bay, FL 32907','(430)994-6203'),
		('Willy Barnes','7229 Highland St. Grand Haven, MI 49417','(430)980-6662')
	;

	create table libraryBranches (
		lbID int primary key not null identity (600,1),
		branchName varchar(50) not null,
		branchAddress varchar(100) not null
	);

	insert into libraryBranches
		(branchName,branchAddress)
		values
		('Sharpstown','737 Summer Lane Mocksville, NC 27028'),
		('Central','328 Big Rock Cove Road Jersey City, NJ 07302'),
		('BookTown','95 Adams Avenue Glendora, CA 91740'),
		('Bubba Jays','54 Acacia St. Panama City, FL 32404'),
		('City Library','349 S. Fairfield Street Gulfport, MS 39503')
	;

	create table bookCopies (
		copiesID int primary key not null identity (400,1),
		bookID int NOT NULL CONSTRAINT fkBookCoppiesBookID FOREIGN KEY REFERENCES books(bookID) on update cascade on delete cascade,
		branchID int not null constraint branchBookCopiesID foreign key references libraryBranches(lbID) on update cascade on delete cascade,
		noOfCopies int not null
	);

	insert into bookCopies
		(bookID, branchID, noOfCopies)
		values 
		('1','600','2'),('1','601','2'),
		('1','602','2'),('1','603','2'),
		('1','604','2'),('2','600','2'),
		('2','601','2'),('2','602','2'),
		('2','603','3'),('2','604','2'),
		('3','600','2'),('3','601','2'),
		('3','602','2'),('3','603','3'),
		('3','604','3'),('4','600','4'),
		('4','601','4'),('4','602','4'),
		('4','603','4'),('4','604','4'),
		('5','600','3'),('5','601','3'),
		('5','602','3'),('5','603','3'),
		('5','604','3'),('6','600','3'),
		('6','601','3'),('6','602','3'),
		('6','603','3'),('6','604','3'),
		('7','600','2'),('7','601','2'),
		('7','602','3'),('7','603','3'),
		('7','604','5'),('8','600','5'),
		('8','601','5'),('8','602','5'),
		('8','603','5'),('8','604','5'),
		('9','600','4'),('9','601','4'),
		('9','602','4'),('9','603','4'),
		('9','604','4'),('10','600','3'),
		('10','601','3'),('10','602','3'),
		('10','603','3'),('10','604','3'),
		('11','600','2'),('11','601','2'),
		('11','602','2'),('11','603','2'),
		('11','604','2'),('12','600','3'),
		('12','601','3'),('12','602','3'),
		('12','603','3'),('12','604','3'),
		('13','600','5'),('13','601','5'),
		('13','602','5'),('13','603','5'),
		('13','604','5'),('14','600','6'),
		('14','601','6'),('14','602','4'),
		('14','603','6'),('14','604','6'),
		('15','600','4'),('15','601','4'),
		('15','602','4'),('15','603','4'),
		('15','604','4'),('16','600','5'),
		('16','601','3'),('16','602','3'),
		('16','603','5'),('16','604','5'),
		('17','600','4'),('17','601','4'),
		('17','602','4'),('17','603','4'),
		('17','604','4'),('18','600','4'),
		('18','601','4'),('18','602','4'),
		('18','603','4'),('18','604','4'),
		('19','600','5'),('19','601','5'),
		('19','602','5'),('19','603','5'),
		('19','604','5'),('20','600','4'),
		('20','601','4'),('20','602','4'),
		('20','603','4'),('20','604','4'),
		('21','600','6'),('21','601','6'),
		('21','602','6'),('21','603','6'),
		('21','604','6'),('22','600','6'),
		('22','601','6'),('22','602','6'),
		('22','603','6'),('22','604','6'),
		('23','600','4'),('23','601','4'),
		('23','602','4'),('23','603','4'),
		('23','604','4'),('24','600','5'),
		('24','601','5'),('24','602','5'),
		('24','603','5'),('24','604','5'),
		('25','600','4'),('25','601','4'),
		('25','602','4'),('25','603','4'),
		('25','604','4')
	;


	 create table bookLoans (
		loanID int primary key not null identity (300,1),
		bookID int NOT NULL CONSTRAINT fkBoolLoansBookID FOREIGN KEY REFERENCES books(bookID) on update cascade on delete cascade,
		lbID int not null constraint lbID foreign key references libraryBranches(lbID) on update cascade on delete cascade,
		cardNo int not null constraint cardNo foreign key references borrowers(cardNo) on update cascade on delete cascade,
		dateOut varchar(20) not null,
		dueDate varchar(20) not null
	);

	insert into bookLoans
		(dateOut, dueDate, bookID, lbID, cardNo)
		values
		('8/28/2017','9/28/2017','3','604','502'), ('8/31/2017','9/31/2017','20','603','504'), ('9/13/2017','10/13/2017','18','600','500'),
		('8/28/2017','9/28/2017','4','604','502'), ('9/1/2017','10/1/2017','21','603','504'),  ('9/13/2017','10/13/2017','18','602','508'),
		('8/28/2017','9/28/2017','5','604','502'), ('9/4/2017','10/4/2017','22','603','504'),  ('9/13/2017','10/13/2017','18','603','510'),
		('8/28/2017','9/28/2017','6','604','502'), ('9/5/2017','10/5/2017','23','603','504'),  ('9/14/2017','10/14/2017','16','600','509'),
		('8/28/2017','9/28/2017','7','604','502'), ('9/6/2017','10/6/2017','1','601','501'),   ('9/15/2017','10/15/2017','13','600','509'),
		('8/29/2017','9/29/2017','8','601','500'), ('9/7/2017','10/7/2017','2','601','503'),   ('9/15/2017','10/15/2017','13','604','507'),
		('8/29/2017','9/29/2017','9','601','500'), ('9/8/2017','10/8/2017','10','600','500'),  ('9/15/2017','10/15/2017','13','601','505'),
		('8/30/2017','9/30/2017','19','602','500'),('9/8/2017','10/8/2017','10','600','506'),  ('9/25/2017','10/25/2017','15','601','500'),
		('8/30/2017','9/30/2017','19','602','501'),('9/8/2017','10/8/2017','10','600','510'),  ('9/25/2017','10/25/2017','15','601','506'),
		('8/30/2017','9/30/2017','19','604','502'),('9/8/2017','10/8/2017','10','604','508'),  ('9/25/2017','10/25/2017','15','601','507'),
		('8/30/2017','9/30/2017','19','603','503'),('9/11/2017','10/11/2017','24','600','504'),('9/25/2017','10/25/2017','15','603','510'),
		('8/30/2017','9/30/2017','19','600','505'),('9/11/2017','10/11/2017','24','604','501'),('9/25/2017','10/25/2017','15','603','501'),
		('8/30/2017','9/30/2017','19','600','506'),('9/11/2017','10/11/2017','24','602','506'),('9/25/2017','10/25/2017','15','604','502'),
		('8/30/2017','9/30/2017','19','600','507'),('9/12/2017','10/12/2017','25','601','504'),('9/25/2017','10/25/2017','15','602','509'),
		('8/30/2017','9/30/2017','19','601','508'),('9/12/2017','10/12/2017','25','604','510'),('9/25/2017','10/25/2017','15','602','508'),
		('8/30/2017','9/30/2017','19','604','509'),('9/12/2017','10/12/2017','25','603','508'),('8/27/2017','9/27/2017','15','600','503'),
		('8/30/2017','9/30/2017','19','602','510'),('9/12/2017','10/12/2017','25','600','509')
	;

