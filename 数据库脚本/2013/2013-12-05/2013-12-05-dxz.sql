-- 治安管理保卫机构
create table T_ZA_DW_BWJG
(
  BWJGBH  VARCHAR2(20) not null,
  JGBH    VARCHAR2(27) not null,
  JGMC    VARCHAR2(200),
  LSGX    VARCHAR2(200),
  FZR     VARCHAR2(30),
  FZRSFZH VARCHAR2(18),
  FZRLXFS VARCHAR2(30),
  DJRXM   VARCHAR2(30),
  DJSJ    DATE,
  DJDWMC  VARCHAR2(120),
  DJDWDM  VARCHAR2(12),
  CZRXM   VARCHAR2(30),
  CZSJ    DATE,
  CZDWMC  VARCHAR2(120),
  CZDWDM  VARCHAR2(12),
  CZBS    VARCHAR2(1)
)
tablespace TS_DT_DTJF
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column T_ZA_DW_BWJG.BWJGBH
  is '保卫机构编号（主键）';
comment on column T_ZA_DW_BWJG.JGBH
  is '机构编号';
comment on column T_ZA_DW_BWJG.JGMC
  is '保卫机构名称';
comment on column T_ZA_DW_BWJG.LSGX
  is '隶属关系';
comment on column T_ZA_DW_BWJG.FZR
  is '负责人';
comment on column T_ZA_DW_BWJG.FZRSFZH
  is '负责人身份证号';
comment on column T_ZA_DW_BWJG.FZRLXFS
  is '负责人联系方式';
comment on column T_ZA_DW_BWJG.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_BWJG.DJSJ
  is '登记时间';
comment on column T_ZA_DW_BWJG.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_BWJG.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_BWJG.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_BWJG.CZSJ
  is '操作时间';
comment on column T_ZA_DW_BWJG.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_BWJG.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_BWJG.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_BWJG
  add primary key (BWJGBH)
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
/

-- 保卫制度
create table T_ZA_DW_BWZD
(
  ZDBH   VARCHAR2(20) not null,
  JGBH   VARCHAR2(27) not null,
  BWZDMC VARCHAR2(200) not null,
  XDSJ   DATE,
  NR     CLOB,
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWDM VARCHAR2(12),
  DJDWMC VARCHAR2(120),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWMC VARCHAR2(120),
  CZDWDM VARCHAR2(12),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_BWZD.ZDBH
  is '制度编号（主键）';
comment on column T_ZA_DW_BWZD.JGBH
  is '机构编号';
comment on column T_ZA_DW_BWZD.BWZDMC
  is '保卫制度名称';
comment on column T_ZA_DW_BWZD.XDSJ
  is '修订时间';
comment on column T_ZA_DW_BWZD.NR
  is '内容';
comment on column T_ZA_DW_BWZD.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_BWZD.DJSJ
  is '登记时间';
comment on column T_ZA_DW_BWZD.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_BWZD.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_BWZD.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_BWZD.CZSJ
  is '操作时间';
comment on column T_ZA_DW_BWZD.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_BWZD.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_BWZD.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_BWZD
  add primary key (ZDBH)
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
/


-- 保卫建议书
create table T_ZA_DW_BWJYS
(
  JYSBH  VARCHAR2(20) not null,
  JGBH   VARCHAR2(27) not null,
  JYSMC  VARCHAR2(200) not null,
  XDDWDM VARCHAR2(12),
  XDDWMC VARCHAR2(120),
  XDSJ DATE,
  NR     CLOB,
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWMC VARCHAR2(120),
  DJDWDM VARCHAR2(12),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWDM VARCHAR2(12),
  CZDWMC VARCHAR2(120),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_BWJYS.JYSBH
  is '建议书编号(主键)';
comment on column T_ZA_DW_BWJYS.JGBH
  is '机构编号';
comment on column T_ZA_DW_BWJYS.JYSMC
  is '建议书名称';
comment on column T_ZA_DW_BWJYS.XDDWDM
  is '下达单位代码';
comment on column T_ZA_DW_BWJYS.XDDWMC
  is '下达单位名称';
comment on column T_ZA_DW_BWJYS.XDSJ
  is '下达时间';
comment on column T_ZA_DW_BWJYS.NR
  is '内容';
comment on column T_ZA_DW_BWJYS.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_BWJYS.DJSJ
  is '登记时间';
comment on column T_ZA_DW_BWJYS.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_BWJYS.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_BWJYS.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_BWJYS.CZSJ
  is '操作时间';
comment on column T_ZA_DW_BWJYS.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_BWJYS.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_BWJYS.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_BWJYS
  add primary key (JYSBH)
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
/

-- 突发事件预案
create table T_ZA_DW_TFSJYA
(
  YABH   VARCHAR2(20) not null,
  JGBH   VARCHAR2(27) not null,
  YALX   VARCHAR2(2),
  XDSJ   DATE,
  YQRYQK VARCHAR2(500),
  YQZBQK VARCHAR2(500),
  YANR   CLOB,
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWMC VARCHAR2(120),
  DJDWDM VARCHAR2(12),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWMC VARCHAR2(120),
  CZDWDM VARCHAR2(12),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_TFSJYA.YABH
  is '预案编号（主键）';
comment on column T_ZA_DW_TFSJYA.JGBH
  is '机构编号';
comment on column T_ZA_DW_TFSJYA.YALX
  is '预案类型';
comment on column T_ZA_DW_TFSJYA.XDSJ
  is '修订时间';
comment on column T_ZA_DW_TFSJYA.YQRYQK
  is '要求人员情况';
comment on column T_ZA_DW_TFSJYA.YQZBQK
  is '要求装备情况';
comment on column T_ZA_DW_TFSJYA.YANR
  is '预案内容';
comment on column T_ZA_DW_TFSJYA.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_TFSJYA.DJSJ
  is '登记时间';
comment on column T_ZA_DW_TFSJYA.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_TFSJYA.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_TFSJYA.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_TFSJYA.CZSJ
  is '操作时间';
comment on column T_ZA_DW_TFSJYA.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_TFSJYA.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_TFSJYA.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_TFSJYA
  add primary key (YABH)
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
/

-- 不安定因素
create table T_ZA_DW_BADYS
(
  BH     VARCHAR2(20) not null,
  JGBH   VARCHAR2(27) not null,
  LX     VARCHAR2(2) not null,
  YFYY   VARCHAR2(2),
  FSSJ   DATE,
  CBR    VARCHAR2(30),
  FSDD   VARCHAR2(300),
  BXXS   VARCHAR2(3),
  SDGM   VARCHAR2(100),
  QKMS   VARCHAR2(400),
  CZCS   VARCHAR2(400),
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWMC VARCHAR2(120),
  DJDWDM VARCHAR2(12),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWMC VARCHAR2(120),
  CZDWDM VARCHAR2(12),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_BADYS.BH
  is '编号（主键）';
comment on column T_ZA_DW_BADYS.JGBH
  is '机构编号';
comment on column T_ZA_DW_BADYS.LX
  is '类型';
comment on column T_ZA_DW_BADYS.YFYY
  is '引发原因';
comment on column T_ZA_DW_BADYS.FSSJ
  is '发生时间';
comment on column T_ZA_DW_BADYS.CBR
  is '承办人';
comment on column T_ZA_DW_BADYS.FSDD
  is '发生地点';
comment on column T_ZA_DW_BADYS.BXXS
  is '表现形式';
comment on column T_ZA_DW_BADYS.SDGM
  is '事端规模';
comment on column T_ZA_DW_BADYS.QKMS
  is '情况描述';
comment on column T_ZA_DW_BADYS.CZCS
  is '处置措施';
comment on column T_ZA_DW_BADYS.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_BADYS.DJSJ
  is '登记时间';
comment on column T_ZA_DW_BADYS.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_BADYS.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_BADYS.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_BADYS.CZSJ
  is '操作时间';
comment on column T_ZA_DW_BADYS.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_BADYS.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_BADYS.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_BADYS
  add primary key (BH)
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
/


-- 突发事件预案演练
create table T_ZA_DW_YAYL
(
  BH     VARCHAR2(20) not null,
  YABH   VARCHAR2(20) not null,
  YLMC   VARCHAR2(100) not null,
  YLSJ   DATE not null,
  CYRS   NUMBER not null,
  MS     VARCHAR2(500),
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWMC VARCHAR2(120),
  DJDWDM VARCHAR2(12),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWDM VARCHAR2(12),
  CZDWMC VARCHAR2(120),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_YAYL.BH
  is '编号（主键）';
comment on column T_ZA_DW_YAYL.YABH
  is '预案编号';
comment on column T_ZA_DW_YAYL.YLMC
  is '机构突发事件演练名称';
comment on column T_ZA_DW_YAYL.YLSJ
  is '机构突发事件演练时间';
comment on column T_ZA_DW_YAYL.CYRS
  is '机构突发事件参演人数';
comment on column T_ZA_DW_YAYL.MS
  is '机构突发事件描述';
comment on column T_ZA_DW_YAYL.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_YAYL.DJSJ
  is '登记时间';
comment on column T_ZA_DW_YAYL.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_YAYL.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_YAYL.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_YAYL.CZSJ
  is '操作时间';
comment on column T_ZA_DW_YAYL.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_YAYL.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_YAYL.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_YAYL
  add primary key (BH)
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
/

-- 灾害事故
create table T_ZA_DW_ZHSG
(
  BH     VARCHAR2(20) not null,
  JGBH   VARCHAR2(27) not null,
  SGLX   VARCHAR2(4),
  FSSJ   DATE,
  SSCC   NUMBER,
  FSDD   VARCHAR2(200),
  SGZRR  VARCHAR2(30),
  CBR    VARCHAR2(30),
  SGYY   VARCHAR2(2),
  SGAJZT VARCHAR2(100),
  FSJG   VARCHAR2(400),
  CZCS   VARCHAR2(400),
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWDM VARCHAR2(12),
  DJDWMC VARCHAR2(120),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWDM VARCHAR2(12),
  CZDWMC VARCHAR2(120),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_ZHSG.BH
  is '编号（主键）';
comment on column T_ZA_DW_ZHSG.JGBH
  is '机构编号';
comment on column T_ZA_DW_ZHSG.SGLX
  is '事故类型';
comment on column T_ZA_DW_ZHSG.FSSJ
  is '发生时间';
comment on column T_ZA_DW_ZHSG.SSCC
  is '损失财产（万元）';
comment on column T_ZA_DW_ZHSG.FSDD
  is '发生地点';
comment on column T_ZA_DW_ZHSG.SGZRR
  is '事故责任人';
comment on column T_ZA_DW_ZHSG.CBR
  is '承办人';
comment on column T_ZA_DW_ZHSG.SGYY
  is '事故原因';
comment on column T_ZA_DW_ZHSG.FSJG
  is '发生经过';
comment on column T_ZA_DW_ZHSG.CZCS
  is '处置措施';
comment on column T_ZA_DW_ZHSG.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_ZHSG.DJSJ
  is '登记时间';
comment on column T_ZA_DW_ZHSG.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_ZHSG.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_ZHSG.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_ZHSG.CZSJ
  is '操作时间';
comment on column T_ZA_DW_ZHSG.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_ZHSG.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_ZHSG.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_ZHSG
  add primary key (BH)
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
/
-- 安全隐患
create table T_ZA_DW_AQYH
(
  BH     VARCHAR2(20) not null,
  JGBH   VARCHAR2(27) not null,
  YHMC   VARCHAR2(100),
  YHLX   VARCHAR2(2),
  FXRY   VARCHAR2(30),
  YHDJ   VARCHAR2(2),
  FXSJ   DATE,
  JTWZ   VARCHAR2(200),
  CZCS   CLOB,
  DJRXM  VARCHAR2(30),
  DJSJ   DATE,
  DJDWDM VARCHAR2(12),
  DJDWMC VARCHAR2(120),
  CZRXM  VARCHAR2(30),
  CZSJ   DATE,
  CZDWDM VARCHAR2(12),
  CZDWMC VARCHAR2(120),
  CZBS   VARCHAR2(1)
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
comment on column T_ZA_DW_AQYH.BH
  is '编号(主键)';
comment on column T_ZA_DW_AQYH.JGBH
  is '机构编号';
comment on column T_ZA_DW_AQYH.YHMC
  is '隐患名称';
comment on column T_ZA_DW_AQYH.YHLX
  is '隐患类型';
comment on column T_ZA_DW_AQYH.FXRY
  is '发现人';
comment on column T_ZA_DW_AQYH.YHDJ
  is '隐患等级';
comment on column T_ZA_DW_AQYH.FXSJ
  is '发现时间';
comment on column T_ZA_DW_AQYH.JTWZ
  is '具体位置';
comment on column T_ZA_DW_AQYH.DJRXM
  is '登记人姓名';
comment on column T_ZA_DW_AQYH.DJSJ
  is '登记时间';
comment on column T_ZA_DW_AQYH.DJDWDM
  is '登记单位代码';
comment on column T_ZA_DW_AQYH.DJDWMC
  is '登记单位名称';
comment on column T_ZA_DW_AQYH.CZRXM
  is '操作人姓名';
comment on column T_ZA_DW_AQYH.CZSJ
  is '操作时间';
comment on column T_ZA_DW_AQYH.CZDWDM
  is '操作单位代码';
comment on column T_ZA_DW_AQYH.CZDWMC
  is '操作单位名称';
comment on column T_ZA_DW_AQYH.CZBS
  is '操作标识（1、新增 2、修改 3、删除）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DW_AQYH
  add primary key (BH)
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

  
  --预案类型
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','01','防火灾预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','02','防盗窃预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','03','防破坏预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','04','防抢劫预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','05','防安全事故预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','06','防外来人员冲击预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','07','防恐怖袭击预案','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YALX','突发事件预案类型','99','其他预案','','','1','');


--不安定因素表现形式
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZDY_BADYSLX', '不安定因素类型', '01', '不安定事端', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZDY_BADYSLX', '不安定因素类型', '02', '出走事件', '', '', '1', null);
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN) values (seq_common.nextval, 'ZDY_BADYSLX', '不安定因素类型', '03', '非正常死亡', '', '', '1', null);

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','000','怠工','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','010','停工','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','020','扰乱内部秩序','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','030','聚集','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','040','上访','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','050','堵门','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','060','堵路','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','070','罢课','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','080','威胁领导','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','090','挂横幅','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','100','成立自发组织','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','110','哄抢财务','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','120','游行示威','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','130','围攻','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','990','其他','0','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','041','到主管部门上访','040','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','042','到党政机关上访','040','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','043','到省会上访','040','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','044','到北京上访','040','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','051','堵单位门','050','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','052','堵主管部门大门','050','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','053','堵党政机关大门','050','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','061','堵铁路','060','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','062','堵道路','060','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','063','堵公路','060','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','064','堵高速公路','060','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','071','罢教','070','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','072','罢餐','070','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','073','出去','070','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','081','伤害领导','080','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','091','散传单','090','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','092','写大小字报','090','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','093','发短信','090','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_BXXS','表现形式','094','网上煽动','090','','1','');


--隐患类型
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHLX','隐患类型','01','治安','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHLX','隐患类型','02','消防','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHLX','隐患类型','03','交通','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHLX','隐患类型','04','卫生','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHLX','隐患类型','05','其他','','','1','');

--隐患级别
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHJB','隐患级别','1','特大','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHJB','隐患级别','2','重大','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHJB','隐患级别','3','较大','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YHJB','隐患级别','4','一般','','','1','');

--事故类型
insert into t_common_dictionary values (seq_common.nextval,'ZDY_SGLX','事故类型','0100','自然灾害事故','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_SGLX','事故类型','0200','人为事故','','','1','');

--事故原因
insert into t_common_dictionary values (seq_common.nextval,'ZDY_SGYY','事故原因','10','事故直接原因','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_SGYY','事故原因','20','事故间接原因','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_SGYY','事故原因','99','其他原因','','','1','');

--不安定因素引发原因
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','01','疾病','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','02','学习','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','03','生活','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','04','交友','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','05','上网','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','11','淹溺','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','12','电击','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','13','中毒','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','14','高空坠落','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','15','物体打击','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','16','车辆伤害','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','21','拖欠工资','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','22','福利待遇基本生活费','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','23','改制重组兼并破产','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','24','国有资产流失','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','25','职工身份置换','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','26','集体股票','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','27','劳动合同','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','28','劳动条件','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','30','生产事故','','','1','');

insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','31','腐败问题','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','32','教育问题','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','33','院校合并更名置换','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','34','招生','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','35','文凭','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','36','就业','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','37','后勤服务','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','38','非正常死亡','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','39','环保','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','40','征地拆迁','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','41','敏感问题','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','42','治安问题','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','43','内部管理','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','44','与地方纠纷','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','45','单位之间矛盾','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','46','医疗纠纷','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_YFYY','不安定因素引发原因','99','其他','','','1','');

--序列

-- 安全隐患 
create sequence SEQ_ZDY_AQYH
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;
/
-- 不安定因素
create sequence SEQ_ZDY_BADYS
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;

-- 保卫机构
create sequence SEQ_ZDY_BWJG
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;

-- 保卫建议书 
create sequence SEQ_ZDY_BWJYS
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1
cache 20;

-- 保卫制度 
create sequence SEQ_ZDY_BWZD
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;

-- 突发事件预案
create sequence SEQ_ZDY_TFSJYA
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;

-- 预案演练
create sequence SEQ_ZDY_YAYL
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;

-- 灾害事故
create sequence SEQ_ZDY_ZHSG
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;



