-- Active: 1658998487836@@127.0.0.1@3306@teamproject

-- monthly_expense (월 평균 지출)
use teamproject;

desc monthly_expense;

select * from monthly_expense;

# 불필요한 row 삭제
delete from monthly_expense
    where Column1 in ('특성별(1)', '현 취업상태별');
delete from monthly_expense
    where 유형='기타';

# 불필요한 column 삭제
ALTER TABLE monthly_expense DROP Column1;
ALTER TABLE monthly_expense DROP Column5;
ALTER TABLE monthly_expense DROP Column7;

# column 이름 변경
ALTER TABLE monthly_expense
RENAME COLUMN Column2 TO 유형;
ALTER TABLE monthly_expense
    RENAME COLUMN Column3 TO 2014년;
ALTER TABLE monthly_expense
    RENAME COLUMN Column4 TO 2017년;
ALTER TABLE monthly_expense
    RENAME COLUMN Column6 TO 2020년;

# 데이터 type cast
ALTER TABLE monthly_expense
    modify column 2014년 FLOAT NULL,
    modify column 2017년 FLOAT NULL,
    modify column 2020년 FLOAT NULL;

select * from monthly_expense;

-- 데이터 정제 후 엑셀로 행렬전환 


