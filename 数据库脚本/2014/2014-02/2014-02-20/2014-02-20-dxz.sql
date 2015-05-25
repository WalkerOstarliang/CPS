-- Create table
create table T_ZDRY_WTXX
(
  ID      VARCHAR2(20) not null,
  SFZH    VARCHAR2(30),
  WTRXM   VARCHAR2(30),
  WTRJH   VARCHAR2(20),
  WTDWDM  VARCHAR2(12),
  WTDWMC  VARCHAR2(120),
  WTSJ    DATE,
  WTYY    VARCHAR2(400),
  JGRXM   VARCHAR2(30),
  JGRJH   VARCHAR2(20),
  JGDWMC  VARCHAR2(120),
  JGDWDM  VARCHAR2(12),
  JGSJ    DATE,
  THYY    VARCHAR2(400),
  JGZT    VARCHAR2(1),
  WTRLXFS VARCHAR2(20),
  JGRLXFS VARCHAR2(20)
);
-- Add comments to the columns 
comment on column T_ZDRY_WTXX.ID
  is '主键ID';
comment on column T_ZDRY_WTXX.SFZH
  is '重点人员身份号';
comment on column T_ZDRY_WTXX.WTRXM
  is '委托人姓名';
comment on column T_ZDRY_WTXX.WTRJH
  is '委托人警号';
comment on column T_ZDRY_WTXX.WTDWDM
  is '委托人单位代码';
comment on column T_ZDRY_WTXX.WTDWMC
  is '委托单位名称';
comment on column T_ZDRY_WTXX.WTSJ
  is '委托时间';
comment on column T_ZDRY_WTXX.WTYY
  is '委托原因';
comment on column T_ZDRY_WTXX.JGRXM
  is '接管人姓名';
comment on column T_ZDRY_WTXX.JGRJH
  is '接管人警号';
comment on column T_ZDRY_WTXX.JGDWMC
  is '接管单位名称';
comment on column T_ZDRY_WTXX.JGDWDM
  is '接管单位代码';
comment on column T_ZDRY_WTXX.JGSJ
  is '接管时间';
comment on column T_ZDRY_WTXX.THYY
  is '退回原因';
comment on column T_ZDRY_WTXX.JGZT
  is '接管状态（0：未接管，1：已接管，2：退回）';
comment on column T_ZDRY_WTXX.WTRLXFS
  is '委托人联系方式';
comment on column T_ZDRY_WTXX.JGRLXFS
  is '接管人联系方式';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZDRY_WTXX
  add primary key (ID);




-- Create sequence 
create sequence SEQ_ZDRY_WTXX_ID
minvalue 1000000000000000001
maxvalue 9999999999999999999
start with 1000000000000000001
increment by 1;


-- Add/modify columns 
alter table T_ZDRY_RYPF add sfzh varchar2(18);
-- Add comments to the columns 
comment on column T_ZDRY_RYPF.sfzh
  is '重点人员身份证';



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
  FROM T_LSGL_RK_JBXX JBXX right JOIN T_ZDRY_GZDX  GZDX ON JBXX.RYBH=GZDX.RYBH;
