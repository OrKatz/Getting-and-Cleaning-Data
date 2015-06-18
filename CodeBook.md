# Introduction
The script run_analysis.Rperforms the following steps as described in project definition

* Merge same data using the rbind() function. binding files that have the same number of columns and using the same entities
* Columns with the mean and standard deviation measures are taken combined with correct names, taken from features.txt
* Taking the activity names and IDs from activity_labels.txt and they are exist in the dataset
* columns with vague column names are corrected
* Create new dataset with all the average measures for each subject and activity type. The output file is called averages_data.txt

# Variables
* xtrain, ytrain, xtest, ytest, subtrain and subtest contain the data from the downloaded files
* xdata, ydata and subdata merge the previous datasets
* features contains the correct names for the xdata dataset, which are applied to the column names stored in mean_and_std, a numeric vector used to extract the desired data
* A similar approach is taken with activity names through the activities variable
* all_data merges xdata, ydata and subdata in a big dataset
* averages_data contains the relevant averages which will be later stored in a .txt file
