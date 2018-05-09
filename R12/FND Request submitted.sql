SELECT v.request_id,
       v.request_date,
       v.ACTUAL_COMPLETION_DATE,
       v.PHASE_CODE,
       v.STATUS_CODE,
       v.program_short_name short_name,
       v.user_concurrent_program_name,
       v.requestor,
       v.argument_text,
       v.responsibility_application_id app_id,
       (SELECT fa.application_short_name
          FROM fnd_application fa
         WHERE 1 = 1
           AND fa.application_id = v.responsibility_application_id) app_name /*,
           v.RESPONSIBILITY_ID,
           (SELECT fr.responsibility_key
           FROM fnd_responsibility fr
           WHERE 1=1
           AND fr.responsibility_id = RESPONSIBILITY_ID
           AND ROWNUM = 1)*/
  FROM fnd_conc_req_summary_v v
 WHERE 1=1
 --AND v.program_short_name = 'XXPAUPDATESTATUS'
--AND v.program LIKE 'Create Accounting%'
AND v.USER_CONCURRENT_PROGRAM_NAME LIKE 
--'XXPA:Project Status Update(BA)'
--'XXAR: Delivery Interface outbound GSCM to R3'
'XXPA%Project Revenue and Cost of Sales Recognition Request'
--'Period Close Reconciliation Report'
--'PRC: Transaction Import'
--'XXPA:Project Cost Data Outbound'

--AND v.request_date > TRUNC(SYSDATE)
--AND trunc(v.request_date) = to_date('2018-04-26','yyyy-mm-dd')
 --AND v.argument_text LIKE 'HEA_Oracle,%'
 --AND v.requestor = 'HAND_HKM'
 --AND v.status_code = 'Q'
 ORDER BY  v.request_id DESC
 ;
 
