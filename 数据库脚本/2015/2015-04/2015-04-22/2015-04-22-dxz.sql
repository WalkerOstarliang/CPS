-- Create table
create table T_LSGL_RK_TH
(
  rkid    VARCHAR2(20),
  thrxm   VARCHAR2(30),
  thrjh   VARCHAR2(20),
  thrsfzh VARCHAR2(18),
  thsj    DATE,
  thdwdm  VARCHAR2(12),
  thdwmc  VARCHAR2(120),
  mbdwdm  VARCHAR2(12),
  mbdwmc  VARCHAR2(120),
  thyy    VARCHAR2(500)
);
-- Add comments to the table 
comment on table T_LSGL_RK_TH
  is '未核实人口退回表';
-- Add comments to the columns 
comment on column T_LSGL_RK_TH.rkid
  is 'czrk_st表ID';
comment on column T_LSGL_RK_TH.thrxm
  is '退回人姓名';
comment on column T_LSGL_RK_TH.thrjh
  is '退回人警号';
comment on column T_LSGL_RK_TH.thrsfzh
  is '退回人身份证';
comment on column T_LSGL_RK_TH.thsj
  is '退回时间';
comment on column T_LSGL_RK_TH.thdwdm
  is '退回单位代码';
comment on column T_LSGL_RK_TH.thdwmc
  is '退回单位名称';
comment on column T_LSGL_RK_TH.mbdwdm
  is '目标单位代码';
comment on column T_LSGL_RK_TH.mbdwmc
  is '目标单位名称';
comment on column T_LSGL_RK_TH.thyy
  is '退回原因';

  -- Create table
create table T_LSGL_RK_FK
(
  rkid    VARCHAR2(20),
  fkrxm   VARCHAR2(30),
  fkrjh   VARCHAR2(20),
  fkrsfzh VARCHAR2(18),
  fksj    DATE,
  fkdwdm  VARCHAR2(12),
  fkdwmc  VARCHAR2(120),
  fknr    VARCHAR2(1000)
);
-- Add comments to the table 
comment on table T_LSGL_RK_FK
  is '未核实人口反馈表';
-- Add comments to the columns 
comment on column T_LSGL_RK_FK.rkid
  is 'czrk_st表ID';
comment on column T_LSGL_RK_FK.fkrxm
  is '反馈人姓名';
comment on column T_LSGL_RK_FK.fkrjh
  is '反馈人警号';
comment on column T_LSGL_RK_FK.fkrsfzh
  is '反馈人身份证';
comment on column T_LSGL_RK_FK.fksj
  is '反馈时间';
comment on column T_LSGL_RK_FK.fkdwdm
  is '反馈单位代码';
comment on column T_LSGL_RK_FK.fkdwmc
  is '反馈单位名称';
comment on column T_LSGL_RK_FK.fknr
  is '反馈内容';
  
  
  -- Create table
create table T_LSGL_RK_PF
(
  rkid    VARCHAR2(20),
  pfrxm   VARCHAR2(30),
  pfrjh   VARCHAR2(20),
  pfrsfzh VARCHAR2(18),
  pfsj    DATE,
  pfdwdm  VARCHAR2(12),
  pfdwmc  VARCHAR2(120),
  mbdwdm  VARCHAR2(12),
  mbdwmc  VARCHAR2(200)
);
-- Add comments to the table 
comment on table T_LSGL_RK_PF
  is '未核实人口派发';
-- Add comments to the columns 
comment on column T_LSGL_RK_PF.rkid
  is 'czrk_st表ID';
comment on column T_LSGL_RK_PF.pfrxm
  is '派发人兴民';
comment on column T_LSGL_RK_PF.pfrjh
  is '派发人警号';
comment on column T_LSGL_RK_PF.pfrsfzh
  is '派发人身份证';
comment on column T_LSGL_RK_PF.pfsj
  is '派发时间';
comment on column T_LSGL_RK_PF.pfdwdm
  is '派发单位代码';
comment on column T_LSGL_RK_PF.pfdwmc
  is '派发单位名称';
comment on column T_LSGL_RK_PF.mbdwdm
  is '目标单位代码';
comment on column T_LSGL_RK_PF.mbdwmc
  is '目标单位名称';
  
  -- Create table
create table T_LSGL_RK_WHS
(
  rkid     VARCHAR2(20),
  sssqdm   VARCHAR2(12),
  sssqmc   VARCHAR2(200),
  ssdwdm   VARCHAR2(12),
  ssdwmc   VARCHAR2(120),
  czzt     CHAR(1) default 0,
  czsj     DATE,
  fkzt     CHAR(1) default 0,
  fksj     DATE,
  czdwdm   VARCHAR2(12),
  czdwmc   VARCHAR2(120),
  czrxm    VARCHAR2(30),
  czrjh    VARCHAR2(20),
  czrsfzh  VARCHAR2(18),
  sfdjsyrk CHAR(1) default 0 not null
);
-- Add comments to the table 
comment on table T_LSGL_RK_WHS
  is '未核实人口';
-- Add comments to the columns 
comment on column T_LSGL_RK_WHS.rkid
  is 'czrk_st表ID';
comment on column T_LSGL_RK_WHS.sssqdm
  is '所属社区代码';
comment on column T_LSGL_RK_WHS.sssqmc
  is '所属社区名称';
comment on column T_LSGL_RK_WHS.ssdwdm
  is '所属单位代码';
comment on column T_LSGL_RK_WHS.ssdwmc
  is '所属单位名称';
comment on column T_LSGL_RK_WHS.czzt
  is '操作状态（0：未派发 1：已派发 2已退回）';
comment on column T_LSGL_RK_WHS.czsj
  is '操作时间';
comment on column T_LSGL_RK_WHS.fkzt
  is '反馈状态(0未反馈 1已反馈)';
comment on column T_LSGL_RK_WHS.fksj
  is '反馈时间';
comment on column T_LSGL_RK_WHS.czdwdm
  is '操作单位代码';
comment on column T_LSGL_RK_WHS.czdwmc
  is '操作单位名称';
comment on column T_LSGL_RK_WHS.czrxm
  is '操作人姓名';
comment on column T_LSGL_RK_WHS.czrjh
  is '操作人警号';
comment on column T_LSGL_RK_WHS.czrsfzh
  is '操作人身份证号';
comment on column T_LSGL_RK_WHS.sfdjsyrk
  is '是否登记实有人口（0未登记 1已登记）';
  
  -- Add/modify columns 
alter table T_LSGL_RK_WHS add rksj date default sysdate;
-- Add comments to the columns 
comment on column T_LSGL_RK_WHS.rksj
  is '入库时间';
  
  create index INDEX_RKID on T_LSGL_RK_WHS (RKID);
