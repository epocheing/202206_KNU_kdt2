# KNU-Kdigital-docker 
### 빅데이터분석가 양성과정에 필요한 도커입니다.</br>


gui 환경 동기화 세팅 예정</br>
matplotlib은 jupyter 또는 image로 저장</br>
selenium은 headless chrome 사용 (사용법 /local 저장)</br>


**bind mount**</br>
python-data-container: ../workspace -> /workspace</br>
rstudio-container: ../workspace -> /home/rstudio/projects</br>
mysql-container: ../workspace -> /workspace</br>

**volume**</br>
rstudio-container: r_libs -> /usr/local/lib/R</br>
rstudio-container: rstudio -> /home/rstudio</br>
mysql-container: mysqldb -> /var/lib/mysql</br>

### VERSION

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