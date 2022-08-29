delimiter //
CREATE PROCEDURE sp_addCustomer (
	IN sFullName VARCHAR(255),
    IN sEmail VARCHAR(50),
    IN sPhone VARCHAR(50),
    IN sAddress VARCHAR(255),
    OUT sMessage VARCHAR(200)
    )
BEGIN
	DECLARE flag BOOLEAN;
    SET flag = TRUE;
    IF (TRIM(sFullName)  = "") THEN 
		SET sMessage = 'Tên không được để trống';
        SET flag = FALSE;
        END IF;
	IF (TRIM(sEmail) = "") THEN
		SET sMessage = 'Email không được để trống';
        SET flag = FALSE;
        END IF;
	IF (exists (SELECT email FROM customers WHERE email = sEmail)) THEN
		SET sMessage = 'Email bị trùng vui lòng nhập lại';
        SET flag = FALSE;
        END IF;
	IF (TRIM(sPhone) = "") THEN
		SET sPhone = 'No Numberphone';
        END IF;
	IF (TRIM(sAddress) = "") THEN
		SET sAddress = 'No Address';
        END IF;
	IF (flag = TRUE) THEN
		INSERT INTO `data_banking`.`customers` (`full_name`, `email`, `phone`, `address`, `balance`, `created_at`, `deleted`) 
        VALUES (sFullName, sEmail, sPhone, sAddress, 0, now(), 0);
        SET sMessage = 'Đã thêm khách hàng mới thành công';
		END IF;
END;