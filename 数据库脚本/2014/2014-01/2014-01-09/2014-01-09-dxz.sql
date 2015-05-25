-- Create sequence 
create sequence SEQ_LDXXBH
minvalue 1
maxvalue 999999999999999
start with 1
increment by 1
cache 10;

/
create or replace function f_get_ldxxbh(dwbm varchar2)
return varchar2
--通过单位获取联动信息变化
as
v_ldxxbh            varchar2(27);
v_dwbm            varchar2(6);
v_currdate        varchar2(6);
v_gaqbdm          varchar2(5);
v_unique          varchar2(10);
begin
      if length(dwbm)>=6 then
         v_gaqbdm:='23101';
         v_dwbm := substr(dwbm,0,6);
         select to_char(sysdate,'yyyymm') into v_currdate from dual;
         select lpad(seq_ldxxbh.nextval,10,'0') into v_unique from dual;
         v_ldxxbh := v_dwbm || v_currdate || v_gaqbdm || v_unique;
     end if;
     return v_ldxxbh;
     exception when others then
     return null;
end f_get_ldxxbh;
/

-- Create sequence 
create sequence SEQ_ZDRY_CKYJCZFKBH
minvalue 100000000
maxvalue 999999999
start with 100000000
increment by 1
cache 10
cycle;

/
CREATE OR REPLACE FUNCTION F_GET_CZYJCZFKBH(YJXXBH VARCHAR2,DWBM VARCHAR2)
RETURN VARCHAR2
--通过预警信息编号和单位编码获取常控预警处置反馈信息编号
--如果通过单位编码和发布时间可以使用F_GET_DTGK_CZFKXXBH
AS
V_YJXXBH          VARCHAR2(20);      --预警信息编号
V_YJFBSJ          VARCHAR2(14);      --预警发布时间
V_CZFKXXBH        VARCHAR2(27);      --常控预警处置反馈信息编号
V_SEQ             VARCHAR2(10);      --唯一编号
V_DWBM            VARCHAR2(6);       --单位编码
BEGIN
      IF YJXXBH IS NOT NULL AND YJXXBH != '''' AND DWBM IS NOT NULL AND LENGTH(DWBM)>6 THEN
         V_DWBM:=SUBSTR(DWBM,0,6);
         SELECT YJXXBH,TO_CHAR(YJFBSJ,'YYMMDD'),LPAD(SEQ_ZDRY_CKYJCZFKBH.NEXTVAL,10,'0')  INTO V_YJXXBH,V_YJFBSJ,V_SEQ
         FROM T_ZDRY_CKYJXX
         WHERE YJXXBH=YJXXBH AND ROWNUM<2;
         V_CZFKXXBH:=V_DWBM||V_YJFBSJ||V_SEQ;
      END IF;
      RETURN V_CZFKXXBH;
      EXCEPTION WHEN OTHERS THEN
      RETURN NULL;
END F_GET_CZYJCZFKBH;
/

-- Create sequence 
create sequence SEQ_ZDRY_YJQSID
minvalue 1000000001
maxvalue 9999999999
start with 1000000001
increment by 1
cycle;

/
create sequence SEQ_ZDRY_YJFKID
minvalue 1000000001
maxvalue 9999999999
start with 1000000001
increment by 1
cycle;