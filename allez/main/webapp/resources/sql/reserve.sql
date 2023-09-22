create table allez_reserve(
	num number primary key, -- 예약순서
    id varchar2(20), -- 아이디
    car_name varchar2(60), -- 시승차량
    place varchar2(50), -- 시승 장소
    drive_date varchar2(30), -- 시승날짜
    drive_time varchar2(20), -- 시승시간
    use number, -- 예약이 이미 있는지 확인 
    image_url varchar2(200) -- 이미지경로
);
drop table allez_reserve;
create sequence seq_reserve nocycle nocache;

select * from allez_reserve;
commit;