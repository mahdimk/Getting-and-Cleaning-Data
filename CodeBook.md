
#This repo explains how all of the scripts work and how they are connected. For information on how to run the code refer to README.md

##step 0 : load required packages
This code uses the dplyr package which must be installed prior to the run.

##step 1 : reading and merging data
The 6 main text files are read into R in this section
train data : X_train y_train subject_train
test data: X_test y_test subject_test
for information regarding the meaning of each text file please refer to the readme file in the original zipped file.

Next, for each variable (X, Y and Subject) test data is appended to train data to get the complete dataset.

After that, each variable is labeled for sanity purposes. For Y and Subject a generic name is used.
For X variables the names can be read from features.txt file


##step 2 : selecting features

As we are only interested in mean and std related features, we find the corresponding indexex by searching through X variable names and subsetting the X_data based on those indexes.

##step 3 : adding activity descriptions
we would like to add the activity description to the table based on the correct activity code. At this point this table is read. The merge happens after the final column bind to avoid sorting errors.

##step 4 : adjusting labels
some of the shortened variable name are replaced with complete words to make them more readable
a column bind is applied to the three datasets with the order of Subject, Activity (Y), Features (X)
a merge on Y and activity names is done at this point. The completed dataset is finalData

##step 5 : tidyData
To get the mean of each activity for each Subject we use the dplyr package functions group_by and summarize_each
group_by is done on Subject and then Activity
summarize each helps create the mean for all variables without having to name all of them.
the code will output tidyData.txt for submission




