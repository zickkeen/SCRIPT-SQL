SELECT a.PLUNumber
	, a.PLUName
	, b.[DepartmentName]
	, replace(convert(varchar,convert(Money, a.[Sell1]),1),'.00','') as [Sell1]
	, replace(convert(varchar,convert(Money, a.[sell2]),1),'.00','') as [Sell2]
	, c.[KPID] as KP1
	, d.[KPID] as KP2
	--, e.[KPID] as KP3
	, a.[MasterKPPrint]
FROM PLU a
	, DEPARTMENTS b
	, KPDetails c
	, KPDetails d
	, KPDetails e
where b.[DepartmentNo]=a.[Department]
	AND c.PrinterID = a.KP1
	AND d.PrinterID = a.KP2
	--AND e.PrinterID = a.KP3
	--AND [SELL1] !=0