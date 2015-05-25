--出租房屋巡查登记
  update t_common_xttx_pz set downloadSql 
      = '
				      select czfwbpbm,
		           dzmc,
		           hzxm,
		           hzlxdh,
		           hzsfzh,
		           sfqdzrz,
		           cqlx,
		           sszrmjxm,
		           sszrdwmc,
		      to_char(last_time + 122, ''yyyy-mm-dd'') blsj
		  from (select fw.sfczw,
		               fw.HZXM,
		               fw.hzlxdh,
		               fw.fwid czfwid,
		               f_get_dzmc(fw.dzid) dzmc,
		               cz.czfwbpbm,
		               fw.sszrmjxm,
		               fw.sszrdwmc,
		               fw.cqlx,
		               cz.sfqdzrz,
		               fw.hzsfzh,
		               fw.fwid fwid,
		               nvl((select max(xcdj.djsj)
		                     from t_lsgl_fw_czwxcdj xcdj
		                    where xcdj.fwid = fw.fwid),
		                   (select max(czfw.djsj)
		                      from t_lsgl_czfw_jbxx czfw
		                     where czfw.FWBH = fw.fwid)) last_time
		          from t_lsgl_fw_jbxx fw, t_lsgl_czfw_jbxx cz
		         where fw.fwid = cz.fwbh
		           and cz.fwzt = ''0''
		           and (fw.zxbs = ''0'' or fw.zxbs is null)
		           and cz.czsj is not null
		           and fw.SFCZW = ''1''
		           and fw.cqlx = ''2''
		           and fw.djdwdm = #[orgcode]) fwtx
		 where (fwtx.last_time + 112) < sysdate
       '
      where id = '57718'
      
      
      
  --实体标注提醒
  update t_common_xttx_pz set downloadSql = '
		        select stbm,
       stmc,
       xzqhmc,
       JDXZMC,
       sqmc,
       jlxmc,
       mph,
       xqz,ldxz,to_char(djsj,''yyyy-mm-dd hh24:mi:ss''),
        to_char(sysdate, ''yyyy-mm-dd'') blsj
       from t_common_stxx
where djdwdm=#[orgcode] and (zxbs=''1'' or zxbs is null ) and X is null and y is null 
	 '
    where id = 'stxxbztx'
    
      --出租房屋登记提醒
  update t_common_xttx_pz set downloadSql = '
         select f_get_dzmc(dzid) as dzmc,
             a.hzxm,
             a.hzlxdh,
             a.hzsfzh,
             (select mc from t_common_dictionary where dm = a.cqlx and zdlb = ''ZDY_CQXZ'') as cqlx,
             a.djrxm,
             a.djdwmc,
              to_char(sysdate, ''yyyy-mm-dd'') blsj
       from t_lsgl_fw_jbxx a
       where a.sfczw=''0'' and fwid in
           (select fwid
              from t_lsgl_rkfw_gl
             where RKFWGLID in (select RKFWGLID
                                  from t_lsgl_rk_ldrkzzxx
                                 where zzcs = ''34'' and ZXBS =''0''
                                   and zrdwdm =#[orgcode] ))
       and (HZXM is null or HZSFZH is null)
    '
    where id = 'czfwxxdjtx'
    
    
      --从业人员核实
  update t_common_xttx_pz set downloadSql = '
	      select b.xm,
       b.sfzh,
      (select mc
           from t_common_dictionary
          where zdlb = ''GB_XB''
            and dm = b.xb) as xb,
       (select dwmc from t_za_jg_jbxx where jgbh = c.jgbh) as dwmc,   
       nvl(c.SJHM, c.qtlxdh) lxdh,
      (select mc from t_common_dictionary where zdlb = ''ZAGL_RY_ZW'' and dm = c.zw) as zwlb,
       c.xzdz,
       to_char(c.djsj + 5, ''yyyy-mm-dd'') blsj
  from t_za_ry_cyry c
 inner join t_lsgl_rk_jbxx b on c.rybh = b.rybh
 where c.xzdjwq = #[orgcode]
   and c.fksj is null
   and c.zxbs != ''1''
   and c.czbs != ''3''
   and (not exists (select 1
                      from t_lsgl_rk_czrk cz
                     where cz.rybh = c.rybh
                       and cz.djdwdm = #[orgcode]) and not exists
        (select 1
           from t_lsgl_rk_ldrkzzxx cz
          where cz.rybh = c.rybh
            and cz.djdwdm = #[orgcode]) and not exists
        (select 1
           from t_lsgl_rk_jzrkxx cz
          where cz.rybh = c.rybh
            and cz.djdwdm = #[orgcode]))
	    '
	    where id = 'cyrytx'
	

    
    commit;
    
    