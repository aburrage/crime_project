hdfs dfs -mkdir /user/w205/crime_project
hdfs dfs -mkdir /user/w205/crime_project/chicago_311_data
hdfs dfs -mkdir /user/w205/crime_project/sf_311_data

wget https://data.sfgov.org/api/views/vw6y-z8j6/rows.csv?accessType=DOWNLOAD
mv rows.csv?accessType=DOWNLOAD sf_311_data.csv

wget https://data.cityofchicago.org/api/views/zuxi-7xem/rows.csv?accessType=DOWNLOAD
mv rows.csv?accessType=DOWNLOAD chicago_all_lights.csv

hdfs dfs -put /home/w205/sf_311_data.csv /user/w205/crime_project/sf_311_data
hdfs dfs -put /home/w205/chicago_all_lights.csv /user/w205/crime_project/chicago_311_data