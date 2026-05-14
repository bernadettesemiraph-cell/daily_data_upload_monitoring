# Daily Data Upload Monitoring Project

## Overview
This project simulates a basic data operations workflow using Snowflake, SQL, and Google Sheets. The goal was to practice monitoring daily file uploads, identifying failed or delayed records, and validating operational datasets in a structured environment.

## Tools Used
- Snowflake
- SQL
- Google Sheets

## Key Features
- Created structured operational tables in Snowflake
- Inserted and managed sample upload datasets
- Queried failed and delayed uploads
- Generated upload summaries and validation checks
- Built a monitoring dashboard using Google Sheets

## Sample SQL Queries

### Find Failed Uploads
SELECT *
FROM monitoring.daily_uploads
WHERE status = 'Failed';

### Count Files per Source System
SELECT source_system,
       COUNT(*) AS total_files
FROM data_operations_demo.monitoring.daily_uploads
GROUP BY source_system
ORDER BY total_files DESC;

## Lessons Learned
During the project, I encountered duplicate records caused by rerunning INSERT statements multiple times. This helped me understand the importance of data validation, query testing, and troubleshooting aggregation issues in operational datasets.

## Screenshots
Included in the documentation file.

## Author
Bernadette G. Semira
