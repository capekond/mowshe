from flask import Flask, jsonify, request

from dominate import document
from dominate.tags import *

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here

    with document(title='hello') as doc:
        h1('Hello Word')
        h2('Nice to see you')
    return doc.render()


@app.route('/load', methods=['GET'])
def load():
    incomes = [{'description': 'load', 'amount': 1000}]
    return jsonify(incomes), 200


@app.route('/sqr', methods=['POST'])
def sqr():
    number = request.json['number']
    res = [{'result': number * number}]
    return jsonify(res), 200


if __name__ == '__main__':
    app.run()
