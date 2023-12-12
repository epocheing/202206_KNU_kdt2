# ---------------------------------------------------------------------
# 기능 : form.html 파일을 복사해서 form.txt 파일로 만들기
# 함수명 : htmlToText
# 파라미터: html 파일명
# 결과값 : 없음
# ---------------------------------------------------------------------


def htmlToTxt(name):
    file = f".\data\\{name}.html"
    with open(file, mode='r') as file:
        txt = file.read()
    with open(f".\\data\\{name}.txt", mode='w') as f:
        f.write(txt)

htmlToTxt('form')

