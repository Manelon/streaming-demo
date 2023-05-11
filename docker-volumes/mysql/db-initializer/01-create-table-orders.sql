use demo;

create table ORDERS (
	id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_total_usd DECIMAL(11,2),
	make VARCHAR(50),
	model VARCHAR(50),
	delivery_city VARCHAR(50),
	delivery_company VARCHAR(50),
	delivery_address VARCHAR(50),
	CREATE_TS DATETIME DEFAULT CURRENT_TIMESTAMP,
	UPDATE_TS DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


create table ACCOUNTS (
	id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Currency CHAR(3) DEFAULT 'GBP',
	Balance DECIMAL(11,2) DEFAULT 0.00,
	CREATE_TS DATETIME DEFAULT CURRENT_TIMESTAMP,
	UPDATE_TS DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table TRANSACTIONS (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	AccountID MEDIUMINT,
	Amount DECIMAL(11,2),
	TransactionType VARCHAR(50),
	CREATE_TS DATETIME DEFAULT CURRENT_TIMESTAMP,
	UPDATE_TS DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (AccountID),
	FOREIGN KEY (AccountID) REFERENCES ACCOUNTS(id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TRIGGER `on_insert_transaction_update_balance` AFTER INSERT ON `TRANSACTIONS` FOR EACH ROW UPDATE ACCOUNTS SET Balance = Balance + NEW.Amount WHERE id = NEW.AccountID;
CREATE TRIGGER `on_update_transaction_update_balance` AFTER UPDATE ON `TRANSACTIONS` FOR EACH ROW UPDATE ACCOUNTS SET Balance = Balance + NEW.Amount - OLD.Amount WHERE id = NEW.AccountID;
CREATE TRIGGER `on_delete_transaction_update_balance` AFTER DELETE ON `TRANSACTIONS` FOR EACH ROW UPDATE ACCOUNTS SET Balance = Balance - OLD.Amount WHERE id = OLD.AccountID;	



