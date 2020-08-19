# -*- coding: utf-8 -*-
"""
Created on Thu Nov  7 22:15:24 2019

@author: Valenzuela
"""

import json
from ibm_watson import VisualRecognitionV4
from ibm_watson.visual_recognition_v4 import AnalyzeEnums, FileWithMetadata
from ibm_cloud_sdk_core.authenticators import IAMAuthenticator

authenticator = IAMAuthenticator('P3Mitx5egbk99Yqo0qVglFVp49aKnlUw8x8i8S-Qr0Kx')
visual_recognition = VisualRecognitionV4(
    version='2019-02-11',
    authenticator=authenticator
)

visual_recognition.set_service_url('https://gateway.watsonplatform.net/visual-recognition/api')

#with open('bprueba.jpg', 'rb') as honda_file, open('bprueba.jpg', 'rb') as dice_file:
with open('a.jpg', 'rb') as honda_file:
    result = visual_recognition.analyze(
        collection_ids=["6443d4c6-041f-4c61-ad4d-f92d4150c65a"],
        features=[AnalyzeEnums.Features.OBJECTS.value],
        images_file=[
            FileWithMetadata(honda_file),
            #FileWithMetadata(dice_file)
        ]).get_result()
    print(json.dumps(result, indent=2))