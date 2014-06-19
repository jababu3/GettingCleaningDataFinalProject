#load the datasets and merge test and train conditions

setwd("D:/Academic/DataScience/GettingCleaningData/FinalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
features <-read.table("features.txt")


setwd("train")
subject_train <-read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
Y_train <-read.table("y_train.txt")


setwd("../test")
subject_test <-read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
Y_test <-read.table("y_test.txt")

X_total = rbind(X_train, X_test)
Y_total =rbind(Y_train, Y_test)
rm(X_test)
rm(X_train)
rm(Y_test)
rm(Y_train)

subject_total <-rbind(subject_train, subject_test)
rm(subject_test)
rm(subject_train)

meanlocs <-grep("mean", features[,2])
stdlocs <-grep("std", features[,2])
alllocs <-append(meanlocs, stdlocs)
alllocs <-sort(alllocs)

Xmeanstds <-X_total[,alllocs]

#cleaning Y_total
Y_total$V1 <-sub("1", "walking", Y_total$V1)
Y_total$V1 <-sub("2", "walkingupstairs", Y_total$V1)
Y_total$V1 <-sub("3", "walkingdownstairs", Y_total$V1)
Y_total$V1 <-sub("4", "sitting", Y_total$V1)
Y_total$V1 <-sub("5", "standing", Y_total$V1)
Y_total$V1 <-sub("6", "laying", Y_total$V1)


subnames <-features[alllocs,]
subnames[,2] <-gsub("-","",subnames[,2])
subnames[,2] <-sub("\\(", "", subnames[,2])
subnames[,2] <-sub("\\)", "", subnames[,2])
subnames[,2] <-tolower(subnames[,2])
names(Xmeanstds) <-subnames[,2]


tidyset <-cbind(subject_total, Y_total, Xmeanstds)
rm(list=c("X_total", "Y_total", "Xmeanstds"))

names(tidyset)[1] <-"subject"
names(tidyset)[2] <-"activity"
tidyset$activity <-as.factor(tidyset$activity)

##--------------------------------
#cycling through data at the moment, there may be a better way to do this
xttmpmeanx <-xtabs(tbodyaccmeanx ~ subject + activity, aggregate(tbodyaccmeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(tbodyaccmeany ~ subject + activity, aggregate(tbodyaccmeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(tbodyaccmeanz ~ subject + activity, aggregate(tbodyaccmeanz~subject+activity, tidyset, mean))

newtidy <- data.frame(xttmpmeanx)
names(newtidy)[3] <-"tbodyaccmeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[4] <-"tbodyaccmeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[5] <-"tbodyaccmeanz"

##--------------------------------
xttmpmeanx <-xtabs(tgravityaccmeanx ~ subject + activity, aggregate(tgravityaccmeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(tgravityaccmeany ~ subject + activity, aggregate(tgravityaccmeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(tgravityaccmeanz ~ subject + activity, aggregate(tgravityaccmeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[6] <-"tgravityaccmeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[7] <-"tgravityaccmeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[8] <-"tgravityaccmeanz"


##--------------------------------
xttmpmeanx <-xtabs(tbodyaccjerkmeanx ~ subject + activity, aggregate(tbodyaccjerkmeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(tbodyaccjerkmeany ~ subject + activity, aggregate(tbodyaccjerkmeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(tbodyaccjerkmeanz ~ subject + activity, aggregate(tbodyaccjerkmeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[9] <-"tbodyaccjerkmeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[10] <-"tbodyaccjerkmeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[11] <-"tbodyaccjerkmeanz"

##--------------------------------
xttmpmeanx <-xtabs(tbodygyromeanx ~ subject + activity, aggregate(tbodygyromeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(tbodygyromeany ~ subject + activity, aggregate(tbodygyromeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(tbodygyromeanz ~ subject + activity, aggregate(tbodygyromeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[12] <-"tbodygyromeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[13] <-"tbodygyromeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[14] <-"tbodygyromeanz"

##--------------------------------
xttmpmeanx <-xtabs(tbodygyrojerkmeanx ~ subject + activity, aggregate(tbodygyrojerkmeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(tbodygyrojerkmeany ~ subject + activity, aggregate(tbodygyrojerkmeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(tbodygyrojerkmeanz ~ subject + activity, aggregate(tbodygyrojerkmeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[15] <-"tbodygyrojerkmeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[16] <-"tbodygyrojerkmeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[17] <-"tbodygyrojerkmeanz"

##--------------------------------
xttmpmeanx <-xtabs(tbodyaccmagmean ~ subject + activity, aggregate(tbodyaccmagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[18] <-"tbodyaccmagmean"

##--------------------------------
xttmpmeanx <-xtabs(tgravityaccmagmean ~ subject + activity, aggregate(tgravityaccmagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[19] <-"tgravityaccmagmean"

##--------------------------------
xttmpmeanx <-xtabs(tbodyaccjerkmagmean ~ subject + activity, aggregate(tbodyaccjerkmagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[20] <-"tbodyjerkaccmagmean"

##--------------------------------
xttmpmeanx <-xtabs(tbodygyromagmean ~ subject + activity, aggregate(tbodygyromagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[21] <-"tbodygyromagmean"

## frequency values
##--------------------------------
xttmpmeanx <-xtabs(fbodyaccmeanx ~ subject + activity, aggregate(fbodyaccmeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(fbodyaccmeany ~ subject + activity, aggregate(fbodyaccmeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(fbodyaccmeanz ~ subject + activity, aggregate(fbodyaccmeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[22] <-"fbodyaccmeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[23] <-"fbodyaccmeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[24] <-"fbodyaccmeanz"

##--------------------------------
xttmpmeanx <-xtabs(fbodyaccmeanfreqx ~ subject + activity, aggregate(fbodyaccmeanfreqx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(fbodyaccmeanfreqy ~ subject + activity, aggregate(fbodyaccmeanfreqy~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(fbodyaccmeanfreqz ~ subject + activity, aggregate(fbodyaccmeanfreqz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[25] <-"fbodyaccmeanfreqx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[26] <-"fbodyaccmeanfreqy"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[27] <-"fbodyaccmeanfreqz"

##--------------------------------
xttmpmeanx <-xtabs(fbodyaccjerkmeanx ~ subject + activity, aggregate(fbodyaccjerkmeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(fbodyaccjerkmeany ~ subject + activity, aggregate(fbodyaccjerkmeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(fbodyaccjerkmeanz ~ subject + activity, aggregate(fbodyaccjerkmeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[28] <-"fbodyaccjerkmeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[29] <-"fbodyaccjerkmeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[30] <-"fbodyaccjerkmeanz"

##--------------------------------
xttmpmeanx <-xtabs(fbodyaccjerkmeanfreqx ~ subject + activity, aggregate(fbodyaccjerkmeanfreqx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(fbodyaccjerkmeanfreqy ~ subject + activity, aggregate(fbodyaccjerkmeanfreqy~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(fbodyaccjerkmeanfreqz ~ subject + activity, aggregate(fbodyaccjerkmeanfreqz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[31] <-"fbodyaccjerkmeanfreqx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[32] <-"fbodyaccjerkmeanfreqy"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[33] <-"fbodyaccjerkmeanfreqz"

##--------------------------------
xttmpmeanx <-xtabs(fbodygyromeanx ~ subject + activity, aggregate(fbodygyromeanx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(fbodygyromeany ~ subject + activity, aggregate(fbodygyromeany~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(fbodygyromeanz ~ subject + activity, aggregate(fbodygyromeanz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[34] <-"fbodygyromeanx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[35] <-"fbodygyromeany"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[36] <-"fbodygyromeanz"

##--------------------------------
xttmpmeanx <-xtabs(fbodygyromeanfreqx ~ subject + activity, aggregate(fbodygyromeanfreqx~subject+activity, tidyset, mean))
xttmpmeany <-xtabs(fbodygyromeanfreqy ~ subject + activity, aggregate(fbodygyromeanfreqy~subject+activity, tidyset, mean))
xttmpmeanz <-xtabs(fbodygyromeanfreqz ~ subject + activity, aggregate(fbodygyromeanfreqz~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[37] <-"fbodygyromeanfreqx"

dftmp.xt <- data.frame(xttmpmeany)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[38] <-"fbodygyromeanfreqy"

dftmp.xt <-data.frame(xttmpmeanz)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[39] <-"fbodygyromeanfreqz"

##--------------------------------
xttmpmeanx <-xtabs(fbodyaccmagmean ~ subject + activity, aggregate(fbodyaccmagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[40] <-"fbodyaccmagmean"


##--------------------------------
xttmpmeanx <-xtabs(fbodyaccmagmeanfreq ~ subject + activity, aggregate(fbodyaccmagmeanfreq~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[41] <-"fbodyaccmagmeanfreq"

##--------------------------------
xttmpmeanx <-xtabs(fbodybodyaccjerkmagmean ~ subject + activity, aggregate(fbodybodyaccjerkmagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[42] <-"fbodybodyaccjerkmagmean"
##--------------------------------
xttmpmeanx <-xtabs(fbodybodyaccjerkmagmeanfreq ~ subject + activity, aggregate(fbodybodyaccjerkmagmeanfreq~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[43] <-"fbodybodyaccjerkmagmeanfreq"

##--------------------------------
xttmpmeanx <-xtabs(fbodybodygyromagmean ~ subject + activity, aggregate(fbodybodygyromagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[44] <-"fbodybodygyromagmean"

##--------------------------------
xttmpmeanx <-xtabs(fbodybodygyromagmeanfreq ~ subject + activity, aggregate(fbodybodygyromagmeanfreq~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[45] <-"fbodybodygyromagmeanfreq"

##--------------------------------
xttmpmeanx <-xtabs(fbodybodygyrojerkmagmean ~ subject + activity, aggregate(fbodybodygyrojerkmagmean~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[46] <-"fbodybodygyrojerkmagmean"

##--------------------------------
xttmpmeanx <-xtabs(fbodybodygyrojerkmagmeanfreq ~ subject + activity, aggregate(fbodybodygyrojerkmagmeanfreq~subject+activity, tidyset, mean))

dftmp.xt <- data.frame(xttmpmeanx)
newtidy <-cbind(newtidy, dftmp.xt[3])
names(newtidy)[47] <-"fbodybodygyrojerkmagmeanfreq"



##cleaning up
rm(dftmp.xt)
rm(features)
rm(subject_total)
rm(subnames)
rm(alllocs)
rm(meanlocs)
rm(stdlocs)
rm(xttmpmeanx)
rm(xttmpmeany)
rm(xttmpmeanz)


#writing the output
setwd("../")
write.table(tidyset, "tidyset.txt")
write.table(newtidy, "newtidy.txt")
