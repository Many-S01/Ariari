import openai

# OpenAI API 키 설정
openai.api_key = '********'
# 사용자 입력
user_input = "안녕하세요, 오늘 날씨는 어때요?"

# 챗봇 응답 생성
response = openai.ChatCompletion.create(
    model='ft:gpt-3.5-turbo-0125:personal::******',  # 사용 중인 파인튜닝된 모델 이름
    messages=[
        {"role": "system", "content": "이 챗봇은 사용자 질문에 답변합니다."},
        {"role": "user", "content": user_input}
    ]
)

# 응답 출력
print("Chatbot response:", response.choices[0].message['content'])
