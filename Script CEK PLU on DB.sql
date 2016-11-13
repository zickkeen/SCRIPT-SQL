SELECT a.PLUNumber
	, a.PLUName
	, b.[DepartmentName]
	, a.[Sell1]
	, a.[sell2]
	, a.[KP1]
	, a.[MasterKPPrint]
FROM PLU a
	, DEPARTMENTS b
where b.[DepartmentNo]=a.[Department]
	AND [SELL1] !=0