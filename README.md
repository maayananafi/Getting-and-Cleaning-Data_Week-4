# Getting-and-Cleaning-Data_Week-4

This repository is submitted for the course project of the Getting and Cleaning data course. It includes the following file:

* a README.md file, which includes a description of the R script used
* DataCleaningProject.R, the R script used to create the dataset
* Codebook.md, which describes the contents of the dataset
* secTidySet.txt, which contains the data set

# Description of R script

The R script, found in DataCleaningProject.R, does the following:

* Downloads and unzips the source data
* Reads the data
* Assigns column names
* Merges the training and test datasets
* Extracts measurements ofr mean and standard deviation for each variable
* Labels the dataset
* Creates a second tidy set with the average for eaech variable for each activity and each subject
* Writes the dataset into the secTidySet.txt file.
