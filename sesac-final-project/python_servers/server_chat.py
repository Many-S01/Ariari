from flask import Flask, request, jsonify
import chatbot_chat

app = Flask(__name__)

@app.route('/chat', methods=['POST'])
def chat():
    data = request.json
    query = data.get('query', '')
    response = chatbot_chat.handle_chat_query(query)
    return jsonify({'response': response})

if __name__ == '__main__':
    app.run(port=5002)  # Use a different port for each server
