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
     cyry.jzdsqmc
from t_za_ry_cyry cyry,t_lsgl_rk_jbxx rkjbxx where cyry.rybh = rkjbxx.rybh;

delete t_common_xttx_pz  where pzdm = 'cyrypftx';
commit;
insert into t_common_xttx_pz (ID, PZDM, TITLE, DESCRIPTION, SQL, HREF, ISVALID, EXECUTESN, RESULTFIELD, SETFIELD, ICONPATH, DOWNLOADSQL)
values ('cyrypftx', 'cyrypftx', '从业人员派发提醒', '从业人员姓名：#[xm],身份证号：#[sfzh], 当前居住地址:#[xzdz]，还未派发至社区请及时派发或反馈。', 'SELECT cyrybh,rybh,jgbh,sfzh,xm,xzdz,DJSJ AS blsj
FROM T_ZA_RY_CYRY
WHERE JZDPCSDM IS NOT NULL
AND XZDJWQ IS NULL
AND FKSJ IS NULL
AND JZDPCSDM=#[orgcode]', '/zagl/dw/toCyrypf.action?dw.cyry.cyrybh=#[cyrybh]&dw.opertype=update&isxttxpage=true&isCyrypf=true', '1', '117', 'cyrybh,rybh,jgbh,sfzh,xm,xzdz', 'orgcode', '', 'select s.xm,
       s.sfzh,
       (select mc
          from t_common_dictionary
         where zdlb = ''GB_XB''
           and dm = s.xb) as xb,
       s.csrq,
       s.dwmc,
       s.SJHM,
       (select mc
          from t_common_dictionary
         where zdlb = ''ZAGL_RY_ZW''
           and dm = s.zwlb) as zwlb,
       s.xzdz
  from v_za_ry_cyry s
WHERE JZDPCSDM IS NOT NULL
AND XZDJWQ IS NULL
AND FKSJ IS NULL
AND JZDPCSDM=#[orgcode]');
commit;
