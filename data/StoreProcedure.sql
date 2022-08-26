DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
	SELECT * FROM customers;
END //
DELIMITER ;

call findAllCustomers();

DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
CREATE PROCEDURE findAllCustomers()
BEGIN 
	SELECT * FROM customers WHERE customerNumber = 175;
END //
DELIMITER ;

call findAllCustomers();

DELIMITER //
CREATE PROCEDURE getCusById(
 IN cusNum INT(11)
)
BEGIN 
	SELECT * FROM customers 
    WHERE customerNumber = cusNum;
END //

DELIMITER ;

call getCusById(175);

DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(
 IN in_city VARCHAR(50),
 OUT total INT
)
BEGIN
	SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END//
DELIMITER ;

CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total;

DELIMITER //
	CREATE PROCEDURE SetCounter(
		INOUT counter INT,
        IN inc INT
	)
    BEGIN 
		SET counter = counter + inc;
	END//
DELIMITER ;
SET @counter = 1;
CALL SetCounter(@counter, 1);
CALL SetCounter(@counter, 1);
CALL SetCounter(@counter, 5);
SELECT @counter;