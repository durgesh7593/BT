import pandas as pd 
import numpy as np 
import seaborn as sns 
import matplotlib as plt 
from sklearn.preprocessing import StandardScaler , LabelEncoder

from sklearn.model_selection import train_test_split 

df = pd.read_csv("3-Churn_Modelling.csv")

df.head()

df = df.drop(["RowNumber","CustomerId"  ,"Surname" ],axis=1)

label_encoder = LabelEncoder()

df["Gender"] = label_encoder.fit_transform(df["Gender"])
df["Geography"] = label_encoder.fit_transform(df["Geography"])

X = df.drop("Exited" , axis=1)
Y = df["Exited"]

X_train , X_test , Y_train , Y_test = train_test_split(X,Y,test_size= 0.3)

scalar = StandardScaler()
X_train = scalar.fit_transform(X_train)
X_test = scalar.fit_transform(X_test)

import tensorflow
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout


model = Sequential()
model.add(Dense(activation='relu', units=32, input_dim=X_train.shape[1]))
model.add(Dropout(0.5))
model.add(Dense(activation='relu' , units = 16 ))
model.add(Dense(activation='sigmoid' , units = 1 ))

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

model.fit(X_train, Y_train, batch_size=32, epochs=50)

y_pred = model.predict(X_test)
y_pred = (y_pred > 0.5) # to convert the probabilistic values to True or False
y_pred

from sklearn.metrics import accuracy_score, confusion_matrix
# Calculate accuracy score
accuracy = accuracy_score(Y_test, y_pred)

# Print confusion matrix
conf_matrix = confusion_matrix(Y_test, y_pred)

# Print the results
print("Accuracy Score:", accuracy)
print("Confusion Matrix:\n", conf_matrix)
