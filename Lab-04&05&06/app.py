from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from config import Config

app = Flask(__name__)
app.config.from_object(Config)

db = SQLAlchemy(app)

# Mô hình đơn giản
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)

    def __repr__(self):
        return f'<User {self.username}>'

@app.route('/')
def home():
    return "Hello, Docker with Flask and PostgreSQL!"

if __name__ == "__main__":
    # Tạo các bảng trong cơ sở dữ liệu (nếu chưa tồn tại)
    with app.app_context():
        db.create_all()
    app.run(host="0.0.0.0", port=5000)
