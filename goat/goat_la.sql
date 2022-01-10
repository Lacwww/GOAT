alter table place add place_areaDetail varchar2(20);
alter table cs add del char(1) default 'n' not null;
delete from PLACE;
select * from place;
update place set place_areadetail = '제주시' where place_name = '제주오름승마랜드';
update place set place_areadetail = '제주시' where place_name = '종남마을';
update place set place_areadetail = '제주시' where place_name = '연미마을(오라리 방화사건 현장)';
update place set place_areadetail = '제주시' where place_name = '아홉굿마을 낙천리 농어촌체험마을';
update place set place_areadetail = '제주시' where place_name = '도령모루';
/* 임시 플레이스 */
CREATE TABLE TEMPPLACE (
   TEMP_NUM NUMBER PRIMARY KEY, /* 임시 플레이스 번호 */
   TEMP_NAME VARCHAR2(100), /* 명칭 */
   TEMP_CATE VARCHAR2(20), /* 카테고리 */
   TEMP_ADDR VARCHAR2(200), /* 지번주소 */
   TEMP_ADDRD VARCHAR2(200), /* 도로면주소 */
   TEMP_PHOTO VARCHAR2(200), /* 사진 */
   LAT VARCHAR2(30), /* 위도 */
   LNG VARCHAR2(30), /* 경도 */
   REG_DATE DATE, /* 등록일자 */
    TEMP_CONTENT varchar2(2000), /* 장소내용 */
    TEMP_AREA varchar2(20), /* 지역 */
    TEMP_TAG varchar2(200), /* 장소 태그 */
    TEMP_AREADETAIL varchar2(20), /* 상세 지역 */
    TEMP_CRUD varchar2(20), /*요청 사항 종류 */
    PLACE_NUM NUMBER, /* 수정시 해당하는 장소 번호 */
    DEL CHAR DEFAULT 'n', /* 해당 요청 처리 유무 */
    M_NUM NUMBER NOT NULL, /* 건의한 사람의 번호 */
    CONSTRAINT FK_TEMPPLACE FOREIGN KEY(M_NUM)
    REFERENCES MEMBER(M_NUM)
);
alter table tempplace add temp_explanation varchar2(1000);