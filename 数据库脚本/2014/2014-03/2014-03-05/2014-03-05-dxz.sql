-- Add/modify columns 
alter table T_ZDRY_GZDX add SSXZSQMC varchar2(200);
-- Add comments to the columns 
comment on column T_ZDRY_GZDX.SSXZSQMC
  is '所属行政社区名称';
  
  
  -- Add/modify columns 
alter table T_ZDRY_RYPF add xzsqmc varchar2(200);
-- Add comments to the columns 
comment on column T_ZDRY_RYPF.xzsqmc
  is '行政社区名称';
  
  
  
  -- Add/modify columns 
alter table T_ZDRY_WTXX add xzsqdm varchar2(20);
alter table T_ZDRY_WTXX add xzsqdmmc varchar2(200);
-- Add comments to the columns 
comment on column T_ZDRY_WTXX.xzsqdm
  is '行政社区代码';
comment on column T_ZDRY_WTXX.xzsqdmmc
  is '行政社区代码名称';
  
  
  
  
  CREATE OR REPLACE VIEW V_ZDRY_GZDX AS
SELECT JBXX.RYBH,
       JBXX.XM,
       JBXX.XMPY,
       JBXX.SFZH,
       JBXX.XB,
       JBXX.GJ,
       JBXX.MZ,
       TO_CHAR(JBXX.CSRQ,'YYYY-MM-DD') AS CSRQ,
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
       JBXX.XZZQH,
       JBXX.HJDXZ,
       JBXX.XZZXZ,
       JBXX.sspcsdm,
       jbxx.ssgajgjgdm,
       jbxx.xzzzrq,
       GZDX.GZDXBH,
       GZDX.DXLB,
       GZDX.DXLB AS DXLBMC,
       GZDX.SALB,
       GZDX.LADW,
       GZDX.LADWJGDM,
       GZDX.CYZK,
       GZDX.CBCLQK,
       GZDX.SSYJ,
       GZDX.YWDA,
       GZDX.DABH,
       GZDX.ZTLX,
       GZDX.XMJJZS,
       GZDX.ISCJBJ,
       GZDX.BJCJLX,
       GZDX.ISCJZW,
       GZDX.FLWSBH,
       GZDX.FLWSMC,
       GZDX.QFJG,
       GZDX.QFSJ,
       GZDX.GLLB,
       GZDX.GLFF,
       GZDX.LGRQ,
       GZDX.LGLY,
       GZDX.LGYY,
       GZDX.CGRQ,
       GZDX.CGLY,
       GZDX.LGZT,
       GZDX.ISQGQLZDRY,
       GZDX.NRBJZDRYKSJ,
       GZDX.ZDRYLBBJ,
       GZDX.ZDRYXL,
       GZDX.YXX,
       GZDX.XZSJ,
       GZDX.BJSJ,
       GZDX.CXSJ,
       GZDX.CXDW,
       GZDX.CXR,
       GZDX.DJRXM,
       GZDX.DJDWDM,
       GZDX.DJDWMC,
       GZDX.DJSJ,
       GZDX.SSZRDWDM,
       GZDX.SSZRDWMC,
       GZDX.SFRL,
       GZDX.Gxdwdm,
       GZDX.ssxzsq,
       GZDX.Ssxzsqmc
  FROM T_LSGL_RK_JBXX JBXX
  right JOIN
  (select GZDX.* from T_ZDRY_GZDX  GZDX where not exists (select 1 from t_zdry_sjth th where th.sfzh = GZDX.Sfzh )) GZDX
  ON JBXX.RYBH=GZDX.RYBH;
  
  
  -- Add/modify columns 
alter table T_ZDRY_WTXX rename column XZSQDMMC to XZSQMC;
  