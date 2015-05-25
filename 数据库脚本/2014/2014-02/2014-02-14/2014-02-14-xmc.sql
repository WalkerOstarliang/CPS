-- Add/modify columns 
alter table T_LSGL_CZFW_JBXX add CZFWBHBM VARCHAR2(100);
-- Add comments to the columns 
comment on column T_LSGL_CZFW_JBXX.CZFWBHBM
  is '出租房屋标牌编码';

  
  -- Add/modify columns 
alter table T_LSGL_CZFW_JBXX rename column CZFWBHBM to CZFWBPBM;
 
 
 
 -- Create sequence 
create sequence seq_lsgl_czfwbm
minvalue 1
maxvalue 999999999
start with 1
increment by 1
cache 10;
 
 
-- Add/modify columns 
alter table T_COMMON_HNXZQH add ZHJC VARCHAR2(10);
-- Add comments to the columns 
comment on column T_COMMON_HNXZQH.ZHJC
  is '字号简称';
 
 
update t_common_hnxzqh
set zhjc=substr(jc,1,1)
where leve='3';
commit;


-- Create sequence 
create sequence seq_lsgl_czfwbpbm
minvalue 1
maxvalue 999999
start with 1
increment by 1
cache 10;


create or replace function f_get_czfwbpbm(v_orgcode varchar2)
return varchar2
--获取出租房屋标牌编码
as
     
       v_czfwbpbm varchar2(100);
begin
       select zhjc||'(租)字'||substr(v_orgcode,6,2)||lpad(seq_lsgl_czfwbpbm.nextval,6,'0') into v_czfwbpbm from t_common_hnxzqh where dm=substr(v_orgcode,1,6)||'000000' and leve='3';
       return v_czfwbpbm;
end;
/

