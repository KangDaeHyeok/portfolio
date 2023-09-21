create table volleyball_member(
    id varchar2(30) primary key, -- 아이디
    name varchar2(50) not null, -- 이름
    email varchar2(50) not null, -- 이메일
    phone varchar2(50) not null, -- 연락처
    zip_code number(10) not null, -- 우편번호
    address varchar2(100) not null, -- 주소
    detailed_address varchar2(100), -- 상세주소
    password varchar2(50) not null -- 비밀번호
);

insert into volleyball_member values('admin', '관리자', 'admin@admin.com', '000-0000-0000', 00000, '관리자 주소', '관리자 상세주소', '1234');
insert into volleyball_member values('user1', '박병호', 'park@user.com', '010-1111-2222', 12345, '주소', '상세주소', '1234');
insert into volleyball_member values('user2', '김은연', 'kim@user.com', '010-1111-3333', 45678, '주소', '상세주소', '1234');
insert into volleyball_member values('user3', '강종학', 'kang@user.com', '010-1111-4444', 12535, '주소', '상세주소', '1234');


select * from volleyball_member;