import fitz  # PyMuPDF

def extract_text_from_pdf(pdf_path):
    doc = fitz.open(pdf_path)
    text = ""
    for page in doc:
        text += page.get_text()
    return text

pdf_path = "./경제단어 700선.pdf"
pdf_text = extract_text_from_pdf(pdf_path)
print(pdf_text[:1000])  # 텍스트가 제대로 추출되었는지 확인
