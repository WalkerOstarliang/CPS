-- Create sequence 
create sequence SEQ_DWOPLOG_ID
minvalue 1000000001
maxvalue 9999999999
start with 1000000001
increment by 1;

-- Create table
create table T_ZA_DWTB
(
  ywzjid   VARCHAR2(50) not null,
  dwmc     VARCHAR2(400) not null,
  frdbsfzh VARCHAR2(18),
  frdbxm   VARCHAR2(30),
  frdblxdh VARCHAR2(30),
  dwdh     VARCHAR2(30),
  dwdz     VARCHAR2(500) not null,
  hylb     VARCHAR2(3) not null,
  dwlb     VARCHAR2(6) not null,
  zzjgdm   VARCHAR2(40),
  yyzzhm   VARCHAR2(60),
  kyrq     DATE,
  sszrdwdm VARCHAR2(12),
  sssqdm   VARCHAR2(12),
  zxbs     VARCHAR2(1),
  zxsj     DATE,
  djsj     DATE,
  xgsj     DATE default sysdate,
  jlrksj   DATE default sysdate,
  jlbgsj   DATE,
  qsbs     VARCHAR2(2) default 0,
  glbm     VARCHAR2(2),
  glzt     VARCHAR2(1),
  ywxtdwlx VARCHAR2(2)
);
-- Add comments to the table 
comment on table T_ZA_DWTB
  is '单位同步数据';
-- Add comments to the columns 
comment on column T_ZA_DWTB.ywzjid
  is '原业务系统主键ID';
comment on column T_ZA_DWTB.dwmc
  is '单位名称';
comment on column T_ZA_DWTB.frdbsfzh
  is '法人代表身份证';
comment on column T_ZA_DWTB.frdbxm
  is '法人代表姓名';
comment on column T_ZA_DWTB.frdblxdh
  is '法人联系电话';
comment on column T_ZA_DWTB.dwdh
  is '单位电话';
comment on column T_ZA_DWTB.dwdz
  is '单位地址';
comment on column T_ZA_DWTB.hylb
  is '行业类别（02：娱乐场所 05：网吧 07：旅馆业）';
comment on column T_ZA_DWTB.dwlb
  is '单位类别（1799：娱乐场所 1705：网吧 2605：旅馆）';
comment on column T_ZA_DWTB.zzjgdm
  is '组织机构代码';
comment on column T_ZA_DWTB.yyzzhm
  is '营业执照';
comment on column T_ZA_DWTB.kyrq
  is '开业日期';
comment on column T_ZA_DWTB.sszrdwdm
  is '责任单位代码';
comment on column T_ZA_DWTB.sssqdm
  is '社区代码';
comment on column T_ZA_DWTB.zxbs
  is '注销标示';
comment on column T_ZA_DWTB.zxsj
  is '注销时间';
comment on column T_ZA_DWTB.djsj
  is '登记时间';
comment on column T_ZA_DWTB.xgsj
  is '修改时间';
comment on column T_ZA_DWTB.jlrksj
  is '入库时间';
comment on column T_ZA_DWTB.jlbgsj
  is '变更信息';
comment on column T_ZA_DWTB.qsbs
  is '签收状态（0：未派发 1：已派发 2：已签收 3：已退回） ';
comment on column T_ZA_DWTB.glbm
  is '管理部门（1:治安 2:内保 3:外管 4:网监 5:消防 9:其他）';
comment on column T_ZA_DWTB.glzt
  is '管理状态';
comment on column T_ZA_DWTB.ywxtdwlx
  is '业务系统单位类型（hylb为07时，01 旅馆 02家庭旅馆）hylb为05时，03网吧，hylb为02时，04娱乐场所';
-- Create/Recreate indexes 
create index INDEX_YWXTLX on T_ZA_DWTB (YWXTDWLX);
create index INDEX_YWXTZJID on T_ZA_DWTB (YWZJID);

-- Create table
create table T_ZA_DWTB_OPLOG
(
  id      VARCHAR2(20) not null,
  ywxtzj  VARCHAR2(50) not null,
  czsj    DATE,
  czrsfzh VARCHAR2(18),
  czrxm   VARCHAR2(30),
  czdwdm  VARCHAR2(12),
  czdwmc  VARCHAR2(120),
  pfdwdm  VARCHAR2(12),
  pfdwmc  VARCHAR2(120),
  czzt    VARCHAR2(1),
  thyy    VARCHAR2(1000),
  mbdwdm  VARCHAR2(12),
  mbdwmc  VARCHAR2(120),
  ywxtlx  VARCHAR2(3)
);
-- Add comments to the columns 
comment on column T_ZA_DWTB_OPLOG.id
  is '主键ID';
comment on column T_ZA_DWTB_OPLOG.ywxtzj
  is '业务系统主键';
comment on column T_ZA_DWTB_OPLOG.czsj
  is '操作时间';
comment on column T_ZA_DWTB_OPLOG.czrsfzh
  is '操作人身份证';
comment on column T_ZA_DWTB_OPLOG.czrxm
  is '操作人姓名';
comment on column T_ZA_DWTB_OPLOG.czdwdm
  is '操作单位代码';
comment on column T_ZA_DWTB_OPLOG.czdwmc
  is '操作单位名称';
comment on column T_ZA_DWTB_OPLOG.pfdwdm
  is '派发单位代码';
comment on column T_ZA_DWTB_OPLOG.pfdwmc
  is '派发单位名称';
comment on column T_ZA_DWTB_OPLOG.czzt
  is '操作状态（1：派发2：签收3：退回）';
comment on column T_ZA_DWTB_OPLOG.thyy
  is '退回原因';
comment on column T_ZA_DWTB_OPLOG.mbdwdm
  is '派发到的单位代码';
comment on column T_ZA_DWTB_OPLOG.mbdwmc
  is '派发到的单位名称';
comment on column T_ZA_DWTB_OPLOG.ywxtlx
  is '业务系统类型';
-- Create/Recreate indexes 
create index INDEX_YWXTLX_LOG on T_ZA_DWTB_OPLOG (YWXTLX);
create index INDEX_YWXTZJID_LOG on T_ZA_DWTB_OPLOG (YWXTZJ);
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DWTB_OPLOG
  add primary key (ID);



alter table T_ZA_JG_JBXX add yxtzj VARCHAR2(50);
alter table T_ZA_JG_JBXX add ywxtlx VARCHAR2(2);
-- Add comments to the columns 
comment on column T_ZA_JG_JBXX.yxtzj
  is '原业务系统主键';
comment on column T_ZA_JG_JBXX.ywxtlx
  is '业务系统单位类型（hylb为07时，01 旅馆 02家庭旅馆）hylb为05时，03网吧，hylb为02时，04娱乐场所';
