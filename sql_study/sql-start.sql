create database testdb;
use testdb;

# person 테이블 생성 
# CONSTRAINT  pk_person: 제약 조건의 이름 설정 
drop table person if exists;

CREATE TABLE person
      (person_id SMALLINT UNSIGNED,
       fname VARCHAR(20),
       lname VARCHAR(20),
       eye_color ENUM('BR','BL','GR'),
       birth_date DATE,
       street VARCHAR(30),
       city VARCHAR(20),
       state VARCHAR(20),
       country VARCHAR(20),
       postal_code VARCHAR(20),
       CONSTRAINT pk_person PRIMARY KEY (person_id)
      );
     
desc person;    

drop table if exists; 

create table favorite_food 
	(person_id smallint unsigned,
	food VARCHAR(20),
	constraint pk_favorite_food primary key (person_id, food),
	constraint fk_fav_food_person_id foreign key (person_id)
	references person(person_id)
	);

desc favorite_food;
/*
 * 2.5 테이블 수
 */
set foreign_key_checks=0;
alter table person modify person_id smallint unsigned auto_increment;
set foreign_key_checks=1;

desc person;

select * from person; # person 테이블의 모든 내용 출력 
select * from favorite_food;


# 데이터추가 
insert into person 
	(person_id, fname, lname, eye_color, birth_date)
values(null, 'William', 'Turner', 'BR', '1972-05-27');

select * from person;

select person_id, fname, lname, birth_date from person;

select person_id, fname, lname, birth_date 
from person where lname = 'Turner';

select fname, lname from person where lname='Turner';


select * from favorite_food;
# 여러 행의 데이터 한번에 추가
insert into favorite_food 
	(person_id, food)
values 
	(1, 'pizza'), (1, 'cookie'), (1, 'nachos');

# order by 컬럼명 asc : 오름 차순 정렬 
select food from favorite_food 
where person_id=1 order by food asc;

# order by 컬럼명 desc : 내림 차순 정렬 
select food from favorite_food 
where person_id=1 order by food desc;

# person 테이블에 데이터 추가 
insert into person 
(person_id, fname, lname, eye_color, birth_date,
street, city, state, country, postal_code)
values (null, 'Susan', 'Smith', 'BL', '1975-11-02', 
'23 Maple St.', 'Arlington', 'VA', 'USA', '20220');


select person_id, fname, lname, birth_date from person;
