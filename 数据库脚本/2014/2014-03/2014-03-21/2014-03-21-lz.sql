-- Create table
create table t_lsgl_ldrk_yqzx
(
  id       varchar2(32),
  czrjh    varchar2(6),
  czrxm    varchar2(30),
  czrsfzh  varchar2(18),
  czdwdm   varchar2(12),
  czdwmc   varchar2(60),
  cllx     varchar2(2),
  ldrkzzbh varchar2(20),
  ldrkrybh varchar2(20),
  ldrksfzh varchar2(18)
)
;
-- Add comments to the table 
comment on table t_lsgl_ldrk_yqzx
  is '流动人口的延期注销';
-- Add comments to the columns 
comment on column t_lsgl_ldrk_yqzx.id
  is '主键ID';
comment on column t_lsgl_ldrk_yqzx.czrjh
  is '操作人警号';
comment on column t_lsgl_ldrk_yqzx.czrxm
  is '操作人姓名';
comment on column t_lsgl_ldrk_yqzx.czrsfzh
  is '操作人身份证号';
comment on column t_lsgl_ldrk_yqzx.czdwdm
  is '操作单位代码';
comment on column t_lsgl_ldrk_yqzx.czdwmc
  is '操作单位名称';
comment on column t_lsgl_ldrk_yqzx.cllx
  is '处理类型（2、到期延期  1、到期注销 ）';
comment on column t_lsgl_ldrk_yqzx.ldrkzzbh
  is '流动人口的zzbh';
comment on column t_lsgl_ldrk_yqzx.ldrkrybh
  is '人员编号';
comment on column t_lsgl_ldrk_yqzx.ldrksfzh
  is '身份证号';
  
  
-- Add/modify columns 
alter table T_LSGL_LDRK_YQZX add czsj date;
-- Add comments to the columns 
comment on column T_LSGL_LDRK_YQZX.czsj
  is '操作时间';


  -- Create sequence 
create sequence SEQ_LSGL_LDRK_YQZX_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;



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
       GZDX.Ssxzsqmc,
       gzdx.zdrybh
  FROM T_LSGL_RK_JBXX JBXX
  right JOIN
  (select GZDX.* from T_ZDRY_GZDX  GZDX where not exists (select 1 from t_zdry_sjth th where th.sfzh = GZDX.Sfzh )) GZDX
  ON JBXX.RYBH=GZDX.RYBH;
