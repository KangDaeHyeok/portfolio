create table volleyball_player(
    idx number primary key, -- 인덱스 번호
    name varchar2(20), -- 이름
    position varchar2(50), -- 포지션
    back_num number(2), -- 등번호
    player_img varchar2(50) -- 선수 이미지
);

drop table volleyball_player;

select * from volleyball_player;
select * from volleyball_player where idx between 6 and 11;
select name, player_img from volleyball_player where back_num is not null order by back_num;

insert into volleyball_player (idx, name, position, player_img) values(0, '한국도로공사', '하이패스 배구단', '0.jpg');
insert into volleyball_player (idx, name, position, player_img) values(1, '김종민', '감독', '1.jpg');
insert into volleyball_player values(2, '캣벨', '아포짓', 1, '2.jpg');
insert into volleyball_player values(3, '안예림', '세터', 3, '3.jpg');
insert into volleyball_player values(4, '전세얀', '아웃사이더 히터', 4, '4.jpg');
insert into volleyball_player values(5, '이윤정', '세터', 6, '5.jpg');
insert into volleyball_player values(6, '이예림', '아웃사이더 히터', 7, '6.jpg');
insert into volleyball_player values(7, '임명옥', '리베로', 8, '7.jpg');
insert into volleyball_player values(8, '박정아', '아웃사이더 히터', 9, '8.jpg');
insert into volleyball_player values(9, '배유나', '미들블로커', 10, '9.jpg');
insert into volleyball_player values(10, '이예담', '아웃사이더 히터', 11, '10.jpg');
insert into volleyball_player values(11, '문정원', '아포짓', 12, '11.jpg');
insert into volleyball_player values(12, '정대영', '미들블로커', 13, '12.jpg');
insert into volleyball_player values(13, '임주은', '미들블로커', 14, '13.jpg');
insert into volleyball_player values(14, '차유정', '아웃사이더 히터', 15, '14.jpg');
insert into volleyball_player values(15, '이미소', '아웃사이더 히터', 16, '15.jpg');
insert into volleyball_player values(16, '우수민', '아웃사이더 히터', 17, '16.jpg');
insert into volleyball_player values(17, '김세인', '아웃사이더 히터', 18, '17.jpg');
insert into volleyball_player values(18, '백채림', '아웃사이더 히터', 19, '18.jpg');
insert into volleyball_player values(19, '공은서', '아웃사이더 히터', 20, '19.jpg');
insert into volleyball_player values(20, '이예은', '아웃사이더 히터', 21, '20.jpg');
insert into volleyball_player values(21, '정소율', '세터', 22, '21.jpg');
insert into volleyball_player (idx, name, position, player_img) values(22, '한국도로공사', '하이패스 배구단', '22.jpg');
insert into volleyball_player (idx, name, position, player_img) values(23, '한국도로공사', '하이패스 배구단', '23.jpg');