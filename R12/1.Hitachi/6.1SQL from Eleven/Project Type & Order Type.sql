
select p.project_type,
       p.segment1,
       ol.project_id,
       oh.order_number,
       tt.NAME,
       tt2.name,
       oh.order_type_id,
       pt.description
  from pa_projects_all      p,
       oe_order_lines_all   ol,
       oe_order_headers_all oh,
       oe_transaction_types tt2,
       oe_transaction_types tt,
       PA_PROJECT_TYPES_ALL pt
 where 1 = 1
      
   and p.project_type in ('L', 'H', 'D')
   and ol.project_id(+) = p.project_id
   and oh.header_id(+) = ol.header_id
   and oh.order_type_id = tt.TRANSACTION_TYPE_ID(+)
   and ol.line_type_id = tt2.TRANSACTION_TYPE_ID(+)
   and p.project_type = pt.project_type
  and segment1 in ('12001999',
                    '12002149',
                    '12002196',
                    '12002234',
                    '12002285',
                    '12002307',
                    '12002318',
                    '12002332',
                    '12002345',
                    '12002407',
                    '12002414',
                    '12002415',
                    '12002424',
                    '12002426',
                    '12002427',
                    '12002429',
                    '12002439',
                    '12002444',
                    '12002452',
                    '12002457',
                    '12002460',
                    '12002461',
                    '12002463',
                    '12002467',
                    '12002469',
                    '12002470',
                    '12002477',
                    '12002487',
                    '12002489',
                    '12002493',
                    '12002497',
                    '12002500',
                    '12002501',
                    '12002507',
                    '12002511',
                    '12002515',
                    '12002520',
                    '12002521',
                    '12002539',
                    '12002540',
                    '12002544',
                    '12002545',
                    '12002547',
                    '12002549',
                    '12002564',
                    '12002568')
/*select * from oe_order_lines_all
where project_id is not null*/
