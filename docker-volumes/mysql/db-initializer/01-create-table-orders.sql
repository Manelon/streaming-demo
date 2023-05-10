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
	TransactionDate DATETIME,
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

insert into ACCOUNTS (Currency, Balance) values ('GBP', 100.00);
insert into ACCOUNTS (Currency, Balance) values ('GBP', 200.00);
insert into ACCOUNTS (Currency, Balance) values ('GBP', 300.00);
insert into ACCOUNTS (Currency, Balance) values ('GBP', 400.00);
insert into ACCOUNTS (Currency, Balance) values ('GBP', 500.00);

insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (1, 10.00, 'Deposit', '2020-01-01 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (1, 20.00, 'Deposit', '2020-01-02 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (1, 30.00, 'Deposit', '2020-01-03 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (1, 40.00, 'Deposit', '2020-01-04 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (2, 50.00, 'Deposit', '2020-01-05 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (2, 60.00, 'Deposit', '2020-01-06 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (2, 70.00, 'Deposit', '2020-01-07 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (2, 80.00, 'Deposit', '2020-01-08 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (3, 90.00, 'Deposit', '2020-01-09 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (3, 100.00, 'Deposit', '2020-01-10 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (3, 110.00, 'Deposit', '2020-01-11 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (3, 120.00, 'Deposit', '2020-01-12 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (4, 130.00, 'Deposit', '2020-01-13 10:00:00');
insert into TRANSACTIONS (AccountID, Amount, TransactionType, TransactionDate) values (4, 140.00, 'Deposit', '2020-01-14 10:00:00');


