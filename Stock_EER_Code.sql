USE stock_info;

-- First, drop the stock_market_data table to remove the foreign key dependency
DROP TABLE IF EXISTS stock_market_data;

-- Then, drop and recreate the combined_indicators table
DROP TABLE IF EXISTS combined_indicators;

CREATE TABLE combined_indicators (
    Year INT PRIMARY KEY,
    Country_Name VARCHAR(100),
    co2e_Value DECIMAL(10, 2),
    inflation_gdp_deflator_Value DECIMAL(10, 2),
    co2e_manf_Value DECIMAL(10, 2),
    energy_prod_coal_Value DECIMAL(10, 2),
    energy_use_Value DECIMAL(10, 2),
    exports_Value DECIMAL(10, 2)
);

-- Insert data into combined_indicators
INSERT INTO combined_indicators (
    Year,
    Country_Name,
    co2e_Value,
    inflation_gdp_deflator_Value,
    co2e_manf_Value,
    energy_prod_coal_Value,
    energy_use_Value,
    exports_Value
) VALUES (
    2021,
    'CountryX',
    12345.67,
    67890.12, -- This value should be for inflation_gdp_deflator, not gdp_Value as in your original script
    2345.67,
    3456.78,
    4567.89,
    5678.90
);

-- Now, recreate the stock_market_data table with the foreign key reference to combined_indicators
CREATE TABLE stock_market_data (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL,
    Year INT,
    OpenPrice DECIMAL(10, 2),
    ClosePrice DECIMAL(10, 2),
    HighPrice DECIMAL(10, 2),
    LowPrice DECIMAL(10, 2),
    Volume INT,
    FOREIGN KEY (Year) REFERENCES combined_indicators(Year)
);

-- Insert data into stock_market_data
INSERT INTO stock_market_data (
    Date,
    Year,
    OpenPrice,
    ClosePrice,
    HighPrice,
    LowPrice,
    Volume
) VALUES (
    '2021-01-01',
    2021,
    100.00,
    150.00,
    155.00,
    90.00,
    500000
);
