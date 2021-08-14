---
title: "Getting and Cleaning Data - Course Project"
author: "Arianna Bionda"
date: "14/8/2021"
output: html_document
---

This repository contains all the files related to the final project of the course "Getting and Cleaning Data".

The project's instructions are the following:

"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

You should create one R script called run_analysis.R that does the following. 

- Merges the training and the test sets to create one data set.  
- Extracts only the measurements on the mean and standard deviation for each measurement.  
- Uses descriptive activity names to name the activities in the data set.  
- Appropriately labels the data set with descriptive variable names.  
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  "

## "run_analysis.R" script

This script: 

- Download and unzip the datasets.  
- Reads all the datasets.  
- Merges all the datasets containing the training data with those containing the test data and then merge the datasets containing the different type of data.  
- Extractes only the "mean" and "standard deviation" measurements, according to the features' (i.e., the variables') names.  
- Matches the Activity symbols with the Activity names. - Renames all the columns so that they are easier to be understood.  
- Creates another dataset with the mean values of each variable for each activity and subject, using dplyr package and saving it in ".txt" format.

This script can be launched in RStudio and performs all the analyses described above.
