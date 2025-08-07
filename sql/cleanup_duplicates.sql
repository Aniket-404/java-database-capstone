-- Script to clean up duplicate emails in patient and doctor tables
-- This script keeps the record with the lowest ID and removes duplicates

-- Clean up duplicate patients by email
WITH duplicate_patients AS (
    SELECT email, MIN(id) as keep_id
    FROM patient 
    GROUP BY email 
    HAVING COUNT(*) > 1
)
DELETE FROM patient 
WHERE id NOT IN (
    SELECT keep_id FROM duplicate_patients
    UNION
    SELECT id FROM patient 
    WHERE email IN (
        SELECT email FROM patient 
        GROUP BY email 
        HAVING COUNT(*) = 1
    )
);

-- Clean up duplicate doctors by email
WITH duplicate_doctors AS (
    SELECT email, MIN(id) as keep_id
    FROM doctor 
    GROUP BY email 
    HAVING COUNT(*) > 1
)
DELETE FROM doctor 
WHERE id NOT IN (
    SELECT keep_id FROM duplicate_doctors
    UNION
    SELECT id FROM doctor 
    WHERE email IN (
        SELECT email FROM doctor 
        GROUP BY email 
        HAVING COUNT(*) = 1
    )
);

-- Add unique constraints (if they don't exist already)
-- Note: These might fail if the application is using Hibernate to manage schema
-- ALTER TABLE patient ADD CONSTRAINT uk_patient_email UNIQUE (email);
-- ALTER TABLE doctor ADD CONSTRAINT uk_doctor_email UNIQUE (email);

-- Verify no duplicates remain
SELECT 'Patient email duplicates remaining:' as check_type, COUNT(*) as count
FROM (
    SELECT email 
    FROM patient 
    GROUP BY email 
    HAVING COUNT(*) > 1
) duplicates
UNION ALL
SELECT 'Doctor email duplicates remaining:' as check_type, COUNT(*) as count
FROM (
    SELECT email 
    FROM doctor 
    GROUP BY email 
    HAVING COUNT(*) > 1
) duplicates;
