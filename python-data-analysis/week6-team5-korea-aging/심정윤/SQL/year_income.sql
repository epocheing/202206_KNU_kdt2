-- Active: 1658998487836@@127.0.0.1@3306@teamproject

use teamproject;

desc year_income;

select * from year_income;

-- 불필요한 row 삭제
delete from year_income
    where Column3='금액 (만원)';
delete from year_income
    where Column2='기타';
-- 불필요한 column 삭제
ALTER TABLE year_income DROP Column1;


-- 데이터 정제 후 엑셀로 행렬전환 
