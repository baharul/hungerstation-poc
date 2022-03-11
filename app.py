from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
# from flask_sqlalchemy import SQLAlchemy as _BaseSQLAlchemy
import os

app=Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']="postgresql://postgres:nHZ6sAG4T2@postgres-postgresql.default.svc.cluster.local:5432/postgres"
app.config['SQLALCHEMY_POOL_SIZE']=20
app.config['SQLALCHEMY_POOL_TIMEOUT']=30

if __name__ == '__main__':
    app.run(debug=True)

db = SQLAlchemy(app)

class Item(db.Model):
  id = db.Column(db.Integer, primary_key=True)
  title = db.Column(db.String(80), unique=True, nullable=False)
  content = db.Column(db.String(120), unique=True, nullable=False)

  def __init__(self, title, content):
    self.title = title
    self.content = content

db.create_all()

@app.route('/items/<id>', methods=['GET'])
def get_item(id):
  item = Item.query.get(id)
  del item.__dict__['_sa_instance_state']
  return jsonify(item.__dict__)

@app.route('/items', methods=['GET'])
def get_items():
  items = []
  for item in db.session.query(Item).all():
    del item.__dict__['_sa_instance_state']
    items.append(item.__dict__)
  return jsonify(items)

@app.route('/items', methods=['POST'])
def create_item():
  body = request.get_json()
  db.session.add(Item(body['title'], body['content']))
  db.session.commit()
  return "item created"

@app.route('/items/<id>', methods=['PUT'])
def update_item(id):
  body = request.get_json()
  db.session.query(Item).filter_by(id=id).update(
    dict(title=body['title'], content=body['content']))
  db.session.commit()
  return "item updated"


@app.route('/items/<id>', methods=['DELETE'])
def delete_item(id):
  db.session.query(Item).filter_by(id=id).delete()
  db.session.commit()
  return "item deleted"

@app.route('/healthz', methods=['GET'])
def get_healthcheck():
   return "<h2>Your Flask app is running successfully!<h2>"