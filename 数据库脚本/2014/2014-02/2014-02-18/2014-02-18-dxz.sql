-- Add/modify columns 
alter table T_LSGL_RY_LXFS add LXFSLX varchar2(3);
alter table T_LSGL_RY_LXFS add lxfs varchar2(100);
-- Add comments to the columns 
comment on column T_LSGL_RY_LXFS.SJHM
  is '手机号码 禁用';
comment on column T_LSGL_RY_LXFS.JTDH
  is '家庭电话 禁用';
comment on column T_LSGL_RY_LXFS.GSDH
  is '公司电话 禁用';
comment on column T_LSGL_RY_LXFS.CZHM
  is '传真号码 禁用';
comment on column T_LSGL_RY_LXFS.QQHM
  is 'QQ号码 禁用';
comment on column T_LSGL_RY_LXFS.EMAIL
  is '电子邮箱 禁用';
comment on column T_LSGL_RY_LXFS.MSN
  is 'MSN 禁用';
comment on column T_LSGL_RY_LXFS.DJSJ
  is '登记时间 ';
comment on column T_LSGL_RY_LXFS.DJRXM
  is '登记人姓名 ';
comment on column T_LSGL_RY_LXFS.LXFSLX
  is '联系方式类型';
comment on column T_LSGL_RY_LXFS.lxfs
  is '联系方式';
  
  
  
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','001','手机号码','','',1,'');
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','002','家庭电话','','',1,'');
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','003','公司电话','','',1,'');
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','004','传真号码','','',1,'');
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','005','QQ号码','','',1,'');
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','006','电子邮箱','','',1,'');
insert into t_common_dictionary values (seq_common.nextval, 'ZDY_LXFSLX','联系方式类型','007','MSN','','',1,'');
commit;


-- Add/modify columns 
alter table T_LSGL_RY_LXFS add lxfsbz varchar2(100);
-- Add comments to the columns 
comment on column T_LSGL_RY_LXFS.lxfsbz
  is '联系方式备注';