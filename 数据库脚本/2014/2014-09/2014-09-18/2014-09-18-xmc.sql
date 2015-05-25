-- Add/modify columns 
alter table T_LSGL_RK_JBXX modify LXDHBZ VARCHAR2(100);

create or replace function f_get_rybh(v_xzqh varchar2)
return varchar2
as
       v_rybh     varchar2(20);
begin
       select 'R'||substr(v_xzqh,1,6)||lpad(seq_lsgl_rybh.nextval,13,'0') into v_rybh 
       from dual;
       return v_rybh;
end;
/

create or replace function f_get_jgbh(v_orgcode varchar2, v_dwtype varchar2)
--dwdm 当前登录机构代码
--dwtype 单位类型 JG：机构基本信息 ，TZ:特种行业 ,NB:内部单位，GC：公共场所 其他单位待定
return varchar2
as
       v_jgbh      varchar2(27);
begin
       select v_dwtype||substr(v_orgcode,1,8)||to_char(sysdate,'yyyymmdd')||lpad(seq_za_jgbh.nextval,9,'0') into v_jgbh 
       from dual;
       return v_jgbh;
end;
/