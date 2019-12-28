import pandas as pd
import numpy as np
import seaborn as sns
from sklearn.metrics import r2_score
import matplotlib as mpl
from sklearn import preprocessing #标准化数据模块
import matplotlib.pyplot as plt
from IPython.display import display
from sklearn import decomposition
from sklearn.model_selection import KFold
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import make_scorer
from sklearn.model_selection import GridSearchCV
from sklearn.naive_bayes import GaussianNB
from sklearn import neighbors

plt.style.use("fivethirtyeight")
sns.set_style({'font.sans-serif':['simhei','Arial']})

# 导入tag.xlsx

tag = pd.read_excel('tag.xlsx')   
t=tag.values
tags = tag.set_index("字段").to_dict()["字段说明"]  #以字典形式存储tag.xlsx数据{'feat1':'电池可以存储的总容量';'feat2':......}
del tags['id']  #删除其中的id列
del tags['price']   #删除其中的价格列
lisan = tags.copy()     # 离散型特征
lianxu = tags.copy()    # 连续型特征
for i in [2,4,6,10,18,19,20]:
    del lianxu['feat' + str(i)]
for i in [1,3,5,7,8,9,11,12,13,14,15,16,17]:
    del lisan['feat' + str(i)]  

# 读取数据

train_data = pd.read_excel("train.xlsx")
valid_data = pd.read_excel("valid.xlsx")
test_data = pd.read_excel("test.xlsx")
df = train_data.copy()
ID = df.pop('id')
df = pd.DataFrame(df)
col = train_data.columns.values.tolist()
col1 = col[1:-1]

# 转换数据集格式为数组

features_train = np.array(train_data[col1])
prices_train = train_data['price']
features_valid = np.array(valid_data[col1])
prices_valid = valid_data['price']
features_test = np.array(test_data[col1])
prices_test = test_data['price']

# -------------------1.离散型特征分析----------------

print('------------------特征分析----------------------\n')
def liSanXing(featt):
    g = sns.FacetGrid(df, col="price")
    g = g.map(plt.hist, featt,bins = 8)
def liSanXing0(featt):    
    d = sns.FacetGrid(df, col=featt)
    d = d.map(plt.hist, 'price',bins = 8)

def liSanXing1():
    f, (ax1,ax2,ax3,ax4,ax5,ax6) = plt.subplots(1,6,figsize=(20, 10), sharex=True, sharey=True)
    sns.barplot(x='feat2', y='price', data=df, ax=ax1)
    ax1.set_title(lisan['feat2']+'与price对比',fontsize=10)
    ax1.set_xlabel(lisan['feat2'])
    ax1.set_ylabel('price')

    sns.barplot(x='feat4', y='price', data=df, ax=ax2)
    ax2.set_title(lisan['feat4']+'与price对比',fontsize=10)
    ax2.set_xlabel(lisan['feat4'])
    ax2.set_ylabel('price')

    sns.barplot(x='feat6', y='price', data=df, ax=ax3)
    ax3.set_title(lisan['feat6']+'与price对比',fontsize=10)
    ax3.set_xlabel(lisan['feat6'])
    ax3.set_ylabel('price')

    sns.barplot(x='feat18', y='price', data=df, ax=ax4)
    ax4.set_title(lisan['feat18']+'与price对比',fontsize=10)
    ax4.set_xlabel(lisan['feat18'])
    ax4.set_ylabel('price')

    sns.barplot(x='feat19', y='price', data=df, ax=ax5)
    ax5.set_title(lisan['feat19']+'与price对比',fontsize=10)
    ax5.set_xlabel(lisan['feat19'])
    ax5.set_ylabel('price')

    sns.barplot(x='feat20', y='price', data=df, ax=ax6)
    ax6.set_title(lisan['feat20']+'与price对比',fontsize=10)
    ax6.set_xlabel(lisan['feat20'])
    ax6.set_ylabel('price')
    plt.show()

    f, (ax1) = plt.subplots(1,1,figsize=(20, 10))
    sns.barplot(x='feat10', y='price', data=df, ax=ax1)
    ax1.set_title(lisan['feat10']+'与price对比',fontsize=10)
    ax1.set_xlabel(lisan['feat10'])
    ax1.set_ylabel('总价')
    plt.show()

# --------------2.连续型特征分析---------------------

df_price0 = df.copy()  #price = 1 的数据
df_price0 = df_price0[df_price0.price == 0]
df_price1 = df.copy()  #price = 2 的数据
df_price1 = df_price1[df_price1.price == 1]
df_price2 = df.copy()  #price = 3 的数据
df_price2 = df_price2[df_price2.price == 2]
df_price3 = df.copy()  #price = 4 的数据
df_price3 = df_price3[df_price3.price == 3]

def lianXuXing(featt):
    ax8=sns.kdeplot(df_price0[featt], shade=True, color='r',label='price = 0')
    ax9=sns.kdeplot(df_price1[featt], shade=True, color='g',label='price = 1')
    ax10=sns.kdeplot(df_price2[featt], shade=True, color='b',label='price = 2')
    ax11=sns.kdeplot(df_price3[featt], shade=True, color='#98F5FF',label='price = 3')
    ax11.set_xlabel(lianxu[featt])
    ax11.set_title(featt)
    plt.show()


# -------------3.特征间相关性热力图-----------------

def heat():
    f = df.drop('price',axis = 1).corr()
    cmap = sns.cm.rocket_r
    sns.heatmap(f,vmin=-0.05,cmap = cmap)
    plt.show()

# -------------------4.预处理---------------------

print('------------------预处理----------------------\n')
# ---------4.1 离散化-----------

# for featt in lianxu:
#     est = preprocessing.KBinsDiscretizer(strategy='quantile', encode='ordinal').fit(features_train)
#     features_train = est.transform(features_train)
#     est = preprocessing.KBinsDiscretizer(strategy='quantile', encode='ordinal').fit(features_valid)
#     features_valid = est.transform(features_valid)

# ---------4.2 标准化-----------

# features_train = preprocessing.normalize(features_train, norm = 'l2')#L2
# features_valid = preprocessing.normalize(features_valid, norm = 'l2')#L2
# min_max_scaler = preprocessing.MinMaxScaler()

# features_train = min_max_scaler.fit_transform(features_train)
# features_valid = min_max_scaler.fit_transform(features_valid)
# features_test = min_max_scaler.fit_transform(features_test)

# ---------4.3 降维-----------

#U是特征向量，S是特征值

def pca(X):
    m=X.shape[0]
    n=X.shape[1]

    sigma=np.dot(X.T,X)/m
    U,S,v=np.linalg.svd(sigma,full_matrices=True)

    return U,S
def projectData(X, U, K):
    Z = np.zeros((X.shape[0], K))

    for i in range(X.shape[0]):
        x = X[i, :]
        Z[i, :] = np.dot(x, U[:, 0:K])

    return Z
U,S=pca(features_train)

#维度
K=18

# features_train=projectData(features_train,U,K)

# U,S=pca(features_test)
# features_test=projectData(features_test,U,K)

# U,S=pca(features_valid)
# features_valid=projectData(features_valid,U,K)


#-----------------------------------------------------------------
# for featt in lisan:
#     liSanXing(featt)
#     plt.show()
# for featt in lisan:
#     liSanXing0(featt)
#     plt.show()
# liSanXing1()

# for featt in lianxu:
#     lianXuXing(featt)
    
# heat()





# ------------------CART算法及交叉验证----------------------

print('------------------算法----------------------\n')
# 利用GridSearchCV计算最优解
def fit_model(X, y):
    """ 基于输入数据 [X,y]，利于网格搜索找到最优的决策树模型"""
    
    cross_validator = KFold(10, shuffle=True)
    regressor = DecisionTreeRegressor()
    
    params = {'max_depth':[1,2,3,4,5,6,7,8,9,10]}
    scoring_fnc = make_scorer(performance_metric)
    grid = GridSearchCV(estimator = regressor, param_grid = params, scoring = scoring_fnc, cv = cross_validator)

    # 基于输入数据 [X,y]，进行网格搜索
    grid = grid.fit(X, y)
    print(pd.DataFrame(grid.cv_results_))
    return grid.best_estimator_

# 计算R2分数
def performance_metric(y_true, y_predict):
    """计算并返回预测值相比于预测值的分数"""
    score = r2_score(y_true, y_predict)

    return score

opt = fit_model(features_train, prices_train)

# 输出最优模型的 'max_depth' 参数
print("最理想CART模型的参数 'max_depth' 是 {} 。".format(opt.get_params()['max_depth']))

predicted_value = opt.predict(features_valid)
r2 = performance_metric(prices_valid, predicted_value)

print("CART模型在验证数据上 R^2 分数 {:,.5f}。".format(r2))

# -------------朴素贝叶斯算法及交叉验证----------------

gnb = GaussianNB().fit(features_train, prices_train)
predicted_value = gnb.predict(features_valid)
r2 = performance_metric(prices_valid, predicted_value)
print("朴素贝叶斯模型在验证数据上 R^2 分数 {:,.5f}。".format(r2))

# -------------KNN算法及交叉验证----------------

xxx = neighbors.KNeighborsClassifier(30)
xxx.fit(features_train, prices_train)
predicted_value = xxx.predict(features_valid)
r2 = performance_metric(prices_valid, predicted_value)
print("KNN模型在验证数据上 R^2 分数 {:,.5f}。".format(r2))

# --------------测试----------------

print('------------------测试----------------------\n')
predicted_value1 = opt.predict(features_test)
r1 = performance_metric(prices_test,predicted_value1)
predicted_value2 = gnb.predict(features_test)
r2 = performance_metric(prices_test,predicted_value2)
predicted_value3 = xxx.predict(features_test)
r3 = performance_metric(prices_test,predicted_value3)

print('\nCART模型在测试数据上 R^2 分数 {:,.5f}。'.format(r1))
print('\n朴素贝叶斯模型在测试数据上 R^2 分数 {:,.5f}。'.format(r2))
print('\nKNN模型在测试数据上 R^2 分数 {:,.5f}。'.format(r3))
