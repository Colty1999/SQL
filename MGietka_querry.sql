INSERT INTO Customer ([Customer ID], [Customer Name], Segment)
VALUES (100151402, 'Aaron Bergman', 'Consumer');

INSERT INTO [Order]([Order ID], [Customer ID], [Order Date], [Ship date], [Product ID])
VALUES (41954, 100151402, 11/11/2014, 5816);

INSERT INTO Product ([Product ID], [Product Name], Category)
VALUES (5816, 'Samsung Convoy 3', 'Technology');

INSERT INTO Shipping ([Order ID], Shipdate, [Ship mode], [Ship cost])
VALUES (41954, 13/11/2014, 'First Class', 40.77);

INSERT INTO [Customer Location] ([Customer ID], [Postal Code], City, [State], Country)
VALUES (100151402, 73120, 'Oklahoma City', 'Oklahoma', 'United States');

INSERT INTO [Order Details] ([Order ID], [Product ID], [Quantity], Sales, Discount, Profit)
VALUES (41954, 5816, 2, 221.98, 0, 62.15);