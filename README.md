# Marketing-campaign-performance-analysis (SQL & TABLEAU)

## Project Overview
This project analyzes a large marketing campaign dataset to identify key performance metrics, trends, and insights across multiple campaigns, channels, and customer segments. The dataset contains information on campaigns run by various companies, including channel used, target audience, conversion rate, acquisition cost, ROI, clicks, impressions, and customer segment.

The main objectives are:  
- Understand which campaigns perform best by ROI, clicks, and conversion rates.  
- Identify the most effective channels and campaign types.  
- Determine customer segments that respond best to different campaigns.  
- Evaluate cost efficiency and ROI per dollar spent.  

## Tools Used
- **SQL (PostgreSQL)** – For cleaning, aggregation, and analysis queries.  
- **Excel / CSV** – Exported query results for further inspection.  
- **Tableau / Power BI** – Dashboard creation and visual storytelling.  


## Data Cleaning Steps
1. Loaded the CSV dataset into PostgreSQL.  
2. Created a view `v_campaign_clean` to standardize columns:  
   - Trimmed extra spaces in text fields.  
   - Converted numeric fields (`ROI`, `Conversion_Rate`, `Acquisition_Cost`) to proper numeric types.  
   - Standardized dates to `YYYY-MM-DD`.  
   - Ensured no missing or invalid campaign IDs.  
3. Verified data quality and removed rows with invalid values (negative cost, clicks, or ROI).  

## Analysis Performed
1. **Audience Performance** – ROI, clicks, and conversion rate by target audience.  
2. **Channel Performance** – ROI, clicks, and conversion rate by channel used.  
3. **Cost Efficiency** – ROI per dollar spent per campaign type.  
4. **Top Campaigns by ROI** – Top 10 campaigns by ROI.  
5. **Customer Segment vs Campaign Type** – Identifies which segments respond best to different campaign types.  
6. **Campaign Duration vs ROI** – Evaluates the impact of campaign duration on ROI.  
7. **Location Performance** – ROI, clicks, and impressions per location.  
8. **Language Performance** – ROI and conversion rates by language.  
9. **Clicks vs Impressions vs ROI** – Examines individual campaign performance.  
10. **Channel Efficiency Comparison** – ROI per dollar across channels.  

## Insights
- Channels such as Google Ads and YouTube consistently show higher ROI for certain age groups.  
- Specific campaign types work better for targeted customer segments (e.g., Email campaigns for 25–34 males).  
- Cost-efficient campaigns can be identified by comparing ROI per dollar spent across channels.  
- High-engagement campaigns often correlate with increased clicks and impressions, but ROI varies by campaign type and audience.  

## Notes
- Dataset is **large**, hence SQL was used for cleaning and analysis rather than Excel alone.  
- Exported analysis results to CSV for chart creation in Tableau or Power BI.  
- No changes were made to the original raw dataset; all cleaning steps were applied via SQL views.  
- Visual dashboards were created to summarize the metrics for executive insights.  

