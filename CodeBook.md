This codebook is a re-work of the README.txt provided with the UCI HAR dataset. It was written to fulfill the getting and cleaning data coursera class project. This codebook will describe the variables, the data, and any transformations or work performed to clean up the data.

///////////////////////////////////////////////
Data Background:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 se
///////////////////////////////////////////////
Data transformations

The project was to combine the testing and training datasets, tidy the data, then return a new dataset with the average of each variable for each activity and each subject. 

The changes below are presented in a logical format, but the actual script processes these transformations in slightly different order to ensure the preservation of data

change 1) the Y_train file is not an independent observation, but a variable in the tidy dataset. We moved the data in Y_train to a new column labeled "activity_type".

change 2) the "activity_type" column was an integer, but it represented an activity best described in words. Each number, 1:6 in activity_type was replaced with a character from the activity_labels.txt

change 3) the subject_train file is not an independent observation, but a variable in the tidy dataset. We moved the data into a new column named "subject"

change 4) the  data column names were imported from features.txt and applied to the dataset. They were manipulated to make them more readable and more R friendly. They are currently a little large for printing.

change 5) repeat the above for the "test" dataset

change 6) merge the "test" and "train" datasets

change 7) extract only the columns that contain the mean or the standard deviation of a measurement.

change 8) organize the data so the average for each variable is displayed, organized by each subject and each activity type. eg, show all average accelerations for subject 2 when walking, then all accelerations for subject 2 while standing etc. 

///////////////////////////////////////////////
variable description

We will describe the first two variables in specific, then describe the remaining 79 variables algorithmically

 [1] "subject"      

"subject" is an integer variable (represented as a factor in R) ranges from 1:30 and represents an individual test subject from the original UCI testing. 
 
 [2] "activity_type"   

"activity_type" is a character variable (represented as a factor in R) that represents the type of activity being measured. It has 6 possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING,

 [3:81] measurements

Each of the remaining 79 variables contain a unitless* mean of a measurement, in the following format:

Domain_MeasurementSource_Measurement_Function_Vector

Domain: whether the result is in the time domain or frequency domain

MeasurementSource: whether the result pertains to the subject's body or to gravity

Measurement: type of data measured

Function: type of function applied to data (remember this is before we perform change 8 from above-- all of our results are means)

Vector: direction of the measurement, or possibly the magnitude (euclidean norm) of the vectors


*see forum thread https://class.coursera.org/getdata-016/forum/thread?thread_id=202

///////////////////////////////////////////////
Variable list:

  [1] "subject"                                
 [2] "activity_type"                          
 [3] "Time_Body_Acceleration_mean_X"          
 [4] "Time_Body_Acceleration_mean_Y"          
 [5] "Time_Body_Acceleration_mean_Z"          
 [6] "Time_Body_Acceleration_std_X"           
 [7] "Time_Body_Acceleration_std_Y"           
 [8] "Time_Body_Acceleration_std_Z"           
 [9] "Time_Gravity_Acceleration_mean_X"       
[10] "Time_Gravity_Acceleration_mean_Y"       
[11] "Time_Gravity_Acceleration_mean_Z"       
[12] "Time_Gravity_Acceleration_std_X"        
[13] "Time_Gravity_Acceleration_std_Y"        
[14] "Time_Gravity_Acceleration_std_Z"        
[15] "Time_Body_AccelerationJerk_mean_X"      
[16] "Time_Body_AccelerationJerk_mean_Y"      
[17] "Time_Body_AccelerationJerk_mean_Z"      
[18] "Time_Body_AccelerationJerk_std_X"       
[19] "Time_Body_AccelerationJerk_std_Y"       
[20] "Time_Body_AccelerationJerk_std_Z"       
[21] "Time_Body_Gyro_mean_X"                  
[22] "Time_Body_Gyro_mean_Y"                  
[23] "Time_Body_Gyro_mean_Z"                  
[24] "Time_Body_Gyro_std_X"                   
[25] "Time_Body_Gyro_std_Y"                   
[26] "Time_Body_Gyro_std_Z"                   
[27] "Time_Body_GyroJerk_mean_X"              
[28] "Time_Body_GyroJerk_mean_Y"              
[29] "Time_Body_GyroJerk_mean_Z"              
[30] "Time_Body_GyroJerk_std_X"               
[31] "Time_Body_GyroJerk_std_Y"               
[32] "Time_Body_GyroJerk_std_Z"               
[33] "Time_Body_Acceleration_mean_Mag"        
[34] "Time_Body_Acceleration_std_Mag"         
[35] "Time_Gravity_Acceleration_mean_Mag"     
[36] "Time_Gravity_Acceleration_std_Mag"      
[37] "Time_Body_AccelerationJerk_mean_Mag"    
[38] "Time_Body_AccelerationJerk_std_Mag"     
[39] "Time_Body_Gyro_mean_Mag"                
[40] "Time_Body_Gyro_std_Mag"                 
[41] "Time_Body_GyroJerk_mean_Mag"            
[42] "Time_Body_GyroJerk_std_Mag"             
[43] "Freq_Body_Acceleration_mean_X"          
[44] "Freq_Body_Acceleration_mean_Y"          
[45] "Freq_Body_Acceleration_mean_Z"          
[46] "Freq_Body_Acceleration_std_X"           
[47] "Freq_Body_Acceleration_std_Y"           
[48] "Freq_Body_Acceleration_std_Z"           
[49] "Freq_Body_Acceleration_meanFreq_X"      
[50] "Freq_Body_Acceleration_meanFreq_Y"      
[51] "Freq_Body_Acceleration_meanFreq_Z"      
[52] "Freq_Body_AccelerationJerk_mean_X"      
[53] "Freq_Body_AccelerationJerk_mean_Y"      
[54] "Freq_Body_AccelerationJerk_mean_Z"      
[55] "Freq_Body_AccelerationJerk_std_X"       
[56] "Freq_Body_AccelerationJerk_std_Y"       
[57] "Freq_Body_AccelerationJerk_std_Z"       
[58] "Freq_Body_AccelerationJerk_meanFreq_X"  
[59] "Freq_Body_AccelerationJerk_meanFreq_Y"  
[60] "Freq_Body_AccelerationJerk_meanFreq_Z"  
[61] "Freq_Body_Gyro_mean_X"                  
[62] "Freq_Body_Gyro_mean_Y"                  
[63] "Freq_Body_Gyro_mean_Z"                  
[64] "Freq_Body_Gyro_std_X"                   
[65] "Freq_Body_Gyro_std_Y"                   
[66] "Freq_Body_Gyro_std_Z"                   
[67] "Freq_Body_Gyro_meanFreq_X"              
[68] "Freq_Body_Gyro_meanFreq_Y"              
[69] "Freq_Body_Gyro_meanFreq_Z"              
[70] "Freq_Body_Acceleration_mean_Mag"        
[71] "Freq_Body_Acceleration_std_Mag"         
[72] "Freq_Body_Acceleration_meanFreq_Mag"    
[73] "Freq_Body_AccelerationJerk_mean_Mag"    
[74] "Freq_Body_AccelerationJerk_std_Mag"     
[75] "Freq_Body_AccelerationJerk_meanFreq_Mag"
[76] "Freq_Body_Gyro_mean_Mag"                
[77] "Freq_Body_Gyro_std_Mag"                 
[78] "Freq_Body_Gyro_meanFreq_Mag"            
[79] "Freq_Body_GyroJerk_mean_Mag"            
[80] "Freq_Body_GyroJerk_std_Mag"             
[81] "Freq_Body_GyroJerk_meanFreq_Mag"  