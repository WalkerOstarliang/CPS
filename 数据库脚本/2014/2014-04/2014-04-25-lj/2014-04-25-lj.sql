-- Create table
create table T_ZA_WYXQ_AQJC
(
  ID           VARCHAR2(25),
  XQMC         VARCHAR2(200),
  SSPCSDM      VARCHAR2(12),
  SSPCSMC      VARCHAR2(100),
  JCMJJH       VARCHAR2(10),
  JCMJXM       VARCHAR2(30),
  JCRQ         DATE,
  QKMS         VARCHAR2(400),
  ZDLSNBZABWZD VARCHAR2(1),
  LSNBZABWZR   VARCHAR2(1),
  LSYGAQFFPX   VARCHAR2(1),
  LFRYWPDJSX   VARCHAR2(1),
  DYMJXT       VARCHAR2(1),
  SPBJXTYZ     VARCHAR2(1),
  SFJZTCC      VARCHAR2(1),
  YHBWFDCFDM   VARCHAR2(1),
  WQSFWH       VARCHAR2(1),
  SFZGABRY     VARCHAR2(1),
  SFGQPX       VARCHAR2(1),
  SFFWQXBJ     VARCHAR2(1),
  SFCSGZ       VARCHAR2(1),
  SFDQJY       VARCHAR2(1),
  SFYBAFZ      VARCHAR2(1),
  SFRZLZ       VARCHAR2(1),
  SFZZABDW     VARCHAR2(1),
  SFBLZZBA     VARCHAR2(1),
  WYXDWQID     VARCHAR2(25),
  AQYHMS       VARCHAR2(400),
  MJCLYJ       VARCHAR2(400),
  AQCL         VARCHAR2(400),
  AQZGQX       NUMBER,
  SLDSPYJ      VARCHAR2(400),
  SLDJH        VARCHAR2(10),
  SLDXM        VARCHAR2(30),
  SLDSPSJ      DATE
);
-- Add comments to the table 
comment on table T_ZA_WYXQ_AQJC
  is '治安管理---物业小区安全检查表';
-- Add comments to the columns 
comment on column T_ZA_WYXQ_AQJC.ID
  is '主键ID';
comment on column T_ZA_WYXQ_AQJC.XQMC
  is '物业小区名称（单位名称）';
comment on column T_ZA_WYXQ_AQJC.SSPCSDM
  is '所属派出所代码';
comment on column T_ZA_WYXQ_AQJC.SSPCSMC
  is '所属派出所名称';
comment on column T_ZA_WYXQ_AQJC.JCMJJH
  is '安全检查民警警号';
comment on column T_ZA_WYXQ_AQJC.JCMJXM
  is '安全检查民警姓名';
comment on column T_ZA_WYXQ_AQJC.JCRQ
  is '安全检查日期';
comment on column T_ZA_WYXQ_AQJC.QKMS
  is '安全检查情况描述';
comment on column T_ZA_WYXQ_AQJC.ZDLSNBZABWZD
  is '制定和落实内部治安保卫制度（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.LSNBZABWZR
  is '落实内部治安保卫工作责任制（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.LSYGAQFFPX
  is '落实员工安全防范培训教育（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.LFRYWPDJSX
  is '来访人员及物品出入登记手续（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.DYMJXT
  is '单元门禁系统（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SPBJXTYZ
  is '视频监控或入侵报警系统是否运转正常（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFJZTCC
  is '是否有集中停车场（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.YHBWFDCFDM
  is '重点要害部位防盗窗和防盗门（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.WQSFWH
  is '封闭式小区围墙是否完好（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFZGABRY
  is '配备足够数量的安保人员（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFGQPX
  is '进行上岗前培训和定期开展培训（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFFWQXBJ
  is '配备使用防卫器械和报警装备（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFCSGZ
  is '保安员全部持《保安员证》上岗（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFDQJY
  is '定期开展教育、培训（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFYBAFZ
  is '保安员是否着符合要求的保安员服装上岗（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFRZLZ
  is '保安员是否认真履职，有较强的安全防范意识（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFZZABDW
  is '是否为自招保安员单位（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.SFBLZZBA
  is '是否办理自招保安员单位备案（0否，1是）';
comment on column T_ZA_WYXQ_AQJC.WYXDWQID
  is '关联物业小区单位表t_za_wyxq的主键ID';
comment on column T_ZA_WYXQ_AQJC.AQYHMS
  is '隐患描述';
comment on column T_ZA_WYXQ_AQJC.MJCLYJ
  is '民警处理意见';
comment on column T_ZA_WYXQ_AQJC.AQCL
  is '处理';
comment on column T_ZA_WYXQ_AQJC.AQZGQX
  is '整改期限(天)';
comment on column T_ZA_WYXQ_AQJC.SLDSPYJ
  is '所领导审批意见';
comment on column T_ZA_WYXQ_AQJC.SLDJH
  is '所领导警号';
comment on column T_ZA_WYXQ_AQJC.SLDXM
  is '所领导姓名';
comment on column T_ZA_WYXQ_AQJC.SLDSPSJ
  is '所领导审批时间';

  
  
  -- Create table
create table T_ZA_WYXQ_AQJC_ZP
(
  ID       VARCHAR2(25),
  AQJCID   VARCHAR2(25),
  WYXQID   VARCHAR2(25),
  AQJCYHZP BLOB,
  ZPSCSJ   DATE,
  DJDWDM   VARCHAR2(12),
  DJDWMC   VARCHAR2(100)
);
-- Add comments to the table 
comment on table T_ZA_WYXQ_AQJC_ZP
  is '治安管理-物业小区安全检查隐患照片';
-- Add comments to the columns 
comment on column T_ZA_WYXQ_AQJC_ZP.ID
  is '主键ID';
comment on column T_ZA_WYXQ_AQJC_ZP.AQJCID
  is '物业小区安全检查ID';
comment on column T_ZA_WYXQ_AQJC_ZP.WYXQID
  is '物业小区ID';
comment on column T_ZA_WYXQ_AQJC_ZP.AQJCYHZP
  is '安全检查隐患照片';
comment on column T_ZA_WYXQ_AQJC_ZP.ZPSCSJ
  is '照片上传时间';
comment on column T_ZA_WYXQ_AQJC_ZP.DJDWDM
  is '登记单位代码';
comment on column T_ZA_WYXQ_AQJC_ZP.DJDWMC
  is '登记单位名称';
  
  -- Create sequence 
create sequence SEQ_T_ZA_WYXQ_AQJCID
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
cache 20;

-- Create sequence 
create sequence SEQ_T_ZA_WYXQ_AQJC_ZPID
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
cache 20;
