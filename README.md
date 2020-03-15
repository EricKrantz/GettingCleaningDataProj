# GettingCleaningDataProj

Final project for Coursera course "Getting and Cleaning Data".

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following:
1.    Merges the training and the test sets to create one data set.
2.    Extracts only the measurements on the mean and standard deviation for each measurement.
3.    Uses descriptive activity names to name the activities in the data set
4.    Appropriately labels the data set with descriptive variable names.
5.    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Review criteria:
1.    The submitted data set is tidy.
2.    The Github repo contains the required scripts.
3.    GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4.    The README that explains the analysis files is clear and understandable.
5.    The work submitted for this project is the work of the student who submitted it.

# Submission

A script called "run_analysis.R" was created to load all data, match data labels with columns, and name columns. The script selects only the sensors that include the "mean()" or "std()" in the name of the sensor. The script then tidies the resulting data set. The resulting data set is called "dat.txt".

Key to data set "dat.txt":  

Column   | Class   | What it is
---------|---------|-----------
subject  | Factor  | Identifier of the person ("subject") who is wearing the device
activity | Factor  | The activity of the subject (e.g., walking, sitting, ...)
set      | Factor  | Training or Test data? 
variable   | Factor  | Sensor identifier including whether mean or stdev
value    | Numeric | Data value  
