--所领导、刑侦、巡防、治安、社区、内勤、其它
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '01', '所领导', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '02', '刑侦', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '03', '巡防', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '04', '治安', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '05', '社区', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '06', '内勤', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_GZGW', '工作岗位', '99', '其它', '', '', '1', null);
commit;




insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (t_common_dictionary_id.nextval, 'ZDY_JZYY', '寄住原因', '800', '购买房屋', '', '', '1', null);
commit;



--重点人员托管提醒
update t_common_xttx_pz 
set sql = 
'
select t.id tgxxId,
       c.rybh,
       c.xm,
       a.sfzh,
       t.wtrxm wtrxm,
       t.wtdwmc wtdwmc,
       to_char(t.wtsj, ''yyyy-mm-dd hh24:mi:ss'') wtsj,
       to_char((t.wtsj + 6), ''yyyy-mm-dd hh24:mi:ss'') clsj,
       to_char((t.wtsj + 6), ''yyyy-mm-dd'') blsj
  from T_ZDRY_WTXX t, t_zdry_gzdx a, t_lsgl_rk_jbxx c
 where a.sfzh = t.sfzh
   and a.rybh = c.rybh
   and t.jgzt = ''0''
   and t.jgdwdm = # orgcode
   and (a.yxx is null or a.yxx = ''1'')
'
where id = 'zdryzktg'



--重点人员在控登记
update t_common_xttx_pz 
set sql = 
'
select rk.xm,
       rk.sfzh,
       rk.lxdh,
       (select max(djsj) from t_zdry_xsbx where sfzh = rk.sfzh) as last_time,
       rk.xzzxz
  from t_zdry_gzdx zdry, t_lsgl_rk_jbxx rk
 where zdry.rybh = rk.rybh
   and (zdry.sfzh in
       (select sfzh
           from (select rybh,
                        sfzh,
                        djsj,
                        row_number() over(partition by sfzh order by djsj desc) as sn
                   from t_zdry_xsbx
                  where djdwdm = # orgcode
                    and sfzh is not null)
          where sn = ''1''
            and to_char(djsj, ''yyyymm'') != to_char(sysdate, ''yyyymm'')) or
       zdry.sfzh not in (select sfzh
                            from t_zdry_xsbx
                           where djdwdm = # orgcode
                             and sfzh is not null))
   and zdry.sszrdwdm = # orgcode
   and (zdry.yxx is null or zdry.yxx = ''1'')
'
where id = 'zdryzkdj'

commit;
