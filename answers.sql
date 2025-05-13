-- Question 1: Achieving 1NF (First Normal Form)
-- The Products column contains multiple values, so we need to split them into separate rows.

-- Step 1: Create the new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Step 2: Insert individual products per order
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'Achieng Otieno', 'Laptop'),
(101, 'Achieng Otieno', 'Mouse'),
(102, 'Kamau Mwangi', 'Tablet'),
(102, 'Kamau Mwangi', 'Keyboard'),
(102, 'Kamau Mwangi', 'Mouse'),
(103, 'Wanjiku Njeri', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)
-- The table has partial dependencies, so we need to separate customer information from order items.

-- Step 1: Create the Orders table to store OrderID and CustomerName
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert unique OrderID and CustomerName pairs into the Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'Achieng Otieno'),
(102, 'Kamau Mwangi'),
(103, 'Wanjiku Njeri');

-- Step 3: Create the OrderItems table to store OrderID, Product, and Quantity
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert product details (OrderID, Product, Quantity) into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
