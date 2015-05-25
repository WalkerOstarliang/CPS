-- Create table
create table T_LSGL_CZFW_CZXX
(
  CZXXBH  VARCHAR2(22) not null,
  RYJGBH  VARCHAR2(30),
  CZFWBH  VARCHAR2(22),
  FJBH    VARCHAR2(10),
  YFZGX   VARCHAR2(3),
  ZLRQ    DATE,
  TZRQ    DATE,
  TZYY    VARCHAR2(2),
  DJSJ    DATE,
  DJDWDM  VARCHAR2(30),
  DJR     VARCHAR2(6),
  DJRXM   VARCHAR2(30),
  DJDWMC  VARCHAR2(120),
  XGDW    VARCHAR2(30),
  XGR     VARCHAR2(6),
  XGSJ    DATE,
  XGRXM   VARCHAR2(30),
  XGDWMC  VARCHAR2(120),
  RAS     VARCHAR2(1),
  HZRXM   VARCHAR2(30),
  HZRSFZH VARCHAR2(20),
  HZRXB   VARCHAR2(4),
  JGDWMC  VARCHAR2(120),
  CZRLX   VARCHAR2(1),
  CZZT    VARCHAR2(1)
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
-- Add comments to the table 
comment on table T_LSGL_CZFW_CZXX
  is '出租房屋的承租信息';
-- Add comments to the columns 
comment on column T_LSGL_CZFW_CZXX.CZXXBH
  is '承租信息编号';
comment on column T_LSGL_CZFW_CZXX.RYJGBH
  is '承租编号';
comment on column T_LSGL_CZFW_CZXX.CZFWBH
  is '房屋编号';
comment on column T_LSGL_CZFW_CZXX.FJBH
  is '房间编号';
comment on column T_LSGL_CZFW_CZXX.YFZGX
  is '与房主关系';
comment on column T_LSGL_CZFW_CZXX.ZLRQ
  is '租赁日期';
comment on column T_LSGL_CZFW_CZXX.TZRQ
  is '退租日期';
comment on column T_LSGL_CZFW_CZXX.TZYY
  is '退租原因';
comment on column T_LSGL_CZFW_CZXX.DJSJ
  is '登记时间';
comment on column T_LSGL_CZFW_CZXX.DJDWDM
  is '登记单位';
comment on column T_LSGL_CZFW_CZXX.DJR
  is '登记人(警号)';
comment on column T_LSGL_CZFW_CZXX.DJRXM
  is '登记人';
comment on column T_LSGL_CZFW_CZXX.DJDWMC
  is '登记单位';
comment on column T_LSGL_CZFW_CZXX.XGDW
  is '修改单位代码';
comment on column T_LSGL_CZFW_CZXX.XGR
  is '修改人(警号)';
comment on column T_LSGL_CZFW_CZXX.XGSJ
  is '修改时间';
comment on column T_LSGL_CZFW_CZXX.XGRXM
  is '修改人';
comment on column T_LSGL_CZFW_CZXX.XGDWMC
  is '修改单位';
comment on column T_LSGL_CZFW_CZXX.RAS
  is '关联更新标识';
comment on column T_LSGL_CZFW_CZXX.HZRXM
  is '合租人姓名（私有，关联人员）';
comment on column T_LSGL_CZFW_CZXX.HZRSFZH
  is '合租人身份证号（私有，关联人员）';
comment on column T_LSGL_CZFW_CZXX.HZRXB
  is '合租人性别（私有，关联人员）';
comment on column T_LSGL_CZFW_CZXX.JGDWMC
  is '机构单位名称（公有，关联机构）';
comment on column T_LSGL_CZFW_CZXX.CZRLX
  is '承租人类型 1：单位租凭 2：个人租凭';
comment on column T_LSGL_CZFW_CZXX.CZZT
  is '承租状态 1：正常 2：退租';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_LSGL_CZFW_CZXX
  add constraint PK_CZXX_ID primary key (CZXXBH)
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
  
  
  
-- Create sequence 
create sequence SEQ_LSGL_CZFW_CZXX_CZBH
minvalue 1
maxvalue 999999999999999999999999999
start with 141
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_LSGL_CZFW_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 181
increment by 1
cache 20;


-- Create table
create table T_LSGL_CZFW_JBXX
(
  ID      VARCHAR2(20) not null,
  CZFWBH  VARCHAR2(22),
  ZZBH    VARCHAR2(20),
  FZXM    VARCHAR2(30),
  FZSFZH  VARCHAR2(20),
  FZXB    VARCHAR2(4),
  JGDWDM  VARCHAR2(30),
  JGDWMC  VARCHAR2(120),
  RYJGBH  VARCHAR2(20),
  DJBH    VARCHAR2(30),
  CQDW    VARCHAR2(60),
  LXDH    VARCHAR2(50),
  GLJB    VARCHAR2(3),
  ZZLX    VARCHAR2(1),
  SFXXY   VARCHAR2(1),
  CZYT    VARCHAR2(3),
  FWLX    VARCHAR2(3),
  CZJS    VARCHAR2(5),
  CZMJ    VARCHAR2(5),
  CZSJ    DATE,
  CZYZ    VARCHAR2(20),
  SJZZRS  VARCHAR2(5),
  HX      VARCHAR2(2),
  CZZZSJ  DATE,
  ZXYY    VARCHAR2(2),
  DLR     VARCHAR2(50),
  DLRSFZH VARCHAR2(18),
  DLRLXFS VARCHAR2(50),
  SFQDZRZ VARCHAR2(1),
  BZ      VARCHAR2(400),
  FWZT    VARCHAR2(1),
  GLLB    VARCHAR2(3),
  DJSJ    DATE,
  DJRXM   VARCHAR2(30),
  DJDWMC  VARCHAR2(100),
  DJDWDM  VARCHAR2(30),
  FWBH    VARCHAR2(20)
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
-- Add comments to the table 
comment on table T_LSGL_CZFW_JBXX
  is '出租房屋基本信息';
-- Add comments to the columns 
comment on column T_LSGL_CZFW_JBXX.ID
  is '主键id';
comment on column T_LSGL_CZFW_JBXX.CZFWBH
  is '出租房屋编号';
comment on column T_LSGL_CZFW_JBXX.ZZBH
  is '住址编号';
comment on column T_LSGL_CZFW_JBXX.FZXM
  is '房主姓名（私有，关联人员）';
comment on column T_LSGL_CZFW_JBXX.FZSFZH
  is '房主身份证号（私有，关联人员）';
comment on column T_LSGL_CZFW_JBXX.FZXB
  is '房主性别（私有，关联人员）';
comment on column T_LSGL_CZFW_JBXX.JGDWDM
  is '机构单位代码（公有，关联机构）';
comment on column T_LSGL_CZFW_JBXX.JGDWMC
  is '机构单位名称（公有，关联机构）';
comment on column T_LSGL_CZFW_JBXX.RYJGBH
  is '房主编号';
comment on column T_LSGL_CZFW_JBXX.DJBH
  is '租赁备案证号';
comment on column T_LSGL_CZFW_JBXX.CQDW
  is '房屋产权单位';
comment on column T_LSGL_CZFW_JBXX.LXDH
  is '房主联系电话';
comment on column T_LSGL_CZFW_JBXX.GLJB
  is '管理级别';
comment on column T_LSGL_CZFW_JBXX.ZZLX
  is '租住类型';
comment on column T_LSGL_CZFW_JBXX.SFXXY
  is '是否信息员';
comment on column T_LSGL_CZFW_JBXX.CZYT
  is '承租用途';
comment on column T_LSGL_CZFW_JBXX.FWLX
  is '房屋类型';
comment on column T_LSGL_CZFW_JBXX.CZJS
  is '出租间数';
comment on column T_LSGL_CZFW_JBXX.CZMJ
  is '出租面积';
comment on column T_LSGL_CZFW_JBXX.CZSJ
  is '出租时间';
comment on column T_LSGL_CZFW_JBXX.CZYZ
  is '月租金';
comment on column T_LSGL_CZFW_JBXX.SJZZRS
  is '实际租住人数';
comment on column T_LSGL_CZFW_JBXX.HX
  is '户型';
comment on column T_LSGL_CZFW_JBXX.CZZZSJ
  is '出租终止时间';
comment on column T_LSGL_CZFW_JBXX.ZXYY
  is '注销原因';
comment on column T_LSGL_CZFW_JBXX.DLR
  is '治安责任人';
comment on column T_LSGL_CZFW_JBXX.DLRSFZH
  is '治安责任人身份证';
comment on column T_LSGL_CZFW_JBXX.DLRLXFS
  is '治安责任人电话';
comment on column T_LSGL_CZFW_JBXX.SFQDZRZ
  is '是否签订责任状';
comment on column T_LSGL_CZFW_JBXX.BZ
  is '备注';
comment on column T_LSGL_CZFW_JBXX.FWZT
  is '房屋状态';
comment on column T_LSGL_CZFW_JBXX.GLLB
  is '管理类别';
comment on column T_LSGL_CZFW_JBXX.DJSJ
  is '登记时间';
comment on column T_LSGL_CZFW_JBXX.DJRXM
  is '登记人';
comment on column T_LSGL_CZFW_JBXX.DJDWMC
  is '登记单位名称';
comment on column T_LSGL_CZFW_JBXX.DJDWDM
  is '登记单位代码';
comment on column T_LSGL_CZFW_JBXX.FWBH
  is '房屋编号  关联房屋';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_LSGL_CZFW_JBXX
  add constraint PK_CZFW_ID primary key (ID)
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

  
  
  
-- Add/modify columns 
alter table T_COMMON_DZXX add fsdz varchar2(200);
-- Add comments to the columns 
comment on column T_COMMON_DZXX.fsdz
  is '附属地址';