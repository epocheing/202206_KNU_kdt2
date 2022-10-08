# 모듈
import pandas as pd

# 경로 및 데이터프레임
DIR = "./beachpredict.csv"
df = pd.read_csv(DIR)

# 필요없는 열 제거
df.drop(["지점.1", "지점.3"], axis=1, inplace=True)

# 강수량 변경
df["일강수량(mm)"].fillna(0, inplace=True)
df["일강수량(mm).1"].fillna(0, inplace=True)

# 중앙값 대체
df["평균 풍속(m/s)"].fillna(df["평균 풍속(m/s)"].mean(), inplace=True)
df["평균 상대습도(%)"].fillna(df["평균 상대습도(%)"].mean(), inplace=True)
df["평균 기온(°C)"].fillna(df["평균 기온(°C)"].mean(), inplace=True)
df["평균 수온(°C)"].fillna(df["평균 수온(°C)"].mean(), inplace=True)
df["평균 풍속(m/s).1"].fillna(df["평균 풍속(m/s).1"].mean(), inplace=True)
df["평균 상대습도(%).1"].fillna(df["평균 상대습도(%).1"].mean(), inplace=True)
df["평균 기온(°C).1"].fillna(df["평균 기온(°C).1"].mean(), inplace=True)
df["평균 수온(°C).1"].fillna(df["평균 수온(°C).1"].mean(), inplace=True)
df["합계 일조시간(hr)"].fillna(df["합계 일조시간(hr)"].mean(), inplace=True)
df["합계 일조시간(hr).1"].fillna(df["합계 일조시간(hr).1"].mean(), inplace=True)

# 지역명 변경
df["지점"].fillna("거제", inplace=True)
df["지점.2"].fillna("통영", inplace=True)

# input 파일 저장
df.to_csv("beachDF.csv")
