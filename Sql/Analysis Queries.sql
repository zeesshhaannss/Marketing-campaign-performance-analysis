-- ===========================
-- 1. Audience Performance
-- Summarizes ROI, conversion rate, and clicks per target audience
-- ===========================
SELECT Target_Audience,
       SUM(ROI) AS total_roi,
       AVG(Conversion_Rate) AS avg_conversion,
       SUM(Clicks) AS total_clicks
FROM v_campaign_clean
GROUP BY Target_Audience
ORDER BY total_roi DESC;


-- ===========================
-- 2. Channel Performance
-- Summarizes ROI, conversion rate, and clicks per marketing channel
-- ===========================
SELECT Channel_Used AS channel,
       SUM(ROI) AS total_roi,
       AVG(Conversion_Rate) AS avg_conversion,
       SUM(Clicks) AS total_clicks
FROM v_campaign_clean
GROUP BY Channel_Used
ORDER BY total_roi DESC;


-- ===========================
-- 3. Cost Efficiency
-- Measures total cost, total ROI, and ROI per dollar by campaign type
-- ===========================
SELECT Campaign_Type,
       SUM(Acquisition_Cost) AS total_cost,
       SUM(ROI) AS total_roi,
       SUM(ROI)/SUM(Acquisition_Cost) AS roi_per_dollar
FROM v_campaign_clean
GROUP BY Campaign_Type
ORDER BY roi_per_dollar DESC;


-- ===========================
-- 4. Top Campaigns by ROI
-- Shows top 10 campaigns based on ROI
-- ===========================
SELECT Campaign_ID,
       Company,
       Campaign_Type,
       Target_Audience,
       ROI
FROM v_campaign_clean
ORDER BY ROI DESC
LIMIT 10;


-- ===========================
-- 5. Customer Segment vs Campaign Type
-- Which customer segments respond best to which campaign types
-- ===========================
SELECT Customer_Segment,
       Campaign_Type,
       SUM(ROI) AS total_roi,
       SUM(Clicks) AS total_clicks
FROM v_campaign_clean
GROUP BY Customer_Segment, Campaign_Type
ORDER BY total_roi DESC;


-- ===========================
-- 6. Campaign Duration vs ROI
-- Evaluates ROI by campaign duration
-- ===========================
SELECT Duration,
       SUM(ROI) AS total_roi,
       AVG(ROI) AS avg_roi
FROM v_campaign_clean
GROUP BY Duration
ORDER BY avg_roi DESC;


-- ===========================
-- 7. Location Performance
-- Shows ROI, clicks, and impressions per location
-- ===========================
SELECT Location,
       SUM(ROI) AS total_roi,
       SUM(Clicks) AS total_clicks,
       SUM(Impressions) AS total_impressions
FROM v_campaign_clean
GROUP BY Location
ORDER BY total_roi DESC;


-- ===========================
-- 8. Language Performance
-- Analyzes ROI and conversion rate by language
-- ===========================
SELECT Language,
       SUM(ROI) AS total_roi,
       AVG(Conversion_Rate) AS avg_conversion
FROM v_campaign_clean
GROUP BY Language
ORDER BY total_roi DESC;


-- ===========================
-- 9. Clicks vs Impressions vs ROI
-- Examines individual campaign performance in terms of clicks, impressions, and ROI
-- ===========================
SELECT Campaign_ID,
       Clicks,
       Impressions,
       ROI
FROM v_campaign_clean
ORDER BY ROI DESC;


-- ===========================
-- 10. Channel Efficiency Comparison
-- Measures ROI per dollar spent across channels
-- ===========================
SELECT Channel_Used AS channel,
       SUM(ROI) AS total_roi,
       SUM(Acquisition_Cost) AS total_cost,
       SUM(ROI)/SUM(Acquisition_Cost) AS roi_per_dollar
FROM v_campaign_clean
GROUP BY Channel_Used
ORDER BY roi_per_dollar DESC;
