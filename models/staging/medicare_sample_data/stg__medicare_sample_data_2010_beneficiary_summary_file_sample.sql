
with source as (

    select * from {{ source('medicare_sample_data', 'medicare_samples__2010_beneficiary_summary_file_sample') }}

),

renamed as (

    select
        desynpuf_id,
        bene_birth_dt,
        bene_death_dt,
        bene_sex_ident_cd,
        bene_race_cd,
        bene_esrd_ind,
        sp_state_code,
        bene_county_cd,
        bene_hi_cvrage_tot_mons,
        bene_smi_cvrage_tot_mons,
        bene_hmo_cvrage_tot_mons,
        plan_cvrg_mos_num,
        sp_alzhdmta,
        sp_chf,
        sp_chrnkidn,
        sp_cncr,
        sp_copd,
        sp_depressn,
        sp_diabetes,
        sp_ischmcht,
        sp_osteoprs,
        sp_ra_oa,
        sp_strketia,
        medreimb_ip,
        benres_ip,
        pppymt_ip,
        medreimb_op,
        benres_op,
        pppymt_op,
        medreimb_car,
        benres_car,
        pppymt_car,
        row_number() over (partition by 1 order by 1) as unqiue_key

    from source

)

select * from renamed

