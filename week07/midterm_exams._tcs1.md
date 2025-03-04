## Part 0 - Data Schema

table name: airports

columns:
  - IATA: 3 upper-case letter code
  - ICAO: 4 upper-case letter code
  - name: unique name
  - area_served (nullable)
  - city_province (nullable)
  - island_group: must be one of 'Luzon', 'Visayas', 'Mindanao'
  - runway_meters: integer
  - international (bit; 0 = False, 1 = True)
  - opened (nullable): date using ISO-8601 format

```
CREATE TABLE airports (
  IATA nvarchar(3) NOT NULL,
  ICAO nvarchar(4) NOT NULL,
  name nvarchar(200) NOT NULL,
  area_served nvarchar(200) NULL,
  city_province nvarchar(200) NULL,
  island_group nvarchar(8) NOT NULL,
  runway_meters int NOT NULL,
  international bit NOT NULL CONSTRAINT DF_international DEFAULT 0,
  opened date,
  CONSTRAINT UI_IATA UNIQUE(IATA),
  CONSTRAINT UI_ICAO UNIQUE(ICAO),
  CONSTRAINT CK_IATA CHECK ((upper(IATA) = (IATA) collate Latin1_General_BIN2)),
  CONSTRAINT CK_ICAO CHECK ((upper(ICAO) = (ICAO) collate Latin1_General_BIN2)),
  CONSTRAINT CK_island_group CHECK ((island_group = 'Mindanao' OR island_group = 'Visayas' OR island_group = 'Luzon'))
);
```


## Part 1 - Data Entry

- There are currently 8 international airports in the Philippines
- There are currently 40 domestic airports in the Philippines
- For NAIA, you may set 'city_province' to "Pasay"
- For NAIA, you may set 'runway_meters' to the sum of "Pasay" and "Paranaque" runways


## Part 2 - Queries

For each of these queries, capture a screenshot that shows:
A. Query Window showing the executed query
B. Results 

Save each screenshot using the following format:

`ME_TCS1_<surname>_Query<question_no>.png`

e.g.

`ME_TCS1_raymundo_Query1.png`

1. Get the count of international airports
2. Get the count of domestic (non-international) airports
3. Find all airports in Luzon, that has greater than 2000 meters of runway length, sorted by IATA code in ascending order
4. Find all airports that were opened in the 90's, sorted by name in descending order
5. Find all airports where 'area_served' starts with the word "Metro", sorted by runway length in descending order
 
 Compile these 5 screenshots in a folder named `ME_TCS1_<surname>`, compress it and submit on the Dropbox

 ---
