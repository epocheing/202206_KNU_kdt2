 show databases;
 
create database Siu_db;
ALTER DATABASE Siu_db CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
use Siu_db;


####################################################


# 찾을 키워드 저장해주는 테이블
create table search_keyword (
	country VARCHAR(5),
	maintag VARCHAR(10),
	subtag VARCHAR(10),
	positive SMALLINT,
	constraint pk_search_keyword primary key (subtag)
	);
	
# 크롤링 데이터 저장해주는 테이블
create table craw_data (
	num int,
	subtag VARCHAR(10),
	keyword VARCHAR(100),
	countn int,
	constraint pk_craw_data primary key (num, subtag),
	constraint fk_craw_search_keyword foreign key (subtag)
	references search_keyword(subtag)
	);

set foreign_key_checks=0;
alter table craw_data modify num smallint unsigned auto_increment;
set foreign_key_checks=1;


# 찾을 키워드 데이터 생성
insert into search_keyword 
(country, maintag, subtag, positive)
value ('KOR', '노인', '혐오', -1),
	('KOR', '노인', '종업원', 0),
	('KOR', '노인', '일자리', 1);


# 데이터 확인
select * from search_keyword;
select * from craw_data;



select cw.keyword, sum(countn) as count
from craw_data as cw
group by keyword;

# 일자리 정보
select cw.keyword, sum(countn) as count
from 
(select *
from craw_data
where subtag = '일자리') as cw
group by keyword
order by count desc;


select cw.keyword, sum(countn) as count
from 
(select *
from craw_data
where subtag = '혐오') as cw
group by keyword
order by count desc;


select cw.keyword, sum(countn) as count
from 
(select *
from craw_data
where subtag = '종업원') as cw
group by keyword
order by count desc;







###################################################


# 나라 데이터 저장 테이블
create table elderly_population (
	location VARCHAR(10),
	findtime year,
	value float,
	constraint pk_elderly_population primary key (location, findtime)
	);

# 노년부양비 데이터 저장 테이블
create table old_age_dependency_ratio (
	location VARCHAR(10),
	findtime year,
	value float,
	constraint pk_elderly_population primary key (location, findtime),
	constraint fk_elderly_ratio foreign key (location)
	references elderly_population(location)
	);

SELECT * from elderly_population ep ;
select * from old_age_dependency_ratio ;


###################################################

select *
from elderly_population ep
where location = 'KOR';

SELECT *
FROM old_age_dependency_ratio oadr
where location = 'KOR';


