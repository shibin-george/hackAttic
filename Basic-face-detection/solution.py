import requests
import shutil
from OpenSSL import crypto
import base64
from subprocess import call, check_output
import base64
import json
from datetime import datetime
import face_recognition
from PIL import Image

def is_ascii(s):
    return all(ord(c) < 128 for c in s)

response = requests.get("https://hackattic.com/challenges/basic_face_detection/problem?access_token=99de6f567fe7a695")
json_response = response.json()

image_url = json_response['image_url']
response = requests.get(image_url, stream=True)
with open('image.file', 'wb') as out_file:
    shutil.copyfileobj(response.raw, out_file)

image = face_recognition.load_image_file("image.file")
face_locations = face_recognition.face_locations(image)

print(image.shape) 
# the image always seems to of shape 800 x 800, with each image being 100 x 100

face_tiles = []

for face_location in face_locations:

    # Print the location of each face in this image
    top, right, bottom, left = face_location
    print("A face is located at pixel location Top: {}, Left: {}, Bottom: {}, Right: {}".format(top, left, bottom, right))

    row_index = (int)(top / 100)
    column_index = (int)(right / 100)
    
    face_tiles.append([row_index, column_index])
    print (row_index, column_index)

print(face_tiles)

response = requests.post("https://hackattic.com/challenges/basic_face_detection/solve?access_token=99de6f567fe7a695", json={'face_tiles': face_tiles})
print(response.content)
