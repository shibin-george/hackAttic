from qreader import QReader
import cv2
import requests
import shutil

response = requests.get("https://hackattic.com/challenges/reading_qr/problem?access_token=99de6f567fe7a695")
print(response.content)
image_url = response.json()["image_url"]

response = requests.get(image_url, stream=True)
with open('img.png', 'wb') as out_file:
    shutil.copyfileobj(response.raw, out_file)

# Create a QReader instance
qreader = QReader()

# Get the image that contains the QR code (QReader expects an uint8 numpy array)
image = cv2.cvtColor(cv2.imread("img.png"), cv2.COLOR_BGR2RGB)

# Use the detect_and_decode function to get the decoded QR data
decoded_text = qreader.detect_and_decode(image=image)
print(decoded_text[0])

response = requests.post("https://hackattic.com/challenges/reading_qr/solve?access_token=99de6f567fe7a695", json={'code':decoded_text[0]})
print(response.content)
