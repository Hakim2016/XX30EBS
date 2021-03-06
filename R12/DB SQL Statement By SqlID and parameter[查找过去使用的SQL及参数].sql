
-- 查询过去使用的SQL语句
SELECT *
  FROM dba_hist_sqltext t
 WHERE 1 = 1
   AND t.sql_id = 'djmgu2v87n29q';
/*
-- SQL
SELECT pt.task_number,
       v.project_status_name,
       pt.task_id,
       v.project_id
  FROM xxpa_task_dtls_v v,
       pa_tasks         pt
 WHERE v.task_id = pt.task_id
   AND pt.task_id = top_task_id
   AND v.parent_structure_version_id = pa_project_structure_utils.get_latest_wp_version(v.project_id)
   AND upper(v.project_status_name) = :b2
   AND v.period_date > :b1
   AND v.period_date <= SYSDATE;
*/
-- SQL参数
SELECT *
  FROM dba_hist_sql_bind_metadata t
 WHERE t.sql_id = 'djmgu2v87n29q';
/* 
      DBID  SQL_ID  NAME  POSITION  DUP_POSITION  DATATYPE  DATATYPE_STRING CHARACTER_SID PRECISION SCALE MAX_LENGTH
  188210796 djmgu2v87n29q :B2 1   1 VARCHAR2(128) 873     128
  188210796 djmgu2v87n29q :B1 2   12  DATE        7
*/

-- 查找过去使用的SQL语句中的参数值
SELECT *
  FROM dba_hist_sqlbind t
 WHERE 1 = 1
   AND t.sql_id = 'djmgu2v87n29q'
 ORDER BY t.snap_id DESC,
          t.position;
/*
SNAP_ID  DBID  INSTANCE_NUMBER  SQL_ID  NAME  POSITION  DUP_POSITION  DATATYPE  DATATYPE_STRING  CHARACTER_SID  PRECISION  SCALE  MAX_LENGTH  WAS_CAPTURED  LAST_CAPTURED  VALUE_STRING
26334  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/9 22:20:08  CANCELLED
26334  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/9 22:20:08  04/08/2015 22:20:03
26311  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/8 22:20:04  CANCELLED
26311  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/8 22:20:04  04/07/2015 22:20:03
26310  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/8 22:20:04  CANCELLED
26310  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/8 22:20:04  04/07/2015 22:20:03
26287  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/7 22:20:05  CANCELLED
26287  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/7 22:20:05  04/06/2015 22:20:05
26286  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/7 22:20:05  CANCELLED
26286  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/7 22:20:05  04/06/2015 22:20:05
26263  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/6 22:20:08  CANCELLED
26263  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/6 22:20:08  04/05/2015 22:20:07
26262  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/6 22:20:08  CANCELLED
26262  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/6 22:20:08  04/05/2015 22:20:07
26239  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/5 22:20:09  CANCELLED
26239  188210796  1  djmgu2v87n29q  :B1  2    12  DATE        7  YES  2015/4/5 22:20:09  04/04/2015 22:20:07
26238  188210796  1  djmgu2v87n29q  :B2  1    1  VARCHAR2(128)  873      128  YES  2015/4/5 22:20:09  CANCELLED
26238  188210796	1	djmgu2v87n29q	:B1	2		12	DATE				7	YES	2015/4/5 22:20:09	04/04/2015 22:20:07
26214	188210796	1	djmgu2v87n29q	:B2	1		1	VARCHAR2(128)	873			128	YES	2015/4/4 22:20:08	CANCELLED
26214	188210796	1	djmgu2v87n29q	:B1	2		12	DATE				7	YES	2015/4/4 22:20:08	04/03/2015 22:20:05
26191	188210796	1	djmgu2v87n29q	:B2	1		1	VARCHAR2(128)	873			128	YES	2015/4/3 22:20:07	CANCELLED
26191	188210796	1	djmgu2v87n29q	:B1	2		12	DATE				7	YES	2015/4/3 22:20:07	04/02/2015 22:20:04
26190	188210796	1	djmgu2v87n29q	:B2	1		1	VARCHAR2(128)	873			128	YES	2015/4/3 22:20:07	CANCELLED
26190	188210796	1	djmgu2v87n29q	:B1	2		12	DATE				7	YES	2015/4/3 22:20:07	04/02/2015 22:20:04
26167	188210796	1	djmgu2v87n29q	:B2	1		1	VARCHAR2(128)	873			128	YES	2015/4/2 22:20:06	CANCELLED
26167	188210796	1	djmgu2v87n29q	:B1	2		12	DATE				7	YES	2015/4/2 22:20:06	04/01/2015 22:20:04
26166	188210796	1	djmgu2v87n29q	:B2	1		1	VARCHAR2(128)	873			128	YES	2015/4/2 22:20:06	CANCELLED
26166	188210796	1	djmgu2v87n29q	:B1	2		12	DATE				7	YES	2015/4/2 22:20:06	04/01/2015 22:20:04
*/
