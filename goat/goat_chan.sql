/* 회원 */
CREATE TABLE MEMBER (
	M_NUM NUMBER NOT NULL, /* 회원번호 */
	M_ID VARCHAR2(20), /* 아이디 */
	M_PASS VARCHAR2(20), /* 비밀번호 */
	M_NICK VARCHAR2(40), /* 닉네임 */
	M_EMAIL VARCHAR2(40), /* 이메일 */
	M_NAME VARCHAR2(20), /* 이름 */
	M_TEL NUMBER, /* 전화번호 */
	M_BIRTH DATE, /* 생년월일 */
	M_ADDR VARCHAR(200), /* 주소 */
	M_ADDRD VARCHAR2(200), /* 상세주소 */
	REG_DATE DATE, /* 가입일 */
	M_PHOTO VARCHAR2(50), /* 사진 */
	DEL CHAR DEFAULT 'n', /* 회원삭제 */
	ADMIN CHAR /* 관리자 */
);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			M_NUM
		);
alter table member modify(m_tel varchar2(40));
alter table member modify(m_pass varchar2(1000));
select * from member;
delete from member where m_num=6;

update member set m_id='admin', m_nick='admin', m_name='admin', m_addr='admin', m_addrd='admin', admin='y' where m_num=3;

/* 알림 */
CREATE TABLE ALERT (
	ALE_NUM NUMBER PRIMARY KEY,  /* 알림번호 */
	M_NUM NUMBER NOT NULL, /* 회원번호 */
	SCH_NUM NUMBER, /* 스케줄 번호 */
	SCH_NAME VARCHAR2(200), /* 스케줄명 */
	S_DATE DATE, /* 여행 시작일자 */
	TEMP_NUM NUMBER, /* 임시 플레이스 번호 */
	TEMP_NAME VARCHAR2(100), /* 명칭 */
    TEMP_CRUD varchar2(20), /*요청 사항 종류 */
    DEL CHAR DEFAULT 'n', /* 해당 요청 처리 유무 */
	CS_NUM NUMBER, /* 글번호 */
	CS_TITLE VARCHAR2(100) /* 제목 */
);
select * from alert;
alter table alert add t_num number;
alter table alert add t_title varchar2(100);
alter table alert add place_num number;
alter table alert add t_like number;
alter table alert add t_reply number;
delete from alert;

/* 여행 게시판 */
CREATE TABLE TRIP (
	T_NUM NUMBER NOT NULL, /* 글번호 */
	T_TITLE VARCHAR2(100), /* 제목 */
	T_CONTENT VARCHAR2(3000), /* 내용 */
	REG_DATE DATE, /* 작성일 */
	T_VIEW NUMBER, /* 조회수 */
	T_PHOTO VARCHAR2(50), /* 사진 */
	DEL CHAR DEFAULT 'n', /* 여행글 삭제 */
	M_NUM NUMBER /* 회원번호 */
);
ALTER TABLE TRIP
	ADD
		CONSTRAINT PK_TRIP
		PRIMARY KEY (
			T_NUM
		);
ALTER TABLE TRIP
	ADD
		CONSTRAINT FK_MEMBER_TO_TRIP
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

alter table trip drop column t_photo;
drop table tirp_photo;

/* 여행 게시판 댓글 */
CREATE TABLE TRIP_REPLY (
	TRE_NUM NUMBER NOT NULL, /* 댓글 번호 */
	TRE_CONTENT VARCHAR2(1000), /* 댓글 내용 */
	REG_DATE DATE, /* 작성일 */
	DEL CHAR DEFAULT 'n', /* 댓글삭제 */
	TRE_REF NUMBER, /* 참조번호 */
	TRE_RE_STEP NUMBER, /* 답글순서 */
	TRE_RE_LEVEL NUMBER, /* 들여쓰기 레벨 */
	T_NUM NUMBER, /* 글번호 */
	M_NUM NUMBER /* 회원번호 */
);
ALTER TABLE TRIP_REPLY
	ADD
		CONSTRAINT PK_TRIP_REPLY
		PRIMARY KEY (
			TRE_NUM
		);

ALTER TABLE TRIP_REPLY
	ADD
		CONSTRAINT FK_TRIP_TO_TRIP_REPLY
		FOREIGN KEY (
			T_NUM
		)
		REFERENCES TRIP (
			T_NUM
		);

ALTER TABLE TRIP_REPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_TRIP_REPLY
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

/* 여행 게시판 사진 */
CREATE TABLE TIRP_PHOTO (
	TP_NUM NUMBER NOT NULL, /* 번호 */
	FILENAME VARCHAR2(200), /* 파일명 */
	T_NUM NUMBER /* 글번호 */
);
ALTER TABLE TIRP_PHOTO
	ADD
		CONSTRAINT PK_TIRP_PHOTO
		PRIMARY KEY (
			TP_NUM
		);

ALTER TABLE TIRP_PHOTO
	ADD
		CONSTRAINT FK_TRIP_TO_TIRP_PHOTO
		FOREIGN KEY (
			T_NUM
		)
		REFERENCES TRIP (
			T_NUM
		);

/* 공지사항 */
CREATE TABLE NOTICE (
	NO_NUM NUMBER NOT NULL, /* 글번호 */
	NO_TITLE VARCHAR2(100), /* 제목 */
	NO_CONTENT VARCHAR2(2000), /* 내용 */
	REG_DATE DATE, /* 작성일 */
	NO_VIEW NUMBER, /* 조회수 */
	DEL CHAR DEFAULT 'n', /* 공지사항 삭제 */
	M_NUM NUMBER /* 회원번호 */
);
ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			NO_NUM
		);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_MEMBER_TO_NOTICE
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

/* 공지사항 댓글 */
CREATE TABLE NOTICE_REPLY (
	NOR_NUM NUMBER NOT NULL, /* 댓글 번호 */
	NOR_CONTENT VARCHAR2(1000), /* 댓글내용 */
	REG_DATE DATE, /* 작성일 */
	DEL CHAR DEFAULT 'n', /* 댓글 삭제 */
	NOR_REF NUMBER, /* 참조번호 */
	NOR_RE_STEP NUMBER, /* 댓글순서 */
	NOR_RE_LEVEL NUMBER, /* 들여쓰기 레벨 */
	M_NUM NUMBER, /* 회원번호 */
	NO_NUM NUMBER /* 글번호 */
);
ALTER TABLE NOTICE_REPLY
	ADD
		CONSTRAINT PK_NOTICE_REPLY
		PRIMARY KEY (
			NOR_NUM
		);

ALTER TABLE NOTICE_REPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_NOTICE_REPLY
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

ALTER TABLE NOTICE_REPLY
	ADD
		CONSTRAINT FK_NOTICE_TO_NOTICE_REPLY
		FOREIGN KEY (
			NO_NUM
		)
		REFERENCES NOTICE (
			NO_NUM
		);
/* 스케줄 내역 */
CREATE TABLE SCHEDULE (
	SCH_NUM NUMBER NOT NULL, /* 스케줄 번호 */
	SCH_NAME VARCHAR2(200), /* 스케줄명 */
	S_DATE DATE, /* 여행 시작일자 */
	E_DATE DATE, /* 여행 종료일자 */
	M_NUM NUMBER /* 회원번호 */
);
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT PK_SCHEDULE
		PRIMARY KEY (
			SCH_NUM
		);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_MEMBER_TO_SCHEDULE
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

/* 스케줄 상세내역 */
CREATE TABLE SCHEDULE_DETAIL (
	SCHD_NUM NUMBER NOT NULL, /* 스케줄 상세번호 */
	DAY DATE, /* 일자별 분류 */
	VEHICLE VARCHAR2(20), /* 이동수단 */
	SCH_NUM NUMBER, /* 스케줄 번호 */
	PLACE_NUM NUMBER /* 플레이스 번호 */
);
ALTER TABLE SCHEDULE_DETAIL
	ADD
		CONSTRAINT SCHEDULE_DETAIL
		PRIMARY KEY (
			SCHD_NUM
		);

ALTER TABLE SCHEDULE_DETAIL
	ADD
		CONSTRAINT FK_SCHEDULE_TO_SCHEDULE_DETAIL
		FOREIGN KEY (
			SCH_NUM
		)
		REFERENCES SCHEDULE (
			SCH_NUM
		);

ALTER TABLE SCHEDULE_DETAIL
	ADD
		CONSTRAINT FK_PLACE_TO_SCHEDULE_DETAIL
		FOREIGN KEY (
			PLACE_NUM
		)
		REFERENCES PLACE (
			PLACE_NUM
		);

alter table schedule_detail modify(day number);

/* 좋아요 */
CREATE TABLE TRIP_LIKE (
	LIKE_NUM NUMBER NOT NULL, /* 번호 */
	M_NUM NUMBER, /* 회원번호 */
	T_NUM NUMBER /* 글번호 */
);
ALTER TABLE TRIP_LIKE
	ADD
		CONSTRAINT PK_TRIP_LIKE
		PRIMARY KEY (
			LIKE_NUM
		);

ALTER TABLE TRIP_LIKE
	ADD
		CONSTRAINT FK_MEMBER_TO_TRIP_LIKE
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

ALTER TABLE TRIP_LIKE
	ADD
		CONSTRAINT FK_TRIP_TO_TRIP_LIKE
		FOREIGN KEY (
			T_NUM
		)
		REFERENCES TRIP (
			T_NUM
		);

/* 고객문의 */
CREATE TABLE CS (
	NUM NUMBER NOT NULL, /* 글번호 */
	CS_TITLE VARCHAR2(100), /* 제목 */
	REG_DATE DATE, /* 작성일 */
	CS_CONTENT VARCHAR2(2000), /* 내용 */
	CS_VIEW NUMBER, /* 조회수 */
	CS_REF NUMBER, /* 참조번호 */
	CS_RE_STEP NUMBER, /* 답글순서 */
	CS_RE_LEVEL NUMBER, /* 들여쓰기 레벨 */
	M_NUM NUMBER /* 회원번호 */
);
ALTER TABLE CS
	ADD
		CONSTRAINT PK_CS
		PRIMARY KEY (
			NUM
		);

ALTER TABLE CS
	ADD
		CONSTRAINT FK_MEMBER_TO_CS
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);
alter table cs rename column num to cs_num;
alter table cs add del char(1) default 'n' not null;
alter table cs add con char(1) default 'n' not null;

update cs set con='n' where cs_num=1;
select * from cs;
delete from cs where cs_num=3;
delete from cs;

/* 플레이스 */
CREATE TABLE PLACE (
	PLACE_NUM NUMBER NOT NULL, /* 플레이스 번호 */
	PLACE_NAME VARCHAR2(100), /* 명칭 */
	PLACE_CATE VARCHAR2(20), /* 카테고리 */
	PLACE_ADDR VARCHAR2(200), /* 주소 */
	PLACE_ADDRD VARCHAR2(200), /* 상세주소 */
	PLACE_PHOTO VARCHAR2(200), /* 사진 */
	LAT VARCHAR2(30), /* 위도 */
	LNG VARCHAR2(30), /* 경도 */
	REG_DATE DATE /* 등록일자 */
);
ALTER TABLE PLACE
	ADD
		CONSTRAINT PK_PLACE
		PRIMARY KEY (
			PLACE_NUM
		);
        
alter table place add place_content varchar2(2000); 
alter table place add place_area varchar2(20); 

ALTER TABLE PLACE
   ADD 
      CONSTRAINT FK_PLACE_AREA_TO_PLACE
      FOREIGN KEY (
         PLACE_AREA
      )
      REFERENCES AREA (
         PLACE_AREA
      );
alter table place add place_tag varchar2(200);

alter table place add place_areaDetail varchar2(20);

update place set place_areadetail = '제주시' where place_name = '제주오름승마랜드';
update place set place_areadetail = '제주시' where place_name = '종남마을';
update place set place_areadetail = '제주시' where place_name = '연미마을(오라리 방화사건 현장)';
update place set place_areadetail = '제주시' where place_name = '아홉굿마을 낙천리 농어촌체험마을';
update place set place_areadetail = '제주시' where place_name = '도령모루';

/* 플레이스 후기 */
CREATE TABLE PLACE_REVIEW (
	PREV_NUM NUMBER NOT NULL, /* 후기 번호 */
	PREV_TITLE VARCHAR2(100), /* 제목 */
	SCORE NUMBER, /* 평점 */
	PREV_CONTENT VARCHAR2(2000), /* 내용 */
	DEL CHAR DEFAULT 'n', /* 후기 삭제 */
	REG_DATE DATE, /* 작성일 */
	M_NUM NUMBER, /* 회원번호 */
	PLACE_NUM NUMBER /* 플레이스 번호 */
);
ALTER TABLE PLACE_REVIEW
	ADD
		CONSTRAINT PK_PLACE_REVIEW
		PRIMARY KEY (
			PREV_NUM
		);

ALTER TABLE PLACE_REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_PLACE_REVIEW
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

ALTER TABLE PLACE_REVIEW
	ADD
		CONSTRAINT FK_PLACE_TO_PLACE_REVIEW
		FOREIGN KEY (
			PLACE_NUM
		)
		REFERENCES PLACE (
			PLACE_NUM
		);

/* 플레이스 즐찾 */
CREATE TABLE BOOKMARK (
	BOOK_NUM NUMBER NOT NULL, /* 즐겨찾기 번호 */
	M_NUM NUMBER, /* 회원번호 */
	PLACE_NUM NUMBER /* 플레이스 번호 */
);
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT PK_BOOKMARK
		PRIMARY KEY (
			BOOK_NUM
		);

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_MEMBER_TO_BOOKMARK
		FOREIGN KEY (
			M_NUM
		)
		REFERENCES MEMBER (
			M_NUM
		);

ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_PLACE_TO_BOOKMARK
		FOREIGN KEY (
			PLACE_NUM
		)
		REFERENCES PLACE (
			PLACE_NUM
		);

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

/* 지역 테이블 */    
create table Area(
    place_area varchar2(20) primary key,
    area_photo varchar2(20),
    description varchar2(2000)
    );
alter table area modify(description varchar2(3000));

insert into area values('서울특별시','서울.jpg','과거와 현재가 공존하며 하루가 다르게 변하는 서울을 여행하는 일은 매일이 새롭다. 
    도시 한복판에서 600년의 역사를 그대로 안고 있는 아름다운 고궁들과 더불어 대한민국의 트렌드를 이끌어나가는 예술과 
    문화의 크고 작은 동네들을 둘러볼 수 있는
    서울은 도시 여행에 최적화된 장소다.');
insert into area values('제주도','제주도.jpg','섬 전체가 하나의 거대한 관광자원인 제주도. 에메랄드빛 물빛이 인상적인 협재 해수욕장은 
    제주 대표 여행지며, 파도가 넘보는 주상절리와 바다 위 산책로인 용머리 해안은 제주에서만 볼 수 있는 천혜의 자연경관으로 손꼽힌다.');
insert into area values('부산광역시','부산.jpg','우리나라 제2의 수도 부산광역시. 부산 대표 관광지로 손꼽히는 해운대는 밤에는 마린시티의
    야경이 더해져 더욱 화려한 해변이 된다. 감천문화마을은 사진 찍기에 좋으며, 매해 가을마다 개최되는 아시아 최대 규모의 영화제인 부산국제영화제와
    함께 부산의 구석구석을 즐겨보는 것도 좋다. 전통시장 투어가 있을 만큼 먹거리가 가득한 부산의 맛기행은 필수!');
insert into area values('강원도','강원도.jpg','빼어난 자연경관으로 유명한 강원도. 래프팅, 패러글라이딩, 라이딩, 스키 등 계절마다 자연을 누리며 
    각종 레저스포츠를 즐길 수 있다. 그뿐만 아니라, 연말연시가 되면 가장 먼저 떠오르는 정동진은 해돋이 명소로 손꼽히며, 배를 타고 들어가야 하는 남이섬
    곳곳에는 운치 있는 메타세콰이어길이 있어 데이트 코스로도 유명하다. 호수를 둘러싼 자전거 길을 따라 느긋하게 춘천을 둘러보는 여행도 추천한다.');
insert into area values('경기도','경기도.jpg','문화· 예술· 레저 등 모든 걸 아우르는 경기도. 서울 근교에 위치해 접근성이 좋고 다양한 
    문화생활을 즐길 수 있어서 주말을 이용한 나들이가 가능하다. 아울렛이 위치한 파주와 여주는 문화 복합 도시로 풍부한 볼거리를 제공하고 있다. 
    양평이나 가평은 자연과 함께 여유로운 하루를 만끽하고 싶은 이들에게 제격이다.');
insert into area values('대구광역시','대구.jpg','우리나라에서 가장 더운 지역 대구. 하지만 매년 여름 열리는 치맥 페스티벌과 함께라면 더위도 문제없다. 
    놀이동산 이월드는 가족과 함께 나들이하기에 좋으며, 두류공원도 산책코스로 제격! 음악 분수쇼로 유명한 수성못과 독특한 외관이 인상적인 전시공간 
    디아크는 대구의 야경 명소로 손꼽힌다. 우리나라 3대 시장인 서문시장 야시장도 대구의 대표 핫플레이스!');
insert into area values('인천광역시','인천.jpg','살짝 비릿한 바다향이 매력적인 인천광역시. 지리적 특징을 잘 이용하여 내륙과 해안 지역의 관광이 
    두루 발달한 곳이다. 대표적인 해양관광지로는 을왕리 해수욕장을 비롯해 문화의 거리가 갖춰진 월미도 등이 있으며, 한국 속 작은 중국이라 불리는 
    차이나타운도 인천 여행지로 손꼽힌다. 이 외에도 인천 각처에 오랜 역사 유물들이 산재해 있어 역사를 테마로 여행 코스를 잡아보는 것도 좋다.');
insert into area values('광주광역시','광주.jpg','문화예술의 중심지라 불리는 광주광역시. 예향의 본고장답게 맛과 멋이 조화를 이루며 남도의 
    문화를 이끌어 왔다고 해도 과언이 아니다. 광주의 대표 축제인 광주비엔날레를 중심으로 광주김치대축제, 광주국제영화제 등 5대 축제를 즐길 수 있을 뿐
    아니라 문화예술시장으로 재탄생한 대인시장의 야시장에서는 밤여행의 묘미를 즐길 수 있다.');
insert into area values('대전광역시','대전.jpg','다양한 테마 여행이 가능한 대전광역시. 맨발로 걸을 수 있는 계족산 황톳길은 온몸으로 자연을 느끼는
    여행을 할 수 있으며, 대전 근현대 전시관과 남간정사 등 대전에 있는 역사 문화 공간을 코스로 잡아도 좋다. 아이들이 좋아하는 동물원이 있는 오월드와 
    가볍게 산책하기 좋은 유림공원도 있어 주말 가족 나들이 코스로도 손색이 없다.');
insert into area values('울산광역시','울산.jpg','울산시는 2017년을 울산 방문의 해로 지정하고 더욱 풍성한 볼거리를 준비했다. 
    5월 태화강 봄꽃 대향연을 시작으로 국내 유일의 고래축제 등 다양한 축제가 기다리고 있다. 일출이 가장 빨리 시작되는 간절곶과 해안을 따라 산책하기 좋은
    대왕암 공원은 울산의 대표 명소다. 아름다운 생태공원으로 재탄생한 태화강을 따라 대나무가 시원하게 뻗어있는 십리대숲길을 산책할 수 있으며,
    태화강대공원을 좀 더 제대로 감상하고 싶다면 태화강 전망대를 이용하면 된다.');
insert into area values('세종시','세종.jpg','주말 여행지로 좋은 세종특별자치시. 금강수목원은 다양한 식물을 보유하고 있어 아이들을 위한
    교육장으로도 좋으며, 딸기 체험이 가능한 농장도 있어 주말 가족 나들이 장소로 제격이다. 세종 호수공원은 여유로운 산책을 즐길 수 있어 데이트 코스로 좋다.');
insert into area values('충청북도','충청북도.jpg','자연을 만끽할 수 있는 충청북도. 충북 대표 여행지 단양은 드라이브 코스로 좋은 충주호에서
    하늘을 나는 패러글라이딩이 인기이며, 도담삼봉은 해 질 녘 풍경이 아름답다. 가장 오래된 저수지 의림지가 있는 제천은 출사지로 알려졌으며,
    전국 최고의 둘레길이 있는 괴산군의 산막이 옛길을 걸어보는 것도 추천한다.');
insert into area values('충청남도','충청남도.jpg','백제의 발자취를 고스란히 안고 있는 충청남도. 백제의 수도였던 공주와 부여가 위치해 있어 
    역사적인 사찰과 문화재를 곳곳에서 만날 수 있다. 또한 당진 왜목마을에서는 서해의 일출을 볼 수 있고, 보령에서는 세계 각지에서 온 여행객들과 온몸에
    진흙을 묻히며 마음껏 놀 수 있는 머드축제를 즐기는 색다른 경험을 할 수 있다.');
insert into area values('전라북도','전라북도.jpg','한국 문화의 원형이 가장 잘 보존되어 있는 전라북도. 도심 중심에 한옥마을을 품고 있는 전주는
    전라북도의 대표 관광지이다. 전주의 전통음식 비빔밥을 맛보는 건 필수 이며, 한복 체험과 함께 한옥 마을을 걸어보는 것도 하나의 재미! 
    춘향과 몽룡의 사랑이 시작된 광한루가 있는 남원과 일제 시대의 근대 건축 기행이 가능한 군산과 익산을 함께 여행해보는 것도 좋다.');
insert into area values('전라남도','전라남도.jpg','기개 높은 대나무숲을 가진 담양, 보푸른 녹차밭의 보성, 
    이름만으로도 좋은 여수 밤바다까지 각 지역의 전통과 고유색이 잘 살아있는 전라남도. 순천만의 지평선 끝까지 황금빛으로 물든 갈대밭을 구경하고 싶다면
    11월 초에 열리는 순천만갈대축제를 방문해보는 것을 추천한다. 해상관광부터 산악관광까지 두루 갖춘 전라남도에서 색다른 자연의 매력에 흠뻑 빠져보길 바란다.');
insert into area values('경상북도','경상북도.jpg','민족문화 창달의 대표 경상북도. 신라 천년 고도의 숨결을 간직한 경주를 시작으로
    유네스코 세계문화유산에 등재된 안동 하회마을까지. 우리나라의 오랜 전통과 역사의 때가 묻은 지역을 방문하고 싶다면 경상북도만한 곳도 없다. 
    기상이변으로 방문 자체가 쉽지 않은 울릉도와 독도에도 천혜 절경의 우리땅을 밟아볼 수 있는 기회가 기다리고 있다.');
insert into area values('경상남도','경상남도.jpg','산악과 해상관광을 함께 누릴 수 있는 경상남도. 통영과 남해를 중심으로 위치한 
    해상공원은 섬과 바다의 두 가지의 매력을 모두 느낄 수 있어 경상남도 대표 여행지로 손꼽힌다. 봄에는 하얀 눈꽃이 흩날리는 하동벚꽃축제와 
    순매원 매화축제가, 겨울에는 거제도를 빨갛게 물들이는 동백축제가 열린다. 이외에도 온천여행과 도자기 체험, 딸기 체험 등 다양한 경험이 가능하다.');


-- 음식점
insert into place values(99999,'모해 통갈치 화덕구이','음식점','제주 서귀포시 성산읍 성산리 150 모해통갈치화덕구이',
			'제주 서귀포시 성산읍 일출로 267 모해통갈치화덕구이',
			'/goat/resources/p_images/ahgoxhdrkfcl.png',
			'33.461767827230965','126.93373197061504',sysdate,
			'성산일출봉맛집 제주본점 모해(모퉁이를 비추는 해)는 통갈치/흑돼지 화덕구이전문점 입니다.
			국내최초로 제주최고의 성산포은갈치와 제주흑돼지를 고온의 화덕에 통채로 구워내어 기존의 통갈치구이,통갈치조림, 
			흑돼지와차원이 다른맛을 선사합니다.
			성산일출봉으로 진입하는 일방통행길 중간에 위치하고 있으며,
			일방통행길로 올라오시다보면 좌측 단독건물로 모해 통갈치화덕구이본점이 있습니다.
			(제주 서귀포시 성산읍 일출로 267 (구주소: 성산리 150) 전화번호 : 064-784-2024 ) 입니다^^*',
			'제주도','편의, 단체석, 주차, 포장, 무선 인터넷, 반려동물 동반, 남/녀 화장실 구분, 장애인 편의시설','서귀포시');


insert into place values(99998,'올래국수','음식점','제주특별자치도 제주시 연동 301-19','제주특별자치도 제주시 귀아랑길 24',
			'/goat/resources/p_images/dhffornrtn.png',
			'33.491524135760706','126.4972725711568',sysdate,
			'주차는 근처 마리나호텔,웨딩홀 주차장 영업시 15시까지 주문
			신제주 로터리 제주은행 뒤편길',
			'제주도','주차, 무선 인터넷, 지역화폐(카드형), 국민지원금','제주시');

insert into place values(99997,'천돈가 중문본점','음식점','제주 서귀포시 색달동 2353-1','제주 서귀포시 일주서로 873',
			'/goat/resources/p_images/cjsehsrk.png',
			'33.258028623027975','126.41741541986953',sysdate,
			'제주 현지인들도 인정한 로컬 맛집
			코로나 방역지침 준수, 매장 방문시 마스크 착용, 명부작성, 	손세정, 단체환영 (100인석완비), 드시고 남은 고기 포장가능
			,쾌적하고 깔끔한 매장, 환기시설!굿!도민이 인정한 로컬 맛집, 넓은 주차장 (가게 옆 뒤)
			천돈가 제주흑돼지근고기 전문점',
			'제주도','단체석, 주차, 포장, 배달, 예약, 무선 인터넷, 반려동물 동반, 남/녀 화장실 구분, 지역화폐(카드형), 지역화폐(모바일형), 국민지원금','서귀포시');

insert into place values(99996,'우진해장국','음식점','제주 제주시 삼도2동 831','제주 제주시 서사로 11',
			'/goat/resources/p_images/dnwlsgowkdrnr.png','33.51151239913488','126.52000399583704',sysdate,
			'제주산 고사리를 갈아 넣고 푹 끓여 갈색 빛깔이 나는 제주식 해장국을 만날 수 있는 한식당입니다. 
			제주 육개장을 주문하면 뚝배기에 해장국을 담고 파와 고춧가루를 얹어 내는데요, 
			찬으로는 오징어젓갈과 부추무침, 깍두기 등의 밑반찬이 곁들여집니다.','제주도',
			'안심식당, 고사리해장국, 젓갈, 몸국, 향토음식','제주시');

insert into place values(99995,'돈사돈','음식점','제주 제주시 노형동 3086-3','제주 제주시 우평로 19',
			'/goat/resources/p_images/ehstkehs.png','33.47887068901249','126.46402008955637',sysdate,
			'저희 돈사돈은 제주도 제주시 노형동에 위치하고 있습니다. 돈사돈의 근고기는 일반 음식점에서 느낄 수 없는 깊은 맛과 멜젓의 조화를 이루고있으며 
			외지나 해외에서도 많이 찾아 오시는 분들께 맛있는 근고기를 제대로 대접해 드리기 위해 노력하고 있습니다.
 			돈사돈 근고기의 참맛을 느껴보세요. 최고의 맛으로 모시겠습니다. 감사합니다.','제주도',
			'주차, 무선 인터넷, 남/녀 화장실 구분, 국민지원금','제주시');

insert into place values(99994,'연돈','음식점','제주특별자치 서귀포시 색달동 2156-2','제주특별자치 서귀포시 일주서로 968-10',
			'/goat/resources/p_images/dusehs.png','33.258888539483394','126.40716087484735',sysdate,
			'백종원의 골목식당 100회 방영','제주도',
			'백종원의골목식당, 돈가스, 치즈돈가스','서귀포시');

insert into place values(99993,'순옥이네명가','음식점','제주 제주시 도두일동 2615-5','제주 제주시 도공로 8',
			'/goat/resources/p_images/tnsdhrdlsp.png','33.5055033478502','126.46499138305644',sysdate,
			'제주 여름밤의 명소로 잘 알려진 도두동에 전복요리집입니다. 
			물질만 벌써 40여년. 직접 따온 전복,성게,오분작 등의 신선하고 믿을 수 있는 
			자연산으로 요리한 이 곳 순옥이네 명가에 오시면 이름을 걸고 대접하는 만큼 정성을 다한 
			요리를 맛보실 수 있습니다. 언제오셔도 변함없는 맛과 넉넉한 인심으로 즐거운 시간을 
			가지실 수 있으며 바로 옆 순옥이네 해산물에서는 싱싱함이 넘쳐흐르는 제주 자연산 해물을 
			저렴한 가격에 구입하실 수도 있습니다. 항상 밝은 모습으로 오시는 모든 분들께 좋은 음식과 
			기분좋은 만남을 전해드리고자 노력하고 있는 이 곳 순옥이네에서 제주 바다의 깊은 맛을 
			맛보시길 바랍니다. 감사합니다.','제주도',
			'주차, 예약, 국민지원금','제주시');

insert into place values(99992,'네거리식당','음식점','제주 서귀포시 서귀동 320-9','제주 서귀포시 서문로29번길 20',
			'/goat/resources/p_images/sprjfltlrekd.png','33.2484893525197','126.55929634337123',sysdate,
			'성게미역국, 갈치국 등 싱싱한 재료를 이용한 제주음식을 만날 수 있는 곳입니다.','제주도',
			'국민지원금','서귀포시');

insert into place values(99991,'델문도','음식점','제주 제주시 조천읍 함덕리 1008-1','제주 제주시 조천읍 조함해안로 519-10',
			'/goat/resources/p_images/epfanseh.png','33.543697167337825','126.6687250805034',sysdate,
			'제주도 함덕의 로스터리 카페 델문도입니다. 함덕서우봉해변의 에메랄드빛 바다를 품고 있어, 
			맛있는 음료와 함께 아름다운 풍경도 감상하실 수 있습니다. 
			1박2일 제주도편 촬영지로도 유명하며^-^ , 현재 WBC(World Barista Championship)의 
			대표 에스프레소 머신인, 빅토리아 아르두이노 VA388 Black Eagle로 맛있는 커피를 
			제공하고 있습니다. (특히 델문도에서 보유하고 있는 SEATTLE 버전은 세계 60여대 
			밖에 없는 리미티드 에디션입니다!!)','제주도',
			'주차, 국민지원금','제주시');

insert into place values(99990,'해녀촌','음식점','제주 제주시 구좌읍 동복리 1502-1','제주 제주시 구좌읍 동복로 33',
			'/goat/resources/p_images/gosuchs.png','33.55365935631572','126.70988364588077',sysdate,
			'탱글탱글 신선한 회를 매콤하게 무쳐 국수와 함께 내는 회국수는 동복리 해녀촌의 인기메뉴입니다. 
			일반 국수와 다를바 없어보이지만 커다란 접시에 한 가득 나오는 회와 굵은 면발은 가격도 저렴할뿐 
			아니라 양도 푸짐하여 인기랍니다. 동복리 해녀회에서 운영하기 때문에 언제나 싱싱한 
			횟감으로 국수을 말아 계절에 따라 다른 회국수를 맛볼 수 있지요. 
			성게알이 잔뜩 들어간 성게국수도 별미라고 하네요.','제주도',
			'단체석, 회국수, 성게국수','제주시');

insert into place values(99989,'놀맨','음식점','제주 제주시 애월읍 애월리 2530','제주 제주시 애월읍 애월로1길 24',
			'/goat/resources/p_images/shfaos.png','33.46246322607721','126.31022672063645',sysdate,
			'빈티지한 분위기, 이국적인 분위기, 해변이는 보이는 해물라면 가게, 해안산책로가 가깝다.','제주도',
			'문어라면','제주시');

insert into place values(99988,'협재수우동(협재점)','음식점','제주 제주시 한림읍 협재리 1706-1','제주 제주시 한림읍 협재1길 11',
			'/goat/resources/p_images/guqwotndnehd.png','33.39661481891554','126.24244036709065',sysdate,
			'정통 일식우동, 돈가스, 튀김','제주도',
			'주차, 무선 인터넷, 남/녀 화장실 구분, 지역화폐(카드형)','제주시');

insert into place values(99987,'카페 노티드 제주','음식점','제주 제주시 애월읍 애월리 2527-3','제주 제주시 애월읍 애월로1길 24-9',
			'/goat/resources/p_images/shxlemwpwn.png','33.46326286136663','126.30972826356987',sysdate,
			'안녕하세요 카페 노티드 제주 애월입니다. 고객님들께 더 좋은 서비스를 제공하기 위하여 항상 노력하겠습니다.','제주도',
			'카페','제주시');

insert into place values(99986,'명진전복','음식점','제주 제주시 구좌읍 평대리 515-28','제주 제주시 구좌읍 해맞이해안로 1282',
			'/goat/resources/p_images/audwlswjsqhr.png','33.53246865917716','126.85019304912738',sysdate,
			'전복구이/전복돌솥밥이 맛있는 가게','제주도',
			'국민지원금','제주시');

insert into place values(99985,'오는정김밥','음식점','제주 서귀포시 서귀동 254-6','제주 서귀포시 동문동로 2',
			'/goat/resources/p_images/dhsmswjdrlaqkq.png','33.2495870217526','126.5676259294988',sysdate,
			'안녕하세요 제주도 오는정김밥입니다. 홀에서는 드실수 없고 포장판매만 가능합니다. 
			전화로 미리 예약주시면 (전날,또는당일) 편하게 드실 수 있습니다. 바쁜시간대에는 전화통화가 어려울수있다는점 양해부탁드립니다.
			좋은여행되세요!','제주도',
			'포장판매, 예약','서귀포시');

insert into place values(99984,'쌍둥이횟집본점','음식점','제주 서귀포시 서귀동 496-18 쌍둥이횟집','제주 서귀포시 중정로62번길 14 쌍둥이횟집',
			'/goat/resources/p_images/Tkdenddlghltwlq.png','33.24656367019196','126.56293018730287',sysdate,
			'서귀포 중학교 앞 제주 새 생명교회 옆 길 안쪽에 위치하고 있습니다.','제주도',
			'단체석, 국민지원금','서귀포시');

insert into place values(99983,'풍림다방(송당점)','음식점','제주 제주시 구좌읍 송당리 1377-1 풍림다방','제주 제주시 구좌읍 중산간동로 2267-4 풍림다방',
			'/goat/resources/p_images/vndflaekqkd.png','33.47188090908449','126.78570812673388',sysdate,
			'* 노키즈존(10세이하) 실내는 10세이상만 가능합니다. 실외자리는 모두 가능합니다. *반려동물은 실내 및 야외 모두 케이지에서만 가능합니다.','제주도',
			'주차, 무선 인터넷, 국민지원금','제주시');

insert into place values(99982,'풍원','음식점','제주 제주시 우도면 연평리 2427-1','제주 제주시 우도면 우도해안길 340',
			'/goat/resources/p_images/vnddnjs.png','33.508302541215855','126.94399371412162',sysdate,
			'우도 한라산볶음밥의 명가 풍원입니다. 흉내낼수 없는 명가의 자부심으로 음식을 만듭니다. 
			저희 풍원은 남은 음식을 재사용하지 않고 있습니다.','제주도',
			'단체석, 주차, 예약, 무선 인터넷, 남/녀 화장실 구분','제주시');

insert into place values(99981,'가시아방','음식점','제주 서귀포시 성산읍 고성리 528','제주특별자치도 서귀포시 성산읍 섭지코지로 10',
			'/goat/resources/p_images/rktldkqkd.png','33.438609592539024','126.91806478014949',sysdate,
			'- 브레이크타임 없음 
			< 쉬운 대기등록 방법 > 
			매장 방문없이 어플 "예써"에서 대기등록 가능합니다. 
			매일 예상 대기시간 및 실시간 대기현황을 어플상에서 확인하시고 오시는길에 각자의 
			일정에 맞춰 자유롭게 대기등록을 하시면 오래 기다리지 않습니다','제주도',
			'주차, 포장, 무선 인터넷, 남/녀 화장실 구분, 지역화폐, 국민지원금','서귀포시');

insert into place values(99980,'김서방재첩해장국','음식점','제주 제주시 노형동 934-16','제주 제주시 원노형6길 27',
			'/goat/resources/p_images/rlatjqkdwocjqgowkdrnr.png','33.4836371278507','126.48294888155871',sysdate,
			'제주재첩해장국,제주시 노형동 재첩해장국,북어해장국','제주도',
			'무선 인터넷, 지역화폐(지류형), 지역화폐(카드형), 국민지원금','제주시');

insert into place values(99979,'함덕다퍼주는횟집','음식점','제주 제주시 조천읍 함덕리 4149-4','제주 제주시 조천읍 함와로 22',
			'/goat/resources/p_images/ekvjwnsmsghltwlq.png','33.53809981560546','126.67440412486556',sysdate,
			'가성비와 맛으로 승부하겠습니다. 부산에서 10년이상 칼질한 주인장이 직접요리합니다','제주도',
			'단체석, 주차, 포장, 배달, 예약, 무선 인터넷, 남/녀 화장실 구분, 지역화폐(카드형), 국민지원금','제주시');

insert into place values(99978,'동도원','음식점','제주 서귀포시 대포동 2201','제주 서귀포시 이어도로 189',
			'/goat/resources/p_images/ehdehdnjs.png','33.23963212604981','126.44174037313695',sysdate,
			'공항 근처에 위치했던 동도원이 3월19일 중문으로 확장이전 하였습니다. 더 나은맛과 서비스로 보답하겠습니다.','제주도',
			'예약, 국민지원금','서귀포시');

insert into place values(99977,'제주협재 바다해찬','음식점','제주 제주시 한림읍 협재리 2514-28','제주 제주시 한림읍 한림로 326',
			'/goat/resources/p_images/qkekgocks.png','33.39267956558428','126.23988960777184',sysdate,
			'청정 바다에서 해녀가 잡은 신선한 재료를 제주 스럽게 해석한 해산물 전문점 바다해찬 입니다. 
			저희 바다해찬을 방문해주신 모든 분들께 합리 적인 가격과 신선한 음식을 제공하고자 다양한 
			메뉴와 세트 메뉴들과 함께 다양한 먹거리를 선보이고 있습니다. 제주 바다의맛을 한번 느껴보시고 좋은 추억 만드시길 바라겠습니다. -바다해찬-','제주도',
			'주차, 포장, 예약, 무선 인터넷, 반려동물 동반, 남/녀 화장실 구분, 국민지원금','제주시');

insert into place values(99976,'상춘재','음식점','제주 제주시 조천읍 선흘리 1829-11','제주 제주시 조천읍 선진길 26',
			'/goat/resources/p_images/tkdcnswo.png','33.458690827096035','126.7047468074585',sysdate,
			'이곳 주인은 청와대 한식전문 요리사로 재직했던 경험을 바탕으로 일반고객들에게 담백한 맛과 
			정성을 재공하기위해 제주도내에 처음으로 상춘재(常春齋)란 상호로 음식점을 오픈, 
			외부건물은 낡았으나 오히려 이런 분위기와 들어가 본 실내는 아담한 전통 한식집을 
			연상시킬만큼 세련되어 분위기가 맞아 떨어진다. 추천 음식은 통영 멍개비빔밥으로 
			제주도음식으로 비유를 한다면, 성개젖갈에 참기름을 넣어 밥에 비벼 먹는 맛처럼 
			고추장이 안들어가고 온갖 야채를 넣어 참기름에 비벼먹는 웰빙식이다. 
			아주 깔끔한 맛이 일품이며, 가격은 9,000원이다','제주도',
			'주차, 남/녀 화장실 구분','제주시');

insert into place values(99975,'천일만두','음식점','제주 서귀포시 서귀동 306-5','제주 서귀포시 서문로 25',
			'/goat/resources/p_images/cjsdlfaksen.png','33.250510547021776','126.55909572590207',sysdate,
			'중국시 수제만두 전문점','제주도',
			'단체석, 주차, 포장, 예약, 무선 인터넷, 국민지원금','서귀포시');

insert into place values(99974,'진아떡집','음식점','제주 제주시 일도1동 1141-3','제주 제주시 동문로4길 7-1',
			'/goat/resources/p_images/wlsdkEjrwlq.png','33.51239434240424','126.52838622427737',sysdate,
			'오전 6시부터 재료소진시 까지 운영합니다. 그날그날 재료소진되는 시간이 다르기 때문에 꼭 전화 한통 주고 오시면 감사하겠습니다~! 064-757-0229','제주도',
			'포장, 국민지원금','제주시');

insert into place values(99973,'엄마손횟집','음식점','제주 제주시 연동 262-24','제주 제주시 연동3길 35',
			'/goat/resources/p_images/djaakthsghltwlq.png','33.48668783188215','126.48809278412182',sysdate,
			'회가 신선하고 맛있는 집','제주도',
			'해산물 요리','제주시');

insert into place values(99972,'속골할망라면','음식점','제주 서귀포시 서호동 86','제주특별자치도 서귀포시 속골로 13-36',
			'/goat/resources/p_images/gkfakdfkaus.png','33.240884560924876','126.52512568141758',sysdate,
			'컵라면과 같이 먹는 신선한 해산물','제주도',
			'해산물 요리','서귀포시');

insert into place values(99971,'돈이랑','음식점','제주 서귀포시 색달동 2182','제주 서귀포시 일주서로 953',
			'/goat/resources/p_images/ehsdlfkd.png','33.25770093486625','126.40911400210625',sysdate,
			'특별한 여행, 최고의 식사를 제공하기 위하여 돈이랑에서는 마치 레스토랑의 코스요리처럼,
			숙련된 직원들이 은은한 연탄불에서 직접 구워, 고객님 한 분 한 분께 최상의 고기맛을 선사합니다.
			낭만의 제주에서 명품흑돼지를 돈이랑에서 즐겨보세요','제주도',
			'단체석, 주차, 포장, 예약, 무선 인터넷, 반려동물동반','서귀포시');

insert into place values(99970,'보건식당','음식점','제주 제주시 이도이동','제주 제주시 동광로6길 19',
			'/goat/resources/p_images/qhrjstlrekd.png','33.50048274979226','126.53273124414457',sysdate,
			'제주 시청 뒤편에 위치, 전복의 사촌쯤 되는 오분재기로 끓여내는 된장뚝배기를 판매합니다.','제주도',
			'오분자기','제주시');

insert into place values(99969,'제주도감','음식점','제주 제주시 오라이동 1770 제주도감','제주 제주시 연북로 257 제주도감',
			'/goat/resources/p_images/wpwnehrka.png','33.48187422119509','126.50892410354233',sysdate,
			'"제주도감"에서는 다양한 제주 식재료를 이용하여 제주도 향토음식을 전통 방식으로 요리하고 특별한 제주의 맛을 나누어 드립니다. 
			"도감"은 제주도에서 혼례나 잔치가 있을 때, 돼지를 잡고 고기를 요리하고 나누어 주기까지의 모든 일을 주관하는 장인을 말합니다.','제주도',
			'단체석, 주차, 예약, 무선 인터넷, 남/녀 화장실 구분','제주시');

--숙소

insert into place values(99968,'제주신라호텔','숙소','제주 서귀포시 색달동 3039-3','제주 서귀포시 중문관광로72번길 75',
			'/goat/resources/p_images/wpwntlsfkghxpf.png','33.24737685356276','126.40805679794788',sysdate,
			'세계자연문화유산인 제주의 아름다운 풍광을 담은 리조트로써 그 명성을 쌓아가고 있는 제주신라호텔은 
			1980년 개관부터 지금까지 품격과 문화가 있는 휴식지로서 수많은 굵직한 국제행사를 성공적으로 치러온 
			최고의 리조트입니다. 이국적인 분위기와 최고의 시설을 선보이며 고객에게 먼저 다가가는 리조트에 
			특화된 서비스로 호텔에 다녀간 세계의 국가 수반을 비롯 많은 VIP들에게 크나큰 찬사를 받아 왔습니다.','제주도',
			'주차, 예약, 남/녀 화장실 구분','서귀포시');


insert into place values(99967,'그랜드 하얏트 제주','숙소','제주 제주시 노형동 925','제주 제주시 노연로 12',
			'/goat/resources/p_images/rmfosemgkditxm.png','33.485550971322894','126.48192071891685',sysdate,
			'제주드림타워와 함께 그랜드 하얏트 제주는 1,600개의 올 스위트 객실, 14개의 레스토랑과 바, 8층 풀데크, 38층 스카이데크를 비롯해 
			K 패션 쇼핑몰, 2개의 스파, 마이스(MICE, 국제회의 및 각종 전시회, 박람회 관련 산업) 등 매머드급 시설을 갖추고 있습니다. 
			라스베이거스 및 싱가포르, 마카오에서나 볼 수 있는 월드클래스 수준의 복합리조트입니다.','제주도',
			'주차, 발렛파킹, 예약, 무선 인터넷, 남/녀 화장실 구분, 장애인 편의시설','제주시');


insert into place values(99966,'메종 글래드 제주','숙소','제주 제주시 연동 263-15','제주 제주시 노연로 80',
			'/goat/resources/p_images/apwhdrmffoemwpwn.png','33.48528084962881','126.48851799824808',sysdate,
			'제주국제공항과 10분 거리에 위치한 메종글래드 제주는 제주 도민의 삶 속 깊이 자리잡은 랜드마크이자, 
			제주 고유의 매력을 경험할 수 있는 호텔입니다. 40여 년 역사를 존중하는 헤리티지와 
			모던의 균형 있는 가치를 간직한 호텔로, 제주의 감성을 더한 스마트 럭셔리를 통해 특별한 경험을 
			느끼실 수 있습니다. 고풍스러운 건물과 13개 타입의 513개 모던 클래식 객실(56개 스위트 룸 포함), 
			특급 호텔리어의 친밀하고 기품있는 서비스는 편안하고 여유로운 글래드 모먼트(GLAD MOMENT)를 선사합니다.','제주도',
			'단체석, 주차, 포장, 예약, 무선 인터넷, 유아시설(놀이방), 남/녀 화장실 구분, 장애인 편의시설','제주시');


insert into place values(99965,'해비치호텔앤드리조트','숙소','제주 서귀포시 표선면 표선리 40-69','제주 서귀포시 표선면 민속해안로 537',
			'/goat/resources/p_images/goqlclghxpf.png','33.321450379545475','126.84462948846453',sysdate,
			'해비치 호텔, 해비치 리조트, 해비치 윈터가든, 해비치 컨트리 클럽 등 다양한 이용시설 완비','제주도',
			'호텔, 리조트, 골프, 패키지, 여행','서귀포시');


insert into place values(99964,'롯데호텔 제주','숙소','제주 서귀포시 색달동 2812-4','제주 서귀포시 중문관광로72번길 35',
			'/goat/resources/p_images/fhtepghxpf.png','33.24848879860944','126.41057633287238',sysdate,
			'제주도 최초로 인증 받은 5성 호텔 푸른 제주 바다와 하늘이 맞닿은 곳에 위치한 롯데호텔제주는 
			천국 같은 휴식과 여행의 즐거움을 동시에 누릴 수 있는 대한민국 대표 호텔이다. 
			제주의 따뜻한 바다를 닮은 사계절 온수풀 "해온(海溫)", 멀티 놀이공간 "플레이토피아", 
			헬로키티 캐릭터 룸과 풀빌라 스위트 룸, 연회장을 비롯해 미식 여행의 진수를 선사할 레스토랑까지 
			다채로운 시설들을 보유하고 있다.','제주도',
			'호텔, 사계절온수풀, 헬로키티룸, 풍차라운지, 풀빌라스위트','서귀포시');


insert into place values(99963,'토스카나 호텔','숙소','제주 서귀포시 강정동 3704','제주 서귀포시 용흥로66번길 158-7',
			'/goat/resources/p_images/xhtmzksk.png','33.26566371016771','126.48441948433651',sysdate,
			'제주도 서귀포시에 위치한 호텔 토스카나는 이탈리아의 토스카나를 연상케 하는 편안한 인테리어, 
			가족 여행객들에게 이상적인 넓은 객실, 제주도에서 가장 큰 전용 온수 수영장을 갖춘 풀빌라 및 사계절 
			온수풀, 소수의 회원만을 위한 회원 전용 서비스 등 호텔 토스카나에서만 경험할 수 있는 특별한 
			시설과 서비스를 선보입니다.','제주도',
			'호텔, 서귀포, 제주온수풀, 풀빌라','서귀포시');


insert into place values(99962,'그랜드 조선 제주','숙소','제주 서귀포시 색달동 2785','제주 서귀포시 중문관광로72번길 60',
			'/goat/resources/p_images/rmfosemwhtjs.png','33.2524615543984','126.40796349562847',sysdate,
			'에메랄드 빛 바다와 천혜의 경관을 그대로 마주하고 있는 그랜드 조선 제주는 
			제주 대표 관광지가 모여있는 중문관광단지에 위치하여 풍부한 주변 볼거리를 제공합니다. 
			제주의 바다를 닮은 넓고 고요한 객실은 일상을 벗어난 편안한 여유의 시간을 즐기기에 최적의 공간입니다.','제주도',
			'호텔, 그랜드조선, 제주숙박, 여행, 조선호텔','서귀포시');


insert into place values(99961,'라마다프라자 제주호텔','숙소','제주 제주시 삼도2동 1255','제주 제주시 탑동로 66',
			'/goat/resources/p_images/fkakekvmfkwk.png','33.51881148646909','126.51786742962045',sysdate,
			'제주도 제주시 탑동 해변가에 위치한 라마다프라자 제주 호텔은 호화 유람선을 
			모티브로 한 독특한 설계와 바다와 바로 인접해 있는 국내 최초의 해변호텔 로서 제주항과 
			제주국제공항에서 차로 5분거리의 가까운 곳이며 제주에서 새롭게 부상하는 번화가에 위치해 
			국내외 관광객들에게 또 하나의 제주관광 명소로서 기억이 남게 될 것입니다.','제주도',
			'호텔, 호캉스, 공항근처, 오션프론트, 호텔뷔페','제주시');


insert into place values(99960,'WE호텔','숙소','제주 서귀포시 회수동 30','제주 서귀포시 1100로 453-95',
			'/goat/resources/p_images/weghxpf.png','33.28621808537933','126.4440686794961',sysdate,
			'"WE 호텔 제주"는 고급 시설을 갖춘 아늑한 분위기의 87개의 Superior, 4개의 Deluxe 및 
			12개의 Suite를 포함한 103개의 객실을 갖추고 있습니다. 게다가 약 21만 평에 달하는 
			부지에는 호텔 주변과 숲길을 따라 동백꽃, 제주 철쭉, 수국, 참꽃 나무 등 다양한 종류의 
			꽃들과 나무들로 둘러 쌓인 숲 속을 여유 있게 1~2시간 정도의 트레킹이나 산책이 가능한 
			아름다운 산책코스와 한라산의 쾌적한 공기를 느낄 수 있는 편백나무 숲을 자연상태 그대로 잘 조성해 놓았습니다.','제주도',
			'해암하이드로, 힐링포레스트, 워터테라피, 웰니스, 수영장','서귀포시');


insert into place values(99959,'유탑유블레스호텔제주','숙소','제주 제주시 조천읍 함덕리 1269-9','제주 제주시 조천읍 조함해안로 502',
			'/goat/resources/p_images/dbxkqdbqmffptmghxpf.png','33.54243062804912','126.66628045760187',sysdate,
			'제주에서 가장 아름다운 에메랄드빛 바다를 품은 함덕 서우봉해변에 자리하고 있으며, 
			총 290실의 객실, 4개소의 연회장 및 레스토랑과 각종 부대영업장을 갖추고 안락한 시설과 최고의 
			서비스로고객들과 추억을 같이하고 있는 유탑유블레스호텔입니다. 친환경 우수 자재를 
			사용한 감각적이고 안락한 분위기의 객실로 구성되어 있으며, 호텔 9층에 위치한스카이라운지 
			쉼터에서는 탁트인 해변조망과 함께 자쿠지에서의 편안한 시간을 즐기실 수 있고, 
			탁구장/키즈룸과 24시간 운영되는 비지니스센터를 갖추고 있습니다.','제주도',
			'호텔, 제주, 함덕, 유탑, 숙박','제주시');
