from flask import render_template, jsonify, request, make_response
from app import app, db
from app.models import User, Rating
import uuid
import jwt
from functools import wraps



@app.route('/api/test', methods=['GET', 'POST'])
def test():
    '''this is to test
    '''
    food = {
        'biriyani' : 85,
        'oat meal': 25,
        'fried rice': 100
    }
    if request.method == 'POST':
        food.update(request.json)
    return jsonify(food),200



