#!/usr/bin/python3

"""This script  starts a Flask web application"""

from flask import Flask

app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_hbnb():
    """display statement"""
    return "Hello HBNB!"


@app.route('/hbnb', strict_slashes=False)
def hbnb():
    """display statement"""
    return "HBNB"


@app.route('/c/<text>', strict_slashes=False)
def c(text):
    """displays text"""
    text = text.replace('_', ' ')
    return "C {}".format(text)


@app.route('/python/', defaults={'text': 'is cool'}, strict_slashes=False)
@app.route('/python/<text>', strict_slashes=False)
def python(text):
    """displays text"""
    text = text.replace('_', ' ')
    return "Python {}".format(text)

@app.route('/number/<int:n>', strict_slashes=False)
def number(n):
    """if value is integer, it returns string that dispalys
    message, if not 404 error"""
    return "{} is a number".format(n)


@app.route('/number_template/<int:n>', strict_slashes=False)
def number_template(n):
    """display an HTML page only if n is an integer"""
    if isinstance(n, int):
        return render_template('/5-number.html', n=n)
    else:
        return abort (404)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
