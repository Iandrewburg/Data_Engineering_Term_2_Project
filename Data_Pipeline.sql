USE oil_indicators;
DROP PROCEDURE IF EXISTS GetCombinedIndicators; 

DELIMITER //


CREATE PROCEDURE GetCombinedIndicators()
BEGIN
	DROP TABLE IF EXISTS CombinedIndicators;
    
    CREATE TABLE CombinedIndicators AS
	WITH Unpivoted_co2e AS (
		SELECT Country_Name, '2000' AS Year, `2000` AS co2e_Value FROM co2e
		UNION ALL
		SELECT Country_Name, '2001', `2001` FROM co2e
		UNION ALL
		SELECT Country_Name, '2002', `2002` FROM co2e
		UNION ALL
		SELECT Country_Name, '2003', `2003` FROM co2e
		UNION ALL
		SELECT Country_Name, '2004', `2004` FROM co2e
		UNION ALL
		SELECT Country_Name, '2005', `2005` FROM co2e
		UNION ALL
		SELECT Country_Name, '2006', `2006` FROM co2e
		UNION ALL
		SELECT Country_Name, '2007', `2007` FROM co2e
		UNION ALL
		SELECT Country_Name, '2008', `2008` FROM co2e
		UNION ALL
		SELECT Country_Name, '2009', `2009` FROM co2e
		UNION ALL
		SELECT Country_Name, '2010', `2010` FROM co2e
		UNION ALL
		SELECT Country_Name, '2011', `2011` FROM co2e
		UNION ALL
		SELECT Country_Name, '2012', `2012` FROM co2e
		UNION ALL
		SELECT Country_Name, '2013', `2013` FROM co2e
		UNION ALL
		SELECT Country_Name, '2014', `2014` FROM co2e
		UNION ALL
		SELECT Country_Name, '2015', `2015` FROM co2e
		UNION ALL
		SELECT Country_Name, '2016', `2016` FROM co2e
		UNION ALL
		SELECT Country_Name, '2017', `2017` FROM co2e
		UNION ALL
		SELECT Country_Name, '2018', `2018` FROM co2e
		UNION ALL
		SELECT Country_Name, '2019', `2019` FROM co2e
		UNION ALL
		SELECT Country_Name, '2020', `2020` FROM co2e
		UNION ALL
		SELECT Country_Name, '2021', `2021` FROM co2e
		UNION ALL
		SELECT Country_Name, '2022', `2022` FROM co2e
	),
	Unpivoted_gdp AS (
		SELECT Country_Name, '2000' AS Year, `2000` AS gdp_Value FROM gdp
		UNION ALL
		SELECT Country_Name, '2001', `2001` FROM gdp
		UNION ALL
		SELECT Country_Name, '2002', `2002` FROM gdp
		UNION ALL
		SELECT Country_Name, '2003', `2003` FROM gdp
		UNION ALL
		SELECT Country_Name, '2004', `2004` FROM gdp
		UNION ALL
		SELECT Country_Name, '2005', `2005` FROM gdp
		UNION ALL
		SELECT Country_Name, '2006', `2006` FROM gdp
		UNION ALL
		SELECT Country_Name, '2007', `2007` FROM gdp
		UNION ALL
		SELECT Country_Name, '2008', `2008` FROM gdp
		UNION ALL
		SELECT Country_Name, '2009', `2009` FROM gdp
		UNION ALL
		SELECT Country_Name, '2010', `2010` FROM gdp
		UNION ALL
		SELECT Country_Name, '2011', `2011` FROM gdp
		UNION ALL
		SELECT Country_Name, '2012', `2012` FROM gdp
		UNION ALL
		SELECT Country_Name, '2013', `2013` FROM gdp
		UNION ALL
		SELECT Country_Name, '2014', `2014` FROM gdp
		UNION ALL
		SELECT Country_Name, '2015', `2015` FROM gdp
		UNION ALL
		SELECT Country_Name, '2016', `2016` FROM gdp
		UNION ALL
		SELECT Country_Name, '2017', `2017` FROM gdp
		UNION ALL
		SELECT Country_Name, '2018', `2018` FROM gdp
		UNION ALL
		SELECT Country_Name, '2019', `2019` FROM gdp
		UNION ALL
		SELECT Country_Name, '2020', `2020` FROM gdp
		UNION ALL
		SELECT Country_Name, '2021', `2021` FROM gdp
		UNION ALL
		SELECT Country_Name, '2022', `2022` FROM gdp
	),
	Unpivoted_co2e_from_manufacture AS (
		SELECT Country_Name, '2000' AS Year, `2000` AS co2e_manf_Value FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2001', `2001` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2002', `2002` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2003', `2003` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2004', `2004` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2005', `2005` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2006', `2006` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2007', `2007` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2008', `2008` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2009', `2009` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2010', `2010` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2011', `2011` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2012', `2012` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2013', `2013` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2014', `2014` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2015', `2015` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2016', `2016` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2017', `2017` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2018', `2018` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2019', `2019` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2020', `2020` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2021', `2021` FROM co2e_from_manufacture
		UNION ALL
		SELECT Country_Name, '2022', `2022` FROM co2e_from_manufacture
	),
	Unpivoted_energy_prod_from_coal AS (
		SELECT Country_Name, '2000' AS Year, `2000` AS energy_prod_coal_Value FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2001', `2001` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2002', `2002` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2003', `2003` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2004', `2004` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2005', `2005` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2006', `2006` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2007', `2007` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2008', `2008` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2009', `2009` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2010', `2010` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2011', `2011` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2012', `2012` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2013', `2013` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2014', `2014` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2015', `2015` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2016', `2016` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2017', `2017` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2018', `2018` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2019', `2019` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2020', `2020` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2021', `2021` FROM energy_prod_from_coal
		UNION ALL
		SELECT Country_Name, '2022', `2022` FROM energy_prod_from_coal
	),
	Unpivoted_energy_use AS (
		SELECT Country_Name, '2000' AS Year, `2000` AS energy_use_Value FROM energy_use
		UNION ALL
		SELECT Country_Name, '2001', `2001` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2002', `2002` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2003', `2003` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2004', `2004` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2005', `2005` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2006', `2006` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2007', `2007` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2008', `2008` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2009', `2009` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2010', `2010` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2011', `2011` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2012', `2012` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2013', `2013` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2014', `2014` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2015', `2015` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2016', `2016` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2017', `2017` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2018', `2018` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2019', `2019` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2020', `2020` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2021', `2021` FROM energy_use
		UNION ALL
		SELECT Country_Name, '2022', `2022` FROM energy_use
	),
	Unpivoted_exports AS (
		SELECT Country_Name, '2000' AS Year, `2000` AS exports_Value FROM exports
		UNION ALL
		SELECT Country_Name, '2001', `2001` FROM exports
		UNION ALL
		SELECT Country_Name, '2002', `2002` FROM exports
		UNION ALL
		SELECT Country_Name, '2003', `2003` FROM exports
		UNION ALL
		SELECT Country_Name, '2004', `2004` FROM exports
		UNION ALL
		SELECT Country_Name, '2005', `2005` FROM exports
		UNION ALL
		SELECT Country_Name, '2006', `2006` FROM exports
		UNION ALL
		SELECT Country_Name, '2007', `2007` FROM exports
		UNION ALL
		SELECT Country_Name, '2008', `2008` FROM exports
		UNION ALL
		SELECT Country_Name, '2009', `2009` FROM exports
		UNION ALL
		SELECT Country_Name, '2010', `2010` FROM exports
		UNION ALL
		SELECT Country_Name, '2011', `2011` FROM exports
		UNION ALL
		SELECT Country_Name, '2012', `2012` FROM exports
		UNION ALL
		SELECT Country_Name, '2013', `2013` FROM exports
		UNION ALL
		SELECT Country_Name, '2014', `2014` FROM exports
		UNION ALL
		SELECT Country_Name, '2015', `2015` FROM exports
		UNION ALL
		SELECT Country_Name, '2016', `2016` FROM exports
		UNION ALL
		SELECT Country_Name, '2017', `2017` FROM exports
		UNION ALL
		SELECT Country_Name, '2018', `2018` FROM exports
		UNION ALL
		SELECT Country_Name, '2019', `2019` FROM exports
		UNION ALL
		SELECT Country_Name, '2020', `2020` FROM exports
		UNION ALL
		SELECT Country_Name, '2021', `2021` FROM exports
		UNION ALL
		SELECT Country_Name, '2022', `2022` FROM exports
    ),
	Joined_Data AS (
    SELECT
       a.Country_Name,
        a.Year,
        CASE WHEN a.co2e_Value = 0 THEN 'Null' ELSE a.co2e_Value END AS co2e_Value,
        CASE WHEN b.gdp_Value = 0 THEN 'Null' ELSE b.gdp_Value END AS gdp_Value,
        CASE WHEN c.co2e_manf_Value = 0 THEN 'Null' ELSE c.co2e_manf_Value END AS co2e_manf_Value,
        CASE WHEN d.energy_prod_coal_Value = 0 THEN 'Null' ELSE d.energy_prod_coal_Value END AS energy_prod_coal_Value,
        CASE WHEN e.energy_use_Value = 0 THEN 'Null' ELSE e.energy_use_Value END AS energy_use_Value,
        CASE WHEN f.exports_Value = 0 THEN 'Null' ELSE f.exports_Value END AS exports_Value,
        CASE
            WHEN a.Country_Name IN ('Algeria', 'Angola', 'Congo, Rep.', 'Equatorial Guinea', 'Gabon', 'Iran, Islamic Rep.', 'Iraq', 'Kuwait', 'Libya', 'Nigeria', 'Saudi Arabia', 'United Arab Emirates', 'Venezuela, RB') THEN 1
            ELSE 0
        END AS Is_OPEC
	FROM
		Unpivoted_co2e a
	LEFT JOIN
		Unpivoted_gdp b ON a.Country_Name = b.Country_Name AND a.Year = b.Year
	LEFT JOIN
		Unpivoted_co2e_from_manufacture c ON a.Country_Name = c.Country_Name AND a.Year = c.Year
	LEFT JOIN
		Unpivoted_energy_prod_from_coal d ON a.Country_Name = d.Country_Name AND a.Year = d.Year
	LEFT JOIN
		Unpivoted_energy_use e ON a.Country_Name = e.Country_Name AND a.Year = e.Year
	LEFT JOIN
		Unpivoted_exports f ON a.Country_Name = f.Country_Name AND a.Year = f.Year
	)
	SELECT * FROM Joined_Data;
END //

DELIMITER ;

CALL GetCombinedIndicators();
SELECT * FROM oil_indicators.combinedindicators;