#create and randomize data
data=iris
data=data.matrix(data)
data=data[sample(nrow(data)),]

#Training Set: 
# Validation set is used for tuning the parameters of a model. 
#Test set is used for performance evaluation. 

#divide test and train
train=data[1:120,]
test=data[121:150,]


#train_cl=train[,5]    #why use factor?
train_cl=as.factor(train[,5])
train_data=train[,-5]

test_cl=as.factor(test[,5])
test_data=test[,-5]

ctrl <- trainControl(method="cv",number = 5)
knnfit<- train(train_data,train_cl,method="knn", trControl=ctrl)

knnPredict <- predict(knnfit,newdata = test_data )
conf_mat=confusionMatrix(knnPredict, test_cl )

print(conf_mat$table)
print(conf_mat$overall)