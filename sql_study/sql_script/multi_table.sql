show databases;


# sakila 사용
use sakila;


# 교차 조인: 조건없이 모든 행을 결합
select c.first_name, c.last_name, a.address
from customer as c join address as a;


# 내부 조인: 두개의 테이블을 묶어 하나의 결고 집합
select c.first_name, c.last_name, a.address
from customer as c inner join address as a
on c.address_id = a.address_id;


# 세 개 이상 테이블 조인
select c.first_name, c.last_name, ct.city
from customer as c
	inner join address as a
	on c.address_id = a.address_id 
	inner join city as ct
	on a.city_id = ct.city_id ;


# 서브쿼리 사용
select c.first_name, c.last_name, addr.address, addr.city, addr.district
from customer as c
	inner join
	(select a.address_id, a.address, ct.city, a.district
	from address as a
		inner join city as ct
		on a.city_id = ct.city_id
	where a.district = 'California') as addr
	on c.address_id = addr.address_id;


# 테이블 재사용
select f.title
from film as f
	inner join film_actor as fa1
	on f.film_id = fa1.film_id
	inner join actor a1 # film, film_actor, actor 내부 조인 #1
	on fa1.actor_id = a1.actor_id
	inner join film_actor as fa2
	on f.film_id = fa2.film_id
	inner join actor a2 # film, film_actor, actor 내부 조인 #2
	on fa2.actor_id = a2.actor_id
where (a1.first_name = 'CATE' and a1.last_name = 'MCQUEEN')
	and (a2.first_name = 'CUBA' and a2.last_name = 'BIRCH');
	
	
# 셀프 조인
# sqlclass_db 사용
use sqlclass_db;


# 기존에 테이블이 존재하면 삭제하고 다시 생성
drop table if exists customer;
create table customer
(customer_id smallint unsigned,
first_name varchar(20),
last_name varchar(20),
birth_date date,
spouse_id smallint unsigned,
constraint primary key (customer_id));


# customer 테이블에 데이터 추가
insert into customer (customer_id, first_name, last_name, birth_date, spouse_id)
values
(1, 'John', 'Mayer', '1983-05-12', 2),
(2, 'Mary', 'Mayer', '1990-07-30', 1),
(3, 'Lisa', 'Ross', '1989-04-15', 5),
(4, 'Anna', 'Timothy', '1988-12-26', 6),
(5, 'Tim', 'Ross', '1957-08-15', 3),
(6, 'Steve', 'Donell', '1967-07-09', 4);

insert into customer (customer_id, first_name, last_name, birth_date)
values (7, 'Donna', 'Trapp', '1978-06-23');


# 데이터 확인
select * from customer;


# 셀프 조인
SELECT 	
	cust.customer_id,
	cust.first_name,
	cust.last_name,
	cust.birth_date,
	cust.spouse_id,
	spouse.first_name as spouse_firstname,
	spouse.last_name as spouse_lastname
from customer as cust
	join customer as spouse 
	on cust.spouse_id = spouse.customer_id;


# sakila 사용
use sakila;


# JOHN 이라는 이름의 배우가 출현한 모든 영화 제목
select f.title
from film as f
	inner join film_actor as fa
	on f.film_id = fa.film_id
	inner join actor as a
	on fa.actor_id = a.actor_id
where a.first_name = 'JOHN';



# 셀프 조인
select a1.address as addr1, a2.address as addr2, a1.city_id, a1.district
from address as a1
	inner join address as a2
where (a1.city_id = a2.city_id)
	and (a1.address_id != a2.address_id);







	