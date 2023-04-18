#!/usr/bin/env python
# coding: utf-8

# In[36]:


from pandas_profiling import ProfileReport


# In[38]:


df=pd.read_csv(r"C:\Users\gupth\Desktop\GreedyGame\Q4\Q4_ADX_Sample_data.csv")


# In[39]:


df.head()


# In[40]:


df.info()


# In[41]:


for col in df:
    print (col,df[col].nunique())


# In[42]:


report=ProfileReport(df)
report.to_file(r"C:\Users\gupth\Desktop\GreedyGame\Q4\q4profilereport.html")


# In[47]:


df.loc[df['ae_revenue']<1,'segment']='b1'
df.loc[(df['ae_revenue']>=1) & (df['ae_revenue']<101),'segment']='b2'
df.loc[(df['ae_revenue']>100) & (df['ae_revenue']<301),'segment']='b3'
df.loc[(df['ae_revenue']>300) & (df['ae_revenue']<601),'segment']='b4'
df.loc[(df['ae_revenue']>600) & (df['ae_revenue']<1501),'segment']='b5'
df.loc[(df['ae_revenue']>1501),'segment']='b6'


# In[48]:


df


# In[49]:


df.to_excel(r"C:\Users\gupth\Desktop\GreedyGame\Q4\bins.xlsx")


# In[54]:


for i in ['b1','b2','b3','b4','b5','b6']:
    print(len(set(list(df[df["segment"]==i]["app_id"]))))


# In[ ]:




