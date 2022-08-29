delimiter //
CREATE PROCEDURE sp_withdraws (
	IN sRecipient_id VARCHAR(20),
    IN sBalance DECIMAL(12,0),
    OUT sMessage VARCHAR(200)
    )
BEGIN 
	DECLARE flag BOOLEAN;
    SET flag = TRUE;
    IF (TRIM(sRecipient_id) = "") THEN
		SET sMessage = 'Vui lòng nhập ID người rút';
        SET flag = FALSE;
        END IF;
	IF (NOT EXISTS (SELECT id FROM customers WHERE id = sRecipient_id)) THEN
		SET sMessage = 'Id khách hàng không tồn tại';
        SET flag = FALSE;
        END IF;
	IF (sBalance <= 0) THEN
		SET sMessage = 'Số tiền rút phải lớn hơn 0';
        SET flag = FALSE;
        END IF;
	IF (sBalance > (SELECT balance FROM customers WHERE id = sRecipient_id)) THEN
		SET sMessage = 'Số tiền rút phải bé hơn tiền có trong tài khoản';
        SET flag = FALSE;
        END IF;
	IF (flag = TRUE) THEN
		INSERT INTO `data_banking`.`withdraws` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
			VALUES (now(), 0, sRecipient_id, sBalance);

        
        UPDATE `data_banking`.`customers` AS c
        SET c.balance = c.balance - sBalance 
			WHERE (`id` = sRecipient_id);
            
		SET sMessage = 'Đã rút tiền thành công';
		END IF;
END;