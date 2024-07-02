-- Betting Analysis

--Write an sql query using a window function where you would only select each customer's first transaction. 
--We are giving a matched bonus on the first amount, but the amount cannot be higher than 20.

-- METHOD 1:- Using the Partition By clause


WITH CustomersTrans AS (
    SELECT
        PlyerId,
BetID,
        productid,
        BetAmt,
        ROW_NUMBER() OVER (PARTITION BY PlyerId ORDER BY betting_date) AS row_num
    FROM
        [Betting_tax]
    WHERE
        productid IN (1, 2)
)
SELECT
    PlyerId,
BetID,
    productid,
BetAmt,
   [Awarded Amount] = CASE
        WHEN BetAmt <= 20 THEN BetAmt ELSE 20  END
FROM
    CustomersTrans
WHERE
    row_num = 1;


--METHOD 2:- Using the Min betting date

SELECT
  PlyerId,
  BetID,
  productid,
  BetAmt,
  CASE  WHEN BetAmt > 20 THEN 20
    ELSE BetAmt  END AS bonus_amount
FROM  [Betting_tax] bt
WHERE
  productid IN (1, 2)
  AND bt.Betting_date = 
(
    SELECT MIN(Betting_date)
    FROM [Betting_tax]
    WHERE PlyerId = bt.PlyerId
      AND productid IN (1, 2)
  );
