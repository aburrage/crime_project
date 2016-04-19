CREATE EXTERNAL TABLE IF NOT EXISTS cpd_311_schema
(Creation_Date string, Status string, Completion_Date string, Service_Request_Number string, Type_of_Service_Request string, Street_Address string, ZIP_Code string, X_Coordinate string, Y_Coordinate string, Ward string, Police_District string, Community_Area string, Latitude string, Longitude string, Location string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/crime_project/chicago_311_data';

CREATE EXTERNAL TABLE IF NOT EXISTS sfpd_311_schema
(CaseID string, Opened string, Closed string, Updated string, Status string, Status_Notes string, Responsible_Agency string, Category string, Request_Type string, Request_Details string, Address string, Supervisor_District string, Neighborhood string, Point string, Source string, Media_URL string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/crime_project/sf_311_data';