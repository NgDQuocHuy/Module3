CREATE SCHEMA Demo;
CREATE TABLE ProductsDemo (
id VARCHAR(10),
productCode VARCHAR(10),
productName VARCHAR(200),
productPrice DECIMAL(12,0),
productAmount DECIMAL(12,0),
productDescription VARCHAR(200),
productStatus BOOLEAN);

ALTER TABLE `demo`.`productsdemo` 
CHANGE COLUMN `productCode` `productCode` VARCHAR(10) NOT NULL ,
ADD PRIMARY KEY (`productCode`),
ADD UNIQUE INDEX `productCode_UNIQUE` (`productCode` ASC) VISIBLE;

ALTER TABLE `demo`.`productsdemo` 
ADD UNIQUE INDEX `productName_UNIQUE` (`productName` ASC) VISIBLE,
ADD UNIQUE INDEX `productPrice_UNIQUE` (`productPrice` ASC) VISIBLE;

CREATE VIEW ViewDemo AS
SELECT productCode, productName, productPrice, productStatus
FROM productsdemo;

DROP VIEW viewdemo;



