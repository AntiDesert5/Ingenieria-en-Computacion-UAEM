# -*- coding: utf-8 -*-
"""
Created on Thu Nov 14 22:23:36 2019

@author: Valenzuela
"""

from azure.cognitiveservices.vision.customvision.training import CustomVisionTrainingClient

ENDPOINT =  "https://axel1.cognitiveservices.azure.com/"
# Replace with a valid key
training_key = "ac72797357e74ea9be22996edbfd53ec"
prediction_key = "0b8c9d873ad540cd8379e68f82793bde"
prediction_resource_id = "/subscriptions/d470f4a0-77f3-4bda-9ccd-9fb684616a87/resourceGroups/AntiDesert5/providers/Microsoft.CognitiveServices/accounts/axel1-Prediction"


publish_iteration_name = "Iteration2"#aqui va el nombre de la iteracion, nombre publicaado

trainer = CustomVisionTrainingClient(training_key, endpoint=ENDPOINT)

# Create a new project
print ("Analizando Imagen...")
#project = trainer.create_project("Balonesbueno")
project="b73eda71-409c-4fe5-8630-039beb3e19b7"
imagen="/bama.jpg"
# Creacuin de etiquetas
"""
fut = trainer.create_tag(project.id, "fut")
americano = trainer.create_tag(project.id, "americano")
baseball = trainer.create_tag(project.id, "baseball")
grande= trainer.create_tag(project.id, "gande")
real=trainer.create_tag(project.id, "real")
cosido=trainer.create_tag(project.id, "cosido")
redondo=trainer.create_tag(project.id, "redondo")
balon=trainer.create_tag(project.id, "balon")
pequeño=trainer.create_tag(project.id, "pequeño")
ovalado=trainer.create_tag(project.id, "ovalado")

base_image_url = "C:/Users/Valenzuela/Documents/visionartificial/proyecto"#url del proyecto

print("añadiendo imagenes images...")

image_list = []
#las imagenes se agregan al algoritmo y se les asigna las etiquetas
for image_num in range(1, 11):
    file_name = "fut_{}.jpg".format(image_num)
    with open(base_image_url + "Balones/futbol/" + file_name, "rb") as image_contents:
        image_list.append(ImageFileCreateEntry(name=file_name, contents=image_contents.read(), tag_ids=[hemlock_tag.id]))

for image_num in range(1, 11):
    file_name = "base_{}.jpg".format(image_num)
    with open(base_image_url + "Balones/basebal/" + file_name, "rb") as image_contents:
        image_list.append(ImageFileCreateEntry(name=file_name, contents=image_contents.read(), tag_ids=[cherry_tag.id]))

upload_result = trainer.create_images_from_files(project.id, images=image_list)
if not upload_result.is_batch_successful:
    print("Image batch upload failed.")
    for image in upload_result.images:
        print("Image status: ", image.status)
    exit(-1)
    
#para entrenar
    import time

print ("Training...")
#El algoritmo se entrena
iteration = trainer.train_project(project.id)
while (iteration.status != "Completed"):
    iteration = trainer.get_iteration(project.id, iteration.id)
    print ("Training status: " + iteration.status)
    time.sleep(1)

trainer.publish_iteration(project.id, iteration.id, publish_iteration_name, prediction_resource_id)
print ("Entrenado!")
""" ####
from azure.cognitiveservices.vision.customvision.prediction import CustomVisionPredictionClient
base_image_url ="C:/Users/Valenzuela/Documents/visionartificial/proyecto"
# Now there is a trained endpoint that can be used to make a prediction
predictor = CustomVisionPredictionClient(prediction_key, endpoint=ENDPOINT)

import numpy as np
import matplotlib.pyplot as plt   
from skimage import io
image=io.imread(base_image_url +imagen)/255.0 
plt.imshow(image,vmin=0,vmax=1)

with open(base_image_url +imagen, "rb") as image_contents:
    results = predictor.classify_image(
        project, publish_iteration_name, image_contents.read())

    # Display the results.
    for prediction in results.predictions:
        print("\t" + prediction.tag_name +
              ": {0:.2f}%".format(prediction.probability * 100))
        
