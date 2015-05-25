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
    cyry.zxrq,
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
    rkjbxx.xzzzrq,
    rkjbxx.sspcsdm
from t_za_ry_cyry cyry,t_lsgl_rk_jbxx rkjbxx where cyry.rybh = rkjbxx.rybh;



insert into t_common_xttx_pz (ID, PZDM, TITLE, DESCRIPTION, SQL, HREF, ISVALID, EXECUTESN, RESULTFIELD, SETFIELD, ICONPATH)
values ('cyrytx', 'cyrytx', '从业人员', '从业人员住址核实提醒，#[dwmc]的从业人员【#[xm],#[sfzh]】在您的辖区内居住，地址：#[xzdz]，请进行核实是否属实，并登记实有人口信息', 'select 
       b.rybh,
       b.sfzh,b.xm,
       c.cyrybh,
       (select dwmc from t_za_jg_jbxx where jgbh=c.jgbh) as dwmc,
       c.xzdz
from t_za_ry_cyry c inner join t_lsgl_rk_jbxx b on c.rybh=b.rybh
where xzdjwq=#[orgcode] and fksj is null', '', '1', '150', 'rybh,sfzh,xm,cyrybh,dwmc,xzdz', 'orgcode', '');

insert into t_common_xttx_pz (ID, PZDM, TITLE, DESCRIPTION, SQL, HREF, ISVALID, EXECUTESN, RESULTFIELD, SETFIELD, ICONPATH)
values ('czfwxxdjtx', 'czfwxxdjtx', '出租房屋信息登记提醒', '请检查房屋信息是否登记为出租房屋或者出租房屋信息是否登记完善，房屋地址：#[dzmc]', 'select fwid,f_get_dzmc(dzid)  as dzmc
from t_lsgl_fw_jbxx
where fwid in (
  select fwid 
    from t_lsgl_rkfw_gl
    where RKFWGLID in (
      select RKFWGLID 
      from t_lsgl_rk_ldrkzzxx 
      where zzcs=''34'' and zrdwdm=#[orgcode]
   )
)
and (HZXM is null or  HZSFZH is null)', '/lsgl/fw/toFwInfoPage.action?operType=update&queryBean.fwid=#[fwid]&queryBean.sfczw=1', '1', '130', 'fwid,dzmc', 'orgcode', '');

insert into t_common_xttx_pz (ID, PZDM, TITLE, DESCRIPTION, SQL, HREF, ISVALID, EXECUTESN, RESULTFIELD, SETFIELD, ICONPATH)
values ('ldrkdqtx', 'ldrkdqtx', '流动人口', '流动人口【#[xm],#[sfzh]】,将于#[njzrq]居住到期，请及时处理', 'select ld.zzbh,jb.rybh,jb.sfzh,jb.xm,jb.xb,to_char(njzrq,''yyyy-mm-dd'') as njzrq
from t_lsgl_rk_ldrkzzxx ld inner join t_lsgl_rk_jbxx jb on ld.rybh=jb.rybh
where 
     NJZRQ<sysdate+31 
      and zrdwdm=#[orgcode]', '/', '1', '120', 'zzbh,rybh,sfzh,xm,xb,njzrq', 'orgcode', '');

commit;
