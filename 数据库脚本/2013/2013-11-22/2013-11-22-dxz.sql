-- Add/modify columns 
alter table T_ZA_RY_CYRY add mz varchar2(10);
alter table T_ZA_RY_CYRY add bmch varchar2(200);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.mz
  is '民族';
comment on column T_ZA_RY_CYRY.bmch
  is '别名绰号';
  
  
  
  
  --从业人员视图
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
    (select DWMC from t_za_jg_jbxx jg where jg.jgbh=cyry.jgbh) as dwmc
from t_za_ry_cyry cyry;


--单位安全设备信息
-- Create table
create table T_ZA_DW_AQSBXX
(
  SBBH    VARCHAR2(20) not null,
  JGBH    VARCHAR2(27) not null,
  XCP     VARCHAR2(1),
  LZJY    VARCHAR2(1),
  SSDT    VARCHAR2(1),
  TST     NUMBER,
  JYPLQ   VARCHAR2(1),
  MHQ     NUMBER,
  XHS     VARCHAR2(1),
  DXTG    VARCHAR2(1),
  TSCK    VARCHAR2(1),
  HZBJXT  VARCHAR2(1),
  AQCKZSP VARCHAR2(1),
  GL      VARCHAR2(1),
  JKXT    NUMBER,
  SPSXT   NUMBER,
  BZ      VARCHAR2(500),
  DJRXM   VARCHAR2(30),
  DJDWMC  VARCHAR2(120),
  DJDWDM  VARCHAR2(12),
  DJSJ    DATE,
  CZRXM   VARCHAR2(30),
  CZDWDM  VARCHAR2(12),
  CZDWMC  VARCHAR2(120),
  CZSJ    DATE
)
tablespace TS_DT_DTJF
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column T_ZA_DW_AQSBXX.SBBH
  is '设备编号';
comment on column T_ZA_DW_AQSBXX.JGBH
  is '机构编号';
comment on column T_ZA_DW_AQSBXX.XCP
  is '宣传牌';
comment on column T_ZA_DW_AQSBXX.LZJY
  is '亮照经营';
comment on column T_ZA_DW_AQSBXX.SSDT
  is '疏散电梯';
comment on column T_ZA_DW_AQSBXX.TST
  is '逃生梯（具）';
comment on column T_ZA_DW_AQSBXX.JYPLQ
  is '简易喷淋';
comment on column T_ZA_DW_AQSBXX.MHQ
  is '灭火器（瓶）';
comment on column T_ZA_DW_AQSBXX.XHS
  is '消火栓';
comment on column T_ZA_DW_AQSBXX.DXTG
  is '电线套管';
comment on column T_ZA_DW_AQSBXX.TSCK
  is '逃生出口';
comment on column T_ZA_DW_AQSBXX.HZBJXT
  is '火灾报警系统';
comment on column T_ZA_DW_AQSBXX.AQCKZSP
  is '安全出口指示牌';
comment on column T_ZA_DW_AQSBXX.GL
  is '阁楼';
comment on column T_ZA_DW_AQSBXX.JKXT
  is '监控系统（个）';
comment on column T_ZA_DW_AQSBXX.SPSXT
  is '视频摄像头（个）';
comment on column T_ZA_DW_AQSBXX.BZ
  is '备注';
comment on column T_ZA_DW_AQSBXX.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_AQSBXX.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_AQSBXX.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_AQSBXX.DJSJ
  is '登记时间';
comment on column T_ZA_DW_AQSBXX.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_AQSBXX.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_AQSBXX.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_AQSBXX.CZSJ
  is '操作时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_AQSBXX
  add primary key (SBBH)
  using index 
  tablespace TS_DT_DTJF
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
--安全设备序列
create sequence seq_zdy_za_dw_aqsb
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1
cache 99999999999999999999
cycle;
  