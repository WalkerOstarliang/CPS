create or replace function f_get_lkxgybh(v_orgcode varchar2,v_dm varchar2)
return varchar2
--获取流口协管员编号
--v_xzqh 6位行政区划
as
       v_lkxgybh    varchar2(6);
begin
       select v_dm||lpad((to_number(nvl(max(substr(a.fjjh,3,4)),'0000')) +1),4,'0') into v_lkxgybh
       from t_common_organization_fj a
       where a.djdwdm like substr(v_orgcode,0,6)||'%';
       return v_lkxgybh;
end;
/