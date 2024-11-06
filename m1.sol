import numpy as np 
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as plt

from  sklearn.preprocessing import StandardScaler 


df = pd.read_csv("uber.csv")
df.head()

df = df.drop(["Unnamed: 0" , "key" , "pickup_datetime"] , axis = 1)

df.isnull().sum()

df = df.dropna()
df.isnull().sum()

plt.figure(figsize=(10,6))
sns.boxplot(df)
plt.show()

for col in df.columns : 
    Q1 = df[col].quantile(0.25)
    Q3 = df[col].quantile(0.75)
    IQR = Q3 - Q1 

    lb = Q1 - 1.5*IQR 
    ub = Q3 + 1.5*IQR 

    df = df[(df[col] >= lb) & (df[col] <= ub)]

scalar = StandardScaler()
scalar_df = scalar.fit_transform(df)]
scalar_df

sns.heatmap(data= df.corr() , annot = True)
plt.show()

from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score , accuracy_score , mean_squared_error

X = df[["pickup_longitude", "pickup_latitude", "dropoff_longitude", "dropoff_latitude", "passenger_count"]]
Y = df["fare_amount"]

X_train , X_test , Y_train , Y_test = train_test_split(X,Y,test_size=0.3,random_state=42)

model = LinearRegression() 
model.fit(X_train, Y_train)


y_pred = model.predict(X_test)

r2Score = r2_score(Y_test,y_pred)
print("R2 score : " ,r2Score)
rmse = np.sqrt(mean_squared_error(Y_test,y_pred)) 
print("RMSE :" , rmse)

from sklearn.ensemble import RandomForestRegressor

model1 = RandomForestRegressor()
model1.fit(X_train,Y_train)

y_pred = model1.predict(X_test)

r2Score = r2_score(Y_test,y_pred)
print("R2 score : " ,r2Score)
rmse = np.sqrt(mean_squared_error(Y_test,y_pred)) 
print("RMSE :" , rmse)




