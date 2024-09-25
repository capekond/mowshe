from flask import Flask, jsonify, request
from dominate import document
from dominate.tags import *
from app.forms import FormAccount, NameForm
from flask import render_template, flash, redirect
from flask import Flask, render_template, redirect, url_for
from flask_bootstrap import Bootstrap5

from flask_wtf import FlaskForm, CSRFProtect
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired, Length

app = Flask(__name__)
# app.secret_key = 'IRWING'
# bootstrap = Bootstrap5()
# csrf = CSRFProtect(app)

@app.route('/')
def hello_world():  # put application's code here

    with document(title='hello') as doc:
        h1('Mowshe Mir')
    return  doc.render()


@app.route('/account', methods=['GET', 'POST'])
def account():
    form = FormAccount()
    if form.validate_on_submit():
        flash(f'Email pridan pro  {form.username.data}, email = {form.email.data}')
        return redirect('/')
    return render_template('account.html', title='Pridej ucet', form=form)



@app.route('/rest-api', methods=['GET'])
def rest_api():
    res = {'result': 'rest api', 'count' : 10}
    return jsonify(res), 200


@app.route('/sqr', methods=['POST'])
def sqr():
    number = request.json['number']
    res = {'result': number * number}
    return jsonify(res), 200

@app.route('/none', methods=['POST'])
def none():
    res = {'result': 'hola'}
    return jsonify(res), 200

@app.route('/actor', methods=['GET', 'POST'])
def actor():
    names = ['Pepa', "Fanda, 'Tonda"]
    form = NameForm()
    message = ""
    if form.validate_on_submit():
        name = form.name.data
        if name.lower() in names:
            message = "That actor is in our database."
        else:
            message = "That actor is not in our database."
    return render_template('index.html', names=names, form=form, message=message)


if __name__ == '__main__':
    app.run()
