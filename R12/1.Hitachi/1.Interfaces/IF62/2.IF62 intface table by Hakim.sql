--IF62
SELECT intf.ZLSCH, intf.XBLNR,intf.ledger_id, intf.source_table, intf.*
  FROM xxgl_accounting_hfg_int intf
 WHERE 1 = 1
 AND intf.blart = 'Y6'--'Y3'--AR--'Y6'--Y6_for_AP
 AND intf.ledger_id= 2021
 AND intf.XBLNR IN ('58422148APR18')--('SPR-15000019','SPR-17000417')
 --AND intf.creation_date > to_date('2018-02-01','yyyy-mm-dd')
