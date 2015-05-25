-- Add/modify columns 
alter table T_LSGL_RK_JBXX add RYTSSX VARCHAR2(50);
-- Add comments to the columns 
comment on column T_LSGL_RK_JBXX.RYTSSX
  is '人员特殊属性';


CREATE OR REPLACE FUNCTION F_GET_CZRKCOUNT(V_ORGCODE VARCHAR) RETURN NUMBER
--获取常驻人口数据量
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_CZRKNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/

CREATE OR REPLACE FUNCTION F_GET_LDRKCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取流动人口数
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_LDRKNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/
CREATE OR REPLACE FUNCTION F_GET_JWRKNUMBER(V_CODE VARCHAR2,V_LV NUMBER)
-- V_CODE : 机构代码   V_LV:1、省厅用户 2、市级用户 3、区县级用户 4、派出所级用户 5、民警用户
RETURN NUMBER
AS
 V_JWRK NUMBER;
 BEGIN
  V_JWRK :=0;
 IF V_LV=1 THEN
    SELECT COUNT(JWRK.JWBH) INTO V_JWRK FROM T_LSGL_RK_JWRKXX JWRK
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = JWRK.RYBH)
    AND (JWRK.ZXBS = '0' OR JWRK.ZXBS IS NULL);

 ELSIF V_LV = 2 THEN
    SELECT COUNT(JWRK.JWBH) INTO V_JWRK FROM T_LSGL_RK_JWRKXX JWRK
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = JWRK.RYBH)
    AND (JWRK.ZXBS = '0' OR JWRK.ZXBS IS NULL)
    AND JWRK.ZRDWDM LIKE SUBSTR(V_CODE,1,4)||'%';

 ELSIF V_LV = 3 THEN
    SELECT COUNT(JWRK.JWBH) INTO V_JWRK FROM T_LSGL_RK_JWRKXX JWRK
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = JWRK.RYBH)
    AND (JWRK.ZXBS = '0' OR JWRK.ZXBS IS NULL)
    AND JWRK.ZRDWDM LIKE SUBSTR(V_CODE,1,6)||'%';

 ELSIF V_LV = 4 THEN
    SELECT COUNT(JWRK.JWBH) INTO V_JWRK FROM T_LSGL_RK_JWRKXX JWRK
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = JWRK.RYBH)
    AND (JWRK.ZXBS = '0' OR JWRK.ZXBS IS NULL)
    AND JWRK.ZRDWDM LIKE SUBSTR(V_CODE,1,8)||'%';

 ELSIF V_LV = 5  THEN
    SELECT COUNT(JWRK.JWBH) INTO V_JWRK FROM T_LSGL_RK_JWRKXX JWRK
    WHERE EXISTS (SELECT 1 FROM T_LSGL_RK_JBXX RK WHERE RK.RYBH = JWRK.RYBH)
    AND (JWRK.ZXBS = '0' OR JWRK.ZXBS IS NULL)
    AND JWRK.ZRDWDM = V_CODE;
 END IF;
 RETURN V_JWRK;
 END;
/
CREATE OR REPLACE FUNCTION F_GET_JZRKCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取寄住人口数据
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_JZRKNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/
create or replace function f_get_jwrkcount(v_orgcode varchar2) return number
--获取境外人口数量
AS
       V_LEVE   NUMBER;
       V_COUNT  NUMBER;
BEGIN
       V_LEVE := F_GET_DWLEVE(V_ORGCODE);
       V_COUNT:=F_GET_JWRKNUMBER(V_ORGCODE,V_LEVE);
       RETURN V_COUNT;
END;
/

create or replace function f_get_zdrynumber(v_orgcode varchar2,v_leve varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取重点对象数量
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1)  into v_number 
          from t_zdry_gzdx;
       elsif v_leve='2' then
          select count(1)  into v_number 
          from t_zdry_gzdx 
          where SSZRDWDM like substr(v_orgcode,1,4)||'%';
       elsif v_leve='3' then
          select count(1) into v_number 
          from t_zdry_gzdx 
          where SSZRDWDM like substr(v_orgcode,1,6)||'%';
       elsif v_leve='4' then
          select count(1) into v_number 
          from t_zdry_gzdx 
          where SSZRDWDM like substr(v_orgcode,1,8)||'%';
       elsif v_leve='5' then
          select count(1) into v_number 
          from t_zdry_gzdx 
          where SSZRDWDM=v_orgcode;
       end if;
       return v_number;
end;
/