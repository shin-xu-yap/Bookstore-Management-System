-- List the book(s) which has the highest rating. Show book id, book name and the rating
-- Find the total number of feedback per member. Show member id, member name, and total number of feedback per member
-- Find the total number of book published by each publisher. Show publisher id, publisher name, and number of book published
-- Find the total number of books ordered by store manager from each publisher
-- From the book table, list the books where quantity is more than the average quantity of all books
-- Find the bestselling book(s)
-- Show the member(s) who spent most on buying books
-- Show the member(s) who had not make any order
-- A list of purchased books that have not been delivered to members. The list should show member identification number, address, contact number, book serial number, book title, quantity, date and status of delivery
-- Show the members who made more than 2 orders

USE assignment;
SELECT  Cart.member_ID, Member.member_ID, Member.member_name, Member.member_contact,Book.book_ID, Book.book_name, Delivery.delivery_ID, Delivery.delivery_status, CartDetails.cart_ID, Payment.delivery_ID
FROM Cart
LEFT JOIN Member
ON Cart.member_ID = Member.member_ID
RIGHT JOIN CartDetails
ON CartDetails.cart_ID = Cart.cart_ID
LEFT JOIN Book
ON Book.book_ID = CartDetails.book_ID
RIGHT JOIN Payment
ON Payment.cart_ID = Cart.cart_ID
RIGHT JOIN Delivery
ON Delivery.delivery_ID = Payment.delivery_ID
WHERE delivery_status != 'Delivered'
ORDER BY Cart.cart_ID
