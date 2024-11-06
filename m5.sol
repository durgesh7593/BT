import pandas as pd
df = pd.read_csv('5-sales_data_sample.csv', encoding ="unicode_escape")
print(df.head())

df_cleaned = df.dropna()

X = df_cleaned[['SALES', 'QUANTITYORDERED', 'PRICEEACH']]

from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

inertia = []
K = range(1, 11)

for k in K:
    kmeans = KMeans(n_clusters=k, random_state=42)
    kmeans.fit(X_scaled)
    inertia.append(kmeans.inertia_)

    plt.figure(figsize=(8, 6))
plt.plot(K, inertia, 'bo-', color='blue')
plt.xlabel('Number of clusters (k)')
plt.ylabel('Inertia')
plt.title('Elbow Method for Optimal k')
plt.show()

# Choose k based on elbow point (e.g., k=3)
optimal_k = 4
kmeans = KMeans(n_clusters=optimal_k, random_state=42)
df_cleaned['Cluster'] = kmeans.fit_predict(X_scaled)

# Check cluster assignments
print(df_cleaned[['SALES', 'QUANTITYORDERED', 'PRICEEACH', 'Cluster']])

