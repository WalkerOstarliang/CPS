create or replace function f_get_dwnumberByhylb(v_orgcode varchar2,
                                                v_leve    varchar2,
                                                v_hylb    varchar2)
  return number
--参数 v_orgcode 用户机构代码  leve : 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
  --获取单位数量通过行业类别
 as
  v_number number;
begin
  v_number := 0;
  if v_leve = '1' then
    --特种行业
    if v_hylb = '01' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_tzhy th
       where dw.jgbh = th.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 2) || '%' or djdwdm like substr(v_orgcode, 1, 2) || '%' or czdwdm like substr(v_orgcode, 1, 2) || '%')
         and (CZBS is null or czbs <> '3');
    --公共场所     
    elsif v_hylb = '02' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_ggcs ggcs
       where dw.jgbh = ggcs.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 2) || '%' or djdwdm like substr(v_orgcode, 1, 2) || '%' or czdwdm like substr(v_orgcode, 1, 2) || '%')
         and (CZBS is null or czbs <> '3');
    --企事业单位     
    elsif v_hylb = '03' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_nbdw nbdw
       where dw.jgbh = nbdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 2) || '%' or djdwdm like substr(v_orgcode, 1, 2) || '%' or czdwdm like substr(v_orgcode, 1, 2) || '%')
         and (CZBS is null or czbs <> '3');
    --危险物品单位     
    elsif v_hylb = '04' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_wxwpdw wxwp
       where dw.jgbh = wxwp.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 2) || '%' or djdwdm like substr(v_orgcode, 1, 2) || '%' or czdwdm like substr(v_orgcode, 1, 2) || '%')
         and (CZBS is null or czbs <> '3');
    --网吧     
    elsif v_hylb = '05' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_jg_swfwcs wb
       where dw.jgbh = wb.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 2) || '%' or djdwdm like substr(v_orgcode, 1, 2) || '%' or czdwdm like substr(v_orgcode, 1, 2) || '%')
         and (CZBS is null or czbs <> '3');
    --涉外单位     
    elsif v_hylb = '06' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_swdw swdw
       where dw.jgbh = swdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 2) || '%' or djdwdm like substr(v_orgcode, 1, 2) || '%' or czdwdm like substr(v_orgcode, 1, 2) || '%')
         and (CZBS is null or czbs <> '3');
    end if;
  
  
  
  elsif v_leve = '2' then
     --特种行业
    if v_hylb = '01' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_tzhy th
       where dw.jgbh = th.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 4) || '%' or djdwdm like substr(v_orgcode, 1, 4) || '%' or czdwdm like substr(v_orgcode, 1, 4) || '%')
         and (CZBS is null or czbs <> '3');
    --公共场所     
    elsif v_hylb = '02' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_ggcs ggcs
       where dw.jgbh = ggcs.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 4) || '%' or djdwdm like substr(v_orgcode, 1, 4) || '%' or czdwdm like substr(v_orgcode, 1, 4) || '%')
         and (CZBS is null or czbs <> '3');
    --企事业单位     
    elsif v_hylb = '03' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_nbdw nbdw
       where dw.jgbh = nbdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 4) || '%' or djdwdm like substr(v_orgcode, 1, 4) || '%' or czdwdm like substr(v_orgcode, 1, 4) || '%')
         and (CZBS is null or czbs <> '3');
    --危险物品单位     
    elsif v_hylb = '04' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_wxwpdw wxwp
       where dw.jgbh = wxwp.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 4) || '%' or djdwdm like substr(v_orgcode, 1, 4) || '%' or czdwdm like substr(v_orgcode, 1, 4) || '%')
         and (CZBS is null or czbs <> '3');
    --网吧     
    elsif v_hylb = '05' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_jg_swfwcs wb
       where dw.jgbh = wb.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 4) || '%' or djdwdm like substr(v_orgcode, 1, 4) || '%' or czdwdm like substr(v_orgcode, 1, 4) || '%')
         and (CZBS is null or czbs <> '3');
    --涉外单位     
    elsif v_hylb = '06' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_swdw swdw
       where dw.jgbh = swdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 4) || '%' or djdwdm like substr(v_orgcode, 1, 4) || '%' or czdwdm like substr(v_orgcode, 1, 4) || '%')
         and (CZBS is null or czbs <> '3');
    end if;
    
    
    
  elsif v_leve = '3' then
     --特种行业
    if v_hylb = '01' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_tzhy th
       where dw.jgbh = th.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 6) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 6) || '%')
         and (CZBS is null or czbs <> '3');
    --公共场所     
    elsif v_hylb = '02' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_ggcs ggcs
       where dw.jgbh = ggcs.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 6) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 6) || '%')
         and (CZBS is null or czbs <> '3');
    --企事业单位     
    elsif v_hylb = '03' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_nbdw nbdw
       where dw.jgbh = nbdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 6) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 6) || '%')
         and (CZBS is null or czbs <> '3');
    --危险物品单位     
    elsif v_hylb = '04' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_wxwpdw wxwp
       where dw.jgbh = wxwp.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 6) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 6) || '%')
         and (CZBS is null or czbs <> '3');
    --网吧     
    elsif v_hylb = '05' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_jg_swfwcs wb
       where dw.jgbh = wb.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 6) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 6) || '%')
         and (CZBS is null or czbs <> '3');
    --涉外单位     
    elsif v_hylb = '06' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_swdw swdw
       where dw.jgbh = swdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 6) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 6) || '%')
         and (CZBS is null or czbs <> '3');
    end if;
    
    
    
    
  elsif v_leve = '4' then
    --特种行业
    if v_hylb = '01' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_tzhy th
       where dw.jgbh = th.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 8) || '%' or djdwdm like substr(v_orgcode, 1, 8) || '%' or czdwdm like substr(v_orgcode, 1, 8) || '%')
         and (CZBS is null or czbs <> '3');
    --公共场所     
    elsif v_hylb = '02' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_ggcs ggcs
       where dw.jgbh = ggcs.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 8) || '%' or djdwdm like substr(v_orgcode, 1, 8) || '%' or czdwdm like substr(v_orgcode, 1, 8) || '%')
         and (CZBS is null or czbs <> '3');
    --企事业单位     
    elsif v_hylb = '03' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_nbdw nbdw
       where dw.jgbh = nbdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 8) || '%' or djdwdm like substr(v_orgcode, 1, 6) || '%' or czdwdm like substr(v_orgcode, 1, 8) || '%')
         and (CZBS is null or czbs <> '3');
    --危险物品单位     
    elsif v_hylb = '04' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_wxwpdw wxwp
       where dw.jgbh = wxwp.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 8) || '%' or djdwdm like substr(v_orgcode, 1, 8) || '%' or czdwdm like substr(v_orgcode, 1, 8) || '%')
         and (CZBS is null or czbs <> '3');
    --网吧     
    elsif v_hylb = '05' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_jg_swfwcs wb
       where dw.jgbh = wb.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 8) || '%' or djdwdm like substr(v_orgcode, 1, 8) || '%' or czdwdm like substr(v_orgcode, 1, 8) || '%')
         and (CZBS is null or czbs <> '3');
    --涉外单位     
    elsif v_hylb = '06' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_swdw swdw
       where dw.jgbh = swdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 8) || '%' or djdwdm like substr(v_orgcode, 1, 8) || '%' or czdwdm like substr(v_orgcode, 1, 8) || '%')
         and (CZBS is null or czbs <> '3');
    end if;
       
       
       
  elsif v_leve = '5' then
     --特种行业
    if v_hylb = '01' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_tzhy th
       where dw.jgbh = th.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 10) || '%' or djdwdm like substr(v_orgcode, 1, 10) || '%' or czdwdm like substr(v_orgcode, 1, 10) || '%')
         and (CZBS is null or czbs <> '3');
    --公共场所     
    elsif v_hylb = '02' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_ggcs ggcs
       where dw.jgbh = ggcs.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 10) || '%' or djdwdm like substr(v_orgcode, 1, 10) || '%' or czdwdm like substr(v_orgcode, 1, 10) || '%')
         and (CZBS is null or czbs <> '3');
    --企事业单位     
    elsif v_hylb = '03' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_nbdw nbdw
       where dw.jgbh = nbdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 10) || '%' or djdwdm like substr(v_orgcode, 1, 10) || '%' or czdwdm like substr(v_orgcode, 1, 10) || '%')
         and (CZBS is null or czbs <> '3');
    --危险物品单位     
    elsif v_hylb = '04' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_wxwpdw wxwp
       where dw.jgbh = wxwp.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 10) || '%' or djdwdm like substr(v_orgcode, 1, 10) || '%' or czdwdm like substr(v_orgcode, 1, 10) || '%')
         and (CZBS is null or czbs <> '3');
    --网吧     
    elsif v_hylb = '05' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_jg_swfwcs wb
       where dw.jgbh = wb.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 10) || '%' or djdwdm like substr(v_orgcode, 1, 10) || '%' or czdwdm like substr(v_orgcode, 1, 10) || '%')
         and (CZBS is null or czbs <> '3');
    --涉外单位     
    elsif v_hylb = '06' then
      select count(1)
        into v_number
        from t_za_jg_jbxx dw,t_za_dw_swdw swdw
       where dw.jgbh = swdw.jgbh
         and (ZRDWPCSDM like substr(v_orgcode, 1, 10) || '%' or djdwdm like substr(v_orgcode, 1, 10) || '%' or czdwdm like substr(v_orgcode, 1, 10) || '%')
         and (CZBS is null or czbs <> '3');
    end if;
  end if;
  return v_number;
end;


-- Add/modify columns 
alter table T_ZA_DW_WXWPDW modify JGBH not null;
alter table T_ZA_DW_WXWPDW modify HWLB null;
alter table T_ZA_DW_WXWPDW modify DWFL null;