# -*- coding: utf-8 -*-
"""
Created on Wed Aug 28 12:18:09 2019
naive bayes
@author: axel vj
"""
import pandas as pd
import numpy as np
dataset = pd.read_csv("dataset1.csv")
#dataset.iloc[0,1]
#dataset.iloc[:,2]
#dataset.loc[:,'clima']
#dataset.loc[:,:]
#dataset.iloc[:,0]
clases=dataset.iloc[:,2]
np.sum(clases=="Go-out")/clases.size
np.sum(clases=="Stay-home")/clases.size
np.sum(clases=="Sunny")&&np.sum
np.sum([dataset.iloc[:,0]=="Sunny"]and[clases=="Go-out"])
