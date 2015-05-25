-- Add/modify columns 
alter table T_ZA_DWHC add dwfl varchar2(3);
-- Add comments to the columns 
comment on column T_ZA_DWHC.dwfl
  is '单位分类';
  
  
DELETE t_common_dictionary WHERE zdlb = 'ZDY_NBDWLB' ;
COMMIT;
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','001','党政机关','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','002','高校','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','003','中小学幼儿园','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','004','卫生系统','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','005','大型商场超市','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','006','大型企业','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','007','银行、金融机构','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','008','三电油气','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','009','重点工程','','','1','');
INSERT INTO t_common_dictionary VALUES(Seq_Common.Nextval,'ZDY_NBDWLB','内保单位类别','099','其他','','','1','');
commit;


-- Add/modify columns 
alter table T_ZA_JG_JBXX add sfnbgl varchar2(1);
alter table T_ZA_JG_JBXX add sfzagl varchar2(1);
alter table T_ZA_JG_JBXX add sfxfgl varchar2(1);
alter table T_ZA_JG_JBXX add sfwjgl varchar2(1);
-- Add comments to the columns 
comment on column T_ZA_JG_JBXX.sfnbgl
  is '是否内保管理';
comment on column T_ZA_JG_JBXX.sfzagl
  is '是否治安管理';
comment on column T_ZA_JG_JBXX.sfxfgl
  is '是否消防管理';
comment on column T_ZA_JG_JBXX.sfwjgl
  is '是否网监管理';
