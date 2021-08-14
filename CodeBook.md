---
title: "CodeBook"
author: "Arianna Bionda"
date: "14/8/2021"
output: html_document
---

## Data transformation

The original data, which can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), were transformed as follows:


- All the datasets containing the training data were merged with those containing the test data; then, the datasets containing the different type of data were merged together as well.  
- Only the "mean" and "standard deviation" measurements, according to the features' (i.e., the variables') names, were retained.  
- The Activity symbols were matched with the Activity names.  
- All the columns have been renamed, so that they are easier to be understood.  
- Another dataset, called "TidyDataset.txt" was created, using the mean values of each variable for each activity and subject.

All these steps can be perfomed with a single script, which can be found in this repository (run_analysis.R) and launched with Rstudio.

## Variables

In the TidyDataset.txt file: 

- Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) corresponds to the activity performed by the volunteer wearing a smartphone to the waist.
- Subject is the id for each of the 30 volunteers that were included in this experiment.
- All the other columns refer to the mean values of the different measurements. "XYZ" is used to denote 3-axial signals in the X, Y and Z directions.  
        - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
        - Triaxial Angular velocity from the gyroscope. 
 


