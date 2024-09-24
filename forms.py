from wtforms.validators import InputRequired
from wtforms import StringField, EmailField, validators
from flask_wtf import FlaskForm

class FormAccount(FlaskForm):
    username = StringField('Username', validators=[validators.InputRequired()])
    email = EmailField('Email', validators=[InputRequired(), validators.Length(4, 128), validators.Email()])