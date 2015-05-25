-- Add/modify columns 
alter table T_LSGL_RK_JBXX add lxdhbz varchar2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_JBXX.lxdhbz
  is '联系电话备注';
  
  
  
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
       JBXX.RYTSSX,
       JBXX.SWZMBH,
       JBXX.LXDHBZ,
       '1'  AS RN
  FROM T_LSGL_RK_JBXX JBXX;
  
  -- Create sequence 
create sequence SEQ_LSGL_RK_JHSY_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;
  