import fitz  # PyMuPDF
import openai


def extract_text_from_pdf(pdf_path):
    doc = fitz.open(pdf_path)
    text = ""
    for page in doc:
        text += page.get_text()
    return text

pdf_path = "./경제단어 700선.pdf"
pdf_text = extract_text_from_pdf(pdf_path)
print(pdf_text[:1000])  # 텍스트가 제대로 추출되었는지 확인


def parse_terms_from_text(text):
    terms = text.split('\n')
    terms = [term.strip() for term in terms if term.strip()]
    return terms

terms = parse_terms_from_text(pdf_text)

openai.api_key = 'YOUR_OPENAI_API_KEY'

def get_economic_term_explanation(term):
    prompt = f"경제 용어 '{term}'에 대해 쉽게 설명해줘."

    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=150,
        n=1,
        stop=None,
        temperature=0.7,
    )

    explanation = response.choices[0].text.strip()
    return explanation

# 예시로 첫 5개 용어에 대한 설명 생성
for term in terms[:5]:
    print(f"{term}: {get_economic_term_explanation(term)}")
