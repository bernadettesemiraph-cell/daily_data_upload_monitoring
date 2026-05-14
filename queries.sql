//CREATING THE DATABASE
CREATE DATABASE data_operations_demo;

USE DATABASE data_operations_demo;

CREATE SCHEMA data_operations_demo.monitoring;


//CREATING THE DATA TABLE
CREATE TABLE data_operations_demo.monitoring.daily_uploads (
        file_name STRING,
        upload_date DATE,
        source_system STRING,
        status STRING,
        record_count INTEGER,
        notes STRING
        );


//INSERTING SAMPLE DATA
INSERT INTO data_operations_demo.monitoring.daily_uploads
    (file_name, upload_date, source_system, status, record_count, notes)

        VALUES
        ('accounts_0514.csv', '2026-05-14', 'Custodian System', 'Success', 1240, 'Complete'),
        ('portfolio_0514.csv', '2026-05-14', 'Portfolio PMS', 'Failed', 0, 'Missing file'),
        ('transactions_0514.csv', '2026-05-14', 'Bank Feed', 'Success', 3520, 'Complete'),
        ('clientdata_0514.csv', '2026-05-14', 'CRM Platform', 'Success', 890, 'Complete'),
        ('holdings_0514.csv', '2026-05-14', 'Investment Feed', 'Delayed', 0, 'Late upload');


//VIEWING DATA
SELECT DISTINCT *
FROM data_operations_demo.monitoring.daily_uploads;


//CREATE A FAILURE MONITORING QUERY : STATUS IS FAILED
SELECT DISTINCT *
FROM data_operations_demo.monitoring.daily_uploads
WHERE status = 'Failed';


//CREATE DAILY STATUS SUMMARY
SELECT status, COUNT(*) AS total_files
FROM data_operations_demo.monitoring.daily_uploads
GROUP BY status;


//ADDING MORE SAMPLE DATA
INSERT INTO data_operations_demo.monitoring.daily_uploads
(file_name, upload_date, source_system, status, record_count, notes)

VALUES
('cashbalances_0514.csv', '2026-05-14', 'Treasury System', 'Success', 670, 'Validated successfully'),

('investments_0514.csv', '2026-05-14', 'Portfolio PMS', 'Success', 1850, 'Complete'),

('auditlogs_0514.csv', '2026-05-14', 'Internal Audit Tool', 'Failed', 0, 'Corrupted file'),

('marketdata_0514.csv', '2026-05-14', 'Market Feed API', 'Delayed', 0, 'Awaiting vendor upload'),

('useraccounts_0514.csv', '2026-05-14', 'CRM Platform', 'Success', 2140, 'Complete');


//SELECT ALL FAILED OR DELAYED UPLOADS
SELECT DISTINCT *
FROM data_operations_demo.monitoring.daily_uploads
WHERE status IN ('Failed', 'Delayed');


//COUNT FILES PER SOURCE SYSTEM
SELECT source_system,
       COUNT(*) AS total_files
FROM data_operations_demo.monitoring.daily_uploads
GROUP BY source_system
ORDER BY total_files DESC;


//FIND FILES WITH ZERO RECORD
SELECT DISTINCT file_name, status, notes, record_count
FROM data_operations_demo.monitoring.daily_uploads
WHERE record_count = 0;

//TOTAL RECORDS THAT ARE SUCCESSFULLY LOADED
SELECT SUM(record_count) AS Total_loaded_records
FROM data_operations_demo.monitoring.daily_uploads
WHERE status = 'Success';

//TO VERIFY TOTAL RECORDS SUCCESSFULLY LOADED
SELECT file_name, record_count
FROM data_operations_demo.monitoring.daily_uploads
WHERE status = 'Success';

//CHECK DUPLICATES
SELECT *
FROM data_operations_demo.monitoring.daily_uploads;

//IF DUPLICATES FOUND, DELETE ALL
DELETE FROM data_operations_demo.monitoring.daily_uploads;

//RE-INSERT DATA IN TABLE
INSERT INTO data_operations_demo.monitoring.daily_uploads
    (file_name, upload_date, source_system, status, record_count, notes)

        VALUES
        ('accounts_0514.csv', '2026-05-14', 'Custodian System', 'Success', 1240, 'Complete'),
        ('portfolio_0514.csv', '2026-05-14', 'Portfolio PMS', 'Failed', 0, 'Missing file'),
        ('transactions_0514.csv', '2026-05-14', 'Bank Feed', 'Success', 3520, 'Complete'),
        ('clientdata_0514.csv', '2026-05-14', 'CRM Platform', 'Success', 890, 'Complete'),
        ('holdings_0514.csv', '2026-05-14', 'Investment Feed', 'Delayed', 0, 'Late upload'),
        ('cashbalances_0514.csv', '2026-05-14', 'Treasury System', 'Success', 670, 'Validated successfully'),
        ('investments_0514.csv', '2026-05-14', 'Portfolio PMS', 'Success', 1850, 'Complete'),
        ('auditlogs_0514.csv', '2026-05-14', 'Internal Audit Tool', 'Failed', 0, 'Corrupted file'),
        ('marketdata_0514.csv', '2026-05-14', 'Market Feed API', 'Delayed', 0, 'Awaiting vendor upload'),
        ('useraccounts_0514.csv', '2026-05-14', 'CRM Platform', 'Success', 2140, 'Complete');
        
//RECALCULATE TOTAL LOADED RECORDS
SELECT SUM(record_count) AS total_loaded_records
FROM data_operations_demo.monitoring.daily_uploads
WHERE status = 'Success';

//ANOTHER VERIFICATION
SELECT file_name, record_count
FROM data_operations_demo.monitoring.daily_uploads
WHERE status = 'Success';

//RECORD COUNT MONITORING
SELECT file_name, record_count
FROM data_operations_demo.monitoring.daily_uploads
ORDER BY record_count DESC;

//INSERT 30 SAMPLE DATA
INSERT INTO data_operations_demo.monitoring.daily_uploads
(file_name, upload_date, source_system, status, record_count, notes)

VALUES

('accounts_0514.csv', '2026-05-14', 'Custodian System', 'Success', 1240, 'Complete'),

('portfolio_0514.csv', '2026-05-14', 'Portfolio PMS', 'Failed', 0, 'Missing file'),

('transactions_0514.csv', '2026-05-14', 'Bank Feed', 'Success', 3520, 'Complete'),

('clientdata_0514.csv', '2026-05-14', 'CRM Platform', 'Success', 890, 'Complete'),

('holdings_0514.csv', '2026-05-14', 'Investment Feed', 'Delayed', 0, 'Late upload'),

('cashbalances_0514.csv', '2026-05-14', 'Treasury System', 'Success', 670, 'Validated successfully'),

('investments_0514.csv', '2026-05-14', 'Portfolio PMS', 'Success', 1850, 'Complete'),

('auditlogs_0514.csv', '2026-05-14', 'Internal Audit Tool', 'Failed', 0, 'Corrupted file'),

('marketdata_0514.csv', '2026-05-14', 'Market Feed API', 'Delayed', 0, 'Awaiting vendor upload'),

('useraccounts_0514.csv', '2026-05-14', 'CRM Platform', 'Success', 2140, 'Complete'),

('advisoraccounts_0515.csv', '2026-05-15', 'Advisor Portal', 'Success', 1560, 'Complete'),

('dailytrades_0515.csv', '2026-05-15', 'Trading Platform', 'Success', 4280, 'Validated successfully'),

('crmcontacts_0515.csv', '2026-05-15', 'CRM Platform', 'Delayed', 0, 'Vendor delay'),

('wiretransfers_0515.csv', '2026-05-15', 'Bank Feed', 'Failed', 0, 'File format mismatch'),

('complianceaudit_0515.csv', '2026-05-15', 'Compliance System', 'Success', 720, 'Complete'),

('clientholdings_0515.csv', '2026-05-15', 'Investment Feed', 'Success', 1940, 'Complete'),

('taxdocuments_0515.csv', '2026-05-15', 'Document Vault', 'Success', 860, 'Validated successfully'),

('marketprices_0515.csv', '2026-05-15', 'Market Feed API', 'Delayed', 0, 'Awaiting API response'),

('cashflowreport_0515.csv', '2026-05-15', 'Treasury System', 'Success', 510, 'Complete'),

('performance_0515.csv', '2026-05-15', 'Portfolio PMS', 'Success', 1330, 'Complete'),

('useractivity_0515.csv', '2026-05-15', 'Internal Analytics', 'Success', 2740, 'Complete'),

('riskmetrics_0515.csv', '2026-05-15', 'Risk Engine', 'Failed', 0, 'Corrupted upload'),

('investorprofiles_0515.csv', '2026-05-15', 'CRM Platform', 'Success', 980, 'Validated successfully'),

('monthlybalances_0515.csv', '2026-05-15', 'Custodian System', 'Success', 2110, 'Complete'),

('securityprices_0515.csv', '2026-05-15', 'Market Feed API', 'Success', 5020, 'Complete'),

('paymentledger_0515.csv', '2026-05-15', 'Accounting System', 'Delayed', 0, 'Late source delivery'),

('emaillogs_0515.csv', '2026-05-15', 'Communication Platform', 'Success', 3490, 'Complete'),

('advisornotes_0515.csv', '2026-05-15', 'Advisor Portal', 'Success', 640, 'Validated successfully'),

('portfolioallocations_0515.csv', '2026-05-15', 'Portfolio PMS', 'Success', 1780, 'Complete'),

('accountverification_0515.csv', '2026-05-15', 'Verification System', 'Failed', 0, 'Missing records');

SELECT *
FROM monitoring.daily_uploads;