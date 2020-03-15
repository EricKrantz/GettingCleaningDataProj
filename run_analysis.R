library(here)
library(tidyverse)

# Load activities and rename fields so can use in merge later
activities <- read.table(here('Data', 'activity_labels.txt'))
names(activities) <- c('activity_num', 'activity')


# Load test and train activities
# 'Merge' reorders, so need to cbind activities with data before merging with act_name
activities_test <- read.table(here('Data', 'test', 'y_test.txt'))
activities_train <- read.table(here('Data', 'train', 'y_train.txt'))
names(activities_test) <- 'activity_num'
names(activities_train) <- 'activity_num'

# Load column identifiers
features <- read.table(here('Data', 'features.txt'), stringsAsFactors = FALSE)

# Load test data set, merge with activity and add "test" identifier:
dat_test_sub <- read.table(here('Data', 'test', 'subject_test.txt'))
names(dat_test_sub) <- "subject"

dat_test <- read.table(here('Data', 'test', 'X_test.txt')) 
names(dat_test) <- features$V2
dat_test <- cbind(dat_test_sub, activities_test, dat_test)
dat_test <- merge(activities, dat_test, by = 'activity_num')
dat_test$set <- 'test'

# Load training data set, merge with activity and add "test" identifier:
dat_train_sub <- read.table(here('Data', 'train', 'subject_train.txt'))
names(dat_train_sub) <- "subject"

dat_train <- read.table(here('Data', 'train', 'X_train.txt')) 
names(dat_train) <- features$V2
dat_train <- cbind(dat_train_sub, activities_train, dat_train)
dat_train <- merge(activities, dat_train, by = 'activity_num')
dat_train$set <- 'train'

# bind data sets, reorder 
dat <- rbind(dat_test, dat_train) %>% 
    mutate(set = factor(set),
           subject = factor(subject)) %>% 
    select(subject, activity, set, contains('mean()'), contains('std()')) %>% 
    gather(key = 'sensor', value = 'value', -subject, -activity, -set) %>% 
    mutate(sensor = factor(sensor)) %>% 
    arrange(set, subject, activity, sensor)

rm('activities', 'activities_test', 'activities_train', 'dat_test', 'dat_test_sub',
   'dat_train', 'dat_train_sub', 'features')

# write.csv(dat, file = "Mean_StDev.csv", quote = FALSE)

# check if it all makes sense
table(dat$subject, dat$activity, dat$set)

# Calculate the average value of each combination (subject and activity)
dat_summary <- dat %>% 
    group_by(subject, activity) %>% 
    summarize(mean(value))

# write.csv(dat_summary, file = "Mean_StDev_Summary.csv", quote = FALSE)
