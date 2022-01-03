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