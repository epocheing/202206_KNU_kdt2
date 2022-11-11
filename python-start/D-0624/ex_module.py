# -------------------------------------------------------------
# 하나의 파이썬 파일 mod.py
# 특정 목적에 관련된 변수, 함수, 클래스가 존재함
# 필요한 파일에서 사용 가능함
# 사용법 : import 모듈명
# -------------------------------------------------------------

# 모듈 포함하기
import math as m
from math import factorial
# * 를 사용해서 불러오면 모든 함수 다 불러옴
# from math import *
# 다 불러왔을 때 함수가 중복되면 원래 가지고있는 파일의 함수가 우선

# 모듈 안에 기능 사용하기
print(m.factorial(5))

# 모듈에서 특정 기능만 가져올때는 함수명만 씀
print(factorial(9))

# 사용자 모듈
import ex_func
ex_func.displayPrintYear()
