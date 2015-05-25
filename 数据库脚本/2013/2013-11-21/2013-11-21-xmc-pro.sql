create or replace function f_get_zdrynumber(v_orgcode varchar2,v_leve varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取重点对象数量
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1)  into v_number from t_zdry_gzdx;
       elsif v_leve='2' then
          select count(1)  into v_number from t_zdry_gzdx where SSZRDWDM like substr(v_orgcode,1,4)||'%';
       elsif v_leve='3' then
          select count(1) into v_number from t_zdry_gzdx where SSZRDWDM like substr(v_orgcode,1,6)||'%';
       elsif v_leve='4' then
          select count(1) into v_number from t_zdry_gzdx where SSZRDWDM like substr(v_orgcode,1,8)||'%';
       elsif v_leve='5' then
          select count(1) into v_number from t_zdry_gzdx where SSZRDWDM=v_orgcode;
       end if;
       return v_number;
end;
/

create or replace function f_get_czrknumber(v_orgcode varchar2,v_leve varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取常驻人口数量
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1) into v_number
          from (
               select sfzh from t_lsgl_rk_czrk
          );
       elsif v_leve='2' then
          select count(1) into v_number
          from (
               select sfzh from t_lsgl_rk_czrk where hjdqh like substr(v_orgcode,1,4)||'%' and (zxbs='0' or zxbs is null)
          );
       elsif v_leve='3' then
           select count(1) into v_number
           from (
               select sfzh from t_lsgl_rk_czrk where hjdqh like substr(v_orgcode,1,6)||'%' and (zxbs='0' or zxbs is null)
           );
       elsif v_leve='4' then
           select count(1) into v_number
           from (
               select sfzh from t_lsgl_rk_czrk where zrdwdm like substr(v_orgcode,1,8)||'%' and (zxbs='0' or zxbs is null) 
           );
       elsif v_leve='5' then
           select count(1) into v_number
           from (
               select sfzh from t_lsgl_rk_czrk where zrdwdm=v_orgcode and (zxbs='0' or zxbs is null )
           );
       end if;
       return v_number;
end;
/

create or replace function f_get_ldrknumber(v_orgcode varchar2,v_leve varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取流动人口数量
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1) into v_number
          from (
               select sfzh from t_lsgl_rk_ldrkzzxx
          );
       elsif v_leve='2' then
          select count(1) into v_number
          from (
               select sfzh from t_lsgl_rk_ldrkzzxx where zrdwdm like substr(v_orgcode,1,4)||'%' and (zxbs='0' or zxbs is null )
          );
       elsif v_leve='3' then
           select count(1) into v_number
           from (
               select sfzh from t_lsgl_rk_ldrkzzxx where zrdwdm like substr(v_orgcode,1,6)||'%' and (zxbs='0' or zxbs is null )
           );
       elsif v_leve='4' then
           select count(1) into v_number
           from (
               select sfzh from t_lsgl_rk_ldrkzzxx where zrdwdm like substr(v_orgcode,1,8)||'%' and (zxbs='0' or zxbs is null )
           );
       elsif v_leve='5' then
           select count(1) into v_number
           from (
               select sfzh from t_lsgl_rk_ldrkzzxx where zrdwdm=v_orgcode and (zxbs='0' or zxbs is null )
           );
       end if;
       return v_number;
end;
/

create or replace function f_get_fwnumber(v_orgcode varchar2,v_leve varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取房屋数量
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1)  into v_number from T_LSGL_FW_JBXX;
       elsif v_leve='2' then
          select count(1)  into v_number from T_LSGL_FW_JBXX where SSZRDWDM like substr(v_orgcode,1,4)||'%' and (zxbs='0' or zxbs is null );
       elsif v_leve='3' then
          select count(1) into v_number from T_LSGL_FW_JBXX where SSZRDWDM like substr(v_orgcode,1,6)||'%' and (zxbs='0' or zxbs is null );
       elsif v_leve='4' then
          select count(1) into v_number from T_LSGL_FW_JBXX where SSPCSDM like substr(v_orgcode,1,8)||'%' and (zxbs='0' or zxbs is null );
       elsif v_leve='5' then
          select count(1) into v_number from T_LSGL_FW_JBXX where SSZRDWDM=v_orgcode and (zxbs='0' or zxbs is null );
       end if;
       return v_number;
end;
/

create or replace function f_get_zdrynumberbydxlb(v_orgcode varchar2,v_leve varchar2, v_dxlb varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取重点对象数量通过对象类别
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1)  into v_number from t_zdry_gzdx where DXLB=v_dxlb;
       elsif v_leve='2' then
          select count(1)  into v_number from t_zdry_gzdx where SSZRDWDM like substr(v_orgcode,1,4)||'%' and DXLB=v_dxlb;
       elsif v_leve='3' then
          select count(1) into v_number from t_zdry_gzdx where SSZRDWDM like substr(v_orgcode,1,6)||'%' and DXLB=v_dxlb;
       elsif v_leve='4' then
          select count(1) into v_number from t_zdry_gzdx where SSZRDWDM like substr(v_orgcode,1,8) and DXLB=v_dxlb;
       elsif v_leve='5' then
          select count(1) into v_number from t_zdry_gzdx where SSZRDWDM=v_orgcode and DXLB=v_dxlb;
       end if;
       return v_number;
end;
/

create or replace function f_get_dwnumberByhylb(v_orgcode varchar2,v_leve varchar2,v_hylb varchar2)
return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
--获取单位数量通过行业类别
as
     v_number  number;
begin
       v_number:=0;
       if v_leve='1' then
          select count(1)  into v_number from t_za_jg_jbxx where HYLB=v_hylb and (CZBS is null or czbs <> '3');
       elsif v_leve='2' then
          select count(1)  into v_number from t_za_jg_jbxx where ZRDWPCSDM like substr(v_orgcode,1,4)||'%' and HYLB=v_hylb and (CZBS is null or czbs <> '3');
       elsif v_leve='3' then
          select count(1) into v_number from t_za_jg_jbxx where ZRDWPCSDM like substr(v_orgcode,1,6)||'%' and HYLB=v_hylb and (CZBS is null or czbs <> '3');
       elsif v_leve='4' then
          select count(1) into v_number from t_za_jg_jbxx where ZRDWPCSDM like substr(v_orgcode,1,8)||'%' and HYLB=v_hylb and (CZBS is null or czbs <> '3');
       elsif v_leve='5' then
          select count(1) into v_number from t_za_jg_jbxx where ZRDWPCSDM=v_orgcode and HYLB=v_hylb and (CZBS is null or czbs <> '3');
       end if;
       return v_number;
end;
/