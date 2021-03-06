-- Create/Recreate indexes 
create index T_LSGL_RK_LDRKZZXX_SSSQBH on T_LSGL_RK_LDRKZZXX (sssqbh)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  
  
  
  -- Create/Recreate indexes 
create index t_lsgl_rk_czrk_hjsssqbh on T_LSGL_RK_CZRK (hjsssqbh)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  
  
  
  CREATE OR REPLACE VIEW V_LSGL_RK_JZRKXX AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      B.CSRQ,
      B.BMCH,
      B.BYZK,
      B.YWM,
      B.WHCD,
      B.ZJZL,
      B.ZJHM,
      B.ZZMM,
      B.HYZK,
      B.SG,
      B.XX,
      B.ZZXY,
      B.ZC,
      B.LXDH,
      B.FWCS,
      B.ZYDM,
      B.ZW,
      B.SF,
      B.JG,
      B.RYSX,
      B.HJDQH,
      B.HJDXZ,
      B.XZZQH,
      B.XZZQHMC,
      B.XZZXZ,
      B.XZZZRQ,
      B.SSGAJGJGDM,
      B.SSGAJGJGMC,
      B.SSPCSDM,
      B.SSPCSMC,
      B.Rytssx,
      '5' as RYLB,
      C.JZBH,
      TO_CHAR(C.JZSJ,'YYYY-MM-DD') AS JZSJ,
      C.JZYY,
      C.YHZGY,
      C.HZSFZH,
      C.HZXM,
      C.GLLB,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      TO_CHAR(C.CZSJ,'YYYY-MM-DD HH24:MI:SS') AS CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.ZXBS,
      C.RKFWGLID,
      C.sssqbh,
      TO_CHAR(C.ZXSJ,'YYYY-MM-DD HH24:MI:SS') AS ZXSJ,
      C.ZXYY,
      C.BZ
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_JZRKXX C ON B.RYBH = C.RYBH;



CREATE OR REPLACE VIEW V_LSGL_RK_JWRKXX AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      TO_CHAR(CSRQ,'YYYY-MM-DD') AS CSRQ,
      B.BMCH,
      B.BYZK,
      B.WHCD,
      B.ZJZL,
      B.ZJHM,
      B.ZZMM,
      B.HYZK,
      B.SG,
      B.XX,
      B.ZZXY,
      B.ZC,
      B.LXDH,
      B.FWCS,
      B.ZYDM,
      B.ZW,
      B.SF,
      B.JG,
      B.RYSX,
      B.Hjdqh,
      '4' as RYLB,
      C.JWBH,
      C.RJZJZL,
      C.RJZJHM,
      TO_CHAR(C.ZJYXQ,'YYYY-MM-DD') AS ZJYXQ,
      C.QZZL,
      TO_CHAR(C.QZYXQ,'YYYY-MM-DD') AS QZYXQ,
      TO_CHAR(C.TLYXQ,'YYYY-MM-DD') AS TLYXQ,
      C.QZJG,
      C.TLSY,
      TO_CHAR(C.QFRQ,'YYYY-MM-DD') AS QFRQ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.JWRYLX,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.BZ,
      C.RKFWGLID,
      C.Ywx,
      C.Ywm,
      c.sssqbh,
      F_GET_JZDZMC_BY_RKFWGLID(C.Rkfwglid) as XZZXZ
FROM T_LSGL_RK_JBXX B
      INNER JOIN T_LSGL_RK_JWRKXX C ON B.RYBH = C.RYBH;


CREATE OR REPLACE VIEW V_LSGL_RK_WLHCZHK AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      TO_CHAR(CSRQ,'YYYY-MM-DD') AS CSRQ,
      B.BMCH,
      B.BYZK,
      B.YWM,
      B.WHCD,
      B.ZJZL,
      B.ZJHM,
      B.ZZMM,
      B.HYZK,
      B.SG,
      B.XX,
      B.ZZXY,
      B.ZC,
      B.LXDH,
      B.FWCS,
      B.ZYDM,
      B.ZW,
      B.SF,
      B.JG,
      B.RYSX,
      B.Hjdqh,
      B.Xzzxz,
      B.Hjdxz,
      '3' as rylb,
      C.WLHRKBH,
      C.CZJZL,
      C.CZJHM,
      C.WLHYY,
      TO_CHAR(C.WLHQSSJ,'YYYY-MM-DD') AS WLHQSSJ,
      C.YHJDQH,
      C.YHJDXZ,
      C.CSDXZ,
      C.BZ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.Rkfwglid,
      C.SSGAJGJGDM,
      C.SSGAJGJGMC,
      C.SSPCSDM,
      C.SSPCSMC,
      c.sssqbh,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ desc) AS RN
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_WLHCZHK C ON B.RYBH = C.RYBH;

  