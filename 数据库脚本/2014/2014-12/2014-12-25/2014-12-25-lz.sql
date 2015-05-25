-- Create table
create table T_ZA_WBDW_JDHX
(
  id       NUMBER not null,
  djrxm    VARCHAR2(30),
  djrjh    VARCHAR2(20),
  djrsfzh  VARCHAR2(18),
  djrdwid  VARCHAR2(12),
  djsj     DATE,
  czrxm    VARCHAR2(30),
  czrjh    VARCHAR2(20),
  czrsfzh  VARCHAR2(18),
  czdwid   VARCHAR2(12),
  czsj     DATE,
  czbs     CHAR(1),
  jgbh     VARCHAR2(27),
  rlff11   CHAR(1),
  rlff12   VARCHAR2(400),
  rlff13   CHAR(1),
  rlff21   CHAR(1),
  rlff22   VARCHAR2(400),
  rlff23   CHAR(1),
  rlff31   CHAR(1),
  rlff32   VARCHAR2(400),
  rlff33   CHAR(1),
  rlff41   CHAR(1),
  rlff42   VARCHAR2(400),
  rlff43   CHAR(1),
  stff11   CHAR(1),
  stff12   VARCHAR2(400),
  stff13   CHAR(1),
  stff21   CHAR(1),
  stff22   VARCHAR2(400),
  stff23   CHAR(1),
  stff31   CHAR(1),
  stff32   VARCHAR2(400),
  stff33   CHAR(1),
  stff41   CHAR(1),
  stff42   VARCHAR2(400),
  stff43   CHAR(1),
  stff51   CHAR(1),
  stff52   VARCHAR2(400),
  stff53   CHAR(1),
  jsffsj11 CHAR(1),
  jsffsj12 VARCHAR2(400),
  jsffsj13 CHAR(1),
  jsffsj21 CHAR(1),
  jsffsj22 VARCHAR2(400),
  jsffsj23 CHAR(1),
  jsffsj31 CHAR(1),
  jsffsj32 VARCHAR2(400),
  jsffsj33 CHAR(1),
  jsffej11 CHAR(1),
  jsffej12 VARCHAR2(400),
  jsffej13 CHAR(1),
  jsffyj11 CHAR(1),
  jsffyj12 VARCHAR2(400),
  jsffyj13 CHAR(1),
  jsffyj21 CHAR(1),
  jsffyj22 VARCHAR2(400),
  jsffyj23 CHAR(1),
  jsffyj31 CHAR(1),
  jsffyj32 VARCHAR2(400),
  jsffyj33 CHAR(1)
);
-- Add comments to the columns 
comment on column T_ZA_WBDW_JDHX.id
  is '主键id';
comment on column T_ZA_WBDW_JDHX.djrxm
  is '登记人姓名';
comment on column T_ZA_WBDW_JDHX.djrjh
  is '登记人警号';
comment on column T_ZA_WBDW_JDHX.djrsfzh
  is '登记人身份证号';
comment on column T_ZA_WBDW_JDHX.djrdwid
  is '登记人单位id';
comment on column T_ZA_WBDW_JDHX.djsj
  is '登记时间';
comment on column T_ZA_WBDW_JDHX.czrxm
  is '操作人姓名';
comment on column T_ZA_WBDW_JDHX.czrjh
  is '操作人警号';
comment on column T_ZA_WBDW_JDHX.czrsfzh
  is '操作人身份证号';
comment on column T_ZA_WBDW_JDHX.czdwid
  is '操作人单位id';
comment on column T_ZA_WBDW_JDHX.czsj
  is '操作时间';
comment on column T_ZA_WBDW_JDHX.czbs
  is '操作标识(1:新增、2:修改、3:删除)';
comment on column T_ZA_WBDW_JDHX.jgbh
  is '机构编号（关联）';
comment on column T_ZA_WBDW_JDHX.rlff11
  is '人力防范要求第一行是否达标';
comment on column T_ZA_WBDW_JDHX.rlff12
  is '人力防范要求第一行整改措施';
comment on column T_ZA_WBDW_JDHX.rlff13
  is '人力防范要求第一行是否落实';
comment on column T_ZA_WBDW_JDHX.rlff21
  is '人力防范要求第二行是否达标';
comment on column T_ZA_WBDW_JDHX.rlff22
  is '人力防范要求第二行整改措施';
comment on column T_ZA_WBDW_JDHX.rlff23
  is '人力防范要求第二行是否落实';
comment on column T_ZA_WBDW_JDHX.rlff31
  is '人力防范要求第三行是否达标';
comment on column T_ZA_WBDW_JDHX.rlff32
  is '人力防范要求第三行整改措施';
comment on column T_ZA_WBDW_JDHX.rlff33
  is '人力防范要求第三行是否落实';
comment on column T_ZA_WBDW_JDHX.rlff41
  is '人力防范要求第四行是否达标';
comment on column T_ZA_WBDW_JDHX.rlff42
  is '人力防范要求第四行整改措施';
comment on column T_ZA_WBDW_JDHX.rlff43
  is '人力防范要求第四行是否落实';
comment on column T_ZA_WBDW_JDHX.stff11
  is '实体防范要求第一行是否达标';
comment on column T_ZA_WBDW_JDHX.stff12
  is '实体防范要求第一行整改措施';
comment on column T_ZA_WBDW_JDHX.stff13
  is '实体防范要求第一行是否落实';
comment on column T_ZA_WBDW_JDHX.stff21
  is '实体防范要求第二行是否达标';
comment on column T_ZA_WBDW_JDHX.stff22
  is '实体防范要求第二行整改措施';
comment on column T_ZA_WBDW_JDHX.stff23
  is '实体防范要求第二行是否落实';
comment on column T_ZA_WBDW_JDHX.stff31
  is '实体防范要求第三行是否达标';
comment on column T_ZA_WBDW_JDHX.stff32
  is '实体防范要求第三行整改措施';
comment on column T_ZA_WBDW_JDHX.stff33
  is '实体防范要求第三行是否落实';
comment on column T_ZA_WBDW_JDHX.stff41
  is '实体防范要求第四行是否达标';
comment on column T_ZA_WBDW_JDHX.stff42
  is '实体防范要求第四行整改措施';
comment on column T_ZA_WBDW_JDHX.stff43
  is '实体防范要求第四行是否落实';
comment on column T_ZA_WBDW_JDHX.stff51
  is '实体防范要求第五行是否达标';
comment on column T_ZA_WBDW_JDHX.stff52
  is '实体防范要求第五行整改措施';
comment on column T_ZA_WBDW_JDHX.stff53
  is '实体防范要求第五行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffsj11
  is '技术防范要求三级第一行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffsj12
  is '技术防范要求三级第一行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffsj13
  is '技术防范要求三级第一行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffsj21
  is '技术防范要求三级第二行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffsj22
  is '技术防范要求三级第二行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffsj23
  is '技术防范要求三级第二行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffsj31
  is '技术防范要求三级第三行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffsj32
  is '技术防范要求三级第三行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffsj33
  is '技术防范要求三级第三行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffej11
  is '技术防范要求二级第一行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffej12
  is '技术防范要求二级第一行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffej13
  is '技术防范要求二级第一行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffyj11
  is '技术防范要求一级第一行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffyj12
  is '技术防范要求一级第一行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffyj13
  is '技术防范要求一级第一行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffyj21
  is '技术防范要求一级第二行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffyj22
  is '技术防范要求一级第二行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffyj23
  is '技术防范要求一级第二行是否落实';
comment on column T_ZA_WBDW_JDHX.jsffyj31
  is '技术防范要求一级第三行是否达标';
comment on column T_ZA_WBDW_JDHX.jsffyj32
  is '技术防范要求一级第三行整改措施';
comment on column T_ZA_WBDW_JDHX.jsffyj33
  is '技术防范要求一级第三行是否落实';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_WBDW_JDHX
  add constraint PK_T_ZA_WBDW_JDHX primary key (ID);
  
-- Create sequence 
create sequence SEQ_WBDW_JDHX
minvalue 10000001
maxvalue 99999999
start with 10000001
increment by 1;
