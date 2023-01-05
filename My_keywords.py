import requests
import json

def get_request(url):
    response = requests.get(url)
    return response

def post_request(url, data):
    response = requests.post(url, json=data)
    return response

def delete_request(url):
    response = requests.delete(url)
    return response

def to_json(text):
    return json.loads(text)
