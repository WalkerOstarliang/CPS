declare
  v_count   number;
begin
	select count(1) into v_count from t_common_dictionary where zdlb='ZA_SJLY';
	if v_count=0 then
		-- 新增字典的时候，先看下是否已经插入了，防止id冲突（长沙203已经新增了，外地如果需要升级，则视情况新增）
		insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
		values (seq_common.nextval, 'ZA_SJLY', '数据采集来源', '0', '内网PC登记', '', '', '1', null);
		
		insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
		values (seq_common.nextval, 'ZA_SJLY', '数据采集来源', '1', '警务通登记', '', '', '1', null);
		
		insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
		values (seq_common.nextval, 'ZA_SJLY', '数据采集来源', '2', '外网平台登记', '', '', '1', null);
		commit;
	end if;
end;
/
create or replace view v_za_ry_cyry as
select
    cyry.cyrybh,
    cyry.rybh,
    cyry.jgbh,
    cyry.bmmc,
    cyry.gzly,
    cyry.pynx,
    cyry.zw as zwlb,
    cyry.sjhm,
    cyry.qtlxdh,
    cyry.zsqk,
    cyry.pxzh,
    cyry.pxzs,
    cyry.zdfwdxlb,
    cyry.bwcs,
    cyry.kzcs,
    cyry.zygx,
    cyry.zywt,
    cyry.jcqk,
    cyry.bz,
    cyry.zxyy,
    cyry.zxbs,
    to_char(cyry.zxrq,'yyyy-mm-dd') AS zxrq,
    cyry.czrxm,
    cyry.czdwdm,
    to_char(cyry.czsj,'yyyy-mm-dd HH24:mi:ss') as czsj,
    cyry.czbs,
    cyry.djdwdm,
    cyry.djdwmc,
    cyry.djrxm,
    to_char(cyry.djsj,'yyyy-mm-dd HH24:mi:ss') as djsj,
    cyry.czdwmc,
    to_char(cyry.lzsj,'yyyy-mm-dd') as lzsj,
    to_char(cyry.rzsj,'yyyy-mm-dd') as rzsj,
    cyry.cyryygh,
    cyry.xzdz,
    cyry.xm,
    cyry.xb,
    cyry.sfzh,
    cyry.csrq,
    cyry.mz,
    cyry.bmch,
    cyry.sfabry,
    cyry.rkfwglid,
    cyry.pfsj,
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc,
    (select hylb from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as hylb,
    cyry.djrjh,
    cyry.czrjh,
    cyry.XZDJWQ,
    (select orgname from v_common_organization where orgcode=cyry.XZDJWQ and rownum=1) as xzdjwqmc,
    cyry.FKRXM,
    cyry.FKDWDM,
    cyry.FKDWMC,
    cyry.FKSJ,
    cyry.FKNR,
    cyry.jzdpcsdm,
    cyry.jzdpcsmc,
    cyry.sfjwry,
    rkjbxx.xzzzrq,
    rkjbxx.lxdh,
    rkjbxx.xzzxz,
    rkjbxx.sspcsdm,
    cyry.jzdsqdm,
    cyry.jzdsqmc,
    nvl(rkjbxx.zjzl,'111') as zjzl,
    nvl(rkjbxx.sfzh,rkjbxx.zjhm) as zjhm,
    cyry.sfjwtdj,
    decode(cyry.sfjwtdj,
              '0',
              '内网PC登记',
              '1',
              '警务通登记',
              '2',
              '外网平台登记',
              '内网PC登记') as sfjwtdjms
from t_za_ry_cyry cyry,t_lsgl_rk_jbxx rkjbxx where cyry.rybh = rkjbxx.rybh;
