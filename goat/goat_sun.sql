-- 22년 01월 05일 --
alter table cs add del char(1) default 'n' not null;
insert into member values(3,'master','1234','관리자','master@naver.com','문지선','010-7291-1089',sysdate,'서울시','영등포구',sysdate,'abc.jpg','n','y');
----------------

-- 22년 01월 04일 --
insert into member values(1,'abc','1234','오늘도맑음','abc@naver.com','홍길동','010-1111-1234',sysdate,'서울시','영등포구',sysdate,'abc.jpg','n','n');

alter table place add place_tag varchar2(200);

alter table cs rename column num to cs_num;

select * from cs;
delete from member where m_num='1';
delete from cs where cs_num='10';

alter table member modify(m_tel varchar2(40));
alter table member modify(m_pass varchar2(1000));
-----------------

--22년 01월 03일--
/* 지역 테이블 */    
create table Area(
    place_area varchar2(20) primary key,
    area_photo varchar2(20),
    description varchar2(2000)
    );

ALTER TABLE PLACE
   ADD 
      CONSTRAINT FK_PLACE_AREA_TO_PLACE
      FOREIGN KEY (
         PLACE_AREA
      )
      REFERENCES AREA (
         PLACE_AREA
      );
--------------
select * from cs;
alter table place add place_area varchar2(20);