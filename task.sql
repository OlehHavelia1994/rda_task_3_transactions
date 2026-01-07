-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (CustomerID, date)
VALUES (1, '2026-01-07');
-- Start the transaction 
START TRANSACTION;
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 5);
-- And some data should be created inside the transaction
UPDATE Products
INNER JOIN OrderItems
ON Products.ID = OrderItems.ProductID
SET Products.WarehouseAmount = Products.WarehouseAmount - OrderItems.Count
WHERE Products.ID = 1;

COMMIT; 