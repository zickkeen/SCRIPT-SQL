Declare @ETanggal datetime
Declare @NoSalesA int
Declare @NoSalesB int
Set @ETanggal = '06/03/2016'
Set @NoSalesA = '5388'
Set @NoSalesB = '5460'
update SalesTblsTemp set Open_Date=@ETanggal where SalesNo between @NoSalesA and @NoSalesB
update SalesTblsTemp set Close_Date=@ETanggal where SalesNo between @NoSalesA and @NoSalesB
update SalesItemsTemp set SDate=@ETanggal where SalesNo between @NoSalesA and @NoSalesB
update RcptDtls set PrintDate=@ETanggal where SalesNo between @NoSalesA and @NoSalesB
update RcptPrintDtls set Date =@ETanggal where SalesNo between @NoSalesA and @NoSalesB

/*
Tgl 27 Mei Sales Between 5077 and 5122 --
Tgl 28 Mei Sales Between 5123 and 5181 --
Tgl 29 Mei Sales Between 5182 and 5230 --
Tgl 30 Mei Sales Between 5231 and 5269 --
Tgl 31 Mei Sales Between 5270 and 5298 --
Tgl 1 Juni Sales Between 5299 and 5343 --
Tgl 2 Juni Sales Between 5344 and 5387 --
Tgl 3 Juni Sales Between 5388 and 5460 --
