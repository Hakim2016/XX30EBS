--org_id      Resp_id     Resp_app_id
--HBS 101     51249       660        
--HEA 82      50676       660
--HET 141     51272       20005
--SHE 84      50778       20005

/*BEGIN
  fnd_global.apps_initialize(user_id      => 4270,
                             resp_id      => 51249,
                             resp_appl_id => 660);
  mo_global.init('M');
  
END;*/

--1.xxpa_proj_milestone_manage_his
SELECT ROWID,
       period_name,
       installation_progress_rate,
       row_id,
       org_id,
       project_id,
       mfg_no,
       object_version_number,
       created_by,
       creation_date,
       last_updated_by,
       last_update_date,
       last_update_login,
       program_application_id,
       program_id,
       program_update_date,
       request_id,
       attribute_category,
       attribute1,
       attribute2,
       attribute3,
       attribute4,
       attribute5,
       attribute6,
       attribute7,
       attribute8,
       attribute9,
       attribute10,
       attribute11,
       attribute12,
       attribute13,
       attribute14,
       attribute15
  FROM xxpa_proj_progress_his_v v
 WHERE (to_date(period_name, 'MON-YY') < to_date('', 'MON-YY') OR '' IS NULL)
   AND (org_id = 101)
   --AND (project_id = 2575398)
   --AND (mfg_no = 'JED0202-VN')
   ;
   
--2.xxpa_proj_milestone_manage
/*CREATE OR REPLACE VIEW XXPA_PROJ_MILESTONE_MRG_V AS*/
SELECT xpmm.proj_milestone_id,
       hou.name             operating_unit,
       pp.org_id,
       pp.project_id,
       pp.segment1          project_number,
       pt.task_id,
       pt.task_number       mfg_no,
       --xpmm.creation_date,
       xpmm.period_name,
       xpmm.ba_fully_packing_date,
       xpmm.fully_packing_date,
       xpmm.fully_delivery_date,
       xpmm.installation_progress_rate,
       xpmm.hand_over_date,
       xpmm.fm_period_month, --add by gusenlin 2014-01-21
       pp.project_type,
       pp.rowid            row_id,
       xpmm.object_version_number,
       xpmm.created_by,
       xpmm.creation_date,
       xpmm.last_updated_by,
       xpmm.last_update_date,
       xpmm.last_update_login,
       xpmm.program_application_id,
       xpmm.program_id,
       xpmm.program_update_date,
       xpmm.request_id
FROM   pa_projects_all          pp,
       pa_tasks             pt,
       hr_operating_units   hou  ,
       xxpa_proj_milestone_manage     xpmm
WHERE  pp.org_id               = hou.organization_id
  AND  pp.enabled_flag         = 'Y'
  AND  pp.project_status_code  = 'APPROVED'
  AND  pp.template_flag        = 'N'
  AND  pp.project_id           = pt.project_id
  AND  pt.task_id              = pt.top_task_id
  AND  pp.org_id               = nvl(xpmm.org_id,pp.org_id)
  AND  pt.project_id           = xpmm.project_id(+)
  AND  pt.task_number          = xpmm.mfg_num(+)
  AND pp.org_id = 101
  AND pp.segment1 = '53020362'--'53020400'
  --AND pt.task_number IN 
  --('JED0210-VN','JED0211-VN','JED0212-VN','JED0219-VN','JED0220-VN','JED0225-VN')
  --AND xpmm.fully_packing_date IS NOT NULL
  --AND xpmm.fully_delivery_date IS NOT NULL
  --AND ROWNUM < 5
ORDER BY hou.name,
         pp.segment1
;

SELECT * FROM XXPA_PROJ_MILESTONE_MRG_V;
