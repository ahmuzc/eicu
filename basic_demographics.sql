-- ------------------------------------------------------------------
-- Title: Basic Demographics
-- Description: Extracts patient unique identifier, gender, age,
--              admission diagnosis, hospital mortality and
--              icu length of stay.
-- ------------------------------------------------------------------

SELECT patientunitstayid, age, apacheadmissiondx,
       CASE WHEN gender = 'Male' THEN 1
            WHEN gender = 'Female' THEN 2
            ELSE NULL END AS gender,
       CASE WHEN hospitaldischargestatus = 'Alive' THEN 0
            WHEN hospitaldischargestatus = 'Expired' THEN 1
            ELSE NULL END AS hosp_mortality,
       ROUND(unitdischargeoffset/60) AS icu_los_hours
FROM patient
ORDER BY patientunitstayid;
