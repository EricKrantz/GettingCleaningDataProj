# Code_Book

A script called "run_analysis.R" was created to load all data, match data labels with columns, and name columns. The script selects only the sensors that include the "mean()" or "std()" in the name of the sensor. The script then tidies the resulting data set. The resulting data set is called "Mean_StDev.csv". This data set can be read by using the following R code:

dat <- read.csv(file = "https://raw.githubusercontent.com/EricKrantz/GettingCleaningDataProj/master/Mean_StDev.csv")

### Tidy Form
I have chosen to use the long-data form as the tidy form. In this form, "sensor" is a variable, as well as subject, activity, and set.

## Summary
Data values were also averaged by each activity and each subject. These averages are shown in the file "dat_summary".txt. 


Key to data set. This key will describe all data columns:  

Column   | Class   | What it is
---------|---------|-----------
subject  | Factor  | Identifier of the person ("subject") who is wearing the device
activity | Factor  | The activity of the subject (e.g., walking, sitting, ...)
set      | Factor  | Training or Test data? 
variable   | Factor  | Sensor identifier including whether mean or stdev
value    | Numeric | Data value  


### Subject
Thirty different subjects were tested wearing accelerometers and sensors and performing activities. The subject column is a factor that identifies the subject being tested.

### Activity
Variables were recorded while the subjects performed six different activites. The activities were laying, sitting, standing, walking, walking up stairs, and walking down stairs.

### Set
Subjects were separated into either the test set or the training set. This factors indicates which set the subject is in.

### Sensor
The name of the sensor (or sensor channel) being measured, or the result of a previous data aggregation of the sensor data. All values here are either mean or standard deviation of a sensor measurement as given by this column.

### Value
The standardized (i.e., between 0 and 1) measurement of "Sensor".

