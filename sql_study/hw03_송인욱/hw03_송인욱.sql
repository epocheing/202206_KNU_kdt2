 show databases;
 

create database shoppingmall;


use shoppingmall;


# 테이블 만든거 확인
SELECT * FROM user_table ut ;

# 컬럼 타입 변경
alter table user_table modify userID CHAR(8);
alter table user_table modify userName VARCHAR(10) not null;
alter table user_table modify birthYear INT not null;
alter table user_table modify addr CHAR(2) not null;
alter table user_table modify mobile1 CHAR(3);
alter table user_table modify mobile2 CHAR(8);
alter table user_table modify height SMALLINT;
alter table user_table modify mDate DATE;
alter table user_table add primary key (userID);

# 변경 확인
desc user_table;
select * from user_table;


# 테이블 확인
SELECT * FROM buy_table;
alter table buy_table  add primary key (num);

desc buy_table;
SELECT * FROM buy_table;
