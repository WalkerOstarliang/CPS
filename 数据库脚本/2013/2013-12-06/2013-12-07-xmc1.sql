-- Create table
create table T_COMMON_STXX
(
  ID      VARCHAR2(30) not null,
  STBM    VARCHAR2(25),
  STMC    VARCHAR2(120),
  XZQH    VARCHAR2(6),
  XZQHMC  VARCHAR2(120),
  JDXZDM  VARCHAR2(12),
  JDXZMC  VARCHAR2(120),
  SQDM    VARCHAR2(12),
  SQMC    VARCHAR2(120),
  JLXDM   VARCHAR2(20),
  JLXMC   VARCHAR2(120),
  MPH     VARCHAR2(50),
  XQZ     VARCHAR2(60),
  LDXZ    VARCHAR2(100),
  STFL    VARCHAR2(7),
  DMCS    VARCHAR2(3),
  DXCS    VARCHAR2(3),
  JZJG    VARCHAR2(20),
  KFS     VARCHAR2(100),
  WYGLDW  VARCHAR2(100),
  ZBDW    VARCHAR2(100),
  XFDJ    VARCHAR2(4),
  PCSDM   VARCHAR2(12),
  PCSMC   VARCHAR2(100),
  X       NUMBER(19,8),
  Y       NUMBER(19,8),
  ISVALID VARCHAR2(1) default 1,
  GXSJ    DATE
);
-- Add comments to the table 
comment on table T_COMMON_STXX
  is '实体建筑物信息';
-- Add comments to the columns 
comment on column T_COMMON_STXX.ID
  is 'ID主键递增';
comment on column T_COMMON_STXX.STBM
  is '实体编码';
comment on column T_COMMON_STXX.STMC
  is '实体名称';
comment on column T_COMMON_STXX.XZQH
  is '行政区划代码';
comment on column T_COMMON_STXX.XZQHMC
  is '行政区划名称';
comment on column T_COMMON_STXX.JDXZDM
  is '街道乡镇代码';
comment on column T_COMMON_STXX.JDXZMC
  is '街道乡镇名称';
comment on column T_COMMON_STXX.JLXDM
  is '街路巷代码';
comment on column T_COMMON_STXX.JLXMC
  is '街路巷名称';
comment on column T_COMMON_STXX.SQDM
  is '社区代码';
comment on column T_COMMON_STXX.SQMC
  is '社区名称';
comment on column T_COMMON_STXX.MPH
  is '门牌号';
comment on column T_COMMON_STXX.XQZ
  is '小区组';
comment on column T_COMMON_STXX.LDXZ
  is '楼栋祥址';
comment on column T_COMMON_STXX.STFL
  is '实体分类';
comment on column T_COMMON_STXX.DMCS
  is '地上层数';
comment on column T_COMMON_STXX.DXCS
  is '低下层数';
comment on column T_COMMON_STXX.JZJG
  is '建筑结构';
comment on column T_COMMON_STXX.KFS
  is '开发商';
comment on column T_COMMON_STXX.WYGLDW
  is '物业管理单位';
comment on column T_COMMON_STXX.ZBDW
  is '治保单位';
comment on column T_COMMON_STXX.XFDJ
  is '消防等级';
comment on column T_COMMON_STXX.PCSMC
  is '派出所名称';
comment on column T_COMMON_STXX.X
  is 'X坐标';
comment on column T_COMMON_STXX.Y
  is 'Y坐标';
comment on column T_COMMON_STXX.PCSDM
  is '派出所代码';
comment on column T_COMMON_STXX.ISVALID
  is '有效性0：无效 1：有效';
comment on column T_COMMON_STXX.GXSJ
  is '更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_COMMON_STXX add primary key (ID);
alter table T_COMMON_STXX add unique (STBM) ;


-- Add/modify columns 
alter table T_LSGL_RK_CZRK add JHRYSFZH VARCHAR2(18);
alter table T_LSGL_RK_CZRK add JHRESFZH VARCHAR2(18);
-- Add comments to the columns 
comment on column T_LSGL_RK_CZRK.JHRYSFZH
  is '监护人一身份证号';
comment on column T_LSGL_RK_CZRK.JHRESFZH
  is '监护人二身份证号';

  
  -- Drop columns 
alter table T_COMMON_DZXX drop column DZJD;
alter table T_COMMON_DZXX drop column DZWD;
  
  
-- Add/modify columns 
alter table T_COMMON_DZXX modify LDH VARCHAR2(30);

-- Add/modify columns 
alter table T_COMMON_DZXX add YDZBH VARCHAR2(25);
-- Add comments to the columns 
comment on column T_COMMON_DZXX.YDZBH
  is '原地址编号';

  