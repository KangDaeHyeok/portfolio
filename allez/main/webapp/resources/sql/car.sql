create table car(
    carModel varchar2(20),
    carname varchar2(100) primary key,
    price number,
    car_image varchar2(100)
);

--ev모델
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', '니로 EV', 51140000, 'niro-ev_s_swp.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', '니로 플러스', 46000000, 'niro-plus_s_m7g.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', 'EV 6', 51300000, 'ev6_s_glb.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', 'EV6 GT', 75840000, 'ev6-gt_s_klm.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', 'EV 9', 77280000, 'ev9_s_ism.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', '봉고 III EV', 43650000, 'bongo3-ev_s_ud.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', '봉고 III EV 탑차/윙바디', 61740000, 'bongo3-ev-frozen-s_s_ud.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('ev', '봉고 III EV 파워게이트', 47920000, 'bongo3-ev-power_s_ud.png');
commit;
--sedan모델
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', 'Avante', 24660000, 'pBlue.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', '모닝', 12900000, 'morning_s_a2g.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', '레이', 13400000, 'ray_s_m9y.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', 'K3 GT', 27840000, 'k3-gt_s_cr5.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', 'K5', 24180000, 'k5_s_agt.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', 'K8', 32840000, 'k8_s_klg.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('sedan', 'K9', 58150000, 'k9_s_d9b.png');
delete car where carname='avante';

--suv모델
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '셀토스', 20870000, 'seltos_s_swp.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '니로', 28560000, 'niro-hybrid_s_cge.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '스포티지', 25370000, 'sportage_s_swp.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '쏘렌토', 30240000, 'sorento_s_m4b.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '모하비', 50540000, 'mohave_s_abp.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '카니발', 31800000, 'carnival_s_d2u.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('suv', '카니발 하이리무진', 60960000, 'carnival-hilimousine_s_abp.png');

--truck모델
INSERT INTO car (carModel, carname, price, car_image) VALUES('truck', '봉고Ⅲ 트럭', 18150000, 'bongo3_s_ud.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('truck', '봉고Ⅲ 탑차/윙바디/워크스루밴', 25660000, 'bongo3-frozen-standard-king_s_ud.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('truck', '봉고Ⅲ 덤프', 25790000, 'bongo3-dump-1_s_ma.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('truck', '봉고Ⅲ 파워게이트', 22710000, 'bongo3-powergate_s_ud.png');
INSERT INTO car (carModel, carname, price, car_image) VALUES('truck', '봉고Ⅲ 와이드트럭/홈로리/활어수송차', 21220000, 'bongo3-premium-wide_s_ud.png');

commit;