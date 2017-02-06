data=iris
data=data.matrix(data)
data=data[sample(nrow(data)),]

train=data[1:120,]
test=data[121:150,]

train_cl=train[,5]
train=train[,-5]

test_cl=test[,5]
test=test[,-5]

k=5
l1=nrow(train)
l2=nrow(test)
pred_cl=vector(length = l2)
pred=vector(length = 3)
for(i in 1:l2)
{
  s=test[i,]
  v=vector(length = l1)
  for(j in 1:l1)
  {
    v[j]=dist(rbind(train[j,],s))
  }
  o=order(v)
  o=o[1:k]
  
  pred[1]=length(which(train_cl[o]==1))
  pred[2]=length(which(train_cl[o]==2))
  pred[3]=length(which(train_cl[o]==3))

  pred_cl[i]=order(pred)[3]
}


#library(class)
#pred_cl=knn(train,test,train_cl,k=5)

t=table(pred_cl,test_cl)
print((t[1,1]+t[2,2]+t[3,3])/30)