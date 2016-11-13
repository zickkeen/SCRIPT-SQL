

----- data akan muncul setelah buka report trans item di BO baru bisa jalanin skrip ini---------
--------------------------------------------------------------------------------
SELECT     dbo.TransItems.OperatorName, dbo.TransItems.TableNo, CONVERT(VARCHAR(12), dbo.TransItems.SDate, 105) as SDate, CONVERT(VARCHAR(8), dbo.TransItems.STime, 108) as STime, dbo.TransItems.Quantity, dbo.TransItems.ItemName, 
                      dbo.TransItems.ItemAmount, dbo.RcptPrintDtls.Salesno, dbo.TransItems.TSalesNo, dbo.TransItems.TTableNo, dbo.RcptPrintDtls.date AS PrintT, COUNT(*) AS jml
FROM         dbo.TransItems INNER JOIN
                      dbo.RcptPrintDtls ON dbo.TransItems.SalesNo = dbo.RcptPrintDtls.Salesno
GROUP BY dbo.TransItems.OperatorName, dbo.TransItems.TableNo, dbo.TransItems.SDate, dbo.TransItems.STime, dbo.TransItems.Quantity, dbo.TransItems.ItemName, 
                      dbo.TransItems.ItemAmount, dbo.RcptPrintDtls.Salesno, dbo.TransItems.TSalesNo, dbo.TransItems.TTableNo, dbo.RcptPrintDtls.date, 
                      dbo.RcptPrintDtls.Preprintcopyno
HAVING      (CONVERT(VARCHAR(8), dbo.TransItems.STime, 108) > CONVERT(VARCHAR(8), dbo.RcptPrintDtls.date, 108))
Order By dbo.RcptPrintDtls.Salesno desc


-------------------------------------------------------------------------------------------
DECLARE @SalesNo varchar(10)
Set @SalesNo = 14152
SELECT b.OperatorName As Opearator, a.SalesNo, a.POSID, a.TableNo, a.SplitNo, a.TransStatus, a.TSalesNo, a.TransferredTable, a.PLUNo, CONVERT(VARCHAR(12), a.SDate, 105) As SDate, CONVERT(VARCHAR(8), a.STime,108) as STime, a.Quantity, a.ItemName, a.ItemAmount, a.SalesRef, a.FunctionID
FROM SalesItemsTemp a, Operator b
WHERE (a.SalesNo = @SalesNo) AND b.OperatorNo = a.OperatorNo
ORDER BY SplitNo, a.SalesRef

-----------------------------------
SELECT     a.Rcptno, a.Salesno, a.splitno, b.OperatorName, a.date, a.Copyno, a.Preprintcopyno
FROM RcptPrintDtls a, Operator b
WHERE     (Salesno = @SalesNo) AND a.OperatorNo = b.OperatorNo
ORDER By a.SplitNo, a.PrePrintCopyNo

----------------------------------------------

SELECT *
FROM TransItems
WHERE (SalesNo = @SalesNo)
