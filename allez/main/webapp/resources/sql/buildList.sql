create table buildList(
    id varchar2(30), -- ID
    carname varchar2(100), -- 차이름
    engine varchar2(20), -- 엔진
    trim varchar2(20), -- 트림
    transmission varchar2(20), -- 미션
    carPrice number, -- 차 값
    inColor varchar2(30), -- 내장 컬러
    inColorImgFile varchar2(1000), -- 내장 컬러 파일주소
    outColor varchar2(30), -- 외장 컬러
    outColorImgFile  varchar2(1000), -- 외장 컬러 파일주소
    carImgFile varchar2(100), -- 차 이미지 파일
    region varchar2(100), -- 도시 선택
    warehouse varchar2(100), -- 출고장
    optionName varchar2(1000), -- 옵션이름
    optionPrice varchar2(1000), -- 옵션 값
    consignment varchar2(100), -- 탁송의뢰, 본인탁송
    cashWay varchar2(100), -- 현금, 할부
    prepayment varchar2(100), -- 선수금
    installmentPrincipal varchar2(100), -- 할부원금
    monthPeriod varchar2(100), -- 할부기간
    payInstallments varchar2(100), -- 분할 납부금
    logtime varchar2(30), -- 저장한 날짜.
    listNum number unique not null -- 등록 순서 번호
);
--시퀀스 생성
create sequence listNum nocycle nocache;
--시퀀스 삭제
drop sequence listNum;