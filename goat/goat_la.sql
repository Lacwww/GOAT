alter table place add place_areaDetail varchar2(20);
alter table cs add del char(1) default 'n' not null;
delete from PLACE;