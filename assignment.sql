USE assignment;
CREATE TABLE Postcode(
postcode varchar(5) NOT NULL PRIMARY KEY,
city char(50),
state char(50),
);

INSERT INTO Postcode
VALUES
(43200, 'Cheras', 'Selangor'),
(59100, 'Bangsar Baru', 'Kuala Lumpur'),
(51100, 'Sentul', 'Kuala Lumpur'),
(56000, 'Cheras', 'Kuala Lumpur'),
(55100, 'Pandan Jaya','Kuala Lumpur'),
(47810, 'Petaling Jaya', 'Selangor'),
(68000, 'Batu Caves', 'Kuala Lumpur'),
(30000, 'Ipoh', 'Perak'),
(51000, 'Sentul', 'Kuala Lumpur'),
(42000, 'Klang', 'Selangor'),
(50450, 'NULL', 'Kuala Lumpur'),
(47300, 'Petaling Jaya', 'Selangor'),
(80300, 'Johor Bahru', 'Johor'),
(20000, 'Kuala Terengganu', 'Terengganu'),
(47301, 'Petaling Jaya', 'Selangor'),
(53300, 'NULL', 'Kuala Lumpur');

CREATE TABLE Publisher(
publisher_ID varchar(5) NOT NULL PRIMARY KEY,
publisher_name varchar(50),
publisher_contact varchar(11),
publisher_email varchar(50),
publisher_add varchar(100),
postcode varchar(5) FOREIGN KEY REFERENCES Postcode (postcode),
);

INSERT INTO Publisher 
VALUES
('PB01', 'Vision Publication Sdn Bhd', 0359905662, 'vision@gmail.com', 'N51-G, Jalan Orkid 4, Taman Orkid', 43200),
('PB02', 'Silverfish Books Sdn Bhd', 0387965220, 'silverfish@gmail.com', '20-2F, Bangsar Village 2', 59100),
('PB03', 'Uma Publications Sdn Bhd', 0340418990, 'uma@gmail.com', '85, Jalan Perhentian', 51100),
('PB04', 'Odonata Publishing Sdn Bhd', 0391019871, 'odonata@gmail.com', 'Industrial Park, 2, Jalan Dmai Puspa 2', 56000),
('PB05', 'Mehraj Book Distributions', 0392878745, 'mehraj@gmail.com', '10, Jalan Pandan 8/8', 55100);

CREATE TABLE Book(
book_ID varchar(4) NOT NULL PRIMARY KEY,
publisher_ID varchar(5) FOREIGN KEY REFERENCES Publisher (publisher_ID),
book_name char(50),
book_genre varchar(10),
cost integer,
date_published date,
original_quantity integer,
quantity_sold integer,
);

INSERT INTO Book
VALUES
('B01','PB01', 'Gamble of Serpents', 'Fantasy', 59, '2018-3-25', 50, 14),
('B02', 'PB01','Sign of the Thirteenth Pendant', 'Mystery', 55, '2018-9-7', 35, 6),
('B09', 'PB04', 'Message in a Bottle', 'Sci-Fi', 65, '2019-2-16', 100, 88),
('B04', 'PB02', 'Sky Full of Stars', 'Romance', 48, '2019-12-30', 150, 123),
('B07', 'PB04', 'Winter Fairy', 'Crime', 67, '2020-6-6', 50, 24),
('B08', 'PB05', 'Yes, Maybe, No', 'Fantasy', 65, '2020-8-11', 30, 3),
('B03', 'PB03', 'Ragnorak Descending', 'Fantasy', 45, '2021-5-19', 150, 139),
('B05', 'PB03', 'Licensed for Ruin', 'Comedy', 35, '2021-9-27', 50, 35),
('B10', 'PB01', 'Abyss Returning', 'Romance', 71, '2021-1-7', 100, 69),
('B06', 'PB04', 'Blade of Queens', 'Sci-Fi', 54, '2022-4-2', 100, 91);

CREATE TABLE Orders(
order_ID varchar(4) NOT NULL PRIMARY KEY,
publisher_ID varchar(5) FOREIGN KEY REFERENCES Publisher (publisher_ID),
order_date date,
);

INSERT INTO Orders
VALUES
('O01', 'PB01', '2022-1-1'),
('O02', 'PB02', '2022-1-8'),
('O03', 'PB01', '2022-1-25'),
('O04', 'PB04', '2022-1-27'),
('O05', 'PB03', '2022-1-30'),
('O06', 'PB05', '2022-2-28');

CREATE TABLE OrderDetails(
order_ID varchar(4) FOREIGN KEY REFERENCES Orders(order_ID) ,
book_ID varchar(4) FOREIGN KEY REFERENCES Book (book_ID),
Constraint PK_Order_Book PRIMARY KEY (order_ID, book_ID),
order_quantity integer,
);

INSERT INTO OrderDetails
VALUES
('O01', 'B01', 20),
('O01', 'B02', 35),
('O02', 'B04', 15),
('O03', 'B09', 10),
('O04', 'B03', 20),
('O04', 'B05', 25),
('O04', 'B10', 30),
('O05', 'B07', 40),
('O05', 'B08', 20),
('O06', 'B06', 15);

CREATE TABLE Member (
member_ID varchar(4) NOT NULL PRIMARY KEY,
member_name char(50),
member_contact integer,
member_email varchar(50),
member_add varchar(100),
postcode varchar(5) FOREIGN KEY REFERENCES Postcode (postcode),
);

INSERT INTO Member
VALUES
('M01', 'Lim Shan Yen', 01238758625, 'shanyen10@gmail.com', '10 Jln Pju 3/49 Sunway Damansara',47810),
('M02', 'Kwan Kai Wah', 01635984578, 'kaiwahkwan@gmail.com', '73 1 Jln 2/3A', 68000),
('M03', 'Yip Kah Seng', 01513429806,'kahsengyip@gmail.com','6 Wisma Wan Mohamed Jln Panglima Bukit Gantang Wahab',30000),
('M04', 'Chan Wei Ting', 01385836608, 'weitingchan@gmail.com','19-2 Second Floor Sentul Raya Boulevard Jalan 15/48A Off Jalan Sentul', 51000),
('M05', 'Boon Zhi Jie', 01813657764, 'zhijieboon@gmail.com', '5 Jalan Seruling 58 Kawasan 3 Taman Jaya, Klang, Selangor', 42000);

CREATE TABLE Cart (
cart_ID varchar(4) PRIMARY KEY,
member_ID varchar(4) FOREIGN KEY REFERENCES Member (member_ID),
total_price integer
);

INSERT INTO Cart
VALUES
('C01', 'M01', 59),
('C02', 'M02', 295),
('C03', 'M03', 161),
('C04', 'M04', 195),
('C05', 'M05', 67),
('C06', 'M04', 118),
('C07', 'M02', 35),
('C08', 'M02', 65);

CREATE TABLE CartDetails(
cart_ID varchar(4) FOREIGN KEY REFERENCES Cart (cart_ID),
book_ID varchar(4) FOREIGN KEY REFERENCES Book (book_ID),
Constraint PK_Cart_Book PRIMARY KEY (cart_ID, book_ID),
cart_quantity integer,
price integer,
);

INSERT INTO CartDetails
VALUES
('C01', 'B01', 1, 59),
('C02', 'B02', 3, 165),
('C02', 'B03', 2, 130 ),
('C07', 'B08', 1, 35),
('C03', 'B03', 1, 65),
('C03', 'B04', 2, 96),
('C04', 'B06', 1, 65),
('C04', 'B03', 2, 130),
('C06', 'B01', 6, 354),
('C05', 'B05', 1, 67),
('C08','B03', 1, 65);

CREATE TABLE Delivery(
delivery_ID varchar(4) NOT NULL PRIMARY KEY,
delivery_status char(10),
shipped_date date,
);

INSERT INTO Delivery
VALUES
('D03', 'Delivered', '2022-3-23' ),
('D02', 'Delivered', '2022-3-27' ),
('D04', 'Delivered', '2022-3-30'),
('D01', 'Delivered', '2022-4-1'),
('D05', 'not yet', '2022-4-2'),
('D06', 'Delivered', '2022-4-12');

CREATE TABLE Payment (
payment_ID varchar(4) NOT NULL PRIMARY KEY,
member_ID varchar (4) FOREIGN KEY REFERENCES Member (member_ID),
cart_ID varchar(4) FOREIGN KEY REFERENCES Cart (cart_ID),
delivery_ID varchar(4) FOREIGN KEY REFERENCES Delivery (delivery_ID),
payment_method char(10),
payment_date date
);

INSERT INTO Payment
VALUES
('P01','M04', 'C04', 'D01', 'TNG Wallet', '2022-3-21' ),
('P02','M02', 'C02', 'D02', 'Tng Wallet', '2022-3-25' ),
('P03','M01', 'C01', 'D03', 'Paypal', '2022-3-27'),
('P04','M02', 'C07', 'D04', 'GrabPay', '2022-3-29'),
('P05','M05', 'C05', 'D05', 'Paypal', '2022-3-30'),
('P06', NULL, 'C03', NULL, NULL, NULL),
('P07', 'M02', 'C08', 'D06', 'GrabPay', '2022-4-1');

CREATE TABLE Review(
review_ID varchar(4) NOT NULL PRIMARY KEY,
member_ID varchar(4) FOREIGN KEY REFERENCES Member(member_ID),
book_ID varchar(4) FOREIGN KEY REFERENCES Book (book_ID),
rating integer,
comment char(300),
);

INSERT INTO Review
VALUES
('R01', 'M04', 'B06', 4, 'The plot of this book is some kind of old. I was expecting something new'),
('R02', 'M02', 'B03', 6, 'This book is amazing! Will recommend to my friends and family!'),
('R03', 'M01', 'B01', 10, 'Cute and nice story! Love it!'),
('R04', 'M02', 'B08', 7, 'Nice book.'),
('R05', 'M05', 'B05', 6, 'Overall okay but the story is too lengthly.');












