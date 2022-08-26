SELECT * FROM quanlybanhang.customer;
INSERT INTO `quanlybanhang`.`customer` (`cID`, `cName`, `cAge`) 
VALUES (1, 'Minh Quan', 10),
		(2, 'Ngoc Oanh', 20),
        (3, 'Hong Ha', 50);
SELECT * FROM customer;

SELECT * FROM quanlybanhang.orderr;
INSERT INTO `quanlybanhang`.`orderr` (`cID`, `oDate`, `oTotalPrice`) 
VALUES ( 1, '2006/3/21', null),
		( 2, '2006/3/23', null),
        ( 1, '2006/3/16', null);
        
INSERT INTO `quanlybanhang`.`product` (`pName`,`pPrice`)
VALUES ('May Giat', 3),
		('Tu Lanh', 5),
        ('Dieu Hoa', 7),
        ('Quat', 1),
        ('Bep Dien', 2);
        
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`)
VALUES (1, 1, 3),
		(1, 3, 7),
        (1, 4, 2),
        (2, 1, 1),
        (3, 1, 8),
        (2, 5, 4),
        (2, 3, 3);
SELECT * FROM orderdetail