-- Add comments to the table 
comment on table T_LMPC_JWQRYBD
  is '警务通号码绑定';
  

 -- Add/modify columns 
alter table T_LMPC_JWQRYBD add ID VARCHAR2(30);
-- Add comments to the columns 
comment on column T_LMPC_JWQRYBD.ID
  is '主键';
 
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_LMPC_JWQRYBD
  add constraint T_LMPC_JWQRYBD_ID_unique unique (ID);

update T_LMPC_JWQRYBD
set id=seq_common.nextval;
 
-- Add/modify columns 
alter table T_LMPC_JWQRYBD add JWTHM VARCHAR2(20);
alter table T_LMPC_JWQRYBD add GXSJ date;
-- Add comments to the columns 
comment on column T_LMPC_JWQRYBD.KC_JWQDM
  is '科创警务区代码';
comment on column T_LMPC_JWQRYBD.KC_JWQMC
  is '科创警务区名称';
comment on column T_LMPC_JWQRYBD.JCPT_JWQDM
  is '基础平台警务区代码';
comment on column T_LMPC_JWQRYBD.JCPT_JWQMC
  is '基础平台警务区名称';
comment on column T_LMPC_JWQRYBD.JH
  is '警号';
comment on column T_LMPC_JWQRYBD.XM
  is '姓名';
comment on column T_LMPC_JWQRYBD.YXX
  is '有效性';
comment on column T_LMPC_JWQRYBD.ZXRQ
  is '注销日期';
comment on column T_LMPC_JWQRYBD.ZXYY
  is '注销原因';
comment on column T_LMPC_JWQRYBD.JWTHM
  is '警务通号码';
comment on column T_LMPC_JWQRYBD.GXSJ
  is '更新时间';
  
  
-- Add/modify columns 
alter table T_LMPC_JWQRYBD add CZDWDM VARCHAR2(12);
alter table T_LMPC_JWQRYBD add CZDWMC VARCHAR2(120);
alter table T_LMPC_JWQRYBD add CZRXM VARCHAR2(30);
alter table T_LMPC_JWQRYBD add CZRJH VARCHAR2(10);
alter table T_LMPC_JWQRYBD add CZRSFZH VARCHAR2(20);
alter table T_LMPC_JWQRYBD add CZSJ date;
-- Add comments to the columns 
comment on column T_LMPC_JWQRYBD.CZDWDM
  is '操作单位代码';
comment on column T_LMPC_JWQRYBD.CZDWMC
  is '操作单位名称';
comment on column T_LMPC_JWQRYBD.CZRXM
  is '操作人姓名';
comment on column T_LMPC_JWQRYBD.CZRJH
  is '操作人警号';
comment on column T_LMPC_JWQRYBD.CZRSFZH
  is '操作人身份证号';
comment on column T_LMPC_JWQRYBD.CZSJ
  is '操作时间';


-- Add/modify columns 
alter table T_LMPC_JWQRYBD add CJRDWDM VARCHAR2(12);
alter table T_LMPC_JWQRYBD add CJRDWMC VARCHAR2(120);
-- Add comments to the columns 
comment on column T_LMPC_JWQRYBD.JH
  is '警号（采集人警号）';
comment on column T_LMPC_JWQRYBD.XM
  is '姓名（采集人姓名）';
comment on column T_LMPC_JWQRYBD.CJRDWDM
  is '采集人单位代码';
comment on column T_LMPC_JWQRYBD.CJRDWMC
  is '采集人单位名称';


create or replace function f_get_zdrycount(v_code varchar2)
--重点人员
 return number as
  v_lv     varchar2(2);
  v_number number;
begin
  v_lv := f_get_dwleve(v_code);
  if v_lv = '1' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1' and zdry.yxx='1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 2) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 2) || '%');

  elsif v_lv = '2' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1' and zdry.yxx='1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 4) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 4) || '%');

  elsif v_lv = '3' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1' and zdry.yxx='1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 6) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 6) || '%');

  elsif v_lv = '4' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1' and zdry.yxx='1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 8) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 8) || '%');

  else
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1' and zdry.yxx='1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 10) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return v_number;
end;
/

create or replace function f_get_zdryflcount(v_code varchar2,v_zdrylbbjw varchar2)
--重点人员
 return number as
  v_lv     varchar2(2);
  v_number number;
begin
  v_lv := f_get_dwleve(v_code);
  if v_lv = '1' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1' and zdry.yxx='1'
       and zdry.cxsj is null and substr(zdry.zdrylbbj,v_zdrylbbjw,1)=1
       and (zdry.sszrdwdm like substr(v_code, 1, 2) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 2) || '%');

  elsif v_lv = '2' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'  and zdry.yxx='1'
       and zdry.cxsj is null and substr(zdry.zdrylbbj,v_zdrylbbjw,1)=1
       and (zdry.sszrdwdm like substr(v_code, 1, 4) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 4) || '%');

  elsif v_lv = '3' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'  and zdry.yxx='1'
       and zdry.cxsj is null and substr(zdry.zdrylbbj,v_zdrylbbjw,1)=1
       and (zdry.sszrdwdm like substr(v_code, 1, 6) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 6) || '%');

  elsif v_lv = '4' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'  and zdry.yxx='1'
       and zdry.cxsj is null and substr(zdry.zdrylbbj,v_zdrylbbjw,1)=1
       and (zdry.sszrdwdm like substr(v_code, 1, 8) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 8) || '%');

  else
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'  and zdry.yxx='1'
       and zdry.cxsj is null and substr(zdry.zdrylbbj,v_zdrylbbjw,1)=1
       and (zdry.sszrdwdm like substr(v_code, 1, 10) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return v_number;
end;
/


CREATE OR REPLACE FUNCTION F_GET_ZDRYGZDXCOUNT(V_ORGCODE VARCHAR2,V_DXLB VARCHAR2,V_ZDRYLBBJ VARCHAR2)
--重点人员对象数量
--V_DXLB 对象类别  01:重点人员 02：工作对象
--V_ZDRYLBBJ重点人员对象类别
--01: 涉恐人员,02:涉稳人员,03:在逃人员,04:涉毒人员,05:刑事犯罪前科人员,06:肇事肇祸精神病人,07:上访人员
RETURN NUMBER
as
       V_LEVE     NUMBER;
       V_COUNTZDRYSQL  VARCHAR2(4000);
       V_COUNTWTXXSQL  VARCHAR2(4000);
       V_ZDRYCOUNT     NUMBER;
       V_WTZDRYCOUNT   NUMBER;
       V_NUMBER    NUMBER;
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       V_COUNTZDRYSQL:='select count(1) from t_zdry_gzdx where 1=1 and yxx=''1'' ';
       
       IF V_DXLB IS NOT NULL THEN
           V_COUNTZDRYSQL:=V_COUNTZDRYSQL||' AND DXLB='''||V_DXLB||'''';
       END IF;
       
       IF V_ZDRYLBBJ IS NOT NULL THEN
           V_COUNTZDRYSQL:=V_COUNTZDRYSQL||' AND SUBSTR(ZDRYLBBJ,TO_NUMBER('''||V_ZDRYLBBJ||'''),1)=''1''';
       END IF;
       
       IF V_LEVE=5 THEN
          V_COUNTZDRYSQL:= V_COUNTZDRYSQL||' AND SSZRDWDM='''||V_ORGCODE||'''';
          V_COUNTWTXXSQL:='select count(distinct SFZH) from t_zdry_wtxx where JGZT=''1'' and JGDWDM ='''||V_ORGCODE||'''';
       ELSIF V_LEVE=4 THEN
          V_COUNTZDRYSQL:=V_COUNTZDRYSQL||' AND SSZRDWDM LIKE '''||SUBSTR(V_ORGCODE,1,8)||'%'||'''';  
       ELSIF V_LEVE=3 THEN
          V_COUNTZDRYSQL:=V_COUNTZDRYSQL||' AND SSZRDWDM LIKE '''||SUBSTR(V_ORGCODE,1,6)||'%'||'''';  
       ELSIF V_LEVE=2 THEN
          V_COUNTZDRYSQL:=V_COUNTZDRYSQL||' AND SSZRDWDM LIKE '''||SUBSTR(V_ORGCODE,1,4)||'%'||'''';  
       END IF;
       
       IF V_COUNTZDRYSQL IS NOT NULL THEN
          EXECUTE IMMEDIATE V_COUNTZDRYSQL INTO V_ZDRYCOUNT;
       ELSE
          V_ZDRYCOUNT:=0;
       END IF;
       IF V_WTZDRYCOUNT IS NOT NULL THEN
          EXECUTE IMMEDIATE V_COUNTWTXXSQL INTO V_WTZDRYCOUNT;
       ELSE
          V_WTZDRYCOUNT:=0;
       END IF;
       V_NUMBER:=V_ZDRYCOUNT + V_WTZDRYCOUNT; 
       RETURN V_NUMBER;
END F_GET_ZDRYGZDXCOUNT;
/

