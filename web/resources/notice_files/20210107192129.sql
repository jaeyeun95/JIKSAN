--ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';
--ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'HH24:MI'; -- 'RR/MM/DD HH24:MI:SSXFF' ���⼭ HH24:MI���θ� ���ְ� ��

SELECT SYSDATE FROM DUAL; -- ��¥ ����Ȯ�ο�
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
COMMENT ON COLUMN TB_USER.USER_NO  IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_USER.USER_ID   IS '���̵�';
COMMENT ON COLUMN TB_USER.USER_PW   IS '��й�ȣ';
COMMENT ON COLUMN TB_USER.USER_NM   IS '�̸�';
COMMENT ON COLUMN TB_USER.BIRTHDAY   IS '�������';
COMMENT ON COLUMN TB_USER.GENDER   IS '����';
COMMENT ON COLUMN TB_USER.PHONE   IS '��ȭ��ȣ';
COMMENT ON COLUMN TB_USER.ADDRESS   IS '�ּ�';
COMMENT ON COLUMN TB_USER.NICK_NM   IS '�г���';
COMMENT ON COLUMN TB_USER.USER_LV   IS '1 = ȯ��, 2 = �Ƿ���, 3 = ������';
COMMENT ON COLUMN TB_USER.LOGINOK IS '�α��� ��Ȯ��';
COMMENT ON COLUMN TB_USER.ENROLL_DATE IS 'ȸ������ ��¥';
COMMENT ON COLUMN TB_USER.LAST_MODIFIED IS 'ȸ������ ������ ���� ��¥';

DROP SEQUENCE SEQ_DOCNO; --�ǻ�, �Ƿ���, ������ ȸ����ȣ �ڵ� �߻���
CREATE SEQUENCE SEQ_DOCNO
START WITH 1 -- �ڵ� ���� �߻���
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_USERNO; --�Ϲ� ȸ����ȣ �ڵ� �߻���
CREATE SEQUENCE SEQ_USERNO
START WITH 101 -- �ڵ� ���� �߻���
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (���õ�����) : TB_USER
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'doctor01', '1234', '������', '1964/01/01', 'F', '01012345555', 
                                            '�泲 õ�Ƚ� ���ϱ� ������ ����� 31 2��', '1����ǿ����', DEFAULT, 2, DEFAULT, NULL);
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'doctor02', '1234', '�ڿ���', '1967/01/01', 'F', '01012346666', 
                                            '�泲 õ�Ƚ� ���ϱ� ������ ����� 31 2��', '2����ǿ����', DEFAULT, 1, DEFAULT, NULL);           
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'headofdept', '1234', '������', '1970/01/01', 'M', '01012347777', 
                                            '�泲 õ�Ƚ� ���ϱ� ������ ����� 31 2��', '���갡�����а��ǿ�', DEFAULT, 2, DEFAULT, NULL);
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'nurse01', '1234', '��ȣ��', '1965/01/01', 'F', '01012348888', 
                                            '�泲 õ�Ƚ� ���ϱ� ������ ����� 31 2��', '��ȣ������(1)', DEFAULT, 1, DEFAULT, NULL);                  
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'nurse02', '1234', '����ȣ��', '1965/01/01', 'F', '01012349999', 
                                            '�泲 õ�Ƚ� ���ϱ� ������ ����� 31 2��', '��ȣ������(2)', DEFAULT,  1, DEFAULT, NULL);                      
INSERT INTO TB_USER VALUES(SEQ_DOCNO.NEXTVAL, 'nurse03', '1234', '�谣ȣ��', '1966/01/01', 'F', '01012340000', 
                                            '�泲 õ�Ƚ� ���ϱ� ������ ����� 31 2��', '��ȣ��(1)', DEFAULT, 1, DEFAULT, NULL);      
INSERT INTO TB_USER VALUES(SEQ_USERNO.NEXTVAL, 'user01', '1234', 'ȫ���', '1994/01/01', 'F', '01011111111',  -- USER_NO (ȸ����ȣ) = SEQ_USERNO.NEXTVAL = START WITH 101 �̶� USER01�� ȸ����ȣ�� 101
                                            '�泲 õ�Ƚ� ���ϱ� ����� 33', '�Ϲݻ����1', DEFAULT, 0, DEFAULT, NULL);
INSERT INTO TB_USER VALUES(SEQ_USERNO.NEXTVAL, 'user02', '1234', 'ȫ�浿', '1996/01/01', 'F', '01011112222', 
                                            '�泲 õ�Ƚ� ���ϱ� ����� 33', '�Ϲݻ����2', DEFAULT, 0, DEFAULT, NULL);

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
COMMENT ON COLUMN TB_MEMBERS.USER_NO  IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBERS.USER_ID   IS '���̵�';
COMMENT ON COLUMN TB_MEMBERS.USER_PW   IS '��й�ȣ';
COMMENT ON COLUMN TB_MEMBERS.USER_NM   IS '�̸�';
COMMENT ON COLUMN TB_MEMBERS.USER_LV   IS '0 = ȯ��, 1 = �Ƿ���, 2 = ������';

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
COMMENT ON COLUMN TB_DEPT.DEPT_NO IS '����� ��ȣ';
COMMENT ON COLUMN TB_DEPT.DEPT_NM IS '����� ��';

DROP SEQUENCE SEQ_DEPT;
CREATE SEQUENCE SEQ_DEPT
START WITH 1 -- �ڵ� ���� �߻���
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (���õ�����) : TB_USER
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '�������а�'); -- DEPT_NO = 1
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '����');  -- DEPT_NO = 2
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '�Ҿư�'); -- DEPT_NO = 3
INSERT INTO TB_DEPT VALUES(SEQ_DEPT.NEXTVAL, '�̺����İ�'); -- DEPT_NO = 4

COMMIT;----------------------------------------------------------------------------------------------------------------------------------






-- TB_DISEASE TABLE SCRIPT FILE
DROP TABLE TB_ABOUT_DISEASE CASCADE CONSTRAINTS;
DROP TABLE TB_DISEASE CASCADE CONSTRAINTS;
CREATE TABLE TB_DISEASE(
	DISEASE_NO	NUMBER,	
    DISEASE_NM VARCHAR2(50) NOT NULL,
	DEPT_NO	NUMBER DEFAULT 1 NOT NULL,
    RESERVABLE CHAR(1) DEFAULT 'N' NOT NULL, 
    SECT01 VARCHAR2(50) DEFAULT '<H2>����</H2>' ,
    TEXT01 VARCHAR2(4000),
    PIC01 VARCHAR2(100),
    SECT02 VARCHAR2(50) DEFAULT '<h2>����</h2><h3><i> �� ��������</i></h3>' ,
    TEXT02 VARCHAR2(4000) ,
    PIC02 VARCHAR2(100) ,
    SECT03 VARCHAR2(50) DEFAULT '<h2>����</h2>',
    TEXT03 VARCHAR2(4000),
    PIC03 VARCHAR2(100),
    SECT04 VARCHAR2(50) DEFAULT '<h2>�˻� �� ����</h2>',
    TEXT04 VARCHAR2(4000),
    PIC04 VARCHAR2(100),
    SECT05 VARCHAR2(50) DEFAULT '<h2>ġ��</h2><h3><i> ��� �� ����</i></h3>',
    TEXT05 VARCHAR2(4000),
    PIC05 VARCHAR2(100),
    SECT06 VARCHAR2(50) DEFAULT '<h2>�պ���</h2>',
    TEXT06 VARCHAR2(4000),
    PIC06 VARCHAR2(100),
    SECT07 VARCHAR2(50) DEFAULT '<h2>���ǻ���</h2>',
    TEXT07 VARCHAR2(4000),
    PIC07 VARCHAR2(100),
    DISEASE_ALT_NM VARCHAR2(500),
    CONSTRAINT PK_DISEASE PRIMARY KEY (DISEASE_NO),
    CONSTRAINT FK_DEPT_NO FOREIGN KEY (DEPT_NO) REFERENCES TB_DEPT (DEPT_NO) ON DELETE SET NULL
);
COMMENT ON COLUMN TB_DISEASE.DISEASE_NO IS '������ȣ';
COMMENT ON COLUMN TB_DISEASE.DISEASE_NM IS '������';
--COMMENT ON COLUMN TB_DISEASE.DIABETES_COMP IS '�索���պ��� N=�ƴϴ�, Y=�պ����̴�';
COMMENT ON COLUMN TB_DISEASE.DEPT_NO IS '����� ��ȣ';

COMMENT ON COLUMN TB_DISEASE.RESERVABLE IS '���డ��';

COMMENT ON COLUMN TB_DISEASE.SECT01 IS '����';
COMMENT ON COLUMN TB_DISEASE.TEXT01 IS '����: ����';
COMMENT ON COLUMN TB_DISEASE.PIC01 IS '���� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.SECT02 IS '����';
COMMENT ON COLUMN TB_DISEASE.TEXT02 IS '����: ����';
COMMENT ON COLUMN TB_DISEASE.PIC02 IS '���� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.SECT03 IS '����';
COMMENT ON COLUMN TB_DISEASE.TEXT03 IS '����: ����';
COMMENT ON COLUMN TB_DISEASE.PIC03 IS '���� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.SECT04 IS '�˻� �� ����';
COMMENT ON COLUMN TB_DISEASE.TEXT04 IS '�˻� �� ����: ����';
COMMENT ON COLUMN TB_DISEASE.PIC04 IS '�˻� �� ���� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.SECT05 IS 'ġ��';
COMMENT ON COLUMN TB_DISEASE.TEXT05 IS 'ġ��: ����';
COMMENT ON COLUMN TB_DISEASE.PIC05 IS 'ġ�� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.SECT06 IS '�պ���';
COMMENT ON COLUMN TB_DISEASE.TEXT06 IS '�պ���: ����';
COMMENT ON COLUMN TB_DISEASE.PIC06 IS '�պ��� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.SECT07 IS '���ǻ���';
COMMENT ON COLUMN TB_DISEASE.TEXT07 IS '���ǻ���: ����';
COMMENT ON COLUMN TB_DISEASE.PIC07 IS '���ǻ��� �ڷ�';
COMMENT ON COLUMN TB_DISEASE.DISEASE_ALT_NM IS 'ALTERNATIVE NAME ��ȯ�� ���Ǿ�';


DROP SEQUENCE SEQ_DISEASE;
--CREATE SEQUENCE SEQ_DISEASE
--START WITH 001 -- �ڵ� ���� �߻���
--INCREMENT BY 1
--NOMAXVALUE
--NOCYCLE
--NOCACHE;

-- SAMPLE DATA (���õ�����) : TB_DISEASE TABLE
INSERT INTO TB_DISEASE VALUES(101, '����', DEFAULT, DEFAULT,
    DEFAULT, '<b>����</b>�� ���� �ǹ̷� "��⵵��"�̶�� �� ���⵵ ������ ���� ��, ���ĺ�, �κ�, ���, �����, ��� ���� ȣ��⿡ ���̷����� ������ �Ǹ鼭 �Ͼ�� ��ǥ���� ȣ�����ȯ�� �޼� ������ ��ȯ�̴�.', 
        'cold-01.png', 
    DEFAULT, '�޼� ���̷����� ���εο� Ȥ�� �޼������� ��, �񱸸� �� ��� ȣ��谡 ���̷����� �����Ǿ� �ߺ��Ѵ�. ���̷��� ����: <br> <ul> <li> ������̷���(rhinovirus)</li> <li> �ڷγ����̷���(coronavirus)</li> <li> ����Ķ����÷翣�ڹ��̷��� (Human parainfluenza virus, HPIV)</li> <li> ���ȣ��⼼�����չ��̷���(Respiratory syncytial virus, RSV)</li> <li> �Ƶ�����̷���(adenovirus)</li> <li> ... ��</li> </ul>', 
        NULL,
    DEFAULT, '<ul> <li> ��ä��</li> <li> �ڸ���</li> <li> �๰</li> <li> ������</li> <li> ��ħ</li> <li> �̿�</li> <li> ����</li> <li> ������</li> </ul>',
        'cold-03.png', 
    DEFAULT, '������ ������ ȯ���� �๰ ���� ��ü�� �̿��Ͽ� ���⸦ ����Ų ���� ���̷����� ã�����ν� ���������� �Ϲ������� ����� ��κ� �ڿ������� ġ���Ǳ� ������ �ӻ󿡼��� �� ������� �ʴ´�. ���� ������ ������ ȯ���� ���� �� ¡�ĸ� ���� �Ǵ��ϰ� �Ǹ�, �ٸ� �������� ������ ���� ���� �������� ���� �Կ� �� ���װ˻� �� ������ �� �� �ִ�.',
        NULL,
    DEFAULT, '�๰����������� ������ ���� ����, ���� ���� �ؿ����� �����ϰ�, ��ħ���� ������ ���ϰ�, ������ ������ �ϸ� �������� ����� Ȯ����(�⵵�� ���μ� �������� ���� ��쿡 ȿ��) �ǻ��� ó�濡 ���� �����Ѵ�.', 
        NULL, 
    DEFAULT, '���⿡�� ����� ���·��� ������ �պ����� �����ϱ� ������ ���� ġ���ϴ� ���� ����. <ul> <li> ���̿�</li> <li> �κ񵿿�</li> <li> �������</li> <li> �𼼱����</li> <li> �ĵο�</li> <li> ���</li> <li> ... ��</li> </ul>',
        NULL,
    DEFAULT, '����� ��ü�� �������ε� ���ĵ˴ϴ�. ���� ���� ���� �İ�, �ڸ� �Ժη� �ĺ��� ����, ���� ȯ�ڿ��� ������ ���ϴ� ���� ���� �����ϴ�. ������ ���� �����ϰ� ������ �µ��� ������ �����ϴ� �͵� ���� ������ ������ �˴ϴ�.',
        'cold-pic07.png',
    '����, ��⵵ ����, common cold, ��ħ, �๰'
);
INSERT INTO TB_DISEASE VALUES(102, '���󼱱��������', DEFAULT, 'Y',
    DEFAULT, '<b>���󼱱��������</b>�� �츮 ���� �ʿ��� ����ȣ������ �����Ͽ� ��Ÿ���� ��ȯ�� �ǹ��մϴ�.', 
        'thyroid-pic01.png', 
    DEFAULT, '���󼱱���������� ���� ��ü�� ������ ���ܼ� ����ȣ������ ������ �����ϰų�, ���� ������ ���� ����ȣ������ �к� �ڱ��ϴ� �����ڱ�ȣ����(TSH)�� ������ ���������ν� ����ȣ������ ����� ������ ���Ͽ� ��Ÿ���ϴ�.', 
        NULL,
    DEFAULT, '���󼱱���������� ������ �ſ� �پ��ϸ�, �ٸ� ��ȯ���� ��Ÿ���� ����� ������ ��찡 ����. <ul> <li> �¸��� ��� ��� ����</li> <li> �Ǻδ� �����ϰ� â���ϸ� ������ ��</li> <li> ���� �Ƿ���</li> <li> �ǿ� ������ ���� �� �� ��</li> <li> ���� ����</li> <li> ��Ҹ��� ���� ���� ������</li> <li> �Ŀ� ������, ���� �װ� ü�� ����</li> <li> ... ��</li> </ul> ������ ��� ���� ���淮�� �����մϴ�. ���󼱱������������ ��Ÿ���� ������ �հ������� ������ ���� �ڸ��� ������ �ʴ´ٴ� Ư¡�� �ֽ��ϴ�.',
        'hypothy-pic03.png', 
    DEFAULT, '������ ���� ���� ������ ũ��, �˰�, ��Ī�� ���� �����ϰ�, �Ǻ�, ���, ����, ���� � ���󼱱������������ ���� �Ұ��� �ִ��� Ȯ���մϴ�. ���� ���� ����ȣ���� �󵵿� �����ڱ�ȣ���� �󵵸� �����Ͽ� �̸� ������ �� �ֽ��ϴ�. ���� �� ���󼱿��� Ȥ(����)�� �߰ߵǸ� ���� ������ ���� ���� �˻簡 �ʿ��� ��쵵 �ֽ��ϴ�.',
        NULL,
    DEFAULT, '���󼱱���������� ġ��� �����մϴ�. ������ ����ȣ������ �����ϴ� ���Դϴ�. �׷��� ��κ��� ��� ���󼱱���������� �� �� �߻��ϸ� �������̾ ��� ����ȣ�������� �����ؾ� �մϴ�. ���� �Ϻ� ���󼱿��� ��� ���� �Ⱓ ġ�� �� ���� ����� ȸ���Ǿ� ȣ�������� ������ �ߴ��� ���� �ֽ��ϴ�.', 
        NULL, 
    DEFAULT, '<ul> <li> ���� ��ȯ</li> <li> ��������</li> <li> ���ư�ȭ��</li> <li> ���׼����� ȥ��</li> <li> ... ��</li> </ul>',
        NULL,
    DEFAULT, '�밳 ������ ��� ������� �ʿ��� ����ȣ������ ���� �����մϴ�. ���� �ϴ� �ʿ䷮�� �����Ǹ� ������ ���� ����ȣ�������� �����ϰ� �ִ� ���ȿ��� ���� ��ȭ�� �����ϴ�. �׷��Ƿ� ������ ���� ���� �ʿ䵵 ����, ���Ŀ��� �� �⿡ �� �� ���� ���� �˻縦 �����ؼ� Ȥ�� ����ȣ������ �ʿ䷮�� �޶����� �ʴ��� �˾ƺ��� ������ ����մϴ�. ���� ������ ����ȣ������ ���� ���·� �����ϴ� ���̹Ƿ� ����ȣ�������� ��Ⱓ �����Ѵٰ� �Ͽ� ���ۿ��� ����� ���� ����� �����ϴ�.',
        NULL,
    '���� ��ȯ, ������������, �����������, ���󼱱������, ����������, hypothyroidism, thyroid'
);
INSERT INTO TB_DISEASE VALUES(103, '���󼱱��������', DEFAULT, 'Y',
    DEFAULT, '<b>���󼱱��������</b>�� ����ȣ������ ���󺸴� ���� �к�Ǿ� ���� �������� ���� �Ҹ�ǰ� ���� ����� �����Ǵ� ������ ���մϴ�.', 
        'thyroid-pic01.png', 
    DEFAULT, '���󼱱���������� ���� ���� ������ �ڰ��鿪 ��ȯ�� ���� ���Դϴ�. �ڰ��鿪 ��ȯ�̶� �ܺο��� ���� ���̷����� �����ؾ� �ϴ� �鿪���� �ڽ��� ���� �ܺ� ���̷����� �����ϰ� �����ϴ� ��ȯ�Դϴ�.', 
        'hyperthy-pic02.png',
    DEFAULT, '���� ����� �����Ǹ� ���� ���� ������ ��Ÿ���ϴ�. ��ü�� ���� ��Ⱑ �����Ǿ� �ֱ� ������ ������ �־ �ٴ� ȿ���� ��Ÿ���ϴ�.<br> <ul> <li> ���� �̻�</li> <li> �ɹڵ� ���� ������</li> <li> ���� ����</li> <li> �Ű������̰� ������������</li> <li> ���� �� ���� ��ȭ</li> <li> �Ҹ���</li> <li> �Ǻ� ������</li> <li> Ż����</li> <li> ... ��</li> </ul>',
       'hyperthy-pic03.png', 
    DEFAULT, '���󼱱���������� �����ϱ� ���Ͽ� ���� �˻縦 �ʼ������� �����ؾ� �մϴ�. ���� �˻縦 ���� ����ȣ������ �󵵸� �˻��մϴ�. ���� ���� ������, ���� ��ĵ � ������ �� �ֽ��ϴ�. <ul> <li> ���� �˻�</li> <li> ���� ������</li> <li> ���� ��ĵ</li> </ul>',
        NULL,
    DEFAULT, '���󼱱���������� ġ�� ������� �� ������ �ֽ��ϴ�. ù ��°�� �װ��� ���� �����ϴ� �������, �츮���󿡼� ���� ���� �̿��ϴ� ġ�� ����Դϴ�. �� ��°�� ��缺 ����� ġ���Դϴ�. ���� �����ϰ� �δٴ� ������ ������, ���󼱱���������� ��Ÿ�� �� ������ �ӻ�ο��Դ� ������ �� �����ϴ�. �� ��°�� ���� ����Դϴ�. �������� �ſ� ũ�ų� ��缺 ����� ġ�Ḧ ��ġ �ʴ� ��쿡 ������ �� �ֽ��ϴ�. <ul> <li> �װ��� ���� ����</li> <li> ��缺 ����� ġ��</li> <li> ���� ���</li> </ul>', 
        NULL, 
    DEFAULT, '���� ����������ȯ�ڰ� ������ ġ�Ḧ ���� ���� ���¿��� ���۽����� ��Ʈ������ ������ �����ϸ� ���� �ߵ������� �̾��� �� �ֽ��ϴ�. �� �� ���� ����, ���� ���(���� �ڵ����� �д� 100ȸ �̻����� �������� ����), ���, �ǽ� ���, ȥ�� ���� �����ϸ� ������, ����, ���� � ��Ÿ���ϴ�. ���� �����, �������� ���帮��, �ɺ��� ���� �������� ����� ��ٰ����� �պ����� ��Ÿ�� �� �ֽ��ϴ�.<br><br>�׷��Ƿ� ������ ġ��� ���� �ߵ����� �����ؾ� �մϴ�. <ul> <li> �����</li> <li> ���� ���(���� �ڵ����� �д� 100ȸ �̻����� �������� ����)</li> <li> �������� ��ȯ (�ɺ���, �������� ���帮��)</li> <li> ���� �� ���� ��ȭ</li> <li> ��ٰ���</li> <li> ... ��</li> </ul>',
        NULL,
    DEFAULT, '�װ��� �๰�� ���� ���� ���, ��缺 ����� ġ�Ḧ �����ϱ� ���� ��ĥ ���� ������ �ߴ��ؾ� �մϴ�. ���� ������ �ſ� ū ��쿡�� ��缺 ����� ġ�� �� ���� �� �ִ� �й� ���� ���� �����ϱ� ���� �������� ġ�ᰡ �ʿ��� �� �ֽ��ϴ�.<br><br>�ӽ� �� ���� ��� �������� ����� �������� �ʾҴ� ��쿡�� ����, �ӽż� ������, �̼���, ��ü��, �ڱó� ��������, ���, �����ߵ�����, ����� ������ �ɺ��� ���� ������ �ֽ��ϴ�.',
        NULL,
    '���� ��ȯ, ���󼱱��������, ����� ��� ������,�����������, ���� ������'
);

INSERT INTO TB_DISEASE VALUES(104, '��������', DEFAULT, DEFAULT, 
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(105, '������', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(106, '��ٰ���', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(107, '������', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');




INSERT INTO TB_DISEASE VALUES(108, '�索��', DEFAULT, 'Y',
    DEFAULT, '<b>�索��</b>�� �������� ������(����)�� ���Ƽ� �Һ����� �������� ���� �����µ��� ������ �̸��Դϴ�. �������� ��� �Һ����� ���� ���ĳ��� ���� ������ ������ �����˴ϴ�. ���⿡�� ���忡�� �к�Ǵ� <b>�ν���</b>�̶�� ȣ������ �߿��� �ۿ��� �մϴ�. �̷��� �ν����� ���ڶ�ų� ����� ���� �� �ϴ� ���°� �Ǹ� ������ ����ϸ�, �̷� ���� ������ ���������� ���� ���°� �˴ϴ�. �̷��� ���¸� �索���̶�� �մϴ�. <br><br> <p><b>�� 1�� �索��</b></p>�ַ� �Ҿƿ��� �߻��ϳ�, ���ο����� ��Ÿ�� �� �ֽ��ϴ�. �޼� �ߺ��� �ϸ� ���� ����, �ٴ�, ü�߰��� ��� ���� ������� ��Ÿ����, �ν����� �������� �������� ���Ͽ� ��������� �Ͼ�ϴ�. �������� ���� �� ��������� ���� ����� �����ϱ� ���� �ν���ġ�ᰡ �ݵ�� �ʿ��մϴ�.<br> <p><b>�� 2�� �索��</b></p>�索�� �ѱ��� �索���� ��κ��� �����ϸ� ü�������� ���� ������ ��������� �����ϴ�. ��Ȱ������ ������� Į�θ��� ���׼��밡 ���ų� ��������� ����� �����ϰ� ���� ��Ʈ������ ����Ǹ� �ν����� ������ �������� �索���� �����Ǹ� ��� �������� ���� ��� �ν��� �к��� ���Ұ� ������ �˴ϴ�. �ַ� 40�� ���Ŀ� ���� �߻��ϰ� �� �� �̻��� ȯ�ڰ� ��ü���̰ų� ������ ���� �ֽ��ϴ�.<br> <p><b>�ӽż� �索��</b></p>�ӽż� �索���̶� �ӽ� �� ó�� �߰ߵǾ��ų� �ӽ��� ���۰� ���ÿ� ���� ������ �̻��� ���ϸ� �ӽ� �� ���ܵ� �索������ ���е˴ϴ�. �ӻ���� 2��3%�� �ߺ��ϸ�, ��κ��� ��� �� ����ȭ�˴ϴ�. ������ �ӽ� �߿��� ���������� ������ ��������� ����� ��� �¾� ����� �� ��õ�� ������ ��ȯ���� �����Ƿ� ���Ǹ� ���մϴ�.<br>', 
        'thyroid-pic01.png', 
    DEFAULT, '�索���� �߻����� ������ ȯ���� �߿��� ������ �մϴ�. ��, �索���� �̰Ϳ� �ɸ��� ���� ������ ü���� �θ�κ��� �������� ����� �索���� �����ϱ� ���� ȯ�濡 ����� �� �߻��� �� �ֽ��ϴ�. ������ ������� �索���� ����Ű�� �������� �̻��� ã�� �� �ִ� ���� ��ü �索���� 1% �̸��� �Ұ��մϴ�. ��κ��� �索�������� ���� �����ڰ� ��Ȯ�� �������� �ʾҽ��ϴ�.
<br><br>�索���� ������ �� �ִ� ȯ�� ���ڷδ� ���, ��, ��Ʈ����, �ӽ�, ����, �๰(���׷��̵�����, �鿪������, �̴���) ���� �ֽ��ϴ�. ȯ�� ���ڴ� ���� ���ڿʹ� �޸� ������ ������� ��� ���� ���� �� �ֽ��ϴ�. �ֱ� ��� �索���� �����ϴ� ������ �������� ���κ��ٴ� ������ ���Ĺ� ����� ��� ���ҷ� ���� ������ ���� �������� �������ϴ�. �ܰ��� ���� �Դ´ٰ� �索���� �������� ������, �ܰ��� ���� ������ ü���� �þ �� ������, ������ ����� �索���� ���� ���輺�� �����մϴ�.', 
        'diabetes-pic02.png',
    DEFAULT, '�索���� ���� ��ǥ���� ������ �����(߲��)����� �θ��ϴ�. <ul> <li><b> ���� (����) : </b>  ���� ���� ����</li> <li><b> �ٴ� (����) : </b>   �Һ��� ���� ��</li> <li><b> �ٽ� (����) : </b>  ���� ����</li> </ul> �� �� �索���� �������δ� �� ħħ��, �չ� ����, ������ ��� �� �Ҿ��� ���� ��Ÿ�� �� �ֽ��ϴ�. ������ ������ ���� ���� ���� ��쿡�� ��κ� Ư���� ������ ������ ���մϴ�.',
       'hyperthy-pic03.png', 
    DEFAULT, '�索���� ������ �����Ͽ� �����մϴ�. �̶� ���� �˻�� �հ��� ������ ä���� �ϴ� ���� ������ �˻簡 �ƴ϶�, �������� ä���Ͽ� �Ƕ��� ��������� ������ ���� ���� ���и��� �и��Ͽ� ������ �󵵸� �����ϴ� �˻��Դϴ�. ���ſ� ���� �����ϴ� ��� �˻�� �索���� �־ �������� ���� �� �ְ�, �索���� �ƴϴ��� �缺���� ���� �� �����Ƿ� ���� �˻�δ� �������մϴ�.
<br><br>���� ���� �θ� ���ǰ� �ִ� �索���� ���� ������ <i>�索���� ���� ���� �� �з��� ���� ��������ȸ</i>���� ������ ������, ������ �����ϴ�:
<ul>
    <li>�索���� Ư¡���� ������ ���� ���� �԰� �Һ��� ���� ���� ������ ��Ÿ��. �ٸ� Ư���� �������� ������ �� ���� ü�� ���Ұ� ��Ÿ��. �Ļ� �ð��� ������� ������ ������ 200mg/dL �̻���. </li>
    <li>8�ð� ���� ���� ���밡 ���� ���� ���¿��� ������ ���� ������ 126mg/dL �̻�</li>
    <li>�汸 ����� �˻翡�� 75mg�� �������� ������ �� ������ 2�ð�° ������ 200mg/dL �̻�</li>
</ul>
<br>���� �� ���� ���� �� ��� �� ���Ǹ� �����ϸ� �索������ ������ �� �ֽ��ϴ�. �׷��� ����� ������ �����̳� �޼� ��� �̻��� �ִ� ��츦 �����ϰ�� �ٸ� ���� �ݺ� �˻縦 �����Ͽ� �� �� �̻� ���� ������ ������ �� �索������ �����մϴ�.',
        'diabetes-pic04.png',
    DEFAULT, '�索���� ġ�� ������δ� �Ļ� ���, � ���, �๰ ġ�ᰡ �ֽ��ϴ�. ������ �索���� �Ļ� ����� � ��������ε� ȿ�������� ġ���� �� �ֽ��ϴ�. �Ļ� ����� � ��������� ������ ���� ���� ������ �̷������ ���� �� �๰ ����� �߰��մϴ�. ������ �๰ ����� �޴� �߿��� �ݵ�� �Ļ� ����� � ����� �����ؾ� �մϴ�. �๰ ������� �汸 ���簭������ �ν��� �ֻ簡 �ִµ�, �索���� ����, ȯ���� ����, �պ����� ������ ���� ġ�� �๰�� �����մϴ�.', 
        NULL, 
    DEFAULT, '<p><b>(1) �޼��պ���</b></p> �索������ ���� �߻��ϴ� �޼��պ������� ������ ����ġ�� ���� ������ ��Ÿ���� �Ͱ�, �ݴ�� ������ �ʹ� �������� ��Ÿ���� ���� �ֽ��ϴ�. <br><br> <ul> <li> �����缺 ȥ��</li> <li> ���������</li> <li> ������</li> </ul> <br><br> <p><b>(2) �����պ���</b></p> �����պ����� �ϴ� �ߺ��Ǹ� ġ�ᰡ ��ƽ��ϴ�. ���� ġ�Ẹ�ٴ� �����ϴ� ���� �ּ��� ����Դϴ�. �ϴ� �ߺ��Ǿ��ٰ� �ϴ��� ������ �������� �����Ͽ� �պ����� ����ӵ��� ���߾�� �մϴ�. <br><br> <ul> <li> �������� ��ȯ ���ư�ȭ��</li> <li> ������</li> <li> ������ �����</li> <li> ������ȯ �索���� ����</li> <li> ����ȯ �索���� ������</li> <li> �索���� ������</li> <li> �Ǻ���ȯ ������</li> <li> �� ��</li> <li> �索���� ��������</li> <li> ����</li> <li> ������ȯ</li> </ul> <br> �� �索�պ����� ���Ͽ� �� �˾ƺ�������� �е鲲���� <a href="https://www.diabetes.or.kr/general/class/complications.php?code=complication&number=337&mode=view&idx=1">���Ѵ索����ȸ</a>�� ������Ʈ�� ���� �����Ͻñ� �ٶ��ϴ�. <br><br> <button type="button" onclick="https://www.diabetes.or.kr/general/index.html">���Ѵ索����ȸ Ȩ������</button> <button type="button" onclick="https://www.diabetes.or.kr/general/class/complications.php?code=complication&number=337&mode=view&idx=1">�索�� �պ��� ����</button>',
        'diabetes-pic06.png',
    DEFAULT, '�索���� �����ϱ� ���ؼ��� �ϴ� �索���� ������ �� �ִ� ȯ�� ������ ��, �½� ��Ȱ, ������ �Ļ�, ��Ʈ����, ���� ���� ���ϴ� ���� �ּ��Դϴ�. Ư�� ���� �߿� �索�� ȯ�ڰ� �ִ� ����� ������ ������ �ʵ��� �Ļ緮�� ������ �����ϰ�, ��� ��Ģ������ �ؾ� �մϴ�.
<br><br>
����, ��������� �索���� ���⿡ �����ϱ� ���ؼ� ������ �ش��ϴ� ������� �ų� ���� �˻縦 ���� ���� �����ϰ� �ֽ��ϴ�.
�� 45�� �̻��� ��� ����
�� 45�� �̸��̶� ��ü���̰ų� ���̸鼭 �Ʒ��� ���� ���� ������ �ִ� ���
<ul>
    <li> �θ�, ����, �ڽ� �߿� �索�� ȯ�ڰ� �ִ� ���</li>
    <li> ������(���� 140/90mmHg �̻�)�� �ְų� �װ����� �๰�� ���� ���� ���</li>
    <li> �̻��������� ������ �ִ� ���(HDL �ݷ����׷� 35mg/dl ���� �Ǵ� �߼����� 250mg/dl �̻�)>
    <li> ���� ����� ��� �Ǵ� ���� ���� ��ְ� �־��� ���</li>
    <li> �ӽż� �索������ ���ܹ��� ���� �ְų� 4kg �̻��� �Ŵ�Ƹ� ����� ���� �ִ� ���</li>
    <li> ������ ��ȯ(������, ���󵿸� ��ȯ, �������� ��ȯ)�� ������ ���</li>
    <li> ��ҿ� ��� ���� �ʴ� ���</li>
</ul>',
        NULL,
    '�索, �索��, diabetes, mellitus'
);


INSERT INTO TB_DISEASE VALUES(109, '�������', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(110, '����', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(111, '��', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(112, '�˷����� �� �� �� õ��', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(113, '�ڱþ�', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(114, '�Ļ�ǳ', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(115, '���', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');

INSERT INTO TB_DISEASE VALUES(901, '�ǰ�����', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(902, '���ð�', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(903, '��Ÿ�� �ֻ�', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(904, '��������', DEFAULT, DEFAULT,
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(905, '������', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');
INSERT INTO TB_DISEASE VALUES(906, '���װ˻�', DEFAULT, 'Y',
    DEFAULT, '111', NULL, DEFAULT, '222', NULL, DEFAULT, '333', NULL, DEFAULT, '444', NULL, DEFAULT, '555', NULL, DEFAULT, '666', NULL, DEFAULT, '777', NULL, 'SYNONYM');

COMMIT;----------------------------------------------------------------------------------------------------------------------------------





-- TB_SAVE_LIST TABLE SCRIPT FILE 
DROP TABLE TB_SAVE_LIST CASCADE CONSTRAINTS;
CREATE TABLE TB_SAVE_LIST(
	USER_NO	NUMBER,	
    DISEASE_NO	NUMBER, --  (DISEASE_NO = '������������') 
    CONSTRAINT PK_USER_DISEASE PRIMARY KEY(USER_NO, DISEASE_NO), -- �� �ܷ�Ű�� ��� �⺻Ű�� ����
    CONSTRAINT FK_USER_NO FOREIGN KEY(USER_NO) REFERENCES TB_USER(USER_NO) ON DELETE SET NULL,
    CONSTRAINT FK_DISEASE_NO FOREIGN KEY(DISEASE_NO) REFERENCES TB_DISEASE(DISEASE_NO) ON DELETE SET NULL    
);
COMMENT ON COLUMN TB_SAVE_LIST.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_SAVE_LIST.DISEASE_NO IS '����������ȣ';

-- SAMPLE DATA (���õ�����) : TB_SAVE_LIST
INSERT INTO TB_SAVE_LIST VALUES(101, 108); -- user01, '��1�� �索��'
INSERT INTO TB_SAVE_LIST VALUES(102, 108); -- user02, '��1�� �索��'
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
COMMENT ON COLUMN TB_DOCTOR.DOC_NO IS '�ǻ� ��ȣ';
COMMENT ON COLUMN TB_DOCTOR.DOC_NM IS '�ǻ��';
COMMENT ON COLUMN TB_DOCTOR.DEPT_NO IS '����� ��ȣ';
COMMENT ON COLUMN TB_DOCTOR.MAJOR IS '��������';
COMMENT ON COLUMN TB_DOCTOR.ACADEMIC_CAREER IS '�з�';
COMMENT ON COLUMN TB_DOCTOR.CAREER IS '���';
COMMENT ON COLUMN TB_DOCTOR.ACADEMIC_ACTIVITY IS '��ȸȰ��';
COMMENT ON COLUMN TB_DOCTOR.DOMESTIC_ACTIVITY IS '����Ȱ��';
COMMENT ON COLUMN TB_DOCTOR.INTERNATIONAL_ACTIVITY IS '����Ȱ��';
COMMENT ON COLUMN TB_DOCTOR.RESEARCH IS '��';
COMMENT ON COLUMN TB_DOCTOR.JOURNAL IS '����';
COMMENT ON COLUMN TB_DOCTOR.ETC IS '��Ÿ';

-- SAMPLE DATA (���õ�����) : TB_DOCTOR TABLE
INSERT INTO TB_DOCTOR VALUES(1, (SELECT USER_NM FROM TB_USER WHERE USER_NO = '1'),1, '�������а�', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '������ȯ �� �索Ŭ���� ����ǻ�'); -- �ٵ� ���� ���� ����ϰ� �ִٸ� ��� ǥ��?
INSERT INTO TB_DOCTOR VALUES(2, (SELECT USER_NM FROM TB_USER WHERE USER_NO = '2'), 1, '�������а�', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '�ǰ����� �� ���ð� ����ǻ�');

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
COMMENT ON COLUMN TB_RESERVATION.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_RESERVATION.RES_NO IS '�����ȣ';
COMMENT ON COLUMN TB_RESERVATION.RES_NM IS '������ �̸�';
COMMENT ON COLUMN TB_RESERVATION.RES_DATE IS '���� ��¥';
COMMENT ON COLUMN TB_RESERVATION.RES_TIME IS '���� �ð�';
COMMENT ON COLUMN TB_RESERVATION.DEPT_NO IS '����� ��ȣ';
COMMENT ON COLUMN TB_RESERVATION.DISEASE_NO IS '���� �ڵ�';
COMMENT ON COLUMN TB_RESERVATION.DOC_NO IS '�ǻ� ��ȣ';

DROP SEQUENCE SEQ_RESERVATION;
CREATE SEQUENCE SEQ_RESERVATION
START WITH 10000 -- �ڵ� ���� �߻���
INCREMENT BY 1
MAXVALUE 99999
CYCLE -- ������ 89999�� ���Ŀ� �ٽ� 10000 ���� �����Ѵ�.
NOCACHE;

-- SAMPLE DATA (���õ�����) : TB_RESERVATION TABLE
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

COMMENT ON COLUMN TB_QA.QA_NO IS '���ǻ��� ��ȣ';
COMMENT ON COLUMN TB_QA.QA_WRITER IS '�ۼ��� ���̵�';
COMMENT ON COLUMN TB_QA.QA_TITLE IS '�Խñ� ����';
COMMENT ON COLUMN TB_QA.QA_CONTENT IS '�Խñ� ����';
COMMENT ON COLUMN TB_QA.QA_DATE IS '�ۼ���¥';
COMMENT ON COLUMN TB_QA.QA_REF IS '���۹�ȣ';  -- ���۹�ȣ
COMMENT ON COLUMN TB_QA.QA_REPLY_REF IS '������۹�ȣ';  -- ���� : 0, ������ ��� : �ڱ��ȣ, ����� ��� : ������۹�ȣ
COMMENT ON COLUMN TB_QA.QA_REPLY_LEV IS '��۴ܰ�'; -- ���� : 0, ������ ��� : 1, ����� ��� : 2
COMMENT ON COLUMN TB_QA.QA_REPLY_SEQ IS '��ۼ���'; -- ���� : 0, ���� ������ ����� �� : 1 ....... ����ó��



DROP SEQUENCE SEQ_QANO;
CREATE SEQUENCE SEQ_QANO --���ǻ��� ��ȣ
START WITH 1 -- �ڵ� ���� �߻���
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;


INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '���� ����', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '���� ����', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '�ǰ� ����', '�ǰ� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '���峻�ð�', '���°���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '�񸸰���', '�󸶿���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�Ǻΰ���', '��㿹�డ���ұ��',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '��������', '�������� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�索��', '�索�� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '���� ����1', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '���� ����1', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '�ǰ� ����1', '�ǰ� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '���峻�ð�1', '���°���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '�񸸰���1', '�󸶿���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�Ǻΰ���1', '��㿹�డ���ұ��',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '��������1', '�������� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�索��1', '�索�� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '���� ����2', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '���� ����2', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '�ǰ� ����2', '�ǰ� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '���峻�ð�2', '���°���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '�񸸰���2', '�󸶿���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�Ǻΰ���2', '��㿹�డ���ұ��',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '��������2', '�������� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�索��2', '�索�� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '���� ����3', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor02', '���� ����3', '���� ��� �ؾ��ϳ���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'headofdept', '�ǰ� ����3', '�ǰ� ���� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'nurse01', '���峻�ð�3', '���°���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'doctor01', '�񸸰���3', '�󸶿���?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�Ǻΰ���3', '��㿹�డ���ұ��',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user02', '��������3', '�������� ������?',
SEQ_QANO.NEXTVAL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO TB_QA
VALUES (SEQ_QANO.NEXTVAL, 'user01', '�索��3', '�索�� ���� ������?',
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
COMMENT ON COLUMN TB_FAQ.FAQ_NO IS 'FAQ ��ȣ';
COMMENT ON COLUMN TB_FAQ.FAQ_WRITER IS 'FAQ �ۼ��� ��ȣ';
COMMENT ON COLUMN TB_FAQ.FAQ_TITLE IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_TEXT IS 'FAQ ����';
COMMENT ON COLUMN TB_FAQ.FAQ_DATE IS 'FAQ ��ϳ�¥';

DROP SEQUENCE SEQ_FAQ;
CREATE SEQUENCE SEQ_FAQ
START WITH 1 -- �ڵ� ���� �߻���
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (���õ�����) : TB_FAQ TABLE
INSERT INTO TB_FAQ VALUES(SEQ_FAQ.NEXTVAL, DEFAULT, '���ô±� �� ��������', '����������������', DEFAULT);
INSERT INTO TB_FAQ VALUES(SEQ_FAQ.NEXTVAL, DEFAULT, '���� �����ϴ� ���', '����������������', DEFAULT);
INSERT INTO TB_FAQ VALUES(SEQ_FAQ.NEXTVAL, DEFAULT, '�索 �� �պ��� ���', '����������������', DEFAULT);

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
START WITH 1 -- �ڵ� ���� �߻���
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- SAMPLE DATA (���õ�����) : TB_NOTICE
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
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_NO  IS '���� ��ȣ';
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_WRITER IS '���� �ۼ��� ��ȣ';
COMMENT ON COLUMN TB_ADVERTISEMENT.CONTENT IS '������';
COMMENT ON COLUMN TB_ADVERTISEMENT.VISIBLE IS 'Y= ����, N= �����';
COMMENT ON COLUMN TB_ADVERTISEMENT.START_VIS IS '���� �Ⱓ ����';
COMMENT ON COLUMN TB_ADVERTISEMENT.START_VIS IS '���� �Ⱓ ��';
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_FILE_NAME IS '���� ���ϸ�';
COMMENT ON COLUMN TB_ADVERTISEMENT.RENAME_FILE IS '�ٲ�  ���ϸ�';
COMMENT ON COLUMN TB_ADVERTISEMENT.IMG_DATE IS '���� ��� ��¥';
COMMENT ON COLUMN TB_ADVERTISEMENT.UPLOAD_DATE IS '�ۼ���';
COMMENT ON COLUMN TB_ADVERTISEMENT.AD_TYPE IS '����â ���� (1 = ���, 2 = ���鱤��)';

DROP SEQUENCE SEQ_AD;
CREATE SEQUENCE SEQ_AD
START WITH 1 -- �ڵ� ���� �߻���
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO TB_ADVERTISEMENT VALUES ( SEQ_AD.NEXTVAL, 1, '�̰� ���� 1�Դϴ�', 'N', NULL, NULL, 'first_ad', null, default, default, 0 );
INSERT INTO TB_ADVERTISEMENT VALUES ( SEQ_AD.NEXTVAL, 1, '�̰� ���� 2�Դϴ�', 'Y', NULL, NULL, 'second_ad', null, default, default, 1 );
INSERT INTO TB_ADVERTISEMENT VALUES ( SEQ_AD.NEXTVAL, 1, '�̰� ���� 3�Դϴ�', 'Y', NULL, NULL, 'fourth_ad', 'third_ad', default, default, 2 );

COMMIT;----------------------------------------------------------------------------------------------------------------------------------


