use teamproject;


drop table if exists elder_sol;

create table elder_sol
	select yi.년도_코드, truncate(yi.노인독거, 2) as 연간소득, me.노인독거 as 지출
	from year_income as yi 
		inner join monthly_expense as me
		on yi.년도_코드 = me.년도_코드
	where 소득유형 = '연 총소득';

select * from elder_sol;

drop table if exists elder_sol_month;

create table elder_sol_month
	select sol.년도_코드, truncate(연간소득/12,1) as 월간소득,지출 as 월지출, truncate(연간소득/12-지출,1) as 월잔여 
	from elder_sol as sol;

select * from elder_sol_month;

-- 외래키 설정
ALTER TABLE elder_sol_month
add constraint kf_elder_sol_month FOREIGN KEY (년도_코드) REFERENCES year (year_code);

ALTER TABLE monthly_expense 
add constraint kf_monthly_expense FOREIGN KEY (년도_코드) REFERENCES year (year_code);

ALTER TABLE year_income 
add constraint kf_year_income FOREIGN KEY (년도_코드) REFERENCES year (year_code);


drop table if exists elder_sol;














	
	



