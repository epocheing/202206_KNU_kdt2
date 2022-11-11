# -----------------------------------------------------------------
# EXCEPTION Handling : 예외처리
# 프로그렘 실행 시 발생하는 오류(Error)에 대한 처리
# 오류가 발생해도 프로그렘 중단하지 않고 실행될 수 있도록 하는 것
# -----------------------------------------------------------------
try:
    num1, num2 = 10, 0
    print(f"num1 / num2 = {num1 / num2}")

except Exception as ex:
    print("에러발생", ex)
    # pass

except ZeroDivisionError:
    print("error")


finally:
    # 오류 발생 여부 상관없음
    # 무조건 실행
    print("finally")

print("end")

try:
    file = open("dddd.jpg", mode="r")
    print(file.read())
    file.close()
except Exception as e:
    print(f"에러 발생 : {e}")

import os

if os.path.exists("dddd.jpg"):
    file = open("dddd.jpg", mode="r")
    print(file.read())
    file.close()
else:
    print("없는 파일입니다.")
