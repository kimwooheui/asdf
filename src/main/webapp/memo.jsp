private String V_JUMIN;
private String V_NAME;
private String M_NO;
private String V_TIME;
private String V_AREA;
private String V_CONFIRM;
private String M_NO;
private String M_NAME;
private String P_CODE;
private String P_SCHOOL;
private String M_JUMIN;
private String M_CITY;
private String P_CODE;
private String P_NAME;
private String P_INDATE;
private String P_READER;
private String P_TEL;

create table TBL_VOTE_2020025(
V_JUMIN char(13) constraint vote_jumin_pk primary key,
V_NAME varchar2(20),
M_NO  char(1),
V_TIME  char(4),
V_AREA  char(20),
V_CONFIRM  char(1)
);

//유권자
				  V_JUMIN, V_NAME, M_NO,  V_TIME,  V_AREA, V_CONFIRM 

insert into TBL_VOTE_2020025 values('99010110001','김유권','1','0930','제1투표장','N');
insert into TBL_VOTE_2020025 values('89010120002','이유권','2','0930','제1투표장','N');
insert into TBL_VOTE_2020025 values('69010110003','박유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('59010120004','홍유권','4','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('79010110005','조유권','5','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('89010120006','최유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('59010110007','지유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('49010120008','장유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('79010110009','정유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('89010120010','강유권','4','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('99010110011','신유권','5','0930','제1투표장','Y');
insert into TBL_VOTE_2020025 values('79010120012','오유권','1','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('69010110013','현유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('89010110014','왕유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('99010110015','유유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('79010110016','한유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('89010110017','문유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('99010110018','양유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('99010110019','구유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('79010110020','황유권','5','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('69010110021','배유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('79010110022','전유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('99010110023','고유권','1','1330','제2투표장','Y');
insert into TBL_VOTE_2020025 values('59010110024','권유권','3','1330','제2투표장','Y');

//후보목록			M_NO, M_NAME ,P_CODE ,P_SCHOOL ,M_JUMIN ,M_CITY 

insert into TBL_MEMBER_2020025 values('1','김후보','P1','1','6603011999991','수선화동');
insert into TBL_MEMBER_2020025 values('2','이후보','P2','3','5503011999992','민들래동');
insert into TBL_MEMBER_2020025 values('3','박후보','P3','2','7703011999993','나팔꽃동');
insert into TBL_MEMBER_2020025 values('4','조후보','P4','2','8803011999994','진달래동');
insert into TBL_MEMBER_2020025 values('5','최후보','P5','3','9903011999995','개나리동');

//정당리스트			P_CODE ,P_NAME ,P_INDATE ,P_READER ,P_TEL1 ,P_TEL2 ,P_TEL3 

insert into TBL_PARTY_2020025 values('P1','A정당','2010-01-01','위대표','02','1111','0001');
insert into TBL_PARTY_2020025 values('P2','B정당','2010-02-01','명대표','02','1111','0002');
insert into TBL_PARTY_2020025 values('P3','C정당','2010-03-01','기대표','02','1111','0003');
insert into TBL_PARTY_2020025 values('P4','D정당','2010-04-01','옥대표','02','1111','0004');
insert into TBL_PARTY_2020025 values('P5','E정당','2010-05-01','임대표','02','1111','0005');

create table TBL_MEMBER_2020025(
M_NO char(1) constraint member_no_pk primary key,
M_NAME varchar2(20),
P_CODE char(2),
P_SCHOOL char(1),
M_JUMIN char(13),
M_CITY varchar2(20)
);
create table TBL_PARTY_2020025(
P_CODE char(2) constraint party_code_pk primary key,
P_NAME varchar2(20),
P_INDATE date,
P_READER varchar2(20),
P_TEL1 char(3),
P_TEL2 char(4),
P_TEL3 char(4)
);

//후보조회 (완)
select m.M_NO ,m.M_NAME, 
P_NAME, 
decode(m.P_SCHOOL, '1','고졸','2','학사','3','석사','4','박사') as school, 
substr(m.M_JUMIN,1,6)||'-'||substr(m.M_JUMIN,7,6) as jumin, 
M_CITY,p.P_TEL1||'-'||p.P_TEL2||'-'||p.P_TEL3 as tel
from TBL_MEMBER_2020025 m , TBL_PARTY_2020025 p
where m.P_CODE = p.P_CODE ;

//huboList getSet
M_NO
M_NAME
P_NAME
P_SCHOOL
M_JUMIN
M_CITY
P_TEL

투표하기 select (완)
select m.M_NO, m.M_NAME from TBL_MEMBER_2020025 m ;

투표하기 insert (완)
insert into TBL_VOTE_2020025 values(?,?,?,?,?,?);
//3번은 option val에 숫자넣기

투표검수조회 (완)
select V_NAME, 
'19'||substr(V_JUMIN,1,2)||'년'|| 
substr(V_JUMIN,3,2)||'월'|| 
substr(V_JUMIN,5,2)||'일생' as birth, 
'만'||to_number(120-substr(V_JUMIN,1,2))||'세' as age, 
M_NO, 
decode(substr(V_JUMIN,7,1),'1','남','2','여') as gender, 
substr(V_TIME,1,2)||':'|| substr(V_TIME,3,2) as time, 
decode(V_CONFIRM ,'Y','확인','N','미확인') as confirm 
from TBL_VOTE_2020025
where V_AREA='제1투표장';

//voteList
V_NAME
birth
age
M_NO
gender
V_TIME
V_CONFIRM

등수 (완)//두번재 M_NO는 decode
select M_NO, 
decode(M_NO,'1','김후보','2','이후보','3','박후보','4','조후보','5','최후보'), 
count(M_NO) as total 
from TBL_VOTE_2020025
where V_CONFIRM ='Y'
group by M_NO
order by total desc


   