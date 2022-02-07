insert into customer values (1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
insert into order1 values (1,1,"2006-3-21",null),
(2,2,"2006-3-23",null),
(3,1,"3-16-2006z",null);
insert into product(pName,pPrice) values ("May Giat",3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat",1),
("Bep Dien",2);

#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID,oDate,oTotalPrice FROM order1;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.cName,order1.oID,product.pName from
customer join order1 on customer.cID=order1.cID
join orderdetail on order1.oID=orderdetail.oID
join product on orderdetail.pID=product.pID;

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    customer.cName
FROM
    customer
WHERE
    cID NOT IN (SELECT 
            cID
        FROM
            order1);
#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    o.oID, o.oDate, SUM(p.pPrice * od.odQTY) AS Price
FROM
    order1 AS o
        JOIN
    orderdetail AS od ON od.oID = o.oID
        JOIN
    product AS p ON p.pID = od.pID
GROUP BY o.oID