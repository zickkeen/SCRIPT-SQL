/*
 KP 2 = BAR
 KP 3 = KITCHEN
 KP 4 = dBAR
 KP 5 = dKITCHEN
 KP 6 = KASIR
 MKP1 = dBAR
 MKP2 = dKITCHEN
 MKP3 = dKITCHEN

 */
SELECT * FROM PLU WHERE KP1=3 AND KP2=0
-- PAKET KP1=2 AND KP2=3 AND KP3=5 AND MasterKPPrint=1 AND masterkpprint2=1 AND masterkpprint3=1
update PLU SET KP1=2, KP2=3, KP3=6, MasterKPPrint=1, masterkpprint2=1, masterkpprint3=1

WHERE KP1=2 AND KP2=3 AND KP3=5 AND MasterKPPrint=1 AND masterkpprint2=1 AND masterkpprint3=1
-- BAR KP1=2 AND KP2=99 AND KP3=6 AND MasterKPPrint=1 AND masterkpprint2=0 AND masterkpprint3=0 
update PLU SET KP1=2, KP2=99, KP3=6, MasterKPPrint=1, masterkpprint2=0, masterkpprint3=0 

WHERE KP1=2 AND KP2=4 AND KP3=0 AND MasterKPPrint=1 AND masterkpprint2=0 AND masterkpprint3=0
-- KITCHEN KP1=3 AND KP2=99 AND KP3=6 AND MasterKPPrint=1 AND masterkpprint2=1 AND masterkpprint3=1
update PLU SET KP1=3, KP2=99, KP3=6, MasterKPPrint=0, masterkpprint2=1, masterkpprint3=1

WHERE KP1=3 AND KP2=99 AND KP3=6 AND MasterKPPrint=1 AND masterkpprint2=1 AND masterkpprint3=1
