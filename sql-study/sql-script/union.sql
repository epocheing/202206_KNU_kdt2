show databases;
use sakila;
 
# 집합연산 규칙
 # 두 데이터셋 모두 같은 수의 열을 가져야함
 # 두 데이터셋의 각 열의 자료형은 서로 동일해야함


# union 연산자
# union = 정렬 후 중복 제거
# union all = 그냥 다 합침

desc customer;
desc actor;


# union all
select 'CUST' as type1, c.first_name, c.last_name
from customer as c
union all
select 'ACTR' as type1, a.first_name, a.last_name
from actor as a;


# 갯수 확인
select count(first_name) from customer;
select count(first_name) from actor;


# order by 할때 복합 쿼리의 첫번째 쿼리에 있는 열의 이름을 사용해야함
select a.first_name as fname, a.last_name as lname
from actor as a
where a.first_name like 'J%' and a.last_name like 'D%'
union ALL 
select c.first_name, c.last_name
from customer as c
where c.first_name like 'J%' and c.last_name like 'D%'
order by lname, fname;



