from flask import Flask, jsonify, request
from dominate import document
from dominate.tags import *
from app.forms import FormAccount
from flask import render_template, flash, redirect

app = Flask(__name__)

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






@app.route('/sqr', methods=['POST'])
def sqr():
    number = request.json['number']
    res = [{'result': number * number}]
    return jsonify(res), 200


if __name__ == '__main__':
    app.run()
