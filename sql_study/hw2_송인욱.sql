show databases;

create DATABASE sqlclass_db;

use sqlclass_db;

select * from nobel;


# 1. 1960년에 노벨 물리학상 또는 노벨 평화상을 수상한 사람의 정보 출력
SELECT *
FROM nobel
WHERE (year = 1960) 
	AND (subject in ('Peace', 'Physics'));


# 2. Albert Einstein이 수상한 연도와 상 이름 출력
# 	- year, subject
SELECT year, subject
from nobel
where winner = 'Albert Einstein';


# 3. 1910 부터 1950까지 노벨 평화상 수상자 명단 출력
#	- year, winner
SELECT n.year, n.winner
FROM (
	SELECT *
	FROM nobel
	WHERE subject = 'Peace') as n
WHERE n.year BETWEEN 1910 and 1950;


# 4. 전체 테이블에서 수상자 이름이 'John'으로 시작하는 수상자 모두 출력
SELECT n.subject, n.winner
FROM nobel n 
WHERE n.winner like 'John%';

SELECT subject, winner
FROM nobel
WHERE winner REGEXP '^[J][o][h][n]';


# 5. 1964년 수상자 중에서 노벨화학상과 의학상을 제외한 수상자의 모든
# 	 정보를 수상자 이름을 기준으로 오름차순 정렬 후 출력
SELECT *
FROM (
	SELECT *
	FROM nobel
	WHERE year = 1964) as n
WHERE subject not in ('Medicine', 'Chemistry')
order by n.winner;


# 6. 1910 부터 1960까지 노벨 문학상 수상자 명단 출력
SELECT *
FROM (
	SELECT *
	FROM nobel
	WHERE year between 1910 and 1960) as n
WHERE n.subject = 'Literature';


# 7. 각 분야별 역대 수상자의 수를 내림차순 정렬후 출력
SELECT subject, count(*)
FROM nobel
group by subject
order by count(*) desc;


# 8. 노벨 의학상이 없던 연도를 모두 출력 (distinct)
create view no_medicine as
select DISTINCT year
from nobel 
where subject = 'Medicine';

SELECT distinct year
FROM nobel
WHERE year not in (select * from no_medicine);

# 9. 노벨 의학상이 없었던 연도의 총 회수를 출력
SELECT count(*)
FROM nobel
WHERE year not in (select * from no_medicine);
		
