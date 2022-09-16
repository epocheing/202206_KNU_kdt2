# KNU-Kdigital-docker 
## 빅데이터분석가 양성과정에 필요한 도커입니다.</br>
</br>

### **Version 2 update**
### jupyter lab + mysql (rstudio)

</br>

1) jupyter:datascience-notebook, rocker/geospatial, mysql 이미지 사용
2) locale 설정 및 nanum, D2Coding 폰트 설치
3) jupyter lab 기본 환경 구성 (python, R, Julia)
4) requirements.txt, requirements-mamba.txt 사용 패키지 설치

</br></br>

***********

</br></br>


**ver1.0** : init

**ver1.1**
- rstudio 추가
- 디렉토리 구조 변경 (상대경로)

**ver1.2**
- timezone 서울로 변경
- rstudio: locale 및 한글 설정

**ver1.3**
- python: locale error 수정 (데비안)
- mysql: utf8mb4 기본값 설정
- volume 디렉토리 최적화
