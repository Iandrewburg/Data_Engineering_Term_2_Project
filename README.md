# Data_Engineering_Term_2_Project


## Overview

The goal of our project is to capture the correlation between stock prices, such as oil and gold, and G20 GDP PPP, inflation rates, emissions, and energy consumption. 
The source of this data is is from the World Bank. 
We would like to use the Yahoo Finance API to enrich the economic and environmental indicator data.
[Yahoo Finance API](https://developer.yahoo.com/api/)

Prior research has shown that the prices of real assets and stocks are negatively correlated, moreover the energy sector has proved to be cyclical, which has furhter impacted
the countries that rely on oil revenue such as Saudi Arabia and other gulf countries. 

## Navigation

## Data sources

- [Electricity production from coal sources (% of total)](https://data.worldbank.org/indicator/EG.ELC.COAL.ZS)
- [Energy use (kg of oil equivalent per capita)](https://data.worldbank.org/indicator/EG.USE.PCAP.KG.OE)
- [CO2 emissions from liquid fuel consumption (kt)](https://data.worldbank.org/indicator/EN.ATM.CO2E.LF.KT)
- [CO2 emissions from manufacturing industries and construction (% of total fuel combustion)](https://data.worldbank.org/indicator/EN.CO2.MANF.ZS)
- [Exports of goods and services (% of GDP)](https://data.worldbank.org/indicator/NE.EXP.GNFS.ZS)
- [Inflation, GDP deflator (annual %)](https://data.worldbank.org/indicator/NY.GDP.DEFL.KD.ZG)

  
## Setup

## Technical Choices

## EER diagram

![EER Diagram of the Indicator Data Tables](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/ER_Indicators.png)

![EER Diagram of Indicator Aggregated Table and Stock Table](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/ER_Indicators_Stock.png)

## Knime pipeline

![Knime Pipeline](https://github.com/Iandrewburg/Data_Engineering_Term_2_Project/blob/main/knime_pipeline.png)

## Results
