# -*- coding: utf-8 -*-
"""
Created on Fri Nov  8 09:36:57 2019

@author: Valenzuela
"""
import json
from watson_developer_cloud import VisualRecognitionV3

visual_recognition = VisualRecognitionV3(
    '2018-03-19',
    iam_apikey='MoFdwRJNmESmkWpxMdLzuZj7T9zAmk0SaxUKkWj9SS23')

with open('./carro.jpg', 'rb') as images_file:
    classes = visual_recognition.classify(
        images_file,
        threshold='0.6',
	classifier_ids='default').get_result()
print(json.dumps(classes, indent=2))