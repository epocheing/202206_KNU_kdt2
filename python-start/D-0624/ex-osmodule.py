# -------------------------------------------------------------
# os 모듈
# 파일 and 디렉토리 관련된 모듈
# -------------------------------------------------------------

import os.path as osp
import os


# 특정 폴더 체크하고 해당하는 폴더가 없으면 생성하는 기능

DIR_PATH = './AddressBook'

if not osp.exists(DIR_PATH):
    os.mkdir(DIR_PATH)
    # os.makedirs(DIR_PATH)  # 하위 폴더까지 다 만들때

DATA_FILE = DIR_PATH+r'\flower.jpg'

if osp.exists(DATA_FILE):
    print('있습니다')
else:
    print('없음')

# 특정 경로 안에 존재하는 내용 리스트

FILE_LIST = os.listdir(DIR_PATH+r'\AddressBook')
print(FILE_LIST)
