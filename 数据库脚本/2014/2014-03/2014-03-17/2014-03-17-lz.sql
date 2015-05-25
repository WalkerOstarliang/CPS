-- Create table
create table T_ZYQB_GGXX
(
  LDXXBH    VARCHAR2(27) not null,
  YLDXXBH   VARCHAR2(27),
  RYXH      VARCHAR2(5),
  XM        VARCHAR2(30),
  GMSFHM    VARCHAR2(18),
  HZHM      VARCHAR2(200),
  XB        VARCHAR2(1),
  CSRQ      DATE,
  WWXM      VARCHAR2(80),
  BMHCH     VARCHAR2(30),
  GJ        VARCHAR2(3),
  MZ        VARCHAR2(2),
  HJD       VARCHAR2(6),
  XZD       VARCHAR2(6),
  XZDXZ     VARCHAR2(100),
  ZY        VARCHAR2(3),
  FWCS      VARCHAR2(70),
  GDDHHM    VARCHAR2(200),
  SJHM      VARCHAR2(200),
  ZZZHM     VARCHAR2(30),
  HLWTXGJHM VARCHAR2(200),
  BZ        VARCHAR2(500),
  ID        VARCHAR2(32),
  SJID      VARCHAR2(32)
);

-- Add comments to the table 
comment on table T_ZYQB_GGXX
  is '重要情报线索与事件涉事骨干信息';
-- Add comments to the columns 
comment on column T_ZYQB_GGXX.LDXXBH
  is '联动信息编号';
comment on column T_ZYQB_GGXX.YLDXXBH
  is '源联动信息编号';
comment on column T_ZYQB_GGXX.RYXH
  is '人员序号';
comment on column T_ZYQB_GGXX.XM
  is '姓名';
comment on column T_ZYQB_GGXX.GMSFHM
  is '公民身份号码';
comment on column T_ZYQB_GGXX.HZHM
  is '护照号码';
comment on column T_ZYQB_GGXX.XB
  is '性别';
comment on column T_ZYQB_GGXX.CSRQ
  is '出生日期';
comment on column T_ZYQB_GGXX.WWXM
  is '外文姓名';
comment on column T_ZYQB_GGXX.BMHCH
  is '别名或绰号';
comment on column T_ZYQB_GGXX.GJ
  is '国籍';
comment on column T_ZYQB_GGXX.MZ
  is '民族';
comment on column T_ZYQB_GGXX.HJD
  is '户籍地';
comment on column T_ZYQB_GGXX.XZD
  is '现住地';
comment on column T_ZYQB_GGXX.XZDXZ
  is '现住地详址';
comment on column T_ZYQB_GGXX.ZY
  is '职业';
comment on column T_ZYQB_GGXX.FWCS
  is '服务处所';
comment on column T_ZYQB_GGXX.GDDHHM
  is '固定电话号码';
comment on column T_ZYQB_GGXX.SJHM
  is '手机号码';
comment on column T_ZYQB_GGXX.ZZZHM
  is '暂住证号码';
comment on column T_ZYQB_GGXX.HLWTXGJHM
  is '互联网通讯工具号码';
comment on column T_ZYQB_GGXX.BZ
  is '备注';
comment on column T_ZYQB_GGXX.ID
  is '主键ID';
comment on column T_ZYQB_GGXX.SJID
  is '事件ID';





-- Create table
create table T_ZYQB_SJXX
(
  LDXXBH      VARCHAR2(27) not null,
  BSSJ        DATE,
  JJCD        VARCHAR2(1),
  FSZT        VARCHAR2(1),
  BGCX        VARCHAR2(1),
  XSXXLY      VARCHAR2(2),
  BT          VARCHAR2(200),
  GJC         VARCHAR2(500),
  XXZW        VARCHAR2(4000),
  CJDWJGDM    VARCHAR2(12),
  CJDW        VARCHAR2(70),
  CJR         VARCHAR2(30),
  TBDWJGDM    VARCHAR2(12),
  TBDW        VARCHAR2(70),
  TBR         VARCHAR2(30),
  SHR         VARCHAR2(30),
  SSZT        VARCHAR2(2),
  SSLB1       VARCHAR2(4),
  SJMGSD      VARCHAR2(3),
  SJZDHD      VARCHAR2(3),
  SJRSGM      VARCHAR2(2),
  SJCCSSGM    VARCHAR2(2),
  SSYY        VARCHAR2(2),
  BXXS        VARCHAR2(2),
  ASJFSSJ     DATE,
  ASJDLB      VARCHAR2(2),
  SASFSDSXQ   VARCHAR2(6),
  SASFSDXZ    VARCHAR2(100),
  YLDXXBH     VARCHAR2(27),
  RKSJ        DATE,
  CQSHR       VARCHAR2(6),
  SHSJ        VARCHAR2(8),
  SHYJ        VARCHAR2(1),
  CJRDM       VARCHAR2(6),
  TQBZ        VARCHAR2(1),
  SSLB        VARCHAR2(3),
  JLLX        VARCHAR2(1),
  JLZT        VARCHAR2(1),
  ID          VARCHAR2(32) not null,
  CJRID       VARCHAR2(12),
  SASFSDSXQMC VARCHAR2(120)
);

-- Add comments to the table 
comment on table T_ZYQB_SJXX
  is '重要情报线索与事件信息表';
-- Add comments to the columns 
comment on column T_ZYQB_SJXX.LDXXBH
  is '联动信息编号';
comment on column T_ZYQB_SJXX.BSSJ
  is '报送时间';
comment on column T_ZYQB_SJXX.JJCD
  is '紧急程度';
comment on column T_ZYQB_SJXX.FSZT
  is '发生状态';
comment on column T_ZYQB_SJXX.BGCX
  is '报告次序';
comment on column T_ZYQB_SJXX.XSXXLY
  is '线索信息来源';
comment on column T_ZYQB_SJXX.BT
  is '标题';
comment on column T_ZYQB_SJXX.GJC
  is '关键词';
comment on column T_ZYQB_SJXX.XXZW
  is '信息正文';
comment on column T_ZYQB_SJXX.CJDWJGDM
  is '采集单位机构代码';
comment on column T_ZYQB_SJXX.CJDW
  is '采集单位';
comment on column T_ZYQB_SJXX.CJR
  is '采集人';
comment on column T_ZYQB_SJXX.TBDWJGDM
  is '填报单位机构代码';
comment on column T_ZYQB_SJXX.TBDW
  is '填报单位';
comment on column T_ZYQB_SJXX.TBR
  is '填报人';
comment on column T_ZYQB_SJXX.SHR
  is '审核人';
comment on column T_ZYQB_SJXX.SSZT
  is '涉事主体';
comment on column T_ZYQB_SJXX.SSLB1
  is '涉事类别';
comment on column T_ZYQB_SJXX.SJMGSD
  is '涉及敏感时点';
comment on column T_ZYQB_SJXX.SJZDHD
  is '涉及重大活动';
comment on column T_ZYQB_SJXX.SJRSGM
  is '涉及人数规模';
comment on column T_ZYQB_SJXX.SJCCSSGM
  is '涉及财产损失规模';
comment on column T_ZYQB_SJXX.SSYY
  is '涉事诱因';
comment on column T_ZYQB_SJXX.BXXS
  is '表现形式';
comment on column T_ZYQB_SJXX.ASJFSSJ
  is '案(事)件发生时间';
comment on column T_ZYQB_SJXX.ASJDLB
  is '案(事) 件发生地类别';
comment on column T_ZYQB_SJXX.SASFSDSXQ
  is '案(事)件发生地所属省市代码';
comment on column T_ZYQB_SJXX.SASFSDXZ
  is '案(事)件发生地详址';
comment on column T_ZYQB_SJXX.YLDXXBH
  is '源联动信息编号';
comment on column T_ZYQB_SJXX.RKSJ
  is '入库时间';
comment on column T_ZYQB_SJXX.CQSHR
  is '呈请审核人';
comment on column T_ZYQB_SJXX.SHSJ
  is '审核时间';
comment on column T_ZYQB_SJXX.SHYJ
  is '审核意见';
comment on column T_ZYQB_SJXX.CJRDM
  is '采集人代码';
comment on column T_ZYQB_SJXX.SSLB
  is '重要情报线索与事件涉事类别';
comment on column T_ZYQB_SJXX.ID
  is '主键ID';
comment on column T_ZYQB_SJXX.CJRID
  is '采集人ID';
comment on column T_ZYQB_SJXX.SASFSDSXQMC
  is '案(事)件发生地所属省市';

  
  
  -- Create sequence 
create sequence SEQ_QBXS_GGXX_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;
