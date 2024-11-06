import pandas as pd 
import numpy as np 
import seaborn as sns 
import matplotlib as plt 
from sklearn.preprocessing import StandardScaler

from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC 
from sklearn.metrics import classification_report , confusion_matrix 

df = pd.read_csv("2-emails.csv")

df.head()

df.isnull().sum()

X = df.drop(['Email No.' , 'Prediction'], axis=1)
Y = df['Prediction']

X_train , X_test , Y_train , Y_test = train_test_split(X,Y,test_size=0.3)

print("Number of smaple in text : " , X_train.shape[0])
print("Number of smaple in label : " , Y_train.shape[0])


knn = KNeighborsClassifier() 
knn.fit(X_train , Y_train)
y_pred = knn.predict(X_test)

print(classification_report(Y_test , y_pred))

print(confusion_matrix(Y_test,y_pred))

svm = SVC(kernel = 'linear' , probability=True)
svm.fit(X_train , Y_train)
y_pred = svm.predict(X_test)

print(classification_report(Y_test , y_pred))
print(confusion_matrix(Y_test,y_pred))
