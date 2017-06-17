dataset = read.table('scores.tsv',header=T,sep="\t",dec=".",stringsAsFactors = FALSE)
colnames(dataset)

library(caTools)
set.seed(123)
split = sample.split(dataset$FINAL,SplitRatio = 4/5)
train_set = subset(dataset,split== T)
test_set=subset(dataset,split==F)

colnames(dataset)
#Backward elimination
#SL=0.05
#All_In 
regressor = lm(FINAL~.,
               dataset)

summary(regressor)

#Highest P value not more than 0.05
regressor = lm(FINAL~.,
               train_set)


y_pred= predict(regressor, newdata = test_set)
