use teamproject;


drop table if exists elder_total;

create table elder_total
	select yi.년도_코드, truncate(yi.전체, 2) as 연간소득, me.전체 as 지출
	from year_income as yi 
		inner join monthly_expense as me
		on yi.년도_코드 = me.년도_코드
	where 소득유형 = '연 총소득';

select * from elder_total;

drop table if exists elder_total_month;

create table elder_total_month
	select t.년도_코드, truncate(연간소득/12,1) as 월간소득,지출 as 월지출, truncate(연간소득/12-지출,1) as 월잔여 
	from elder_total as t;

select * from elder_total_month;

-- 외래키 설정
ALTER TABLE elder_total_month
add constraint kf_elder_total_month FOREIGN KEY (년도_코드) REFERENCES year (year_code);


drop table if exists elder_total;