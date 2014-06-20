GettingCleaningDataFinalProject
===============================

Final Project Submission for Getting and Cleaning Data


#Running the Script

The run_analysis.r script will need to be moved to the root folder of the dataset.  This folder contains separate directories for the test and train data ("test" and "train") as well as several .txt files that describe the dataset.  The *.txt files are:
* features.txt
* features_info.txt
* README.txt
* activity_labels.txt

The script will create two files:  newtidy.txt and tidyset.txt, which correspond to the data frames newtidy and tidyset, which will remain in memory when the script is run.  The data frames/text files are created by merging the following files from the test and train directories:
* X_train.txt
* Y_train.txt
* subject_train.txt

Once the files are merged, run_analysis subsets the mean and standard deviation from X_train values by using regular expressions.  Two new columns are added to make the final tidyset data frame/text file.  The first, subject, was made by appending the merged subject_train file to the newly merged data frame.  The second, activity, was made by mapping the numbers from Y_train into the named activites from the activiy_lables.txt file (i.e. WALKING, SITTING) and appending to the X_train dataframe.

The names of the columns were created by taking the features.txt file and manipulating the values based on a few principles, the names were mapped to the propercolumns of the X_train dataframe:
* no capital letters
* no spaces 
* no paranthesis

To create the second dataset/text file, newtidy, only the means from the tidyset were used.  For each individual variable was cross-tabulated by subject and activity and condensed to the mean, and the results were appended to the new data frame/text file.  This produces a table with a single value (mean) for each subject and activity across all the measured variables.
