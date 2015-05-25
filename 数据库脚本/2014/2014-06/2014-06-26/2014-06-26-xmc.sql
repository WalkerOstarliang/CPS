-- Add/modify columns 
alter table T_LSGL_CZFW_JBXX add ZHXCSJ date default sysdate;
-- Add comments to the columns 
comment on column T_LSGL_CZFW_JBXX.ZHXCSJ
  is '最好巡查时间';

  
update t_lsgl_czfw_jbxx fw
set ZHXCSJ = nvl(
    (select to_date(to_char(max(xcdj.djsj),'yyyy-mm-dd') , 'yyyy-mm-dd') from t_lsgl_fw_czwxcdj xcdj where xcdj.fwid = fw.fwbh),
    (select to_date(to_char(max(czfw.djsj),'yyyy-mm-dd') , 'yyyy-mm-dd') from t_lsgl_czfw_jbxx czfw where czfw.FWBH = fw.fwbh))
;
commit;