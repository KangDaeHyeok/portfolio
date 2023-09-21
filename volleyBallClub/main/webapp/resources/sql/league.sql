create table volleyball_league(
    idx number primary key, -- 인덱스 번호
    team varchar2(20), -- 한국도로공사
    other varchar2(20), -- 다른 팀명
    team_img varchar2(50), -- 한국도로공사 이미지
    other_img varchar2(50), -- 다른 팀 이미지
    times varchar2(10), -- 경기 시간
    area varchar2(20), -- 경기 지역
    score varchar2(20), -- 결과
    round varchar2(30), -- 라운드
    dates varchar2(30) -- 경기 일정
);

drop table volleyball_league;

create sequence league_idx;

insert into volleyball_league values(league_idx.nextval, '한국도로공사', 'IBK기업은행', 'hpic01.png', '32emblem_altos_s.png', '19:00', '화성', '1:3 패', '6R', '03.03(금)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '흥국생명', 'hpic01.png', '32emblem_pinkspiders_s-1.png', '19:00', '김천 홈경기', '3:1 승', '6R', '03.07(화)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '현대건설', 'hpic01.png', '32emblem_hyundai_s.png', '19:00', '김천 홈경기', '3:2 승', '6R', '03.10(금)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '페퍼저축은행', 'hpic01.png', '32pplogo.png', '19:00', '광주', '3:0 승', '6R', '03.14(화)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', 'GS칼텍스', 'hpic01.png', '32emblem_kixx_s.png', '19:00', '서울', '3:0 승', '6R', '03.17(금)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '현대건설', 'hpic01.png', '32emblem_hyundai_s.png', '19:00', '수원', '3:1 승', 'V리그 플레이오프', '03.23(목)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '현대건설', 'hpic01.png', '32emblem_hyundai_s.png', '19:00', '김천 홈경기', '3:0 승', 'V리그 플레이오프', '03.25(토)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '흥국생명', 'hpic01.png', '32emblem_pinkspiders_s-1.png', '19:00', '인천', '1:3 패', 'V리그 챔피언결정전', '03.29(수)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '흥국생명', 'hpic01.png', '32emblem_pinkspiders_s-1.png', '19:00', '인천', '0:3 패', 'V리그 챔피언결정전', '03.31(금)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '흥국생명', 'hpic01.png', '32emblem_pinkspiders_s-1.png', '19:00', '김천 홈경기', '3:1 승', 'V리그 챔피언결정전', '04.02(일)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '흥국생명', 'hpic01.png', '32emblem_pinkspiders_s-1.png', '19:00', '김천 홈경기', '3:1 승', 'V리그 챔피언결정전', '04.04(화)');
insert into volleyball_league values(league_idx.nextval, '한국도로공사', '흥국생명', 'hpic01.png', '32emblem_pinkspiders_s-1.png', '19:00', '인천', '3:2 승', 'V리그 챔피언결정전', '04.06(목)');

select * from volleyball_league;