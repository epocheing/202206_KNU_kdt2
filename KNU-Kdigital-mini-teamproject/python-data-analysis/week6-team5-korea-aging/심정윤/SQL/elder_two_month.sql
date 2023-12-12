use teamproject;

drop table if exists elder_two;

create table elder_two
	select yi.년도_코드, truncate(yi.노인부부, 2) as 연간소득, me.노인부부 as 지출
	from year_income as yi 
		inner join monthly_expense as me
		on yi.년도_코드 = me.년도_코드
	where 소득유형 = '연 총소득';

select * from elder_two;

drop table if exists elder_two_month;

create table elder_two_month
	select two.년도_코드, truncate(연간소득/12,1) as 월간소득,지출 as 월지출, truncate(연간소득/12-지출,1)/2 as 인당_월잔여 
	from elder_two as two;

select * from elder_two_month;


-- 외래키 설정
ALTER TABLE elder_two_month
add constraint kf_elder_two_month FOREIGN KEY (년도_코드) REFERENCES year (year_code);


drop table if exists elder_two;

