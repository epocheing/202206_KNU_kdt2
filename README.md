# bigdata-training-docker
### 빅데이터분석가 양성과정에 필요한 도커입니다.</br>

리눅스 베이스로 설정, 윈도우-맥은 compose.yml파일 바꿔서 사용</br>

~~rstudio 추가 예정~~</br>
rstudio 추가 완료

**bind mount**</br>
python-data-container: ../python -> /workspace</br>
rstudio-container: ../R/projects -> /home/rstudio/projects</br>

**volume**</br>
rstudio-container: r_libs -> /usr/local/lib/R</br>
rstudio-container: rstudio -> /home/rstudio</br>
mysql-container: mysqldb -> /var/lib/mysql</br>

