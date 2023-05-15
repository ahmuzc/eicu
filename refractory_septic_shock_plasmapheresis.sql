select distinct patientunitstayid from eicu.sepsis_adult_eicu where patientunitstayid in
(select distinct patientunitstayid from eicu.norepinephrine_info_eicu where rate_norepinephrine>0.4)
AND patientunitstayid in 
(select distinct patientunitstayid from eicu.treatment where treatmentstring like '%plasmapheresis%'
OR treatmentstring like '%fresh frozen plasma%')
