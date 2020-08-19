# -*- coding: utf-8 -*-
"""
Created on Thu Nov 14 21:20:36 2019

@author: Valenzuela
"""
from azure.cognitiveservices.vision.customvision.training import CustomVisionTrainingClient
from azure.cognitiveservices.vision.customvision.training.models import ImageFileCreateEntry
from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient

ENDPOINT = "https://rafa-prediction.cognitiveservices.azure.com/"

publish_iteration_name = "classifyModel"
# Replace with a valid key
training_key = "cfbc61a4ceea4bacbf139300a1f25f41"
prediction_key = "cfbc61a4ceea4bacbf139300a1f25f41"
prediction_resource_id = "/subscriptions/d470f4a0-77f3-4bda-9ccd-9fb684616a87/resourceGroups/AntiDesert5/providers/Microsoft.CognitiveServices/accounts/Rafa-Prediction"

base_image_url = "C:/Users/Valenzuela/Documents/visionartificial/proyecto/"
# Now there is a trained endpoint that can be used to make a prediction
predictor = CustomVisionPredictionClient(prediction_key, endpoint=ENDPOINT)
project = "fbcbed55-ab03-44ec-97f1-b9527edcd12a"
with open("a.jpg", "rb") as image_contents:
    results = predictor.classify_image(project, publish_iteration_name,image_contents)

    # Display the results.
    for prediction in results.predictions:
        print("\t" + prediction.tag_name +
              ": {0:.2f}%".format(prediction.probability * 100))