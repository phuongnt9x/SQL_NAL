CREATE DATABASE demo;
use demo;
Alter table products
add unique uniqueProductCode(productCode);

Alter table products
add index composite_index (productName, productPrice);

explain select * from products where productName="Laptop";
create view view_products as 
select productCode,productName,productPrice,productStatus  from products;

Delimiter //
Create Procedure allrecords()
    BEGIN
    Select * from products;
    END//
DELIMITER ;
Call allrecord();
Delimiter //
Create Procedure del(IN id INT)
	BEGIN
    DELETE FROM products
	where products.id=id;
    END
DELIMITER ;