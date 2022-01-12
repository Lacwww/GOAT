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

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			M_NUM
		);
alter table member modify(m_tel varchar2(40));
alter table member modify(m_pass varchar2(1000));
select * from member;

update member set m_id='admin', m_nick='admin', m_name='admin', m_addr='admin', m_addrd='admin', admin='y' where m_num=1;

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
