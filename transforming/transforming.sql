CREATE TABLE cpd_crime_probs AS SELECT Date, Block, Primary_Type, Description, Beat, District, Ward, Community_Area FROM cpd_schema;

CREATE TABLE c_311_probs AS SELECT Creation_Date, Status, Completion_Date, Type_of_Service_Request, Ward, Police_District, Community_Area FROM cpd_311_schema;

CREATE TABLE sfpd_crime_probs AS SELECT Category, Descript, Date, PdDistrict, Location FROM sfpd_schema;

CREATE TABLE sf_311_probs AS SELECT Opened, Closed, Updated, Status, Category, Request_Type, Neighborhood FROM sfpd_311_schema; 



