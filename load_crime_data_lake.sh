hdfs dfs -mkdir /user/w205/crime_project
hdfs dfs -mkdir /user/w205/crime_project/chicago_data
hdfs dfs -mkdir /user/w205/crime_project/sf_data
wget https://data.cityofchicago.org/api/views/ijzp-q8t2/rows.csv?accessType=DOWNLOAD
mv rows.csv?accessType=DOWNLOAD Crimes_-_2001_to_present.csv
wget https://data.sfgov.org/api/views/tmnf-yvry/rows.csv?accessType=DOWNLOAD
mv rows.csv?accessType=DOWNLOAD SFPD_Incidents_-_from_1_January_2003.csv
hdfs dfs -put /home/w205/Crimes_-_2001_to_present.csv /user/w205/crime_project/chicago_data
hdfs dfs -put /home/w205/SFPD_Incidents_-_from_1_January_2003.csv /user/w205/crime_project/sf_data  


