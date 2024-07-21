def chatbot():
    print("안녕하세요! 경제 용어에 대해 설명해드리는 챗봇입니다.")
    while True:
        user_input = input("알고 싶은 경제 용어를 입력해주세요 (종료하려면 '종료' 입력): ")
        if user_input.lower() == '종료':
            print("챗봇을 종료합니다. 이용해주셔서 감사합니다!")
            break
        if user_input in terms:
            explanation = get_economic_term_explanation(user_input)
            print(f"{user_input}에 대한 설명: {explanation}")
        else:
            print(f"'{user_input}'는 용어 목록에 없습니다. 다시 입력해주세요.")

if __name__ == "__main__":
    chatbot()
