from flask import render_template, jsonify, request, make_response
from app import app, db
from app.models import User, Rating
import uuid
import jwt
from functools import wraps
from ml.predictor import predictor


#token
def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = None

        if 'Authorization' in request.headers:
            token = request.headers['Authorization'].replace("Bearer ", "")

        if not token:
            return jsonify({'message': 'Token is missing'}), 401
        
        current_user = None

        try:
            data = jwt.decode(token, app.config.get('SECRET_KEY'), algorithms=["HS256"])
            current_user = User.query.filter_by(user_id=data['user_id']).first()
            if not current_user:
                raise Exception()
        except:
            return jsonify({'message': 'Token is invalid!'}), 401

        return f(current_user, *args, **kwargs)
    
    return decorated




