insert into t_common_dictionary values(seq_common.nextval,'ZDY_PCS_HDLX','活动类型','01','消防安全','','',1,'');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_PCS_HDLX','活动类型','02','防范电信诈骗防范','','',1,'');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_PCS_HDLX','活动类型','03','防范入户盗窃','','',1,'');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_PCS_HDLX','活动类型','04','反家庭暴力','','',1,'');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_PCS_HDLX','活动类型','05','防范扒窃','','',1,'');
insert into t_common_dictionary values(seq_common.nextval,'ZDY_PCS_HDLX','活动类型','99','其他','','',1,'');
commit;

-- Create table
create table T_GZGL_PCSXCHD
(
  id       VARCHAR2(20) not null,
  hdlx     VARCHAR2(2),
  hdsj     DATE,
  hdxz     VARCHAR2(200),
  hdnr     VARCHAR2(2000),
  hdkzmjjh VARCHAR2(20),
  hdkzmjxm VARCHAR2(30),
  hdkzdwdm VARCHAR2(12),
  hdkzdwmc VARCHAR2(120),
  zxbs     VARCHAR2(1),
  zxsj     DATE,
  djrxm    VARCHAR2(30),
  djrjh    VARCHAR2(20),
  djrsfzh  VARCHAR2(30),
  djdwdm   VARCHAR2(12),
  djdwmc   VARCHAR2(120),
  djsj     DATE,
  czrxm    VARCHAR2(30),
  czrjh    VARCHAR2(20),
  czdwdm   VARCHAR2(12),
  czdwmc   VARCHAR2(120),
  czrsfzh  VARCHAR2(30),
  czsj     DATE,
  czbs     VARCHAR2(1)
);
-- Add comments to the columns 
comment on column T_GZGL_PCSXCHD.id
  is '主键ID';
comment on column T_GZGL_PCSXCHD.hdlx
  is '活动类型（字典）';
comment on column T_GZGL_PCSXCHD.hdsj
  is '活动时间';
comment on column T_GZGL_PCSXCHD.hdxz
  is '活动详址';
comment on column T_GZGL_PCSXCHD.hdnr
  is '活动内容';
comment on column T_GZGL_PCSXCHD.hdkzmjjh
  is '活动开展民警警号';
comment on column T_GZGL_PCSXCHD.hdkzmjxm
  is '活动开展民警姓名';
comment on column T_GZGL_PCSXCHD.hdkzdwdm
  is '活动开展单位代码';
comment on column T_GZGL_PCSXCHD.hdkzdwmc
  is '活动开展单位名称';
comment on column T_GZGL_PCSXCHD.zxbs
  is '注销标识';
comment on column T_GZGL_PCSXCHD.zxsj
  is '注销时间';
comment on column T_GZGL_PCSXCHD.djrxm
  is '登记人姓名';
comment on column T_GZGL_PCSXCHD.djrjh
  is '登记人警号';
comment on column T_GZGL_PCSXCHD.djrsfzh
  is '登记人身份证号';
comment on column T_GZGL_PCSXCHD.djdwdm
  is '登记单位代码';
comment on column T_GZGL_PCSXCHD.djdwmc
  is '登记单位名称';
comment on column T_GZGL_PCSXCHD.djsj
  is '登记时间';
comment on column T_GZGL_PCSXCHD.czrxm
  is '操作人姓名';
comment on column T_GZGL_PCSXCHD.czrjh
  is '操作人警号';
comment on column T_GZGL_PCSXCHD.czdwdm
  is '操作单位代码';
comment on column T_GZGL_PCSXCHD.czdwmc
  is '操作单位名称';
comment on column T_GZGL_PCSXCHD.czrsfzh
  is '操作人身份证号';
comment on column T_GZGL_PCSXCHD.czsj
  is '操作时间';
comment on column T_GZGL_PCSXCHD.czbs
  is '操作标识';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_GZGL_PCSXCHD
  add primary key (ID);
  
  
  -- Create table
create table T_GZGL_PCSXCHDZP
(
  id       VARCHAR2(20) not null,
  hdid     VARCHAR2(20),
  zp       BLOB,
  bt       VARCHAR2(100),
  djdrxm   VARCHAR2(30),
  djrjh    VARCHAR2(20),
  djdwdm   VARCHAR2(12),
  djdwmc   VARCHAR2(120),
  djsj     DATE,
  djdrsfzh VARCHAR2(30)
);
-- Add comments to the columns 
comment on column T_GZGL_PCSXCHDZP.id
  is '主键ID';
comment on column T_GZGL_PCSXCHDZP.hdid
  is '活动ID   与派出所宣传活动ID关联';
comment on column T_GZGL_PCSXCHDZP.zp
  is '照片';
comment on column T_GZGL_PCSXCHDZP.bt
  is '标题';
comment on column T_GZGL_PCSXCHDZP.djdrxm
  is '登记人姓名';
comment on column T_GZGL_PCSXCHDZP.djrjh
  is '登记人警号';
comment on column T_GZGL_PCSXCHDZP.djdwdm
  is '登记单位代码';
comment on column T_GZGL_PCSXCHDZP.djdwmc
  is '登记单位名称';
comment on column T_GZGL_PCSXCHDZP.djsj
  is '登记时间';
comment on column T_GZGL_PCSXCHDZP.djdrsfzh
  is '登记人身份证号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_GZGL_PCSXCHDZP
  add primary key (ID);
  
