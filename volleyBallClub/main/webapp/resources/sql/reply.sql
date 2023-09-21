CREATE TABLE volleyball_reply (
    idx number primary key, -- 댓글 번호
    b_idx number not null, -- 게시글 번호
    id varchar2(30) not null, -- 아이디
    title varchar2(100) not null, -- 제목
    content varchar2(3000) not null, -- 내용
    writer varchar2(20) not null, -- 작성자
    insert_time date default sysdate not null -- 등록일
);