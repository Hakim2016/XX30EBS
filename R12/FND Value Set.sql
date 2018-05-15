SELECT ffvv.flex_value,
       ffvv.flex_value_meaning,
       ffvv.description,
       --substr(ffvv.compiled_value_attributes, 5, 1),
       decode(substr(ffvv.compiled_value_attributes, 5, 1),
              'A',
              'Asset',
              'R',
              'Revenue',
              'O',
              'Owners Equlity',
              'E',
              'Expense',
              'L',
              'Liability') cate,
       ffvs.*,
       ffvv.*

  FROM fnd_flex_value_sets ffvs,
       fnd_flex_values_vl  ffvv
 WHERE ffvs.flex_value_set_name = 'HBS_ACCOUNT' --'XXHEA_PAYMENT METHOD'
   AND ffvv.flex_value_set_id = ffvs.flex_value_set_id
--AND ffvv.flex_value_meaning = p_payment_method
--AND ROWNUM = 1
 ORDER BY ffvv.flex_value_meaning;

SELECT DISTINCT substr(ffvv.compiled_value_attributes, 5, 1)
  FROM fnd_flex_value_sets ffvs,
       fnd_flex_values_vl  ffvv
 WHERE ffvs.flex_value_set_name = 'HEA_ACCOUNT' --'XXHEA_PAYMENT METHOD'
   AND ffvv.flex_value_set_id = ffvs.flex_value_set_id
--AND ffvv.flex_value_meaning = p_payment_method
--AND ROWNUM = 1
--ORDER BY ffvv.flex_value_meaning
;
