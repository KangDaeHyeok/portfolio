create table allez_member(      -- allez 회원정보 테이블
   id varchar(30) primary key,   -- 아이디
   password varchar(30),      -- 비밀번호
   name varchar2(30),         -- 이름
   birth_date varchar2(30),   -- 생년월일
   email varchar2(50),         -- 이메일
   phone varchar2(50)         -- 휴대폰 번호
);


select * from allez_member;

drop table allez_member;

--insert into allez_member(id, password, name, birth_date, email, phone)
--    values('admin4', '1234', '관리자', '19910119', 'admin@gmail.com', '01088889999');
--insert into allez_member values('admin2', '1234', '관리자', '19910119', 'admin@gmail.com', '01088889999', '1', sysdate, sysdate+30 );
insert into allez_member values('admin4', '1234', '관리자', '19910119', 'admin@gmail.com', '01088889999');

update allez_member set password='', name='' ,birth_date='', email='', phone='', status='', end_date=sysdate+30 where  id = '' ;

select id, password from allez_member;
select 'y' from allez_member where id='강민지' and password='123456';
select id from allez_member where id='winter12';

commit;