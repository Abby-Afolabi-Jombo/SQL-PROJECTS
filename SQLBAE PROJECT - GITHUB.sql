 
--UPDATE [dbo].[AGENT DATA SET]
--   SET [Agent_code] = Agent_code varchar(50),
--      [Agent_name] = Agent_name varchar(50),
--      [Working_area] = Working_area varchar(50),
--      [Commission] = Commission DECIMAL,
--      [Phone no] = Phone_NO INT,
--      [Country] = Country varchar(50);
--GO


--ALTER TABLE [dbo].[AGENT DATA SET]
--ALTER COLUMN Commission DECIMAL(3,3);

--ALTER TABLE [dbo].[AGENT DATA SET]
--ALTER COLUMN  [Agent_name] VARCHAR (50) NOT NULL;


--CREATE TABLE [MAIN AGENT DATA SET]
--(Agent_code varchar(50) PRIMARY KEY NOT NULL,
--Agent_name varchar(50) NOT NULL,
--Working_area varchar(50),
--Commission DECIMAL(3,3),
--Phone_NO VARCHAR (50),
--Country varchar(50));

----INSERT INTO [dbo].[MAIN AGENT DATA SET]
----SELECT * FROM [dbo].[AGENT DATA SET]
----WHERE Commission IN (SELECT Commission FROM [dbo].[AGENT DATA SET] WHERE Commission < 10);

------DROP TABLE [dbo].[PRAT_CUSTOMER TABLE];

----SELECT * FROM [dbo].[MAIN AGENT DATA SET]


--CREATE TABLE [CUSTOMER DATA SET]
--(Cust_code VARCHAR (50) PRIMARY KEY NOT NULL, 
--Cust_name VARCHAR (50) not null unique,
--Cust_city varchar (50),
--cust_country VARCHAR (50),
--Grade smallint,
--Amount float,
--phone_no VARCHAR (50) not null,
--agent_code VARCHAR (50),
--FOREIGN KEY (agent_code) REFERENCES [dbo].[MAIN AGENT DATA SET] (Agent_code));

----ALTER TABLE [dbo].[CUSTOMER_TABLE_PROJECT]
----ALTER COLUMN  [Cust_code] VARCHAR (50) NOT NULL;

----ALTER TABLE [dbo].[CUSTOMER_TABLE_PROJECT]
----ADD PRIMARY KEY (Cust_code);

----ALTER TABLE [dbo].[CUSTOMER_TABLE_PROJECT
----ALTER COLUMN [Grade] smallint;

----ALTER TABLE [dbo].[CUSTOMER_TABLE_PROJECT]
----ALTER COLUMN [Amount] float;

----ALTER TABLE [dbo].[CUSTOMER_TABLE_PROJECT]
----ALTER COLUMN [Cust_name]VARCHAR (50) NOT NULL;
 
----ALTER TABLE [dbo].[CUSTOMER_TABLE_PROJECT]
----ADD CONSTRAINT Cust_name UNIQUE (Cust_name);

----INSERT INTO [dbo].[CUSTOMER DATA SET]
----SELECT * FROM [dbo].[CUSTOMER_TABLE_PROJECT]
----WHERE AMOUNT IN (SELECT AMOUNT FROM [dbo].[CUSTOMER_TABLE_PROJECT] WHERE AMOUNT < 1000000);

----DROP TABLE [dbo].[ORDERS_TABLE_SET];


--CREATE TABLE ORDERS_TABLE_SET
--(Ord_num INT  PRIMARY KEY NOT NULL, 
--Ord_amount FLOAT NOT NULL, 
--Ord_date DATE NOT NULL, 
--Cust_code VARCHAR (50), 
--FOREIGN KEY (Cust_code) references [dbo].[CUSTOMER DATA SET] (Cust_code), 
--Agent_code VARCHAR (50), 
--FOREIGN KEY (Agent_code) REFERENCES [dbo].[MAIN AGENT DATA SET] (Agent_code), 
--Ord_description VARCHAR (50) NOT NULL);
 
--INSERT INTO [dbo].[ORDERS_TABLE_SET]
--VALUES
--(200100, 1000, '08/01/2008','C00013','A003','SOD'),
--(200101, 3000,'07/12/2008','cooool','A008','SOD'),
--(200102, 2000, '05/25/2008','C00012','A012','SOD'),
--(200103, 1500, '05/15/2008','cooool','A005','SOD'),
--(200104, 1500, '03/13/2008','C00006','A004','SOD'),
--(200105, 2500, '08/17/2008','C00015','A011','SOD'),
--(200106, 2500, '04/20/2008','C00005','A002','SOD'),
--(200107,4500, '08/30/2008','C00007','AOIO','SOD'),
--(200108,4000, '02/15/2008','C00008','A004','SOD'),
--(200109, 3500, '07/20/2008','COOOII','AOIO','SOD'),
--(200110,3000, '05/15/2008','C00009','A006','SOD'),
--(200111,1000, '07/30/2008','C00014','A008','SOD'),
--(200112,2000, '05/30/2008','C00006','A007','SOD'),
--(200113,4000, '06/10/2008','C00007','A002','SOD'),
--(200114,3500, '08/15/2008','C00002','A008','SOD'),
--(200115,7000, '09/12/2008','C00004','A009','SOD');

USE ABISOLA
GO

SELECT UPPER (C.Cust_name) AS 'CUSTOMERS_NAMES', LOWER (A.Agent_name) AS 'AGENTS_NAMES'
FROM [dbo].[CUSTOMER DATA SET] AS C
FULL JOIN [dbo].[MAIN AGENT DATA SET] AS A
ON C.agent_code = A.Agent_code
WHERE C.cust_country = 'Canada' OR C.cust_country = 'USA';

SELECT DISTINCT C.cust_country, A.Country
FROM [dbo].[CUSTOMER DATA SET] C
full join 
[dbo].[MAIN AGENT DATA SET] A
ON C.agent_code = A.Agent_code;

SELECT Commission
FROM [dbo].[MAIN AGENT DATA SET]
WHERE Agent_code IN ('A002', 'A0IO', 'A004', 'A006', 'A003', 'A009', 'A012');


--ALTER TABLE ORDERS_TABLE_SET, COLUMN ORD_DATE TO DATETIME DATA TYPE INSTEAD

--ALTER TABLE [dbo].[ORDERS_TABLE_SET]
--ALTER COLUMN [Ord_date] DATETIME;

USE ABISOLA 
GO

SELECT Ord_amount, DATEADD (YEAR, 1, ord_date) AS NEW_DATE, DATEADD (MONTH, 1, Ord_date) AS ORDER_MONTH, DATEADD(MINUTE, 2, Ord_date) AS ORDER_TIME 
FROM ORDERS_TABLE_SET
where Ord_amount > 2000;

--SELECT CAST(DATEADD(MINUTE, 2, Ord_date) AS 'TIMI' 
--FROM ORDERS_TABLE_SET
--where Ord_amount > 2000
--SELECT * FROM [dbo].[CUSTOMER DATA SET]
SELECT COUNT(CUST_CODE) FROM [dbo].[ORDERS_TABLE_SET]

--SELECT COUNT(CUST_CODE) as TOTAL_OF_CUSTOMERS, Agent_code, [Ord_date]
--FROM [dbo].[ORDERS_TABLE_SET]
--GROUP BY Agent_code,[Ord_date]
--HAVING ORD_DATE BETWEEN '2008-01-01' AND '2008-08-31';


--SELECT COUNT(CUST_CODE) as TOTAL_OF_CUSTOMERS, Agent_code
--FROM [dbo].[ORDERS_TABLE_SET]
--GROUP BY Agent_code
--ORDER BY Agent_code


--UPDATE [dbo].[MAIN AGENT DATA SET]
--SET Agent_code = 'A010'
--WHERE Phone_NO = '078-22255588'

--ALTER TABLE [dbo].[MAIN AGENT DATA SET]
--ALTER COLUMN Agent_code = 'A010'
--WHERE Phone_NO = '078-22255588'