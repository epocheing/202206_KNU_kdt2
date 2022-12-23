-- year 테이블 생성 및 테이블 간 연결

use teamproject;

create table year
	(year_code int,
	year int,
	primary key (year_code));

select * from year;
	
insert into year 
	(year_code, year)
	values (1, 2014),
	(2, 2017),
	(3, 2020);
	
-- 지출, 소득 평균 추가

select 년도_코드,  from year_income yi ;