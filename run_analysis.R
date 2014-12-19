run_analysis<-function(path="UCI HAR Dataset"){
    
    library(dplyr)
    
    #import activity lables     
    filename<-paste(path,"activity_labels.txt", sep="/")
    activity_labels<-read.table(filename)
    #we only need the character values(as factors)
    activity_labels<-activity_labels[,2]
        
    #import features
    filename<-paste(path,"features.txt", sep="/")
    features<-read.table(filename, as.is=T)
    #we only need the character values(as chars)
    features<-features[,2]
    
    ###############################
    #import test data
    
    #import X_test dataset (slow)
    filename<-paste(path,"test/X_test.txt", sep="/")
    X_test<-read.table(filename)
    
    #import Y_test dataset
    filename<-paste(path,"test/Y_test.txt", sep="/")
    Y_test<-read.table(filename)
    #we  need a vector of factors
    Y_test<-as.factor(Y_test[,1])
    #Task 3 - replace the integers with the text labels
    #note this does not deal well with NA values, but we should be OK
    levels(Y_test)<-activity_labels
    
    #import subjects_test
    filename<-paste(path,"test/subject_test.txt", sep="/")
    subject_test<-read.table(filename)
    #we only need the int values(as factors)
    subject_test<-as.factor(subject_test[,1])
    
    
    ###############################
    #import training data   
    
    
    #import X_train dataset (slow)
    filename<-paste(path,"train/X_train.txt", sep="/")
    X_train<-read.table(filename)
    
    #import Y_train dataset
    filename<-paste(path,"train/Y_train.txt", sep="/")
    Y_train<-read.table(filename)
    #we  need a vector of factors
    Y_train<-as.factor(Y_train[,1])
    #Task 3 - replace the integers with the text labels
    #note this does not deal well with NA values, but we should be OK
    levels(Y_train)<-activity_labels
    
    #import subjects_train
    filename<-paste(path,"train/subject_train.txt", sep="/")
    subject_train<-read.table(filename)
    #we only need the int values(as factors)
    subject_train<-as.factor(subject_train[,1])
    
    ###############################   
    #Task 4 - fix feature names to be more descriptive
    features<-gsub("fBody","Freq_domain__Body_",features)
    features<-gsub("tBody","Time_domain__Body_",features)
    features<-gsub("tGravity","Time_domain_Gravity_",features)
    features<-gsub("Acc","Acceleration_",features)
    features<-gsub("-","_",features)
    features<-gsub("Body_Body","Body_",features)
    features<-gsub("\\(|\\)","",features)
    
    
    #apply features labels to data-sets
    colnames(X_train)<-features
    colnames(X_test)<-features
    
    #add activity_type column
    test<-cbind(activity_type=Y_test, X_test)
    train<-cbind(activity_type=Y_train, X_train)
    
    #add subject columny
    test<-cbind(subject=subject_test,test)
    train<-cbind(subject=subject_train,train)
    
    ###############################   
    #Task 1 -- combine data-sets   
    complete<-rbind(test,train)
    
    
    ###############################    
    #Task 2 -- extract measurements on the mean or standard deviation
    #There is no grading metric on which columns this task refers to
    #We chose every column with std or mean anywhere in the features.txt description
    
    #extract all columns with mean or std in the title
    filtered<-grep("std|mean",colnames(complete))
    
    #subset the full list to only include the ID columsns, and the extracted columns
    result<-complete[,c(1,2,filtered)]

    ###############################
    #Task 5 - create a tidy dataset from the results of 4
    
    #group the complete dataset by the first (subject) and second (activity_type) columns
    subject_activity<-group_by(result,subject,activity_type)
    

    #summarize each column with the mean function
    result<-summarise_each(subject_activity,"mean")
    
    return(result)
    
    
    
    
    
    
}