-- Create table
create table T_ZA_DDCCJ
(
  ddcid   VARCHAR2(12) not null,
  ddclx   VARCHAR2(2),
  pp      VARCHAR2(50),
  clsbm   VARCHAR2(100),
  djh     VARCHAR2(100),
  ys      VARCHAR2(30),
  hphm    VARCHAR2(50),
  jxdmc   VARCHAR2(100),
  mddz    VARCHAR2(200),
  xssj    DATE,
  gmzxm   VARCHAR2(50),
  gmzsfzh VARCHAR2(18),
  gmzdh   VARCHAR2(30),
  djrxm   VARCHAR2(30),
  djrjh   VARCHAR2(20),
  djrsfzh VARCHAR2(18),
  djsj    DATE,
  djdwdm  VARCHAR2(12),
  djdwmc  VARCHAR2(120),
  czbs    VARCHAR2(1),
  czrxm   VARCHAR2(30),
  czrjh   VARCHAR2(20),
  czsj    DATE,
  czdwdm  VARCHAR2(12),
  czdwmc  VARCHAR2(120),
  zxbs    VARCHAR2(1),
  zxsj    DATE,
  zxyy    VARCHAR2(100)
);
-- Add comments to the table 
comment on table T_ZA_DDCCJ
  is '电动车';
-- Add comments to the columns 
comment on column T_ZA_DDCCJ.ddcid
  is '电动车ID';
comment on column T_ZA_DDCCJ.ddclx
  is '电动车类型';
comment on column T_ZA_DDCCJ.pp
  is '品牌';
comment on column T_ZA_DDCCJ.clsbm
  is '车辆识别码';
comment on column T_ZA_DDCCJ.djh
  is '电机号';
comment on column T_ZA_DDCCJ.ys
  is '颜色';
comment on column T_ZA_DDCCJ.hphm
  is '号牌号码';
comment on column T_ZA_DDCCJ.jxdmc
  is '经销店名称';
comment on column T_ZA_DDCCJ.mddz
  is '门店地址';
comment on column T_ZA_DDCCJ.xssj
  is '销售时间';
comment on column T_ZA_DDCCJ.gmzxm
  is '购买者姓名';
comment on column T_ZA_DDCCJ.gmzsfzh
  is '购买者身份证';
comment on column T_ZA_DDCCJ.gmzdh
  is '购买者电话';
comment on column T_ZA_DDCCJ.djrxm
  is '登记人姓名';
comment on column T_ZA_DDCCJ.djrjh
  is '登记人警号';
comment on column T_ZA_DDCCJ.djrsfzh
  is '登记人身份证号';
comment on column T_ZA_DDCCJ.djsj
  is '登记时间';
comment on column T_ZA_DDCCJ.djdwdm
  is '登记单位代码';
comment on column T_ZA_DDCCJ.djdwmc
  is '登记单位名称';
comment on column T_ZA_DDCCJ.czbs
  is '操作标识';
comment on column T_ZA_DDCCJ.czrxm
  is '操作人姓名';
comment on column T_ZA_DDCCJ.czrjh
  is '操作人警号';
comment on column T_ZA_DDCCJ.czsj
  is '操作时间';
comment on column T_ZA_DDCCJ.czdwdm
  is '操作单位代码';
comment on column T_ZA_DDCCJ.czdwmc
  is '操作单位名称';
comment on column T_ZA_DDCCJ.zxbs
  is '注销标识';
comment on column T_ZA_DDCCJ.zxsj
  is '注销时间';
comment on column T_ZA_DDCCJ.zxyy
  is '注销原因';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_DDCCJ
  add primary key (DDCID);
  
  
  
  -- Create sequence 
create sequence SEQ_DDC_ID
minvalue 100000000001
maxvalue 999999999999
start with 100000000001
increment by 1;



INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'DDCLX','电动车类型','01','电动车','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'DDCLX','电动车类型','02','电动自行车','','','1','');
COMMIT;
