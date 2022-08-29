delimiter //
CREATE PROCEDURE sp_transfers (
	IN sRecipient_id VARCHAR(20),
    IN sSender_id VARCHAR(20),
    IN sBalance DECIMAL(12,0),
    IN fees FLOAT,
    OUT sMessage VARCHAR(200)
    )
BEGIN 
	DECLARE flag BOOLEAN;
    DECLARE feeAmount DECIMAL(12,0);
    DECLARE tranAmount DECIMAL(12,0);
    SET flag = TRUE;
    IF (TRIM(sRecipient_id) = "") THEN
		SET sMessage = 'Vui lòng nhập ID người nhận';
        SET flag = FALSE;
        END IF;
	IF (TRIM(sSender_id) = "") THEN
		SET sMessage = 'Vui lòng nhập ID người chuyển';
        SET flag = FALSE;
        END IF;
	IF (NOT EXISTS (SELECT id FROM customers WHERE id = sRecipient_id)) THEN
		SET sMessage = 'Id người nhận không tồn tại';
        SET flag = FALSE;
        END IF;
	IF (NOT EXISTS (SELECT id FROM customers WHERE id = sSender_id)) THEN
		SET sMessage = 'Id người chuyển không tồn tại';
        SET flag = FALSE;
        END IF;
	IF (sBalance <= 0) THEN
		SET sMessage = 'Số tiền chuyển khoản phải lớn hơn 0';
        SET flag = FALSE;
        END IF;
	IF (sBalance > (SELECT balance FROM customers WHERE id = sSender_id)) THEN
		SET sMessage = 'Số tiền chuyển khoản phải bé hơn số dư có trong tài khoản';
        SET flag = FALSE;
        END IF;
	IF (flag = TRUE) THEN
		SET feeAmount = (sBalance * fees) / 100;
        SET tranAmount = sBalance + feeAmount;
		INSERT INTO `data_banking`.`transfers` (`created_at`, `deleted`, `updated_at`,`fees`, `fees_amount`, `transaction_amount`, `transfer_amount`, `recipient_id`, `sender_id`) 
        VALUES (NOW(), 0, NOW(),fees, feeAmount, tranAmount, sBalance, sRecipient_id, sSender_id);


        
        UPDATE `data_banking`.`customers` AS c
        SET c.balance = c.balance - tranAmount
			WHERE (`id` = sSender_id);
            
		UPDATE `data_banking`.`customers` AS c
        SET c.balance = c.balance + sBalance 
			WHERE (`id` = sRecipient_id);
            
		SET sMessage = 'Đã chuyển tiền thành công';
		END IF;
END;