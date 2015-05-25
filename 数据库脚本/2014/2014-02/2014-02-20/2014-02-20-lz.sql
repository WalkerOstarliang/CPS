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
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ desc) AS RN
FROM T_LSGL_RK_JBXX B INNER JOIN T_LSGL_RK_WLHCZHK C ON B.RYBH = C.RYBH;






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
      F_GET_JZDZMC_BY_RKFWGLID(C.Rkfwglid) as XZZXZ
FROM T_LSGL_RK_JBXX B
      INNER JOIN T_LSGL_RK_JWRKXX C ON B.RYBH = C.RYBH;
      
      
      

update t_common_dictionary 
       set sn = 1
 where zdlb ='GA_ZZCS' 
 and id ='54588'
 and mc ='租赁房屋'  
 commit;
 
 
 update t_common_dictionary set dm = 1 where id ='5281'  and zdlb ='QZFW_JFTJ_TJJG'
 commit;
