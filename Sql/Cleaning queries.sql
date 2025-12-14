-- 1. Preview raw data
SELECT *
FROM marketing_campaign
LIMIT 10;

-- 2. Clean numeric fields and remove currency symbols
CREATE OR REPLACE VIEW v_numeric_clean AS
SELECT *,
       CAST(REPLACE(Acquisition_Cost, '$', '') AS NUMERIC) AS acquisition_cost_clean,
       CAST(Conversion_Rate AS NUMERIC) AS conversion_rate_clean,
       CAST(ROI AS NUMERIC) AS roi_clean,
       CAST(Clicks AS NUMERIC) AS clicks_clean,
       CAST(Impressions AS NUMERIC) AS impressions_clean,
       CAST(Engagement_Score AS NUMERIC) AS engagement_clean
FROM marketing_campaign;

-- 3. Clean text fields
CREATE OR REPLACE VIEW v_text_clean AS
SELECT Campaign_ID,
       INITCAP(TRIM(Company)) AS company,
       INITCAP(TRIM(Campaign_Type)) AS campaign_type,
       TRIM(Target_Audience) AS target_audience,
       TRIM(Duration) AS duration,
       INITCAP(TRIM(Channel_Used)) AS channel,
       acquisition_cost_clean,
       conversion_rate_clean,
       roi_clean,
       INITCAP(TRIM(Location)) AS location,
       INITCAP(TRIM(Language)) AS language,
       clicks_clean AS clicks,
       impressions_clean AS impressions,
       engagement_clean AS engagement,
       INITCAP(TRIM(Customer_Segment)) AS customer_segment,
       CAST(Date AS DATE) AS campaign_date
FROM v_numeric_clean;

-- 4. Remove invalid or zero value rows
CREATE OR REPLACE VIEW v_valid_campaign AS
SELECT *
FROM v_text_clean
WHERE acquisition_cost_clean > 0
  AND conversion_rate_clean >= 0
  AND roi_clean >= 0
  AND clicks > 0
  AND impressions > 0;

-- 5. Add calculated metrics if needed
CREATE OR REPLACE VIEW v_final_clean AS
SELECT *,
       clicks/impressions AS ctr
FROM v_valid_campaign;

-- 6. Preview cleaned data
SELECT *
FROM v_final_clean
LIMIT 10;
