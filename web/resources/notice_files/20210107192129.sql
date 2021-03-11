--ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';
--ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'HH24:MI'; -- 'RR/MM/DD HH24:MI:SSXFF' 여기서 HH24:MI으로만 해주고 픔

SELECT SYSDATE FROM DUAL; -- 날짜 형식확인용
Set define off;

--TB_USER TABLE SCRIPT FILE
DROP TABLE TB_USER CASCADE CONSTRAINTS;
CREATE TABLE TB_USER(
    USER_NO   NUMBER,
    USER_ID    VARCHAR2(20) NOT NULL,	
    USER_PW   VARCHAR2(20) NOT NULL,
    USER_NM   VARCHAR2(30) NOT NULL,
    BIRTHDAY   DATE NOT NULL,
    GENDER      CHAR(1) NOT NULL,
    PHONE       VARCHAR2(20) NOT NULL,
    ADDRESS     VARCHAR2(300) NOT NULL,
    NICK_NM     VARCHAR2(30) NOT NULL,
    USER_LV       NUMBER DEFAULT 1,
    LOGINOK     CHAR(1) DEFAULT 'Y' NOT NULL,
    ENROLL_DATE   DATE DEFAULT SYSDATE,
    LAST_MODIFIED DATE NULL,
    CONSTRAINT PK_USER_NO PRIMARY KEY (USER_NO),
    CONSTRAINT UNIQ_ID UNIQUE (USER_ID),
    CONSTRAINT UNIQ_NICKNM UNIQUE (NICK_NM)
);
COMMENT ON COLUMN TB_USER.USER_NO  IS '회원번호';
COMMENT ON COLUMN TB_USER.USER_ID   IS '아이디';
COMMENT ON COLUMN TB_USER.USER_PW   IS '비밀번호';
COMMENT ON COLUMN TB_USER.USER_NM   IS '이름';
COMMENT ON COLUMN TB_USER.BIRTHDAY   IS '생년월일';
COMMENT ON COLUMN TB_USER.GENDER   IS '성별';
COMMENT ON COLUMN TB_USER.PHONE   IS '전화번호';
COMMENT ON COLUMN TB_USER.ADDRESS   IS '주소';
COMMENT ON COLUMN TB_USER.NICK_NM   IS '닉네임';
COMMENT ON COLUMN TB_USER.USER_LV   IS '1 = 환자, 2 = 의료진, 3 = 관리자';
COMMENT ON COLUMN TB_USER.LOGINOK IS '로그인 상세확인';
COMMENT ON COLUMN TB_USER.ENROLL_DATE IS '회원가입 날짜';
COMMENT ON COLUMN TB_USER.LAST_MODIFIED IS '회원정보 마지막 수정 날짜';

DROP SEQUENCE SEQ_DOCNO; --의사, 의료진, 관리자 회원번호 자동 발생기
CREATE SEQUENCE SEQ_DOCNO
START WITH 1 -- 자동 숫자 발생기
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_USERNO; --일반 회원번호 자동 발생기
CREATE SEQUENCE SEQ_USERNO
START WITH 101 -- 자동 숫자 발생기
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (샘플데이터) : TB_USER
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'doctor01', '1234', '정원장', '1964/01/01', 'F', '01012345555', 
                                            '충남 천안시 서북구 직산읍 직산로 31 2층', '1진료실원장님', DEFAULT, 2, DEFAULT, NULL);
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'doctor02', '1234', '박원장', '1967/01/01', 'F', '01012346666', 
                                            '충남 천안시 서북구 직산읍 직산로 31 2층', '2진료실원장님', DEFAULT, 1, DEFAULT, NULL);           
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'headofdept', '1234', '오실장', '1970/01/01', 'M', '01012347777', 
                                            '충남 천안시 서북구 직산읍 직산로 31 2층', '직산가정의학과의원', DEFAULT, 2, DEFAULT, NULL);
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'nurse01', '1234', '고간호사', '1965/01/01', 'F', '01012348888', 
                                            '충남 천안시 서북구 직산읍 직산로 31 2층', '간호보조사(1)', DEFAULT, 1, DEFAULT, NULL);                  
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'nurse02', '1234', '곽간호사', '1965/01/01', 'F', '01012349999', 
                                            '충남 천안시 서북구 직산읍 직산로 31 2층', '간호보조사(2)', DEFAULT,  1, DEFAULT, NULL);                      
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'nurse03', '1234', '김간호사', '1966/01/01', 'F', '01012340000', 
                                            '충남 천안시 서북구 직산읍 직산로 31 2층', '간호사(1)', DEFAULT, 1, DEFAULT, NULL);      
INSERT INTO TB_USER VALUES(SEQ_USERNO.NEXTVAL, 'user01', '1234', '홍길순', '1994/01/01', 'F', '01011111111',  -- USER_NO (회원번호) = SEQ_USERNO.NEXTVAL = START WITH 101 이라서 USER01의 회원번호는 101
                                            '충남 천안시 서북구 직산로 33', '일반사용자1', DEFAULT, 0, DEFAULT, NULL);
INSERT INTO TB_USER VALUES(SEQ_USERNO.NEXTVAL, 'user02', '1234', '홍길동', '1996/01/01', 'F', '01011112222', 
                                            '충남 천안시 서북구 직산로 33', '일반사용자2', DEFAULT, 0, DEFAULT, NULL);

COMMIT; ----------------------------------------------------------------------------------------------------------------------------------



--TB_MEMBERS TABLE SCRIPT FILE
DROP TABLE TB_MEMBERS CASCADE CONSTRAINTS;
CREATE TABLE TB_MEMBERS(
    USER_NO   NUMBER,
    USER_ID    VARCHAR2(20) NOT NULL,	
    USER_PW   VARCHAR2(20) NOT NULL,
    USER_NM   VARCHAR2(30) NOT NULL,
    USER_LV       NUMBER DEFAULT 1,
    CONSTRAINT PK_M_NO PRIMARY KEY(USER_NO),
    CONSTRAINT FK_M_NO FOREIGN KEY(USER_NO) REFERENCES TB_USER (USER_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_MEMBERS.USER_NO  IS '회원번호';
COMMENT ON COLUMN TB_MEMBERS.USER_ID   IS '아이디';
COMMENT ON COLUMN TB_MEMBERS.USER_PW   IS '비밀번호';
COMMENT ON COLUMN TB_MEMBERS.USER_NM   IS '이름';
COMMENT ON COLUMN TB_MEMBERS.USER_LV   IS '0 = 환자, 1 = 의료진, 2 = 관리자';

INSERT INTO TB_MEMBERS VALUES(1, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '1'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '1'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '1'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '1'));
INSERT INTO TB_MEMBERS VALUES(2, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '2'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '2'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '2'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '2'));
INSERT INTO TB_MEMBERS VALUES(3, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '3'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '3'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '3'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '3'));
INSERT INTO TB_MEMBERS VALUES(4, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '4'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '4'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '4'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '4'));
INSERT INTO TB_MEMBERS VALUES(5, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '5'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '5'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '5'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '5'));
INSERT INTO TB_MEMBERS VALUES(6, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '6'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '6'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '6'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '6'));
INSERT INTO TB_MEMBERS VALUES(101, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '101'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '101'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '101'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '101'));
INSERT INTO TB_MEMBERS VALUES(102, (SELECT USER_ID FROM TB_USER WHERE USER_NO = '102'), 
                                                       (SELECT USER_PW FROM TB_USER WHERE USER_NO = '102'),
                                                       (SELECT USER_NM FROM TB_USER WHERE USER_NO = '102'),
                                                       (SELECT USER_LV FROM TB_USER WHERE USER_NO = '102'));

COMMIT; ----------------------------------------------------------------------------------------------------------------------------------





-- TB_DEPT TABLE SCRIPT FILE
DROP TABLE TB_DEPT CASCADE CONSTRAINTS;

CREATE TABLE TB_DEPT(
	DEPT_NO	NUMBER,	
    DEPT_NM   VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_DEPT_NO PRIMARY KEY(DEPT_NO)
);
COMMENT ON COLUMN TB_DEPT.DEPT_NO IS '진료과 번호';
COMMENT ON COLUMN TB_DEPT.DEPT_NM IS '진료과 명';

DROP SEQUENCE SEQ_DEPT;
CREATE SEQUENCE SEQ_DEPT
START WITH 1 -- 자동 숫자 발생기
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (샘플데이터) : TB_USER
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '가정의학과'); -- DEPT_NO = 1
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '내과');  -- DEPT_NO = 2
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '소아과'); -- DEPT_NO = 3
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '이비인후과'); -- DEPT_NO = 4

COMMIT;----------------------------------------------------------------------------------------------------------------------------------






-- TB_DISEASE TABLE SCRIPT FILE
DROP TABLE TB_ABOUT_DISEASE CASCADE CONSTRAINTS;
DROP TABLE TB_DISEASE CASCADE CONSTRAINTS;
CREATE TABLE TB_DISEASE(
	DISEASE_NO	NUMBER,	
    DISEASE_NM VARCHAR2(50) NOT NULL,
	DEPT_NO	NUMBER DEFAULT 1 NOT NULL,
    RESERVABLE CHAR(1) DEFAULT 'N' NOT NULL, 
    SECT01 VARCHAR2(50) DEFAULT '<H2>정의</H2>' ,
    TEXT01 VARCHAR2(4000),
    PIC01 VARCHAR2(100),
    SECT02 VARCHAR2(50) DEFAULT '<h2>원인</h2><h3><i> 및 위험인자</i></h3>' ,
    TEXT02 VARCHAR2(4000) ,
    PIC02 VARCHAR2(100) ,
    SECT03 VARCHAR2(50) DEFAULT '<h2>증상</h2>',
    TEXT03 VARCHAR2(4000),
    PIC03 VARCHAR2(100),
    SECT04 VARCHAR2(50) DEFAULT '<h2>검사 · 진단</h2>',
    TEXT04 VARCHAR2(4000),
    PIC04 VARCHAR2(100),
    SECT05 VARCHAR2(50) DEFAULT '<h2>치료</h2><h3><i> 방법 · 종류</i></h3>',
    TEXT05 VARCHAR2(4000),
    PIC05 VARCHAR2(100),
    SECT06 VARCHAR2(50) DEFAULT '<h2>합병증</h2>',
    TEXT06 VARCHAR2(4000),
    PIC06 VARCHAR2(100),
    SECT07 VARCHAR2(50) DEFAULT '<h2>주의사항</h2>',
    TEXT07 VARCHAR2(4000),
    PIC07 VARCHAR2(100),
    DISEASE_ALT_NM VARCHAR2(500),
    CONSTRAINT PK_DISEASE PRIMARY KEY (DISEASE_NO),
    CONSTRAINT FK_DEPT_NO FOREIGN KEY (DEPT_NO) REFERENCES TB_DEPT (DEPT_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_DISEASE.DISEASE_NO IS '질병번호';
COMMENT ON COLUMN TB_DISEASE.DISEASE_NM IS '질병명';
--COMMENT ON COLUMN TB_DISEASE.DIABETES_COMP IS '당뇨병합병증 N=아니다, Y=합병증이다';
COMMENT ON COLUMN TB_DISEASE.DEPT_NO IS '진료과 번호';

COMMENT ON COLUMN TB_DISEASE.RESERVABLE IS '예약가능';

COMMENT ON COLUMN TB_DISEASE.SECT01 IS '정의';
COMMENT ON COLUMN TB_DISEASE.TEXT01 IS '정의: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC01 IS '정의 자료';
COMMENT ON COLUMN TB_DISEASE.SECT02 IS '원인';
COMMENT ON COLUMN TB_DISEASE.TEXT02 IS '원인: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC02 IS '원인 자료';
COMMENT ON COLUMN TB_DISEASE.SECT03 IS '증상';
COMMENT ON COLUMN TB_DISEASE.TEXT03 IS '증상: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC03 IS '증상 자료';
COMMENT ON COLUMN TB_DISEASE.SECT04 IS '검사 · 진단';
COMMENT ON COLUMN TB_DISEASE.TEXT04 IS '검사 · 진단: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC04 IS '검사 · 진단 자료';
COMMENT ON COLUMN TB_DISEASE.SECT05 IS '치료';
COMMENT ON COLUMN TB_DISEASE.TEXT05 IS '치료: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC05 IS '치료 자료';
COMMENT ON COLUMN TB_DISEASE.SECT06 IS '합병증';
COMMENT ON COLUMN TB_DISEASE.TEXT06 IS '합병증: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC06 IS '합병증 자료';
COMMENT ON COLUMN TB_DISEASE.SECT07 IS '주의사항';
COMMENT ON COLUMN TB_DISEASE.TEXT07 IS '주의사항: 내용';
COMMENT ON COLUMN TB_DISEASE.PIC07 IS '주의사항 자료';
COMMENT ON COLUMN TB_DISEASE.DISEASE_ALT_NM IS 'ALTERNATIVE NAME 질환명 동의어';


DROP SEQUENCE SEQ_DISEASE;
--CREATE SEQUENCE SEQ_DISEASE
--START WITH 001 -- 자동 숫자 발생기
--INCREMENT BY 1
--NOMAXVALUE
--NOCYCLE
--NOCACHE;

-- SAMPLE DATA (샘플데이터) : TB_DISEASE TABLE
INSERT INTO TB_DISEASE VALUES(101, '감기', DEFAULT, DEFAULT,
    DEFAULT, '<b>감기</b>는 넓은 의미로 "상기도염"이라는 용어를 쓰기도 하지만 보통 코, 인후부, 부비동, 기관, 기관지, 폐와 같은 호흡기에 바이러스가 감염이 되면서 일어나는 대표적인 호흡기질환의 급성 염증성 질환이다.', 
        'cold-01.png', 
    DEFAULT, '급성 바이러스형 비인두염 혹은 급성비염으로 코, 목구멍 등 상부 호흡계가 바이러스에 감염되어 발병한다. 바이러스 종류: <br> <ul> <li> 리노바이러스(rhinovirus)</li> <li> 코로나바이러스(coronavirus)</li> <li> 사람파라인플루엔자바이러스 (Human parainfluenza virus, HPIV)</li> <li> 사람호흡기세포융합바이러스(Respiratory syncytial virus, RSV)</li> <li> 아데노바이러스(adenovirus)</li> <li> ... 등</li> </ul>', 
        NULL,
    DEFAULT, '<ul> <li> 재채기</li> <li> 코막힘</li> <li> 콧물</li> <li> 인후통</li> <li> 기침</li> <li> 미열</li> <li> 두통</li> <li> 근육통</li> </ul>',
        'cold-03.png', 
    DEFAULT, '감기의 진단은 환자의 콧물 등의 검체를 이용하여 감기를 일으킨 원인 바이러스를 찾음으로써 가능하지만 일반적으로 감기는 대부분 자연적으로 치유되기 때문에 임상에서는 잘 시행되지 않는다. 따라서 감기의 진단은 환자의 증상 및 징후를 보고 판단하게 되며, 다른 질병과의 감별을 위해 가슴 엑스레이 사진 촬영 및 혈액검사 등 시행을 할 수 있다.',
        NULL,
    DEFAULT, '약물대증요법으로 개개의 증상에 따라서, 열이 나면 해열제를 복용하고, 기침으로 고통이 심하고, 가슴이 아프고 하면 진해제나 기관지 확장제(기도의 과민성 수축으로 오는 경우에 효과) 의사의 처방에 따라 복용한다.', 
        NULL, 
    DEFAULT, '감기에는 목숨이 위태롭지 않지만 합병증은 위험하기 때문에 빨리 치료하는 것이 좋다. <ul> <li> 중이염</li> <li> 부비동염</li> <li> 기관지염</li> <li> 모세기관염</li> <li> 후두염</li> <li> 폐렴</li> <li> ... 등</li> </ul>',
        NULL,
    DEFAULT, '감기는 신체적 접촉으로도 전파됩니다. 따라서 손을 자주 씻고, 코를 함부로 후비지 말며, 감기 환자와의 접촉을 피하는 것이 가장 좋습니다. 수분을 많이 섭취하고 적절한 온도와 습도를 유지하는 것도 빠른 쾌유에 도움이 됩니다.',
        'cold-pic07.png',
    '감기, 상기도 감염, common cold, 기침, 콧물'
);
INSERT INTO TB_DISEASE VALUES(102, '갑상선기능저하증', DEFAULT, 'Y',
    DEFAULT, '<b>갑상선기능저하증</b>은 우리 몸에 필요한 갑상선호르몬이 부족하여 나타나는 질환을 의미합니다.', 
        'thyroid-pic01.png', 
    DEFAULT, '갑상선기능저하증은 갑상선 자체에 문제가 생겨서 갑상선호르몬의 생산이 감소하거나, 뇌에 문제가 생겨 갑상선호르몬의 분비를 자극하는 갑상선자극호르몬(TSH)의 생산이 감소함으로써 갑상선호르몬을 충분히 만들지 못하여 나타납니다.', 
        NULL,
    DEFAULT, '갑상선기능저하증의 증상은 매우 다양하며, 다른 질환에서 나타나는 증상과 유사한 경우가 많다. <ul> <li> 온몸의 대사 기능 저하</li> <li> 피부는 건조하고 창백하며 누렇게 됨</li> <li> 쉽게 피로함</li> <li> 의욕 없으며 집중 잘 안 됨</li> <li> 기억력 감퇴</li> <li> 목소리가 쉬고 말이 느려짐</li> <li> 식욕 떨어짐, 몸이 붓고 체중 증가</li> <li> ... 등</li> </ul> 여성의 경우 흔히 월경량이 증가합니다. 갑상선기능저하증으로 나타나는 부종은 손가락으로 눌러도 들어가는 자리가 생기지 않는다는 특징이 있습니다.',
        'hypothy-pic03.png', 
    DEFAULT, '촉진을 통해 갑상선 결절의 크기, 촉감, 대칭성 등을 관찰하고, 피부, 모발, 심장, 복부 등에 갑상선기능저하증으로 인한 소견이 있는지 확인합니다. 이후 혈중 갑상선호르몬 농도와 갑상선자극호르몬 농도를 측정하여 이를 진단할 수 있습니다. 진찰 중 갑상선에서 혹(결절)이 발견되면 감별 진단을 위해 조직 검사가 필요한 경우도 있습니다.',
        NULL,
    DEFAULT, '갑상선기능저하증의 치료는 간단합니다. 부족한 갑상선호르몬을 보충하는 것입니다. 그러나 대부분의 경우 갑상선기능저하증은 한 번 발생하면 영구적이어서 평생 갑상선호르몬제를 복용해야 합니다. 물론 일부 갑상선염의 경우 일정 기간 치료 후 갑상선 기능이 회복되어 호르몬제의 복용을 중단할 수도 있습니다.', 
        NULL, 
    DEFAULT, '<ul> <li> 심장 질환</li> <li> 고지혈증</li> <li> 동맥경화증</li> <li> 점액수종성 혼수</li> <li> ... 등</li> </ul>',
        NULL,
    DEFAULT, '대개 성인의 경우 사람마다 필요한 갑상선호르몬의 양이 일정합니다. 따라서 일단 필요량이 결정되면 정해진 양의 갑상선호르몬제를 복용하고 있는 동안에는 몸에 변화가 없습니다. 그러므로 병원에 자주 나올 필요도 없고, 이후에는 일 년에 한 번 정도 혈액 검사를 시행해서 혹시 갑상선호르몬의 필요량이 달라지지 않는지 알아보는 정도로 충분합니다. 몸에 부족한 갑상선호르몬을 약의 형태로 보충하는 것이므로 갑상선호르몬제를 장기간 복용한다고 하여 부작용이 생기는 일은 절대로 없습니다.',
        NULL,
    '갑상선 질환, 갑상샘기능저하, 갑상샘저하증, 갑상선기능저하, 갑상선저하증, hypothyroidism, thyroid'
);
INSERT INTO TB_DISEASE VALUES(103, '갑상선기능항진증', DEFAULT, 'Y',
    DEFAULT, '<b>갑상선기능항진증</b>은 갑상선호르몬이 정상보다 많이 분비되어 몸의 에너지가 빨리 소모되고 많은 기능이 항진되는 질병을 말합니다.', 
        'thyroid-pic01.png', 
    DEFAULT, '갑상선기능항진증의 가장 흔한 원인은 자가면역 질환에 의한 것입니다. 자가면역 질환이란 외부에서 들어온 바이러스를 공격해야 하는 면역력이 자신의 몸을 외부 바이러스로 착각하고 공격하는 질환입니다.', 
        'hyperthy-pic02.png',
    DEFAULT, '갑상선 기능이 항진되면 여러 가지 증상이 나타납니다. 신체의 여러 장기가 항진되어 있기 때문에 가만히 있어도 뛰는 효과가 나타납니다.<br> <ul> <li> 혈압 이상</li> <li> 심박동 수가 빨라짐</li> <li> 숨찬 증상</li> <li> 신경질적이고 안절부절못함</li> <li> 감정 및 정서 변화</li> <li> 불면증</li> <li> 피부 건조증</li> <li> 탈모증</li> <li> ... 등</li> </ul>',
       'hyperthy-pic03.png', 
    DEFAULT, '갑상선기능항진증을 진단하기 위하여 혈액 검사를 필수적으로 시행해야 합니다. 혈액 검사를 통해 갑상선호르몬의 농도를 검사합니다. 또한 갑상선 초음파, 갑상선 스캔 등도 시행할 수 있습니다. <ul> <li> 혈액 검사</li> <li> 갑상선 초음파</li> <li> 갑상선 스캔</li> </ul>',
        NULL,
    DEFAULT, '갑상선기능항진증의 치료 방법에는 세 가지가 있습니다. 첫 번째는 항갑상선 약을 복용하는 방법으로, 우리나라에서 가장 많이 이용하는 치료 방법입니다. 두 번째는 방사성 요오드 치료입니다. 비교적 간단하고 싸다는 장점이 있지만, 갑상선기능저하증이 나타날 수 있으며 임산부에게는 시행할 수 없습니다. 세 번째는 수술 요법입니다. 갑상선종이 매우 크거나 방사성 요오드 치료를 원치 않는 경우에 시행할 수 있습니다. <ul> <li> 항갑상선 약을 복용</li> <li> 방사성 요오드 치료</li> <li> 수술 요법</li> </ul>', 
        NULL, 
    DEFAULT, '갑상선 기증항진증환자가 적절한 치료를 받지 못한 상태에서 갑작스러운 스트레스나 감염을 경험하면 갑상선 중독증으로 이어질 수 있습니다. 이 때 고열과 발한, 심한 빈맥(심장 박동수가 분당 100회 이상으로 빨라지는 현상), 흥분, 의식 상실, 혼수 등을 동반하며 저혈압, 구토, 설사 등도 나타납니다. 또한 빈백증, 비정상적 심장리듬, 심부전 등의 심혈관계 증상과 골다공증의 합병증이 나타날 수 있습니다.<br><br>그러므로 적절한 치료로 갑상선 중독증을 예방해야 합니다. <ul> <li> 빈백증</li> <li> 심한 빈맥(심장 박동수가 분당 100회 이상으로 빨라지는 현상)</li> <li> 심혈관계 질환 (심부전, 비정상적 심장리듬)</li> <li> 감정 및 정서 변화</li> <li> 골다공증</li> <li> ... 등</li> </ul>',
        NULL,
    DEFAULT, '항갑상선 약물을 복용 중인 경우, 방사성 요오드 치료를 시행하기 전에 며칠 동안 복용을 중단해야 합니다. 또한 갑상선이 매우 큰 경우에는 방사성 요오드 치료 후 생길 수 있는 압박 증상 등을 예방하기 위해 보조적인 치료가 필요할 수 있습니다.<br><br>임신 중 갑상선 기능 항진증이 제대로 조절되지 않았던 경우에는 유산, 임신성 고혈압, 미숙아, 저체중, 자궁내 발육지연, 사산, 갑상선중독발증, 산모의 울혈성 심부전 등의 위험이 있습니다.',
        NULL,
    '갑상선 질환, 갑상선기능항진증, 갑상샘 기능 항진증,갑상샘항진증, 갑상선 항진증'
);

INSERT INTO TB_DISEASE VALUES(104, '고지혈증', DEFAULT, DEFAULT, 
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(105, '고혈압', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(106, '골다공증', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(107, '관절염', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');




INSERT INTO TB_DISEASE VALUES(108, '당뇨병', DEFAULT, 'Y',
    DEFAULT, '<b>당뇨병</b>은 혈액중의 포도당(혈당)이 높아서 소변으로 포도당이 넘쳐 나오는데서 지어진 이름입니다. 정상인의 경우 소변으로 당이 넘쳐나지 않을 정도로 혈당이 조절됩니다. 여기에는 췌장에서 분비되는 <b>인슐린</b>이라는 호르몬이 중요한 작용을 합니다. 이러한 인슐린이 모자라거나 제대로 일을 못 하는 상태가 되면 혈당이 상승하며, 이로 인해 혈당이 지속적으로 높은 상태가 됩니다. 이러한 상태를 당뇨병이라고 합니다. <br><br> <p><b>제 1형 당뇨병</b></p>주로 소아에서 발생하나, 성인에서도 나타날 수 있습니다. 급성 발병을 하며 심한 다음, 다뇨, 체중감소 등과 같은 증상들이 나타나고, 인슐린의 절대적인 결핍으로 인하여 케톤산증이 일어납니다. 고혈당의 조절 및 케톤산증에 의한 사망을 방지하기 위해 인슐린치료가 반드시 필요합니다.<br> <p><b>제 2형 당뇨병</b></p>당뇨병 한국인 당뇨병의 대부분을 차지하며 체중정도에 따라서 비만형과 비비만형으로 나눕니다. 생활수준의 향상으로 칼로리의 과잉섭취가 많거나 상대적으로 운동량이 감소하고 많은 스트레스에 노출되면 인슐린의 성능이 떨어져서 당뇨병이 발현되며 계속 조절하지 않을 경우 인슐린 분비의 감소가 따르게 됩니다. 주로 40세 이후에 많이 발생하고 반 수 이상의 환자가 과체중이거나 비만증을 갖고 있습니다.<br> <p><b>임신성 당뇨병</b></p>임신성 당뇨병이란 임신 중 처음 발견되었거나 임신의 시작과 동시에 생긴 당조절 이상을 말하며 임신 전 진단된 당뇨병과는 구분됩니다. 임산부의 2∼3%가 발병하며, 대부분은 출산 후 정상화됩니다. 하지만 임신 중에는 혈당조절의 정도가 정상범위를 벗어나는 경우 태아 사망률 및 선천성 기형의 이환율이 높으므로 주의를 요합니다.<br>', 
        'thyroid-pic01.png', 
    DEFAULT, '당뇨병의 발생에는 유전과 환경이 중요한 역할을 합니다. 즉, 당뇨병은 이것에 걸리기 쉬운 유전적 체질을 부모로부터 물려받은 사람이 당뇨병을 유발하기 쉬운 환경에 노출될 때 발생할 수 있습니다. 하지만 현재까지 당뇨병을 일으키는 유전자의 이상을 찾을 수 있는 경우는 전체 당뇨병의 1% 미만에 불과합니다. 대부분의 당뇨병에서는 원인 유전자가 명확히 밝혀지지 않았습니다.
<br><br>당뇨병을 유발할 수 있는 환경 인자로는 고령, 비만, 스트레스, 임신, 감염, 약물(스테로이드제제, 면역억제제, 이뇨제) 등이 있습니다. 환경 인자는 유전 인자와는 달리 본인의 노력으로 어느 정도 피할 수 있습니다. 최근 들어 당뇨병이 급증하는 이유는 유전적인 원인보다는 과도한 음식물 섭취와 운동량 감소로 인한 비만증의 증가 때문으로 여겨집니다. 단것을 많이 먹는다고 당뇨병이 생기지는 않지만, 단것을 많이 먹으면 체중이 늘어날 수 있으며, 비만증이 생기면 당뇨병이 생길 위험성이 증가합니다.', 
        'diabetes-pic02.png',
    DEFAULT, '당뇨병의 가장 대표적인 증상을 ‘삼다(三多)’라고 부릅니다. <ul> <li><b> 다음 (多飮) : </b>  물을 많이 마심</li> <li><b> 다뇨 (多尿) : </b>   소변을 많이 봄</li> <li><b> 다식 (多食) : </b>  많이 먹음</li> </ul> 그 외 당뇨병의 증상으로는 눈 침침함, 손발 저림, 여성의 경우 질 소양증 등이 나타날 수 있습니다. 하지만 혈당이 많이 높지 않은 경우에는 대부분 특별한 증상을 느끼지 못합니다.',
       'hyperthy-pic03.png', 
    DEFAULT, '당뇨병은 혈당을 측정하여 진단합니다. 이때 혈당 검사란 손가락 끝에서 채혈을 하는 전혈 포도당 검사가 아니라, 정맥혈을 채취하여 피떡을 가라앉히고 상층의 맑은 혈장 성분만을 분리하여 포도당 농도를 측정하는 검사입니다. 과거에 많이 시행하던 요당 검사는 당뇨병이 있어도 음성으로 나올 수 있고, 당뇨병이 아니더라도 양성으로 나올 수 있으므로 진단 검사로는 부적합합니다.
<br><br>현재 가장 널리 사용되고 있는 당뇨병의 진단 기준은 <i>당뇨병의 진단 기준 및 분류에 관한 전문위원회</i>에서 제시한 것으로, 다음과 같습니다:
<ul>
    <li>당뇨병의 특징적인 증상인 물을 많이 먹고 소변을 많이 보는 증상이 나타남. 다른 특별한 원인으로 설명할 수 없는 체중 감소가 나타남. 식사 시간과 관계없이 측정한 혈당이 200mg/dL 이상임. </li>
    <li>8시간 동안 열량 섭취가 없는 공복 상태에서 측정한 공복 혈당이 126mg/dL 이상</li>
    <li>경구 당부하 검사에서 75mg의 포도당을 섭취한 뒤 측정한 2시간째 혈당이 200mg/dL 이상</li>
</ul>
<br>위의 세 가지 조건 중 어느 한 조건만 만족하면 당뇨병으로 진단할 수 있습니다. 그러나 명백한 고혈당 증상이나 급성 대사 이상이 있는 경우를 제외하고는 다른 날에 반복 검사를 시행하여 두 번 이상 진단 기준을 만족할 때 당뇨병으로 진단합니다.',
        'diabetes-pic04.png',
    DEFAULT, '당뇨병의 치료 방법으로는 식사 요법, 운동 요법, 약물 치료가 있습니다. 가벼운 당뇨병은 식사 요법과 운동 요법만으로도 효과적으로 치료할 수 있습니다. 식사 요법과 운동 요법만으로 만족할 만한 혈당 조절이 이루어지지 않을 때 약물 요법을 추가합니다. 하지만 약물 요법을 받는 중에도 반드시 식사 요법과 운동 요법을 병행해야 합니다. 약물 요법에는 경구 혈당강하제와 인슐린 주사가 있는데, 당뇨병의 종류, 환자의 상태, 합병증의 유무에 따라 치료 약물을 선택합니다.', 
        NULL, 
    DEFAULT, '<p><b>(1) 급성합병증</b></p> 당뇨병으로 인해 발생하는 급성합병증에는 혈당이 지나치게 높기 때문에 나타나는 것과, 반대로 혈당이 너무 낮아져서 나타나는 것이 있습니다. <br><br> <ul> <li> 고혈당성 혼수</li> <li> 케톤산혈증</li> <li> 저혈당</li> </ul> <br><br> <p><b>(2) 만성합병증</b></p> 만성합병증은 일단 발병되면 치료가 어렵습니다. 따라서 치료보다는 예방하는 것이 최선의 방법입니다. 일단 발병되었다고 하더라도 혈당을 정상으로 조절하여 합병증의 진행속도를 늦추어야 합니다. <br><br> <ul> <li> 심혈관계 질환 동맥경화증</li> <li> 고혈압</li> <li> 뇌혈관 경색증</li> <li> 신장질환 당뇨병성 신증</li> <li> 안질환 당뇨병성 망막증</li> <li> 당뇨병성 망막증</li> <li> 피부질환 농피증</li> <li> 습 진</li> <li> 당뇨병성 가려움증</li> <li> 괴저</li> <li> 구강질환</li> </ul> <br> 각 당뇨합병증에 관하여 더 알아보고싶으신 분들께서는 <a href="https://www.diabetes.or.kr/general/class/complications.php?code=complication&number=337&mode=view&idx=1">대한당뇨병학회</a>의 웹사이트로 들어가서 참조하시길 바랍니다. <br><br> <button type="button" onclick="https://www.diabetes.or.kr/general/index.html">대한당뇨병학회 홈페이지</button> <button type="button" onclick="https://www.diabetes.or.kr/general/class/complications.php?code=complication&number=337&mode=view&idx=1">당뇨병 합병증 설명</button>',
        'diabetes-pic06.png',
    DEFAULT, '당뇨병을 예방하기 위해서는 일단 당뇨병을 유발할 수 있는 환경 인자인 비만, 좌식 생활, 고지방 식사, 스트레스, 음주 등을 피하는 것이 최선입니다. 특히 가족 중에 당뇨병 환자가 있는 사람은 비만증이 생기지 않도록 식사량을 적절히 조절하고, 운동을 규칙적으로 해야 합니다.
<br><br>
또한, 무증상기의 당뇨병을 조기에 진단하기 위해서 다음에 해당하는 사람들은 매년 혈당 검사를 받을 것을 권장하고 있습니다.
① 45세 이상의 모든 성인
② 45세 미만이라도 과체중이거나 비만이면서 아래와 같은 위험 요인이 있는 경우
<ul>
    <li> 부모, 형제, 자식 중에 당뇨병 환자가 있는 사람</li>
    <li> 고혈압(혈압 140/90mmHg 이상)이 있거나 항고혈압 약물을 복용 중인 사람</li>
    <li> 이상지혈증을 가지고 있는 사람(HDL 콜레스테롤 35mg/dl 이하 또는 중성지방 250mg/dl 이상)>
    <li> 과거 내당능 장애 또는 공복 혈당 장애가 있었던 사람</li>
    <li> 임신성 당뇨병으로 진단받은 적이 있거나 4kg 이상의 거대아를 출산한 적이 있는 사람</li>
    <li> 심혈관 질환(뇌졸중, 관상동맥 질환, 말초혈관 질환)을 경험한 사람</li>
    <li> 평소에 운동을 하지 않는 사람</li>
</ul>',
        NULL,
    '당뇨, 당뇨병, diabetes, mellitus'
);


INSERT INTO TB_DISEASE VALUES(109, '대상포진', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(110, '독감', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(111, '비만', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(112, '알레르기 · 비염 · 천식', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(113, '자궁암', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(114, '파상풍', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(115, '폐렴', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');

INSERT INTO TB_DISEASE VALUES(901, '건강검진', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(902, '내시경', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(903, '비타민 주사', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(904, '예방접종', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(905, '초음파', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(906, '혈액검사', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');

COMMIT;----------------------------------------------------------------------------------------------------------------------------------





-- TB_SAVE_LIST TABLE SCRIPT FILE 
DROP TABLE TB_SAVE_LIST CASCADE CONSTRAINTS;
CREATE TABLE TB_SAVE_LIST(
	USER_NO	NUMBER,	
    DISEASE_NO	NUMBER, --  (DISEASE_NO = '관심질병정보') 
    CONSTRAINT PK_USER_DISEASE PRIMARY KEY(USER_NO, DISEASE_NO), -- 두 외래키를 묶어서 기본키로 설정
    CONSTRAINT FK_USER_NO FOREIGN KEY(USER_NO) REFERENCES TB_USER(USER_NO) ON DELETE SET NULL,
    CONSTRAINT FK_DISEASE_NO FOREIGN KEY(DISEASE_NO) REFERENCES TB_DISEASE(DISEASE_NO) ON DELETE SET NULL    
);
COMMENT ON COLUMN TB_SAVE_LIST.USER_NO IS '회원번호';
COMMENT ON COLUMN TB_SAVE_LIST.DISEASE_NO IS '관심질병번호';

-- SAMPLE DATA (샘플데이터) : TB_SAVE_LIST
INSERT INTO TB_SAVE_LIST VALUES(101, 108); -- user01, '제1형 당뇨병'
INSERT INTO TB_SAVE_LIST VALUES(102, 108); -- user02, '제1형 당뇨병'
INSERT INTO TB_SAVE_LIST VALUES(101, 109); 
INSERT INTO TB_SAVE_LIST VALUES(101, 111); 
INSERT INTO TB_SAVE_LIST VALUES(102, 112);
INSERT INTO TB_SAVE_LIST VALUES(102, 101);
INSERT INTO TB_SAVE_LIST VALUES(102, 103);

COMMIT;----------------------------------------------------------------------------------------------------------------------------------



--TB_DOCTOR TABLE SCRIPT FILE
DROP TABLE TB_DOCTOR CASCADE CONSTRAINTS;
CREATE TABLE TB_DOCTOR(
    DOC_NO	NUMBER	NOT NULL,
    DOC_NM	VARCHAR2(30) NOT NULL,
    DEPT_NO	NUMBER	NOT NULL,
    MAJOR	VARCHAR2(1000)	NULL,
    ACADEMIC_CAREER	VARCHAR2(1000)	NULL,
    CAREER	VARCHAR2(1000)	NULL	,
    ACADEMIC_ACTIVITY	VARCHAR2(1000)	NULL,
    DOMESTIC_ACTIVITY	VARCHAR2(1000)	NULL,
    INTERNATIONAL_ACTIVITY 	VARCHAR2(1000)	NULL,
    RESEARCH	VARCHAR2(1000)	NULL,
    JOURNAL	VARCHAR2(1000)	NULL,
    ETC	VARCHAR2(1000)	NULL,
    CONSTRAINT PK_DOC_NO PRIMARY KEY(DOC_NO),
    CONSTRAINT FK_DOC_NO FOREIGN KEY(DOC_NO) REFERENCES TB_USER (USER_NO) ON DELETE SET NULL,
    CONSTRAINT FK_DOCDEPT FOREIGN KEY(DEPT_NO) REFERENCES TB_DEPT (DEPT_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_DOCTOR.DOC_NO IS '의사 번호';
COMMENT ON COLUMN TB_DOCTOR.DOC_NM IS '의사명';
COMMENT ON COLUMN TB_DOCTOR.DEPT_NO IS '진료과 번호';
COMMENT ON COLUMN TB_DOCTOR.MAJOR IS '세부전공';
COMMENT ON COLUMN TB_DOCTOR.ACADEMIC_CAREER IS '학력';
COMMENT ON COLUMN TB_DOCTOR.CAREER IS '경력';
COMMENT ON COLUMN TB_DOCTOR.ACADEMIC_ACTIVITY IS '학회활동';
COMMENT ON COLUMN TB_DOCTOR.DOMESTIC_ACTIVITY IS '국내활동';
COMMENT ON COLUMN TB_DOCTOR.INTERNATIONAL_ACTIVITY IS '국외활동';
COMMENT ON COLUMN TB_DOCTOR.RESEARCH IS '논문';
COMMENT ON COLUMN TB_DOCTOR.JOURNAL IS '저서';
COMMENT ON COLUMN TB_DOCTOR.ETC IS '기타';

-- SAMPLE DATA (샘플데이터) : TB_DOCTOR TABLE
INSERT INTO TB_DOCTOR VALUES(1, (SELECT USER_NM FROM TB_USER WHERE USER_NO = '1'),1, '가정의학과', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '만성질환 및 당뇨클리닉 담당의사'); -- 근데 여러 과를 담당하고 있다면 어떻게 표시?
INSERT INTO TB_DOCTOR VALUES(2, (SELECT USER_NM FROM TB_USER WHERE USER_NO = '2'), 1, '가정의학과', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '건강검진 및 내시경 담당의사');

COMMIT;----------------------------------------------------------------------------------------------------------------------------------



-- TB_RESERVATION TABLE SCRIPT FILE
DROP TABLE TB_RESERVATION CASCADE CONSTRAINTS;
CREATE TABLE TB_RESERVATION(
    USER_NO   NUMBER	NOT NULL,
    RES_NO     NUMBER NOT NULL,
    RES_NM	    VARCHAR2(30) NOT NULL,
    RES_DATE	DATE	NOT NULL,
    RES_TIME	TIMESTAMP	NOT NULL,
    DEPT_NO	NUMBER	NOT NULL,
    DISEASE_NO	NUMBER	NOT NULL,
    DOC_NO	NUMBER	NOT NULL,
    CONSTRAINT PK_USER_RES PRIMARY KEY(USER_NO, RES_NO),
    CONSTRAINT FK_USERNO_RES FOREIGN KEY(USER_NO) REFERENCES TB_USER (USER_NO) ON DELETE SET NULL,
    CONSTRAINT FK_DEPTNO_RES FOREIGN KEY(DEPT_NO) REFERENCES TB_DEPT (DEPT_NO) ON DELETE SET NULL,
    CONSTRAINT FK_DOCNO_RES FOREIGN KEY(DOC_NO) REFERENCES TB_DOCTOR (DOC_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_RESERVATION.USER_NO IS '회원번호';
COMMENT ON COLUMN TB_RESERVATION.RES_NO IS '예약번호';
COMMENT ON COLUMN TB_RESERVATION.RES_NM IS '예약자 이름';
COMMENT ON COLUMN TB_RESERVATION.RES_DATE IS '예약 날짜';
COMMENT ON COLUMN TB_RESERVATION.RES_TIME IS '진료 시간';
COMMENT ON COLUMN TB_RESERVATION.DEPT_NO IS '진료과 번호';
COMMENT ON COLUMN TB_RESERVATION.DISEASE_NO IS '질병 코드';
COMMENT ON COLUMN TB_RESERVATION.DOC_NO IS '의사 번호';

DROP SEQUENCE SEQ_RESERVATION;
CREATE SEQUENCE SEQ_RESERVATION
START WITH 10000 -- 자동 숫자 발생기
INCREMENT BY 1
MAXVALUE 99999
CYCLE -- 예약이 89999번 된후에 다시 10000 부터 시작한다.
NOCACHE;

-- SAMPLE DATA (샘플데이터) : TB_RESERVATION TABLE
INSERT INTO TB_RESERVATION VALUES(
    '101', SEQ_RESERVATION.NEXTVAL, (SELECT USER_NM FROM TB_USER WHERE USER_NO='101'), '2021/01/31', '14:20', '1', '1', '1');
INSERT INTO TB_RESERVATION VALUES(
    '101', SEQ_RESERVATION.NEXTVAL, (SELECT USER_NM FROM TB_USER WHERE USER_NO='101'), '2021/03/31', '10:40', '1', '1', '1');

COMMIT;----------------------------------------------------------------------------------------------------------------------------------




-- TB_QA TABLE SCRIPT FILE
DROP TABLE TB_QA CASCADE CONSTRAINTS;

CREATE TABLE TB_QA(
    QA_NO           NUMBER NOT NULL,
    QA_WRITER      VARCHAR2(20) NOT NULL,
    QA_TITLE        VARCHAR2(200) NOT NULL,
    QA_CONTENT  VARCHAR2(4000) NOT NULL,
    QA_REF NUMBER,
    QA_REPLY_REF NUMBER,
    QA_REPLY_LEV NUMBER DEFAULT 1,
    QA_REPLY_SEQ NUMBER DEFAULT 1,
    QA_READCOUNT NUMBER DEFAULT 0,
    QA_DATE         DATE DEFAULT SYSDATE,
    CONSTRAINT PK_QA_NO PRIMARY KEY (QA_NO),
    CONSTRAINT FK_QA_WRITER FOREIGN KEY (QA_WRITER) REFERENCES TB_USER (USER_ID) ON DELETE SET NULL
);

COMMENT ON COLUMN TB_QA.QA_NO IS '문의사항 번호';
COMMENT ON COLUMN TB_QA.QA_WRITER IS '작성자 아이디';
COMMENT ON COLUMN TB_QA.QA_TITLE IS '게시글 제목';
COMMENT ON COLUMN TB_QA.QA_CONTENT IS '게시글 내용';
COMMENT ON COLUMN TB_QA.QA_DATE IS '작성날짜';
COMMENT ON COLUMN TB_QA.QA_REF IS '원글번호';  -- 원글번호
COMMENT ON COLUMN TB_QA.QA_REPLY_REF IS '참조답글번호';  -- 원글 : 0, 원글의 답글 : 자기번호, 답글의 답글 : 참조답글번호
COMMENT ON COLUMN TB_QA.QA_REPLY_LEV IS '답글단계'; -- 원글 : 0, 원글의 답글 : 1, 답글의 답글 : 2
COMMENT ON COLUMN TB_QA.QA_REPLY_SEQ IS '답글순번'; -- 원글 : 0, 같은 원글의 답글일 때 : 1 ....... 순차처리



DROP SEQUENCE SEQ_QANO;
CREATE SEQUENCE SEQ_QANO --문의사항 번호
START WITH 1 -- 자동 숫자 발생기
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;


INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '주차 문의', '주차 어디에 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '예약 문의', '예약 어떻게 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '건강 검진', '건강 검진 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '대장내시경', '아픈가여?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '비만관리', '얼마에요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '피부관리', '상담예약가능할까요',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '예방접종', '예방접종 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '당뇨병', '당뇨에 좋은 음식은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '주차 문의1', '주차 어디에 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '예약 문의1', '예약 어떻게 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '건강 검진1', '건강 검진 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '대장내시경1', '아픈가여?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '비만관리1', '얼마에요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '피부관리1', '상담예약가능할까요',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '예방접종1', '예방접종 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '당뇨병1', '당뇨에 좋은 음식은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '주차 문의2', '주차 어디에 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '예약 문의2', '예약 어떻게 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '건강 검진2', '건강 검진 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '대장내시경2', '아픈가여?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '비만관리2', '얼마에요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '피부관리2', '상담예약가능할까요',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '예방접종2', '예방접종 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '당뇨병2', '당뇨에 좋은 음식은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '주차 문의3', '주차 어디에 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '예약 문의3', '예약 어떻게 해야하나요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '건강 검진3', '건강 검진 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '대장내시경3', '아픈가여?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '비만관리3', '얼마에요?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '피부관리3', '상담예약가능할까요',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '예방접종3', '예방접종 가격은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '당뇨병3', '당뇨에 좋은 음식은?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

COMMIT;----------------------------------------------------------------------------------------------------------------------------------



-- TB_FAQ TABLE SCRIPT FILE
DROP TABLE TB_FAQ CASCADE CONSTRAINTS;
CREATE TABLE TB_FAQ(
    FAQ_NO     NUMBER   NOT NULL,
    FAQ_WRITER NUMBER   DEFAULT 3   NOT NULL,
    FAQ_TITLE   VARCHAR2(200)   NOT NULL,
    FAQ_TEXT   VARCHAR2(4000)   NOT NULL,
    FAQ_DATE   DATE DEFAULT SYSDATE NOT NULL ,
    CONSTRAINT PK_FAQ_NO PRIMARY KEY(FAQ_NO),
    CONSTRAINT FK_FAQ_WRITER FOREIGN KEY(FAQ_WRITER) REFERENCES TB_USER(USER_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_FAQ.FAQ_NO IS 'FAQ 번호';
COMMENT ON COLUMN TB_FAQ.FAQ_WRITER IS 'FAQ 작성자 번호';
COMMENT ON COLUMN TB_FAQ.FAQ_TITLE IS 'FAQ 제목';
COMMENT ON COLUMN TB_FAQ.FAQ_TEXT IS 'FAQ 내용';
COMMENT ON COLUMN TB_FAQ.FAQ_DATE IS 'FAQ 등록날짜';

DROP SEQUENCE SEQ_FAQ;
CREATE SEQUENCE SEQ_FAQ
START WITH 1 -- 자동 숫자 발생기
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (샘플데이터) : TB_FAQ TABLE
INSERT INTO TB_FAQ VALUES(SEQ_FAQ.NEXTVAL, DEFAULT, '오시는길 및 주차공간', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', DEFAULT);
INSERT INTO TB_FAQ VALUES(SEQ_FAQ.NEXTVAL, DEFAULT, '진료 예약하는 방법', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', DEFAULT);
INSERT INTO TB_FAQ VALUES(SEQ_FAQ.NEXTVAL, DEFAULT, '당뇨 및 합병증 상담', 'ㅇㅇㅇㅇㅇㅇㅇㅇ', DEFAULT);

COMMIT;----------------------------------------------------------------------------------------------------------------------------------





-- TB_NOTICE TABLE SCRIPT FILE
DROP TABLE TB_NOTICE CASCADE CONSTRAINTS;
CREATE TABLE TB_NOTICE(
    NOTICE_NO   NUMBER   NOT NULL,
    NOTICE_WRITER   NUMBER   NOT NULL,
    NOTICE_TITLE   VARCHAR2(50)   NOT NULL,
    NOTICE_CONTENT   VARCHAR2(2000)   NOT NULL,
    NOTICE_ORIGIN_FILE_NAME   VARCHAR2(50)   NULL,
    NOTICE_RENAME_FILE_NAME   VARCHAR2(50)   NULL,
    NOTICE_DATE   DATE   DEFAULT SYSDATE,
    NOTICE_COUNT   NUMBER DEFAULT 0,
    CONSTRAINT PK_NOTICE_NO PRIMARY KEY(NOTICE_NO)
);

DROP SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_NOTICE 
START WITH 1 -- 자동 숫자 발생기
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (샘플데이터) : TB_NOTICE
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, 0, 0, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO TB_NOTICE VALUES(SEQ_NOTICE.NEXTVAL, 1, SEQ_NOTICE.NEXTVAL, SEQ_NOTICE.NEXTVAL, NULL, NULL, DEFAULT, DEFAULT);


COMMIT;----------------------------------------------------------------------------------------------------------------------------------







-- TB_ADVERTISEMENT TABLE SCRIPT FILE
DROP TABLE TB_ADVERTISEMENT;
CREATE TABLE TB_ADVERTISEMENT(
    AD_NO               NUMBER	            NOT NULL,
    AD_WRITER	     NUMBER	            NOT NULL,
    CONTENT	         VARCHAR2(100)	NOT NULL,
    VISIBLE	             VARCHAR2(3)	    NOT NULL,
    START_VIS	         DATE	                NULL,
    END_VIS	             DATE	                NULL,
    AD_FILE_NAME	 VARCHAR2(500)	NOT NULL,
    RENAME_FILE	     VARCHAR2(500)	NULL,
    IMG_DATE	         DATE	                DEFAULT SYSDATE,
    UPLOAD_DATE    DATE	                DEFAULT SYSDATE,
    AD_TYPE	         NUMBER	            DEFAULT 1,
    CONSTRAINT PK_AD_NO PRIMARY KEY(AD_NO),
    CONSTRAINT FK_AD_WRITER FOREIGN KEY (AD_WRITER) REFERENCES TB_USER (USER_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_NO  IS '광고 번호';
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_WRITER IS '광고 작성자 번호';
COMMENT ON COLUMN TB_ADVERTISEMENT.CONTENT IS '광고내용';
COMMENT ON COLUMN TB_ADVERTISEMENT.VISIBLE IS 'Y= 공개, N= 비공개';
COMMENT ON COLUMN TB_ADVERTISEMENT.START_VIS IS '개시 기간 시작';
COMMENT ON COLUMN TB_ADVERTISEMENT.START_VIS IS '개시 기간 끝';
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_FILE_NAME IS '원래 파일명';
COMMENT ON COLUMN TB_ADVERTISEMENT.RENAME_FILE IS '바뀐  파일명';
COMMENT ON COLUMN TB_ADVERTISEMENT.IMG_DATE IS '광고 등록 날짜';
COMMENT ON COLUMN TB_ADVERTISEMENT.UPLOAD_DATE IS '작성자';
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_TYPE IS '광고창 유형 (1 = 배너, 2 = 전면광고)';

DROP SEQUENCE SEQ_AD;
CREATE SEQUENCE SEQ_AD
START WITH 1 -- 자동 숫자 발생기
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO TB_ADVERTISEMENT VALUES ( SEQ_AD.NEXTVAL, 1, '이건 광고 1입니다', 'N', NULL, NULL, 'first_ad', null, default, default, 0 );
INSERT INTO TB_ADVERTISEMENT VALUES ( SEQ_AD.NEXTVAL, 1, '이건 광고 2입니다', 'Y', NULL, NULL, 'second_ad', null, default, default, 1 );
INSERT INTO TB_ADVERTISEMENT VALUES ( SEQ_AD.NEXTVAL, 1, '이건 광고 3입니다', 'Y', NULL, NULL, 'fourth_ad', 'third_ad', default, default, 2 );

COMMIT;----------------------------------------------------------------------------------------------------------------------------------


