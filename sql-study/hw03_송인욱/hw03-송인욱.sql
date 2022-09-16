 show databases;
 

create database shoppingmall;


use shoppingmall;


# user_table 테이블 생성
create table user_table (
	userID CHAR(8),
	userName  VARCHAR(10) not null,
	birthYear INT not null,
	addr CHAR(2) not null,
	mobile1 CHAR(3),
	mobile2 CHAR(8),
	height SMALLINT,
	mDate DATE,
	CONSTRAINT pk_user_table PRIMARY KEY (userID)
	);

# 데이터 확인
desc user_table;
SELECT * from user_table ut ;


# make buy_table
create table buy_table (
	num int,
	userID char(8) not null,
	prodName char(6) not null,
	groupName char(4),
	price int not null,
	amount smallint not null,
	constraint pk_buy_table primary key (num, userID),
	constraint fk_user_table foreign key (userID)
	references user_table(userID)
);

set foreign_key_checks=0;
alter table buy_table modify num int unsigned auto_increment;
set foreign_key_checks=1;

# 데이터 확인
desc buy_table;
SELECT * from buy_table;
