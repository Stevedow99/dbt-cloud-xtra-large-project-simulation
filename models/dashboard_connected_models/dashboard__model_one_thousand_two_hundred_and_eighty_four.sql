with model_a as
  (select *
   from {{ ref('rollup__model_four_hundred_and_thirty_six') }})
select * exclude unqiue_key,
         row_number() over (partition by 1
                            order by 1) as unqiue_key
from model_a