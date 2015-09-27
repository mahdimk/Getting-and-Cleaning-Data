
#This repo explains how all of the scripts work and how they are connected. For information on how to run the code refer to README.md

step 0 : load required packages
This code uses the dplyr package which must be installed prior to the run.

step 1 : reading and merging data
The 6 main text files are read into R in this section
train data : X_train y_train subject_train
test data: X_test y_test subject_test
for information regarding the meaning of each text file please refer to the readme file in the original zipped file.

Next, for each variable train and test data are appended to get the complete dataset.

After that, each variable is labeled for sanity purposes. For Y and Subject a generic name is used.
For X variables the names can be read from features.txt file


step 2 : selecting features

As we are only interested in mean and std related features, 





