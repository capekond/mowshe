from flask import Flask, jsonify, request
from webargs import flaskparser, fields
from dominate import document
from dominate.tags import *
from forms import FormAccount

app = Flask(__name__)

@app.route('/')
def hello_world():  # put application's code here

    with document(title='hello') as doc:
        h1('Mowshe Mir')
    return


@app.route('/account', methods=['GET'])
def account():


    with document(title='hello') as doc:
        h1('Mowshe Mir email')
    acc_form = FormAccount()  # will register fields called 'username' and 'email'.
    if acc_form.validate_on_submit():
        pass
    else:
        pass

    return doc.render()


@app.route('/sqr', methods=['POST'])
def sqr():
    number = request.json['number']
    res = [{'result': number * number}]
    return jsonify(res), 200


if __name__ == '__main__':
    app.run()
