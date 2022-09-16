show databases;

CREATE database testdb;
use testdb;

create table string_tbl (
	char_fld char(30),
	vchar_fld varchar(30),
	text_fld text
	);


insert into string_tbl (char_fld, vchar_fld, text_fld)
values ('This is char data', 'This is varchar data', 'This is text data');



