with model_a as
  (select * exclude unqiue_key,
            unqiue_key as model_a_unqiue_key
   from stg__tpch_data_region),
     model_b as
  (select * exclude unqiue_key,
            unqiue_key as model_b_unqiue_key
   from stg__tpch_data_region),
     joined_models as
  (select a.*,
          b.*
   from model_a a
   inner join model_b b on a.model_a_unqiue_key = b.model_b_unqiue_key)
select * exclude (model_a_unqiue_key, model_b_unqiue_key),
         row_number() over (partition by 1
                            order by 1) as unqiue_key
from joined_models