create table hugi(
    num number primary key,     --게시글 순서
    id varchar(30),             --작성자
    carname varchar2(100),      --모델 이름
    title varchar2(100),        --제목
    content varchar2(1000),     --내용
    count number,               --조회수
    star number,                --별점
    u_day date                  --등록날짜
);

create sequence num nocycle nocache;
drop sequence num;

select * from hugi where title like '%봉고르기니%';

insert into hugi(num, id, carname, title, content, count, star, u_day) values(num.nextval, 'spring33', 'avante', 
'avante 시승후기', 'avante가 출시 되었다고 해서 시승 신청하고 가서 타봤는데 너무 깔끔하고 승차감도 좋고 좋았습니다.', 0, 4,  sysdate);

----------------------------------------
select * from hugi where title='123';
select count from hugi where num = 7; --조회수 검색
select * from hugi where title like '%셀토스%'; --제목으로 검색
select count(*) from hugi;
select count(*) from hugi where title like '%카니발%';
----------------------------------------
update hugi set title='봉고르기니', content='봉고르기니 시승 후기입니다.', star='3' where num=3;
update hugi set count = 1 where num = 7;
----------------------------------------
delete from hugi where num=12;
delete from hugi where title='니로EV';
----------------------------------------
select ROWNUM,a.* from (select * from hugi a order by num desc) a where ROWNUM>=1 and ROWNUM<=5; --row에 순서를 정해주는 방법
select * from hugi;

drop table hugi;
----------------------------------------
commit;
rollback;
---------------------------- join ----------------------------
select hugi.num, hugi.carname, hugi.title, hugi.content, hugi.count, hugi.star, hugi.u_day, allez_member.name, car.carModel, car.car_image
--조회할 컬럼명 작성
from hugi                       --기준이 되는 테이블명 작성(어떤 테이블에서 조회하여 나타낼건지)
inner join allez_member         --조인할 테이블 작성
on hugi.id = allez_member.id    --일치하는 컬럼명 작성
inner join car                  --조인할 테이블 작성
on hugi.carname = car.carname   --일치하는 컬럼명 작성
order by hugi.num desc;
---------------------------
select b.* from (select ROWNUM AS "rows",a.* from (select * from hugi order by num desc) a) b  where "rows">5 and "rows"<=10;
--row에 순서를 정해주는 방법
select ROWNUM AS "rows",a.* from (select * from hugi order by num desc) a;

select b.* from (select ROWNUM AS "rows", a.* from (select hugi.num, hugi.id, hugi.carname, hugi.title, hugi.content, hugi.count,
hugi.star, hugi.u_day, allez_member.name, car.carModel, car.car_image
from hugi
inner join allez_member
on hugi.id = allez_member.id
inner join car
on hugi.carname = car.carname
order by hugi.num desc) a) 
b where "rows" between 6 and 10;

select hugi.num, hugi.carname, hugi.title, hugi.content, hugi.count, hugi.star, hugi.u_day, allez_member.name, car.carModel, car.car_image
--조회할 컬럼명 작성
from hugi                       --기준이 되는 테이블명 작성(어떤 테이블에서 조회하여 나타낼건지)
inner join allez_member         --조인할 테이블 작성
on hugi.id = allez_member.id    --일치하는 컬럼명 작성
inner join car                  --조인할 테이블 작성
on hugi.carname = car.carname   --일치하는 컬럼명 작성
where name like '%박%' 
order by hugi.num desc;