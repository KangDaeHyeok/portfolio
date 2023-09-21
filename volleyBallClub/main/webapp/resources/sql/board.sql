CREATE TABLE volleyball_board (
    idx number primary key, -- 글번호
    title varchar2(100) not null, -- 제목
    content varchar2(3000) not null, -- 내용
    id varchar2(30) not null, -- 아이디
    writer varchar2(20) not null, -- 작성자
    count number default 0 not null, -- 조회 수
    notice number(1) default 0 not null, -- 공지글 여부
    secret number(1) default 0 not null, -- 비밀글 여부
    secret_num varchar2(50) default 'null' not null, -- 비밀글일 경우 비밀번호
    insert_time date default sysdate not null -- 등록일
);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board),
'<건전한 게시판 사용을 위한 운영정책>', '공지사항', 'admin', '관리자', 0, 1, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board),
'게시판 이용 안내 : 홈페이지 회원 본인만 쓰기/읽기가 가능합니다.', '공지사항', 'admin', '관리자', 0, 1, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'선수단 빠른 업데이트 부탁드려요', '업데이트 부탁드립니다', 'user1', '박병호', 0, 0, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'10월 14일 청소년단체관람 문의 드립니다', '관람 문의 드립니다', 'user2', '김은연', 0, 0, 1, '12345', sysdate);
	
insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'티켓', '구입 문의 드립니다', 'user3', '강종학', 0, 0, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'구미 김천간 구단 셔틀버스 친절함 감사드려요', '셔틀버스 친절합니다', 'user4', '송윤서', 0, 0, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'박정아 5000득점', '너무 축하해요', 'user5', '서예성', 0, 0, 1, '1111', sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'2차 팬미팅 날짜', '언제인가요?', 'user1', '박병호', 0, 0, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'질문 드립니다', '굿즈 구입 기간은 언제인가요?', 'user3', '강종학', 0, 0, 1, '123', sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'멤버쉽 구매', '언제 판매하나요?', 'user2', '김은연', 0, 0, 1, '1234', sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'입장료(초등학생/미취학)', '얼마인가요?', 'user5', '서예성', 0, 0, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'클래퍼 판매 계획은 없나요?', '판다면 언제일까요?', 'user3', '강종학', 0, 0, 0, default, sysdate);

insert into volleyball_board values( (SELECT NVL(MAX(idx), 0) + 1 FROM volleyball_board), 
'멤버쉽', '얼마인가요?', 'user4', '송윤서', 0, 0, 1, '0000', sysdate);



select * from volleyball_board;
commit;