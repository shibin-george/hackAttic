import requests
import shutil
from OpenSSL import crypto
import base64
from subprocess import call
import asyncio
import websockets
import time

global loop

def get_window(diff):
    if diff <= 800:
        return 700
    elif diff <= 1600:
        return 1500
    elif diff <= 2100:
        return 2000
    elif diff <= 2600:
        return 2500
    else:
        return 3000

async def connect():
    response = requests.get("https://hackattic.com/challenges/websocket_chit_chat/problem?access_token=99de6f567fe7a695")
    json_response = response.json()
    token = json_response["token"]
    print("Token: ", token)
    last_ping_time = None
    async with websockets.connect('wss://hackattic.com/_/ws/' + token) as websocket:
        # try:
        while True:
            message = await websocket.recv()
            print(message)
            if message[0] == 'p':
                current_time = round(time.time() * 1000)
                diff = (current_time - last_ping_time)
                last_ping_time = current_time
                # print("diff: ", diff)
                time_resp = get_window(diff)
                await websocket.send(str(time_resp))
            else:
                if message[0] == 'h':
                    last_ping_time = round(time.time() * 1000)
                    # print("Start time: ", last_ping_time)
                elif message[0] == 'c':
                    temp = message.replace('"','')
                    result = temp.replace("congratulations! the solution to this challenge is ", "")
                    print(result)
                    response = requests.post("https://hackattic.com/challenges/websocket_chit_chat/solve?access_token=99de6f567fe7a695", json={'secret': result})
                    print(response.content)




async def main():
    # try:
    print("====MAIN=========")
    task_error = loop.create_task(connect())
    await asyncio.wait([task_error])

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
loop.run_forever()

# response = requests.post("https://hackattic.com/challenges/tales_of_ssl/solve?access_token=99de6f567fe7a695", json={'certificate': b64crt})
# print(response.content)
