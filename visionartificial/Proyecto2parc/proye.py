# -*- coding: utf-8 -*-
"""
Created on Thu Oct 24 15:17:01 2019

@author: Valenzuela
"""

import pandas as pd 
  
data = {"Diferenciacion": ["Brazil", "Russia", "India", "China", "South Africa"], 
       "Tipo de Crecimiento": ["Brasilia", "Moscow", "New Dehli", "Beijing", "Pretoria"], 
       "a": [8.516, 17.10, 3.286, 9.597, 1.221], 
       "Es tumor": ['si', 'si', 'no', 'no', 'no'] } 
  
data_table = pd.DataFrame(data) 
print(data_table) 