-- SELECT PRODUCT YANG NGELINK KE RECEIPT
USE hrsDevector
DECLARE @ProdName varchar(25)
SET @ProdName = 'BEEF MINCED AUST,KG'
SELECT P.Prod_Name,M.RM_RcpName,R.Rcp_Qty_MUnit,R.Rcp_Cost,R.Rcp_Avg_Cost,M.RM_Active
FROM ProductDetails AS P,Recipe AS R, RecipeMain AS M
WHERE P.Prod_Name = R.Rcp_Prod_Name 
	AND R.Rcp_No = M.RM_Rcp_No 
	AND R.Rcp_Prod_Name = @ProdName
ORDER BY M.RM_RcpName

--SELECT RECEIPT YANG NGELINK KE PLU
USE dbDevector
DECLARE @ReceiptName varchar(25)
SET @ReceiptName = 'Bitterbalen with Pesto Sauce%'
SELECT P.PLUNumber, P.PLUName, P.CostPrice,D.RM_Cost,P.LnkTo, P.RecipeID, D.RM_RcpName
FROM PLU AS P INNER JOIN hrsDevector.dbo.RecipeMain AS D ON P.RecipeID = D.RM_Rcp_No 
WHERE (P.LnkTo='R') AND (D.RM_RcpName like @ReceiptName )
ORDER BY P.PLUName


---- Cek PLU Berulang
DECLARE @counter INT, @pluno VARCHAR(MAX), @SQLQuery VARCHAR(MAX), @jmldata int
DECLARE @vtable  TABLE (counter int,pluno varchar(20))

-- INSERTING DATA PERGANTIAN DI SINI
--## REPLACE START
INSERT INTO @vtable (counter,pluno)
SELECT '1', '000000000001624' UNION ALL
SELECT '2', '000000000000232'  UNION ALL
SELECT '3', '000000000001137'  UNION ALL
SELECT '4', '000000000001620'  UNION ALL
SELECT '5', '000000000001521'  UNION ALL
SELECT '6', '000000000001553'  UNION ALL
SELECT '7', '000000000001659'  UNION ALL
SELECT '8', '000000000001129'  UNION ALL
SELECT '9', '000000000000240'  UNION ALL
SELECT '10', '000000000000507'  UNION ALL
SELECT '11', '000000000000582'  UNION ALL
SELECT '12', '000000000000228'  UNION ALL
SELECT '13', '000000000001135'  UNION ALL
SELECT '14', '000000000001737'  UNION ALL
SELECT '15', '000000000001308'  UNION ALL
SELECT '16', '000000000001755'  UNION ALL
SELECT '17', '000000000001309'  UNION ALL
SELECT '18', '000000000001754'  UNION ALL
SELECT '19', '000000000001276'  UNION ALL
SELECT '20', '000000000001756'  UNION ALL
SELECT '21', '000000000000235'  UNION ALL
SELECT '22', '000000000001486'  UNION ALL
SELECT '23', '000000000001658'  UNION ALL
SELECT '24', '000000000000233'

--## REPLACE END
SET @jmldata = (SELECT count(counter) FROM @vtable)
Set @counter = 1
WHILE(@counter <=@jmldata)
BEGIN
SET @pluno = (SELECT pluno FROM @vtable WHERE counter=@counter) 
SET @SQLQuery ='SELECT SUM("Sold") as Terjual, SUM("ItemSales") as uang FROM PLUSalesRep WHERE "PLUNo" = ' + @pluno

PRINT(@SQLQuery)
SET @counter = @counter + 1
END