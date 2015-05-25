-- Create table
create table T_COMMON_FWJCPZ
(
  ID     VARCHAR2(10),
  FWZDLB VARCHAR2(5),
  JCZQ   NUMBER,
  TQTXTS NUMBER,
  DJRQ   DATE,
  DJDWDM VARCHAR2(12),
  DJDWMC VARCHAR2(120),
  DJRXM  VARCHAR2(30),
  CZDWDM VARCHAR2(12),
  CZDWMC VARCHAR2(120),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZBS   VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_COMMON_FWJCPZ
  is '出租房屋检查提醒配置';
-- Add comments to the columns 
comment on column T_COMMON_FWJCPZ.ID
  is 'ID';
comment on column T_COMMON_FWJCPZ.FWZDLB
  is '房屋重点类别';
comment on column T_COMMON_FWJCPZ.JCZQ
  is '检查周期';
comment on column T_COMMON_FWJCPZ.TQTXTS
  is '提前检查天数';
comment on column T_COMMON_FWJCPZ.DJRQ
  is '登记日期';
comment on column T_COMMON_FWJCPZ.DJDWDM
  is '登记单位代码';
comment on column T_COMMON_FWJCPZ.DJDWMC
  is '登记单位名称';
comment on column T_COMMON_FWJCPZ.DJRXM
  is '登记人姓名';
comment on column T_COMMON_FWJCPZ.CZDWDM
  is '操作单位代码';
comment on column T_COMMON_FWJCPZ.CZDWMC
  is '操作单位名称';
comment on column T_COMMON_FWJCPZ.CZRXM
  is '操作人姓名';
comment on column T_COMMON_FWJCPZ.CZSJ
  is '操作时间';
comment on column T_COMMON_FWJCPZ.CZBS
  is '操作标识 1 :新增 2：修改 3：删除';


-- Add/modify columns 
alter table T_ZA_DW_JCPZ add TQTXTS number;
-- Add comments to the columns 
comment on column T_ZA_DW_JCPZ.TQTXTS
  is '提前提醒天数';
