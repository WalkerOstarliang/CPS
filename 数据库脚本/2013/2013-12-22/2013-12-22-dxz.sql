create or replace function f_get_dwnumberByhylb(v_orgcode varchar2,v_leve varchar2,v_hylb varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取单位数量通过行业类别
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1)  into v_number from t_za_jg_jbxx where HYLB like '%'||v_hylb||'%' and (CZBS is null or czbs <> '3');
       elsif v_leve='2' then
          select count(1)  into v_number from t_za_jg_jbxx where (ZRDWPCSDM like substr(v_orgcode,1,4)||'%' or djdwdm like substr(v_orgcode,1,4)||'%' or czdwdm like substr(v_orgcode,1,4)||'%') and HYLB like '%'||v_hylb||'%' and (CZBS is null or czbs <> '3');
       elsif v_leve='3' then
          select count(1) into v_number from t_za_jg_jbxx where (ZRDWPCSDM like substr(v_orgcode,1,6)||'%'  or djdwdm like substr(v_orgcode,1,6)||'%' or czdwdm like substr(v_orgcode,1,6)||'%') and HYLB like '%'||v_hylb||'%' and (CZBS is null or czbs <> '3');
       elsif v_leve='4' then
          select count(1) into v_number from t_za_jg_jbxx where (ZRDWPCSDM like substr(v_orgcode,1,8)||'%'  or djdwdm like substr(v_orgcode,1,8)||'%' or czdwdm like substr(v_orgcode,1,8)||'%') and HYLB like '%'||v_hylb||'%' and (CZBS is null or czbs <> '3');
       elsif v_leve='5' then
          select count(1) into v_number from t_za_jg_jbxx where (ZRDWPCSDM like substr(v_orgcode,1,10)||'%'  or djdwdm like substr(v_orgcode,1,10)||'%' or czdwdm like substr(v_orgcode,1,10)||'%') and HYLB like '%'||v_hylb||'%' and (CZBS is null or czbs <> '3');
       end if;
       return v_number;
end;