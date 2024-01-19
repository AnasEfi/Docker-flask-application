from flask import Flask, render_template, request
import requests
from bs4 import BeautifulSoup

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        url = request.form['url']
        try:
            response = requests.get(url)

            soup = BeautifulSoup(response.text, 'html.parser')
            text_content = soup.get_text(separator='\n', strip=True)

            return render_template('parcer.tpl', url=url, text_content=text_content)

        except requests.RequestException as e:
            error_message = f"Error: {str(e)}"
            return render_template('parcer.tpl', url=url, error_message=error_message)

    return render_template('parcer.tpl', url='', text_content='', error_message='')

if __name__ == '__main__':
    app.run(debug=True)