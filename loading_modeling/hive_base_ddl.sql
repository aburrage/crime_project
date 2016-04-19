CREATE EXTERNAL TABLE IF NOT EXISTS cpd_schema
(ID string,Case_Number string,Date string,Block string,IUCR string,Primary_Type string,Description string,Location_Description string,Arrest string,Domestic string,Beat string,District string,Ward string,Community_Area string,FBI_Code string,X_Coordinate string,Y_Coordinate string,Year string,Updated_On string,Latitude string,Longitude string,Location string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/crime_project/chicago_data';

CREATE EXTERNAL TABLE IF NOT EXISTS sfpd_schema
(IncidntNum string, 
Category string,
Descript string,
DayOfWeek string,
Date string,
Time string,
PdDistrict string,
Resolution string,
Address string,
X string,
Y string,
Location string,
PdId string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/crime_project/sf_data';