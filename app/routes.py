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


@app.route('/api/register', methods=['POST'])
def create_user():
    data = request.get_json()
    required = ['username', 'name', 'email', 'password']
    
    for r in required:
        if not data.get(r):
            return jsonify({"error": f"missing argument [{r}]"})

    user = User.query.filter_by(username=data['username']).first()
    if user: return jsonify({"error": "username is taken"})

    user = User.query.filter_by(email=data['email']).first()
    if user: return jsonify({"error": "email already registered"})

    try:
        user = User(user_id=str(uuid.uuid4()), username=data['username'], name=data['name'], email=data['email'], admin=False)
        user.set_password_hash(data['password'])
        db.session.add(user)
        db.session.commit()
    except AssertionError as e:
        msg = str(e).split(":")[1]
        return jsonify({"error": msg})
    except Exception as e:
        return jsonify({"error": "invalid data"})

    output = {
        'username': user.username,
        'user_id': user.user_id,
        'name': user.name,
        'email': user.email
    }
    token = jwt.encode({'user_id': user.user_id}, app.config.get('SECRET_KEY'), algorithm="HS256")
    return jsonify({"message": "user created!", "user": output, "token":token})




