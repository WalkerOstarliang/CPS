-- Create table
create table T_ZDRY_SJTH
(
  ID     VARCHAR2(20) not null,
  THRXM  VARCHAR2(30),
  THRJH  VARCHAR2(20),
  THSJ   DATE,
  THDWDM VARCHAR2(12),
  THDWMC VARCHAR2(120),
  ZDRYBH VARCHAR2(30),
  SFZH   VARCHAR2(18),
  THYY   VARCHAR2(200)
);
-- Add comments to the table 
comment on table T_ZDRY_SJTH
  is '市局重点人员退回';
-- Add comments to the columns 
comment on column T_ZDRY_SJTH.ID
  is '主键ID';
comment on column T_ZDRY_SJTH.THRXM
  is '退回人姓名';
comment on column T_ZDRY_SJTH.THRJH
  is '退回人警号';
comment on column T_ZDRY_SJTH.THSJ
  is '退回时间';
comment on column T_ZDRY_SJTH.THDWDM
  is '退回单位代码';
comment on column T_ZDRY_SJTH.THDWMC
  is '退回单位名称';
comment on column T_ZDRY_SJTH.ZDRYBH
  is '重点人员编号';
comment on column T_ZDRY_SJTH.SFZH
  is '重点人员身份证';
comment on column T_ZDRY_SJTH.THYY
  is '退回原因';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZDRY_SJTH
  add primary key (ID);
  
  
  -- Create sequence 
create sequence SEQ_ZDRY_SJTH_ID
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
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
       GZDX.Gxdwdm
  FROM T_LSGL_RK_JBXX JBXX 
  right JOIN 
  (select GZDX.* from T_ZDRY_GZDX  GZDX where not exists (select 1 from t_zdry_sjth th where th.sfzh = GZDX.Sfzh )) GZDX
  ON JBXX.RYBH=GZDX.RYBH;
  
  
-- Add/modify columns 
alter table T_ZDRY_XSBX add ZDRYBH varchar2(20);
alter table T_ZDRY_XSBX add YJLBH VARCHAR2(24);
alter table T_ZDRY_XSBX add QWBSQHxz varchar2(100);
-- Add comments to the columns 
comment on column T_ZDRY_XSBX.ZDRYBH
  is '重点人员编号';
comment on column T_ZDRY_XSBX.YJLBH
  is '去往省市详址';
comment on column T_ZDRY_XSBX.QWBSQHxz
  is '基础平台原记录编号';	
  
  
alter table T_ZDRY_XSBX modify JJJJPDYJ VARCHAR2(300);
alter table T_ZDRY_XSBX modify WGDSRPDYY VARCHAR2(300);

  
