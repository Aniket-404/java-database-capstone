-- Script to clean up duplicate emails in patient and doctor tables (MySQL compatible)
-- This script keeps the record with the lowest ID and removes duplicates

-- Method 1: Simple JOIN approach (recommended for MySQL)
-- Clean up duplicate patients by email
DELETE p1 FROM patient p1
INNER JOIN patient p2 
WHERE p1.email = p2.email 
AND p1.id > p2.id;

-- Clean up duplicate doctors by email  
DELETE d1 FROM doctor d1
INNER JOIN doctor d2 
WHERE d1.email = d2.email 
AND d1.id > d2.id;

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
