DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);


DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
 

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
SELECT
    C."Name",
    C."Country",
    O."Order_ID",
    O."Order_Date",
    O."Total_Amount"
FROM
    Customers C  -- 'Cust
INNER JOIN
    Orders O ON C."Customer_ID" = O."Customer_ID"; 

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'C:\Users\lenovo\Downloads\Books.csv' 
CSV HEADER;



COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'C:\Users\lenovo\Downloads\Customers.csv' 
CSV HEADER;


COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Users\lenovo\Downloads\Orders.csv'
CSV HEADER;
