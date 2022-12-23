use koroecd;

select * from oecd;

select * from korea_jop;

select * from 국가식별번호;


alter table oecd
ADD CONSTRAINT LOC_ID PRIMARY KEY(LOCATION);

alter table 국가식별번호
add constraint CONNAME primary key (country name);
add constraint LoC_ID foreign key (alpha-3) references oecd(LOCATION));




#-------------------------------------------------------------------------------
s
# oecd 나라별 취업률 순위
select LOCATION,Value from oecd
where TIME = 2021 order by Value desc;


# oecd 한국 및 oecd 평균 그리고 상위 5위 출력
select LOCATION  ,Value 
from oecd
where LOCATION = 'ISL' or LOCATION = 'NZL' or LOCATION = 'JPN' or LOCATION = 'SWE'
               or LOCATION = 'NOR' or LOCATION = 'KOR' or LOCATION = 'OECD' order by Value desc;

# 국내 65세 이상 취업률  
            
select year,age,population, employed 
from korea_jop;


