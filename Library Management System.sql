create database library;
use library;
create table Branch(
Branch_no int PRIMARY KEY,
Manager_Id int,
Branch_address varchar(30),
Contact_no int);

insert into branch values
(1,123,'ABC',98765678),
(2,124,'DEF',97876544),
(3,125,'GHI',95674567),
(4,126,'JKL',94567899),
(5,127,'MNO',93456789);

 
create table Employee(
Emp_Id int PRIMARY KEY ,
Emp_name varchar(20),
Position_ varchar(20),
Salary int,
Branch_no int,
FOREIGN KEY(Branch_no) references Branch(Branch_no));


insert into employee values
(100,'Nikhil','Clerk',20000,1),
(101,'Sam','Asset Manager',35000,4),
(102,'Ram','Credit Analyst',40000,1),
(103,'Kim','Auditor',50000,1),
(104,'Seema','Clerk',25000,4),
(105,'Reenu','Manager',70000,1),
(106,'Kirthi','Auditor',50000,2),
(107,'Kripa','Auditor',50000,3),
(108,'Reema','Manager',70000,2),
(109,'Rani','Manager',70000,3),
(110,'Raki','Manager',70000,5),
(111,'Ram','Credit Analyst',40000,3),
(112,'Ray','Credit Analyst',40000,4);



create table books(
ISBN int PRIMARY KEY ,
Book_title  varchar(50),
Category varchar(20),
Rental_Price int,
Status enum('yes','no'),
Author varchar(20),
Publisher varchar(40));

insert into books values
(987654321, 'To Kill a Mockingbird', 'Fiction', 12, 'yes', 'Harper Lee', 'J. B. Lippincott & Co.'),
(234567890, '1984', 'Science Fiction', 11, 'yes', 'George Orwell', 'Secker & Warburg'),
(345678901, 'Pride and Prejudice', 'Romance', 9, 'yes', 'Jane Austen', 'T. Egerton, Whitehall'),
(456789012, 'The Catcher in the Rye', 'Fiction', 10, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
(567890123, 'The Hobbit', 'Fantasy', 11, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
(678901234, 'Brave New World', 'Science Fiction', 12, 'yes', 'Aldous Huxley', 'Chatto & Windus'),
(789012345, 'Animal Farm', 'Political Satire', 10, 'yes', 'George Orwell', 'Secker & Warburg'),
(890123456, 'The Lord of the Rings', 'Fantasy', 15, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
(901234567, "Harry Potter and the Sorcerer's Stone", 'Fantasy', 13, 'no', 'J.K. Rowling', 'Bloomsbury');




create table Customer(
Customer_Id int PRIMARY KEY ,
Customer_name varchar(20),
Customer_address varchar(20),
Reg_date timestamp);


Insert into Customer values
(100,'Merin','230 Street U.S','2010-05-01 10:30:00'),
(101,'Sherin','101 Street U.K','2015-04-03 11:45:00'),
(102,'Anson','ABC lane Newsland','2014-01-02 10:30:00'),
(103,'John Doe', '123 Main St', '2024-03-11 09:00:00'),
(104, 'Jane Smith', '456 Elm St', '2024-03-10 10:30:00'),
(105, 'Bob Johnson', '789 Oak St', '2024-03-09 11:45:00'),
(106, 'Alice Brown', '321 Pine St', '2024-03-08 12:15:00'),
(107, 'Sarah Wilson', '654 Maple St', '2024-03-07 13:20:00'),
(108, 'Michael Lee', '987 Cedar St', '2024-03-06 14:45:00'),
(109, 'Emily Garcia', '741 Birch St', '2024-03-05 15:10:00'),
(110, 'David Martinez', '852 Walnut St', '2024-03-04 16:30:00'),
(111, 'Laura Rodriguez', '369 Sycamore St', '2024-03-03 17:20:00'),
(112, 'Daniel Hernandez', '159 Cherry St', '2024-03-02 18:00:00');
 


create table IssueStatus (
Issue_Id int PRIMARY KEY ,
Issued_cust int,
foreign key(Issued_cust) references customer(customer_id),
Issued_book_name varchar(50),
Issue_date date,
Isbn_book int,
foreign key(Isbn_book) references books(Isbn));



Insert into IssueStatus values
(2, 104, 'To Kill a Mockingbird', '2024-03-10', 987654321),
(3, 105, '1984', '2024-03-09', 234567890),
(4, 106, 'Pride and Prejudice', '2024-03-08', 345678901),
(5, 107, 'The Catcher in the Rye', '2024-03-07', 456789012),
(6, 108, 'The Hobbit', '2024-03-06', 567890123),
(7, 109, 'Brave New World', '2024-03-05', 678901234),
(8, 110, 'Animal Farm', '2024-03-04', 789012345),
(9, 111, 'The Lord of the Rings', '2024-03-03', 890123456),
(10, 112, "Harry Potter and the Sorcerer's Stone", '2023-06-02', 901234567);



 create table ReturnStatus (
Return_Id int PRIMARY KEY ,
Return_cust varchar(20), 
Return_book_name varchar(50),
Return_date date,
Isbn_book2 int,
foreign key(Isbn_book2) references books(isbn));


insert into ReturnStatus values
(002, 'Jane Smith', 'To Kill a Mockingbird', '2024-03-19', 987654321),
(003, 'Bob Johnson', '1984', '2024-03-18', 234567890),
(004, 'Alice Brown', 'Pride and Prejudice', '2024-03-17', 345678901),
(005, 'Sarah Wilson', 'The Catcher in the Rye', '2024-03-16', 456789012),
(006, 'Michael Lee', 'The Hobbit', '2024-03-15', 567890123),
(007, 'Emily Garcia', 'Brave New World', '2024-03-14', 678901234),
(008, 'David Martinez', 'Animal Farm', '2024-03-13', 789012345),
(009, 'Laura Rodriguez', 'The Lord of the Rings', '2024-03-12', 890123456),
(010, 'Daniel Hernandez', "Harry Potter and the Sorcerer's Stone", '2023-07-11', 901234567);


-- Display all the tables 
select * from branch;
select * from employee;
select * from books;
select * from customer;
select * from issuestatus;
select * from returnstatus;
-- 1. Retrieve the book title, category, and rental price of all available books.
select book_title,category,rental_price from books;

-- 2. List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
select b.book_title,c.customer_name from issuestatus i
 inner join  books b on i.isbn_book=b.isbn
 inner join customer c on c.customer_id=i.issued_cust;


-- 4. Display the total count of books in each category.
select category,count(*) from books group by category;


-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select emp_name,position_ from employee where salary > 50000;
-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select customer_name from customer where reg_date < '2022-01-01' and customer_id not in (select issued_cust from issuestatus);


-- 7. Display the branch numbers and the total count of employees in each branch.
select branch_no,count(*) from employee group by branch_no;
-- 8. Display the names of customers who have issued books in the month of June 2023.
select c.customer_name from customer c join issuestatus i on c.customer_id = i.issued_cust where i.issue_date like '2023-06-__';
insert into books values
(97812345,'The History of the World','History',10,'yes','John Smith','Random House');
-- 9. Retrieve book_title from book table containing history.
select book_title from books where book_title like '%history%';
insert into employee values
(113,'Nikhil','Auditor',30000,1),
(114,'Vimal','Credit Analyst',40000,1);
-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
select branch_no from employee group by branch_no having count(branch_no) > 5;


