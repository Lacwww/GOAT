alter table place add place_areaDetail varchar2(20);
alter table cs add del char(1) default 'n' not null;
delete from PLACE;
select * from place;
update place set place_areadetail = '제주시' where place_name = '제주오름승마랜드';
update place set place_areadetail = '제주시' where place_name = '종남마을';
update place set place_areadetail = '제주시' where place_name = '연미마을(오라리 방화사건 현장)';
update place set place_areadetail = '제주시' where place_name = '아홉굿마을 낙천리 농어촌체험마을';
update place set place_areadetail = '제주시' where place_name = '도령모루';