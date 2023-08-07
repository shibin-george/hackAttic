import requests
import base64
# flask imports
from flask import Flask, request, jsonify, make_response
# imports for PyJWT authentication
import jwt
from datetime import datetime, timedelta
from functools import wraps

secret_key = ""
append = ""

app = Flask(__name__)

@app.route('/', methods =['GET'])
def start_api():
    global secret_key
    response = requests.get("https://hackattic.com/challenges/jotting_jwts/problem?access_token=99de6f567fe7a695")
    json_response = response.json()
    secret_key = json_response['jwt_secret']
    print("jwt key is set: ", secret_key)
    response = requests.post("https://hackattic.com/challenges/jotting_jwts/solve?access_token=99de6f567fe7a695", json={'app_url': "http://4.154.55.9:5000"})    print(response.content)
    return "Started!"


@app.route('/', methods =['POST'])
def jwt_api():
    global secret_key, append
    token = request.get_data()
    try:
        token_data = jwt.decode(token, secret_key) #, verify=False, options={'verify_exp': False})
        if 'append' in token_data:
            append += token_data['append']
            print("append: ", token_data['append'])
            return ""
        else:
            resp = {'solution': append}
            return jsonify(resp)
    except Exception:
        print("Exception!!!")
        return ""

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, threaded=True)
