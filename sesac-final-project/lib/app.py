# app.py
from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

# OpenAI API 키 설정
openai.api_key = '*********'
@app.route('/chat', methods=['POST'])
def chat():
    data = request.get_json()
    user_message = data.get('message')
    
    response = openai.Completion.create(
        model='gpt-3.5-turbo',  # 모델명을 확인하고 적절히 설정
        prompt=user_message,
        max_tokens=150
    )
    
    return jsonify({'response': response.choices[0].text.strip()})

if __name__ == '__main__':
    app.run(debug=True)
