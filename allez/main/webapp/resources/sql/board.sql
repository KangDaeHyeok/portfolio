create table allez_board(
	num number primary key, -- 글번호
	subject varchar2(100) not null, -- 글제목
	content varchar2(1000) not null, -- 글내용
	regist_day date default sysdate, -- 작성일
    hit number default 0, -- 조회수
    reF number default 0, -- 계층형게시판, 글의 그룹
    reStep number default 0, -- 계층형게시판, 글의 순서
    reLevel number default 0, -- 계층형게시판, 글의 레벨
    id varchar2(20)
);

create sequence allez_board_seq start with 1 increment by 1 minvalue -1;

insert into allez_board values(allez_board_seq.nextval, '문의합니다', '시승 예약은 누구나 할 수 있나요?', sysdate, default, 1, 0, 0, 'user');
insert into allez_board values(allez_board_seq.nextval, '문의합니다에 대한 답변입니다', '회원이라면 누구나 가능합니다', sysdate, default, 1, 1, 1, 'admin');


select * from allez_board;

drop table allez_board;
