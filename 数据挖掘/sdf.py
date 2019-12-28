import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
 
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import StratifiedShuffleSplit

train_data = pd.read_excel("train.xlsx")
LABELS = train_data['price']
# ID = train_data.pop('id')
# y = train_data.pop('price')

# y = LabelEncoder().fit(y).transform(y)

print(train_data)
df = pd.DataFrame({
    'data' : train_data
})
hist = df.hist(bins=3)
