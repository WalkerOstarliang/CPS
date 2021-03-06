CREATE OR REPLACE VIEW V_LSGL_RK_JBXX AS
SELECT /*+index(JBXX T_LSGL_RK_JBXX_SFZH)*/ JBXX.RYBH,
       JBXX.XM,
       JBXX.XMPY,
       JBXX.SFZH,
       JBXX.XB,
       JBXX.GJ,
       JBXX.MZ,
       TO_CHAR(JBXX.CSRQ,'yyyy-MM-dd') AS CSRQ,
       JBXX.BMCH,
       JBXX.BYZK,
       JBXX.YWM,
       JBXX.WHCD,
       JBXX.ZJZL,
       JBXX.ZJHM,
       JBXX.ZZMM,
       JBXX.HYZK,
       JBXX.SG,
       JBXX.XX,
       JBXX.ZZXY,
       JBXX.ZC,
       JBXX.LXDH,
       JBXX.FWCS,
       JBXX.ZYDM,
       JBXX.ZW,
       JBXX.SF,
       JBXX.JG,
       JBXX.RYSX,
       JBXX.RYLB,
       JBXX.HJDQH,
       JBXX.HJDXZ,
       JBXX.SSGAJGJGDM,
       JBXX.SSGAJGJGMC,
       JBXX.SSPCSDM,
       JBXX.SSPCSMC,
       JBXX.XZZQH,
       JBXX.XZZQHMC,
       JBXX.XZZXZ,
       JBXX.XZZZRQ,
       JBXX.CZSJ,
       JBXX.CZDWDM,
       JBXX.CZDWMC,
       JBXX.CZRJH,
       JBXX.CZRXM,
       JBXX.CZBS,
       JBXX.SWRQ,
       JBXX.SWZMBH,
       '1'  AS RN
  FROM T_LSGL_RK_JBXX JBXX;
  
CREATE OR REPLACE VIEW V_LSGL_CZRK_FWGL AS
SELECT CK.*,FW.FWID,FW.DZID,FW.FWMC,dz.dzmc
FROM V_LSGL_RK_CZRK CK LEFT JOIN T_LSGL_RKFW_GL GL ON CK.RKFWGLID=GL.RKFWGLID
     LEFT JOIN T_LSGL_FW_JBXX FW ON FW.FWID=GL.FWID
     left join t_common_dzxx dz on dz.dzid=gl.dzid;


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
      TO_CHAR(C.ZXSJ,'YYYY-MM-DD HH24:MI:SS') AS ZXSJ,
      C.ZXYY,
      C.BZ,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ DESC) AS RN
FROM V_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_JZRKXX C ON B.RYBH = C.RYBH;

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
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ ASC) RN
FROM T_LSGL_RK_JBXX B
      INNER JOIN T_LSGL_RK_JWRKXX C ON B.RYBH = C.RYBH;

      
CREATE OR REPLACE VIEW V_LSGL_RK_LDRK AS
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
      '2' as RYLB,
      B.HJDQH,
      B.HJDXZ,
      C.ZZBH,
      C.ZZZBH,
      C.HH,
      C.FZSFZH,
      C.FZXM,
      C.YHZGX,
      TO_CHAR(C.LBDRQ,'YYYY-MM-DD') AS LBDRQ,
      TO_CHAR(C.ZZZQFRQ,'YYYY-MM-DD') AS ZZZQFRQ,
      TO_CHAR(C.ZZZYXQJZRQ,'YYYY-MM-DD') AS ZZZYXQJZRQ,
      C.XFWCS,
      C.ZZSY,
      C.ZZDQH,
      C.ZZDXZ,
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
      C.XCSZY,
      C.SSGAJGJGDM,
      C.SSGAJGJGMC,
      C.SSPCSDM,
      C.SSPCSMC,
      C.ZZCS,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.ZAGLZRRXM,
      C.ZAGLZRRSFZH,
      C.GZGX,
      C.FHBH,
      C.BZ,
      C.HDQK,
      C.HJDLX,
      C.NJZQX,
      C.RKFWGLID,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ DESC) AS RN
FROM V_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_LDRKZZXX C ON B.RYBH = C.RYBH;
      
      
CREATE OR REPLACE VIEW V_LSGL_RK_CZRK AS
SELECT
      /*+index(JBXX T_LSGL_RK_JBXX_RYBH)*/ B.RYBH,
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
      '1' as RYLB,
      B.RYSX,
      B.HJDQH,
      B.HJDXZ,
      rpad(trim(B.SSGAJGJGDM),12,'0') as SSGAJGJGDM,
      B.SSGAJGJGMC,
      rpad(trim(B.SSPCSDM),12,'0') as SSPCSDM,
      B.SSPCSMC,
      C.CZRKBH,
      C.HH,
      C.HKLB,
      C.YHZGX,
      C.HKXZ,
      C.BDYY,
      TO_CHAR(C.BDSJ,'YYYY-MM-DD') AS BDSJ,
      C.BDQH,
      C.BDXZ,
      C.QRYY,
      TO_CHAR(C.QRSJ,'YYYY-MM-DD') AS QRSJ,
      C.HDQR,
      C.HDQRXZ,
      C.RYZT,
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
      C.ZZSSXQ,
      C.ZZXZ,
      C.QTZZSSXQ,
      C.QTZZXZ,
      C.JHRYXM,
      C.YJHRYGX,
      C.JHREXM,
      C.YJHREGX,
      C.RKFWGLID,
      '1' AS RN
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_CZRK C ON B.RYBH = C.RYBH;
      