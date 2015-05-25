create or replace function f_get_zddwcount(v_code varchar2)
--重点单位
return number
as
zddw number;
lv varchar2(2);
begin
      lv:=F_GET_DWLEVE(v_code);
      if lv = '1' then
         select count(1) into zddw from t_za_jg_jbxx dw where dw.zddwbs is not null and dw.zxbs = '0' and (dw.zrdwpcsdm like substr(v_code,1,2)||'%' or dw.djdwdm like substr(v_code,1,2)||'%' or dw.czdwdm like substr(v_code,1,2)||'%');
      elsif lv='2' then
         select count(1) into zddw from t_za_jg_jbxx dw where dw.zddwbs is not null and dw.zxbs = '0' and (dw.zrdwpcsdm like substr(v_code,1,4)||'%' or dw.djdwdm like substr(v_code,1,4)||'%' or dw.czdwdm like substr(v_code,1,4)||'%');
      elsif lv='3' then
          select count(1) into zddw from t_za_jg_jbxx dw where dw.zddwbs is not null and dw.zxbs = '0' and (dw.zrdwpcsdm like substr(v_code,1,6)||'%' or dw.djdwdm like substr(v_code,1,6)||'%' or dw.czdwdm like substr(v_code,1,6)||'%');
      elsif lv='4' then
             select count(1) into zddw from t_za_jg_jbxx dw where dw.zddwbs is not null and dw.zxbs = '0' and (dw.zrdwpcsdm like substr(v_code,1,8)||'%' or dw.djdwdm like substr(v_code,1,8)||'%' or dw.czdwdm like substr(v_code,1,8)||'%');
      else
              select count(1) into zddw from t_za_jg_jbxx dw where dw.zddwbs is not null and dw.zxbs = '0' and (dw.zrdwpcsdm like substr(v_code,1,10)||'%' or dw.djdwdm like substr(v_code,1,10)||'%' or dw.czdwdm like substr(v_code,1,10)||'%');
      end if;
      return zddw;
end;

/
create or replace function f_get_xxcount(v_code varchar2)
--学校
 return number as
  v_lv varchar2(2);
  xx   number;
begin
  v_lv := f_get_dwleve(v_code);

  if  v_lv = '1' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and (dw.zrdwpcsdm like substr(v_code, 1, 2) || '%' or
           dw.djdwdm like substr(v_code, 1, 2) || '%' or
           dw.czdwdm like substr(v_code, 1, 2) || '%');

  elsif  v_lv = '2' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and (dw.zrdwpcsdm like substr(v_code, 1, 4) || '%' or
           dw.djdwdm like substr(v_code, 1, 4) || '%' or
           dw.czdwdm like substr(v_code, 1, 4) || '%');

  elsif  v_lv = '3' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and (dw.zrdwpcsdm like substr(v_code, 1, 6) || '%' or
           dw.djdwdm like substr(v_code, 1, 6) || '%' or
           dw.czdwdm like substr(v_code, 1, 6) || '%');

  elsif  v_lv = '4' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and (dw.zrdwpcsdm like substr(v_code, 1, 8) || '%' or
           dw.djdwdm like substr(v_code, 1, 8) || '%' or
           dw.czdwdm like substr(v_code, 1, 8) || '%');
  else
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and (dw.zrdwpcsdm like substr(v_code, 1, 10) || '%' or
           dw.djdwdm like substr(v_code, 1, 10) || '%' or
           dw.czdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return xx;
end;
/
create or replace function f_get_yrycount(v_code varchar2)
--幼儿园
 return number as
  v_lv varchar2(2);
  xx   number;
begin
  v_lv := f_get_dwleve(v_code);

  if  v_lv = '1' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and nbdw.dwxl = '1906'
       and (dw.zrdwpcsdm like substr(v_code, 1, 2) || '%' or
           dw.djdwdm like substr(v_code, 1, 2) || '%' or
           dw.czdwdm like substr(v_code, 1, 2) || '%');

  elsif  v_lv = '2' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and nbdw.dwxl = '1906'
       and (dw.zrdwpcsdm like substr(v_code, 1, 4) || '%' or
           dw.djdwdm like substr(v_code, 1, 4) || '%' or
           dw.czdwdm like substr(v_code, 1, 4) || '%');

  elsif  v_lv = '3' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and nbdw.dwxl = '1906'
       and (dw.zrdwpcsdm like substr(v_code, 1, 6) || '%' or
           dw.djdwdm like substr(v_code, 1, 6) || '%' or
           dw.czdwdm like substr(v_code, 1, 6) || '%');

  elsif  v_lv = '4' then
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and nbdw.dwxl = '1906'
       and (dw.zrdwpcsdm like substr(v_code, 1, 8) || '%' or
           dw.djdwdm like substr(v_code, 1, 8) || '%' or
           dw.czdwdm like substr(v_code, 1, 8) || '%');
  else
    select count(1)
      into xx
      from t_za_jg_jbxx dw, t_za_dw_nbdw nbdw
     where dw.jgbh = nbdw.jgbh
       and dw.zxbs = '0'
       and nbdw.dwfl = '1900'
       and nbdw.dwxl = '1906'
       and (dw.zrdwpcsdm like substr(v_code, 1, 10) || '%' or
           dw.djdwdm like substr(v_code, 1, 10) || '%' or
           dw.czdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return xx;
end;
/
create or replace function f_get_lgcount(v_code varchar2)
--旅馆
 return number as
  v_lv varchar2(2);
  lg   number;
begin
  v_lv := f_get_dwleve(v_code);

  if v_lv = '1' then
    select count(1)
      into lg
      from t_za_jg_jbxx dw, t_za_dw_tzhy th, t_za_dw_thlgy thlg
     where dw.jgbh = th.jgbh
       and th.thbh = thlg.thbh
       and dw.zxbs = '0'
       and (dw.zrdwpcsdm like substr(v_code, 1, 2) || '%' or
           dw.djdwdm like substr(v_code, 1, 2) || '%' or
           dw.czdwdm like substr(v_code, 1, 2) || '%');

  elsif v_lv = '2' then
    select count(1)
      into lg
      from t_za_jg_jbxx dw, t_za_dw_tzhy th, t_za_dw_thlgy thlg
     where dw.jgbh = th.jgbh
       and th.thbh = thlg.thbh
       and dw.zxbs = '0'
       and (dw.zrdwpcsdm like substr(v_code, 1, 4) || '%' or
           dw.djdwdm like substr(v_code, 1, 4) || '%' or
           dw.czdwdm like substr(v_code, 1, 4) || '%');

  elsif v_lv = '3' then
    select count(1)
      into lg
      from t_za_jg_jbxx dw, t_za_dw_tzhy th, t_za_dw_thlgy thlg
     where dw.jgbh = th.jgbh
       and th.thbh = thlg.thbh
       and dw.zxbs = '0'
       and (dw.zrdwpcsdm like substr(v_code, 1, 6) || '%' or
           dw.djdwdm like substr(v_code, 1, 6) || '%' or
           dw.czdwdm like substr(v_code, 1, 6) || '%');

  elsif v_lv = '4' then
    select count(1)
      into lg
      from t_za_jg_jbxx dw, t_za_dw_tzhy th, t_za_dw_thlgy thlg
     where dw.jgbh = th.jgbh
       and th.thbh = thlg.thbh
       and dw.zxbs = '0'
       and (dw.zrdwpcsdm like substr(v_code, 1, 8) || '%' or
           dw.djdwdm like substr(v_code, 1, 8) || '%' or
           dw.czdwdm like substr(v_code, 1, 8) || '%');

  else
    select count(1)
      into lg
      from t_za_jg_jbxx dw, t_za_dw_tzhy th, t_za_dw_thlgy thlg
     where dw.jgbh = th.jgbh
       and th.thbh = thlg.thbh
       and dw.zxbs = '0'
       and (dw.zrdwpcsdm like substr(v_code, 1, 10) || '%' or
           dw.djdwdm like substr(v_code, 1, 10) || '%' or
           dw.czdwdm like substr(v_code, 1, 10) || '%');
  end if;

  return lg;
end;
/

create or replace function f_get_zbhcount(v_code varchar2)
--治保会
 return number 
 as
  v_lv varchar2(2);
  zbh  number;
begin
  v_lv := f_get_dwleve(v_code);

  if v_lv = '1' then
    select count(1)
      into zbh
      from t_af_zbhjbxx
     where zxsj is null
       and (sspcsdm like substr(v_code, 1, 2) || '%' or
           djdwdm like substr(v_code, 1, 2) || '%');
  
  elsif v_lv = '2' then
    select count(1)
      into zbh
      from t_af_zbhjbxx
     where zxsj is null
       and (sspcsdm like substr(v_code, 1, 4) || '%' or
           djdwdm like substr(v_code, 1, 4) || '%');
  
  elsif v_lv = '3' then
    select count(1)
      into zbh
      from t_af_zbhjbxx
     where zxsj is null
       and (sspcsdm like substr(v_code, 1, 6) || '%' or
           djdwdm like substr(v_code, 1, 6) || '%');
  
  elsif v_lv = '4' then
    select count(1)
      into zbh
      from t_af_zbhjbxx
     where zxsj is null
       and (sspcsdm like substr(v_code, 1, 8) || '%' or
           djdwdm like substr(v_code, 1, 8) || '%');
  
  else
    select count(1)
      into zbh
      from t_af_zbhjbxx
     where zxsj is null
       and (sspcsdm like substr(v_code, 1, 10) || '%' or
           djdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return zbh;
end;
/

create or replace function f_get_sqgbcount(v_code varchar2)
--社区干部
 return number as
  v_lv varchar2(2);
  sqgb number;
begin

  v_lv := f_get_dwleve(v_code);

  if v_lv = '1' then
    select count(1)
      into sqgb
      from t_af_sqgbxx gb
     where gb.sfdl = '0'
       and gb.zxbs = '1'
       and gb.djdwdm like substr(v_code, 1, 2) || '5';

  elsif v_lv = '2' then
    select count(1)
      into sqgb
      from t_af_sqgbxx gb
     where gb.sfdl = '0'
       and gb.zxbs = '1'
       and gb.djdwdm like substr(v_code, 1, 4) || '5';

  elsif v_lv = '3' then
    select count(1)
      into sqgb
      from t_af_sqgbxx gb
     where gb.sfdl = '0'
       and gb.zxbs = '1'
       and gb.djdwdm like substr(v_code, 1, 6) || '5';

  elsif v_lv = '4' then
    select count(1)
      into sqgb
      from t_af_sqgbxx gb
     where gb.sfdl = '0'
       and gb.zxbs = '1'
       and gb.djdwdm like substr(v_code, 1, 8) || '5';

  else
    select count(1)
      into sqgb
      from t_af_sqgbxx gb
     where gb.sfdl = '0'
       and gb.zxbs = '1'
       and gb.djdwdm like substr(v_code, 1, 10) || '5';
  end if;
  return sqgb;
end;

/

create or replace function f_get_xldcount(v_code varchar2)
--巡逻队
 return number as
  v_lv varchar2(2);
  xld  number;
begin
  v_lv := f_get_dwleve(v_code);

  if v_lv = '1' then
    select count(1)
      into xld
      from t_af_xldxx x
     where x.cxbs = '1'
       and (x.ssdwdm like substr(v_code, 1, 2) || '%' or
           x.djdwdm like substr(v_code, 1, 2) || '%');

  elsif v_lv = '2' then
    select count(1)
      into xld
      from t_af_xldxx x
     where x.cxbs = '1'
       and (x.ssdwdm like substr(v_code, 1, 4) || '%' or
           x.djdwdm like substr(v_code, 1, 4) || '%');

  elsif v_lv = '3' then
    select count(1)
      into xld
      from t_af_xldxx x
     where x.cxbs = '1'
       and (x.ssdwdm like substr(v_code, 1, 6) || '%' or
           x.djdwdm like substr(v_code, 1, 6) || '%');

  elsif v_lv = '4' then
    select count(1)
      into xld
      from t_af_xldxx x
     where x.cxbs = '1'
       and (x.ssdwdm like substr(v_code, 1, 8) || '%' or
           x.djdwdm like substr(v_code, 1, 8) || '%');

  else
    select count(1)
      into xld
      from t_af_xldxx x
     where x.cxbs = '1'
       and (x.ssdwdm like substr(v_code, 1, 10) || '%' or
           x.djdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return xld;
end;
/
create or replace function f_get_ylcscount(v_code varchar2) return number as
--娱乐场所
  v_lv varchar2(2);
  ylcs number;
begin

  v_lv := f_get_dwleve(v_code);

  if v_lv = '1' then
    select count(1)
      into ylcs
      from t_za_jg_jbxx dw, t_za_dw_ggcs ggcs
     where dw.jgbh = ggcs.ggcsbh
       and ggcs.cslb = '1000'
       and (dw.zrdwpcsdm like substr(v_code, 1, 2) || '%' or
           dw.djdwdm like substr(v_code, 1, 2) || '%' or
           dw.czdwdm like substr(v_code, 1, 2) || '%');
  
  elsif v_lv = '2' then
    select count(1)
      into ylcs
      from t_za_jg_jbxx dw, t_za_dw_ggcs ggcs
     where dw.jgbh = ggcs.ggcsbh
       and ggcs.cslb = '1000'
       and (dw.zrdwpcsdm like substr(v_code, 1, 4) || '%' or
           dw.djdwdm like substr(v_code, 1, 4) || '%' or
           dw.czdwdm like substr(v_code, 1, 4) || '%');
  
  elsif v_lv = '3' then
    select count(1)
      into ylcs
      from t_za_jg_jbxx dw, t_za_dw_ggcs ggcs
     where dw.jgbh = ggcs.ggcsbh
       and ggcs.cslb = '1000'
       and (dw.zrdwpcsdm like substr(v_code, 1, 6) || '%' or
           dw.djdwdm like substr(v_code, 1, 6) || '%' or
           dw.czdwdm like substr(v_code, 1, 6) || '%');
  
  elsif v_lv = '4' then
    select count(1)
      into ylcs
      from t_za_jg_jbxx dw, t_za_dw_ggcs ggcs
     where dw.jgbh = ggcs.ggcsbh
       and ggcs.cslb = '1000'
       and (dw.zrdwpcsdm like substr(v_code, 1, 8) || '%' or
           dw.djdwdm like substr(v_code, 1, 8) || '%' or
           dw.czdwdm like substr(v_code, 1, 8) || '%');
  
  else
    select count(1)
      into ylcs
      from t_za_jg_jbxx dw, t_za_dw_ggcs ggcs
     where dw.jgbh = ggcs.ggcsbh
       and ggcs.cslb = '1000'
       and (dw.zrdwpcsdm like substr(v_code, 1, 10) || '%' or
           dw.djdwdm like substr(v_code, 1, 10) || '%' or
           dw.czdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return ylcs;
end;

/

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
       and zdry.sfrl = '1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 2) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 2) || '%');
  
  elsif v_lv = '2' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 4) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 4) || '%');
  
  elsif v_lv = '3' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 6) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 6) || '%');
  
  elsif v_lv = '4' then
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 8) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 8) || '%');
  
  else
    select count(1)
      into v_number
      from t_lsgl_rk_jbxx rk, t_zdry_gzdx zdry
     where zdry.rybh = rk.rybh
       and zdry.sfrl = '1'
       and zdry.cxsj is null
       and (zdry.sszrdwdm like substr(v_code, 1, 10) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 10) || '%');
  end if;
  return v_number;
end;

/

create or replace function f_get_ztrybylbcount(v_code varchar2,
                                               v_dl   varchar2,
                                               v_xl   varchar2)
  return number as
  v_lv     varchar2(2);
  v_number number;
begin
  v_lv := f_get_dwleve(v_code);

  if v_lv = '1' then
    select count(1)
      into v_number
      from t_zdry_gzdx zdry, t_lsgl_rk_jbxx rk
     where zdry.rybh = rk.rybh
       and zdry.cxsj is null
       and zdry.dxlb = v_dl
       and zdry.zdrylbbj = v_xl
       and (zdry.sszrdwdm like substr(v_code, 1, 2) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 2) || '%');
  
  elsif v_lv = '2' then
    select count(1)
      into v_number
      from t_zdry_gzdx zdry, t_lsgl_rk_jbxx rk
     where zdry.rybh = rk.rybh
       and zdry.cxsj is null
       and zdry.dxlb = v_dl
       and zdry.zdrylbbj = v_xl
       and (zdry.sszrdwdm like substr(v_code, 1, 4) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 4) || '%');
  
  elsif v_lv = '3' then
    select count(1)
      into v_number
      from t_zdry_gzdx zdry, t_lsgl_rk_jbxx rk
     where zdry.rybh = rk.rybh
       and zdry.cxsj is null
       and zdry.dxlb = v_dl
       and zdry.zdrylbbj = v_xl
       and (zdry.sszrdwdm like substr(v_code, 1, 6) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 6) || '%');
  
  elsif v_lv = '4' then
    select count(1)
      into v_number
      from t_zdry_gzdx zdry, t_lsgl_rk_jbxx rk
     where zdry.rybh = rk.rybh
       and zdry.cxsj is null
       and zdry.dxlb = v_dl
       and zdry.zdrylbbj = v_xl
       and (zdry.sszrdwdm like substr(v_code, 1, 8) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 8) || '%');
  
  else
    select count(1)
      into v_number
      from t_zdry_gzdx zdry, t_lsgl_rk_jbxx rk
     where zdry.rybh = rk.rybh
       and zdry.cxsj is null
       and zdry.dxlb = v_dl
       and zdry.zdrylbbj = v_xl
       and (zdry.sszrdwdm like substr(v_code, 1, 10) || '%' or
           zdry.gxdwdm like substr(v_code, 1, 10) || '%');
  end if;

  return v_number;
end;
/
create or replace function f_get_dwbyhylb(v_code varchar2,hylb varchar2) return number
as
v_lv varchar2(2);
v_number number;
begin
 v_lv:=f_get_dwleve(v_code);
 v_number := f_get_dwnumberbyhylb(v_code,v_lv,hylb );
 return v_number;
 end;

