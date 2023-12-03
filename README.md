# Data_Engineering_Term_2_Project

**Table of Contents**
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Navigation](#navigation)
- [Setup](#setup)
- [Technical Choices](#technical-choices)
- [EER Diagrams](#eer-diagrams)
  - [EER diagram of base data](#eer-diagram-of-base-data)
  - [EER diagram with API data](#eer-diagram-with-api-data)
- [Knime Pipeline](#knime-pipeline)
- [Results](#results)
  - [OPEC Countries](#opec-countries)
  - [G20 Countries](#g20-countries)

## Introduction

In our project, we aim to explore the relationship between crude oil prices, the GDP of G20 and OPEC countries, and export values. As a proxy variable for crude oil prices, we are using West Texas Intermediate (WTI), a specific type of crude oil primarily produced in the United States, particularly in West Texas. WTI is a widely recognized benchmark for crude oil pricing worldwide.

Our objective is to delve into the dynamics of crude oil pricing and understand how it interacts with various factors, including exports and economic conditions.

At the end of the project, we will present visualizations and correlations between key economic indicators.

## Dataset

The source of national economic and environmental footprint data is the World Bank, Inc., including:
- [Electricity production from coal sources (% of total)](https://data.worldbank.org/indicator/EG.ELC.COAL.ZS)
- [Energy use (kg of oil equivalent per capita)](https://data.worldbank.org/indicator/EG.USE.PCAP.KG.OE)
- [CO2 emissions from liquid fuel consumption (kt)](https://data.worldbank.org/indicator/EN.ATM.CO2E.LF.KT)
- [CO2 emissions from manufacturing industries and construction (% of total fuel combustion)](https://data.worldbank.org/indicator/EN.CO2.MANF.ZS)
- [Exports of goods and services (% of GDP)](https://data.worldbank.org/indicator/NE.EXP.GNFS.ZS)
- [Inflation, GDP deflator (annual %)](https://data.worldbank.org/indicator/NY.GDP.DEFL.KD.ZG)

We have enriched the economic and environmental indicator data with real asset prices such as commodities using the [Yahoo Finance API](https://developer.yahoo.com/api/). West Texas Intermediate (WTI) serves as a proxy variable for oil prices as it is the world's largest producer.

## Navigation

- The CSV files are available [here](link-to-csv-files).
- SQL dumps for [importing](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/Data_Dump_2.sql) and [transforming data](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/Data_Pipeline.sql) using the pipeline.
- Entity-Relationship (ER) diagram indicating the [relationship between economic indicators](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/ER_Indicators.png) and [tables after transformation](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/ER_Indicators_Stock.png).
- Knime [pipeline](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/Project2_DE1_Knime.knwf).

## Setup

1. Upload the data in MySQL using [Data_Dump_2.sql](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/Data_Dump_2.sql)
2. Run the code from [Data_Pipeline.sql](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/Data_Pipeline.sql)
3. Download the [Knime pipeline](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/Project2_DE1_Knime.knwf)
4. Set up your SQL connection using your credentials.
5. Run the pipeline.
6. Check the resulting correlation matrices.
7. Check the visualizations.

## Technical Choices

The data is provided on an annual granularity as the World Bank provides data only on an annual basis, making it unfeasible to assess monthly performance on a country level.

We have included two additional columns, one indicating G20 membership and another for OPEC country status, allowing us to conduct a correlation analysis for each group.

As a result, we have created one visualization and one correlation matrix for each scenario, depending on whether the country belongs to the G20 or OPEC. For the correlation analysis, we have primarily relied on data concerning inflation, exports, and WTI, as many other indicators contained a significant number of missing values, making it challenging to obtain dependable results.

## EER Diagrams

### EER diagram of base data
![EER Diagram of Base Data](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/ER_Indicators.png)

### EER diagram with API data
![EER Diagram with API Data](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/ER_Indicators_Stock.png)

## Knime Pipeline
![Knime Diagram](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/knime_pipeline.png)

We have used a MySQL connector to connect Knime with our database. The pipeline includes the following steps:

1. Get the transformed analytical table using DB Query Reader.
2. Obtain WTI data using the Yahoo Finance API.
3. Add the year as a column using string manipulation node.
4. Join these two datasets using the year column from both tables.
5. Group the joined dataset by year and country to get one observation per country and year. Note that we used average values to aggregate WTI.
6. Using a row filter based on columns `is_G20` and `is_OPEC`, we created two scenarios.
7. For each scenario, we built a correlation matrix and histogram visualization.

## Results

### OPEC Countries

Based on the correlation matrix for OPEC countries, we observe that the correlation between exports and the average WTI, as well as the correlation between inflation value and the average WTI, is positive.

![Correlation Matrix OPEC](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/corr1.png)

Upon closer examination, we note that the correlation is not statistically significant, as the p-value exceeds 0.1.
![Correltions OPEC](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/cor2.png)

### G20 Countries
![Correltions G20](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/cor3.png)

Turning our attention to the correlations for G20 countries, we uncover different outcomes. A negative moderate correlation of -0.14 exists between exports and inflation, and it proves to be statistically significant at the 5% level. This suggests that as one indicator increases, the other decreases.

-------------------
