create table trt as
select * from eicu.treatment where 
lower(treatmentstring) like '%plasmapheresis%' or
lower(treatmentstring) like '%plasma exchange%' or
lower(treatmentstring) like '%fresh frozen plasma%'

create table dx as
select * from eicu.diagnosis where 
patientunitstayid in (select distinct patientunitstayid from trt) AND
(lower(diagnosisstring) like '%severe sepsis%' 
or lower(diagnosisstring) like '%septic shock%'
or lower(diagnosisstring) like '%sepsis|severe%')

select * from eicu.patient where 
patientunitstayid in (select distinct patientunitstayid from dx)
