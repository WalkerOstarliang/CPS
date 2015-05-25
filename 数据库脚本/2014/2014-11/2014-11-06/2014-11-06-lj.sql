-- 流浪乞讨人员表
-- Create table
create table T_GZGL_QTRY
(
  ID         VARCHAR2(22),
  QTRYLB     VARCHAR2(10),
  QTRYXM     VARCHAR2(30),
  QTRYCYM    VARCHAR2(30),
  QTRYXB     VARCHAR2(10),
  QTRYNL     VARCHAR2(3),
  QTRYJG     VARCHAR2(10),
  QTRYMZ     VARCHAR2(10),
  QTRYWHCD   VARCHAR2(10),
  QTRYJKZK   VARCHAR2(10),
  QTRYBFXSJ  DATE,
  QTRYBFXDD  VARCHAR2(120),
  QTRYHJXZ   VARCHAR2(120),
  QTRYCW     VARCHAR2(200),
  QTRYZP     BLOB,
  QTRYJSRXM  VARCHAR2(30),
  QTRYJSSJ   DATE,
  QTRYJSDWMC VARCHAR2(120),
  QTRYJSDWLD VARCHAR2(30),
  QTRYBZ     VARCHAR2(200),
  SSJWQDM    VARCHAR2(12),
  SSJWQMC    VARCHAR2(120),
  DJRXM      VARCHAR2(30),
  DJRJH      VARCHAR2(30),
  DJSJ       DATE,
  DJDWDM     VARCHAR2(12),
  DJDWMC     VARCHAR2(120),
  CZRXM      VARCHAR2(30),
  CZRJH      VARCHAR2(30),
  CZSJ       DATE,
  CZDWDM     VARCHAR2(12),
  CZDWMC     VARCHAR2(120),
  ZXBS       VARCHAR2(2),
  SCSJ       DATE,
  SYDWYJ     VARCHAR2(200),
  SYSJ       DATE,
  SZYY       VARCHAR2(120),
  ZYH        VARCHAR2(30),
  RYQK       VARCHAR2(200),
  SYRYXM     VARCHAR2(30),
  JSYSXM     VARCHAR2(30),
  RYSJ       DATE,
  JZZSHYJ    VARCHAR2(200),
  JZZSHRXM   VARCHAR2(30),
  JZZSHSJ    DATE,
  CYQKCLYJ   VARCHAR2(200),
  YLFY       VARCHAR2(30),
  ZZYSXM     VARCHAR2(30),
  YSSJ       DATE,
  YSCBRXM    VARCHAR2(30),
  JSRXM      VARCHAR2(30),
  JSSJ       DATE,
  JSDWMC     VARCHAR2(30),
  JSDWLD     VARCHAR2(30),
  YSXXBZ     VARCHAR2(200),
  YSDJSJ     DATE,
  YSDJRXM    VARCHAR2(30),
  YSDJDWDM   VARCHAR2(12),
  YSDJDWMC   VARCHAR2(120)
);
-- Add comments to the table 
comment on table T_GZGL_QTRY
  is '为民服务--流浪乞讨人员表';
-- Add comments to the columns 
comment on column T_GZGL_QTRY.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_GZGL_QTRY.QTRYLB
  is '人员类别（参考“人员类别”字典）';
comment on column T_GZGL_QTRY.QTRYXM
  is '乞讨人员姓名';
comment on column T_GZGL_QTRY.QTRYCYM
  is '乞讨人员曾用名';
comment on column T_GZGL_QTRY.QTRYXB
  is '乞讨人员性别（参照“性别”字典）';
comment on column T_GZGL_QTRY.QTRYNL
  is '乞讨人员年龄';
comment on column T_GZGL_QTRY.QTRYJG
  is '乞讨人员籍贯（参照“行政区划”字典）';
comment on column T_GZGL_QTRY.QTRYMZ
  is '乞讨人员民族（参照“民族”字典）';
comment on column T_GZGL_QTRY.QTRYWHCD
  is '乞讨人员文化程度（参照“文化程度”字典）';
comment on column T_GZGL_QTRY.QTRYJKZK
  is '乞讨人员健康状况（参照“健康状况”字典）';
comment on column T_GZGL_QTRY.QTRYBFXSJ
  is '乞讨人员被发现时间';
comment on column T_GZGL_QTRY.QTRYBFXDD
  is '乞讨人员被发现地点';
comment on column T_GZGL_QTRY.QTRYHJXZ
  is '乞讨人员户籍详址';
comment on column T_GZGL_QTRY.QTRYCW
  is '乞讨人员携带物品财物';
comment on column T_GZGL_QTRY.QTRYZP
  is '乞讨人员照片';
comment on column T_GZGL_QTRY.QTRYJSRXM
  is '乞讨人员接收人姓名';
comment on column T_GZGL_QTRY.QTRYJSSJ
  is '乞讨人员接收时间';
comment on column T_GZGL_QTRY.QTRYJSDWMC
  is '乞讨人员接收单位名称';
comment on column T_GZGL_QTRY.QTRYJSDWLD
  is '乞讨人员接收单位领导';
comment on column T_GZGL_QTRY.QTRYBZ
  is '乞讨人员备注';
comment on column T_GZGL_QTRY.SSJWQDM
  is '乞讨人员所属警务区代码';
comment on column T_GZGL_QTRY.SSJWQMC
  is '乞讨人员所属警务区名称';
comment on column T_GZGL_QTRY.DJRXM
  is '登记人姓名';
comment on column T_GZGL_QTRY.DJRJH
  is '登记人警号';
comment on column T_GZGL_QTRY.DJSJ
  is '登记时间';
comment on column T_GZGL_QTRY.DJDWDM
  is '登记单位代码';
comment on column T_GZGL_QTRY.DJDWMC
  is '登记单位名称';
comment on column T_GZGL_QTRY.CZRXM
  is '操作人姓名';
comment on column T_GZGL_QTRY.CZRJH
  is '操作人警号';
comment on column T_GZGL_QTRY.CZSJ
  is '操作时间';
comment on column T_GZGL_QTRY.CZDWDM
  is '操作单位代码';
comment on column T_GZGL_QTRY.CZDWMC
  is '操作单位名称';
comment on column T_GZGL_QTRY.ZXBS
  is '注销标识（''0'':正常；''1'':注销；''2'':删除）';
comment on column T_GZGL_QTRY.SCSJ
  is '删除时间';
comment on column T_GZGL_QTRY.SYDWYJ
  is '送院单位意见（属移送信息）';
comment on column T_GZGL_QTRY.SYSJ
  is '送院时间（属移送信息）';
comment on column T_GZGL_QTRY.SZYY
  is '收治医院名称（属移送信息）';
comment on column T_GZGL_QTRY.ZYH
  is '住院号（属移送信息）';
comment on column T_GZGL_QTRY.RYQK
  is '入院情况（属移送信息）';
comment on column T_GZGL_QTRY.SYRYXM
  is '送院人员姓名（属移送信息）';
comment on column T_GZGL_QTRY.JSYSXM
  is '接收医生姓名（属移送信息）';
comment on column T_GZGL_QTRY.RYSJ
  is '入院时间（属移送信息）';
comment on column T_GZGL_QTRY.JZZSHYJ
  is '救助站审核意见（属移送信息）';
comment on column T_GZGL_QTRY.JZZSHRXM
  is '救助站审核人姓名（属移送信息）';
comment on column T_GZGL_QTRY.JZZSHSJ
  is '救助站审核时间（属移送信息）';
comment on column T_GZGL_QTRY.CYQKCLYJ
  is '出院情况处理意见（属移送信息）';
comment on column T_GZGL_QTRY.YLFY
  is '医疗费用（属移送信息）';
comment on column T_GZGL_QTRY.ZZYSXM
  is '主治医生姓名（属移送信息）';
comment on column T_GZGL_QTRY.YSSJ
  is '移送时间（属移送信息）';
comment on column T_GZGL_QTRY.YSCBRXM
  is '移送承办人姓名（属移送信息）';
comment on column T_GZGL_QTRY.JSRXM
  is '接收人姓名（属移送信息）';
comment on column T_GZGL_QTRY.JSSJ
  is '接收时间（属移送信息）';
comment on column T_GZGL_QTRY.JSDWMC
  is '接收单位名称（属移送信息）';
comment on column T_GZGL_QTRY.JSDWLD
  is '接收单位领导（属移送信息）';
comment on column T_GZGL_QTRY.YSXXBZ
  is '移送信息备注（属移送信息）';
comment on column T_GZGL_QTRY.YSDJSJ
  is '移送登记时间（属移送信息）';
comment on column T_GZGL_QTRY.YSDJRXM
  is '移送登记人姓名（属移送信息）';
comment on column T_GZGL_QTRY.YSDJDWDM
  is '移送登记单位代码（属移送信息）';
comment on column T_GZGL_QTRY.YSDJDWMC
  is '移送登记单位名称（属移送信息）';

  
-- 流浪其他人员表，主键序列
-- Create sequence 
create sequence SEQ_GZGL_QTRYID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;

--流浪乞讨人员家庭成员和亲友信息表
-- Create table
create table T_GZGL_QTRYPY
(
  ID       VARCHAR2(22) not null,
  JTPYXM   VARCHAR2(30),
  JTPYLXDH VARCHAR2(30),
  JTPYGX   VARCHAR2(10),
  DJSJ     DATE,
  DJRXM    VARCHAR2(30),
  DJRJH    VARCHAR2(30),
  DJDWDM   VARCHAR2(12),
  DJDWMC   VARCHAR2(120),
  CZRXM    VARCHAR2(30),
  CZRJH    VARCHAR2(10),
  CZSJ     DATE,
  CZDWDM   VARCHAR2(12),
  CZDWMC   VARCHAR2(120),
  ZXBS     VARCHAR2(2),
  SCSJ     DATE,
  QTRYID   VARCHAR2(22) not null
);
-- Add comments to the table 
comment on table T_GZGL_QTRYPY
  is '为民服务--乞讨人员--家庭亲友';
-- Add comments to the columns 
comment on column T_GZGL_QTRYPY.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_GZGL_QTRYPY.JTPYXM
  is '家庭朋友姓名';
comment on column T_GZGL_QTRYPY.JTPYLXDH
  is '亲戚朋友联系电话';
comment on column T_GZGL_QTRYPY.JTPYGX
  is '亲戚朋友关系（参照“社会关系”字典）';
comment on column T_GZGL_QTRYPY.DJSJ
  is '登记时间';
comment on column T_GZGL_QTRYPY.DJRXM
  is '登记人姓名';
comment on column T_GZGL_QTRYPY.DJRJH
  is '登记人警号';
comment on column T_GZGL_QTRYPY.DJDWDM
  is '登记单位代码';
comment on column T_GZGL_QTRYPY.DJDWMC
  is '登记单位名称';
comment on column T_GZGL_QTRYPY.CZRXM
  is '操作人姓名';
comment on column T_GZGL_QTRYPY.CZRJH
  is '操作人警号';
comment on column T_GZGL_QTRYPY.CZSJ
  is '操作时间';
comment on column T_GZGL_QTRYPY.CZDWDM
  is '操作单位代码';
comment on column T_GZGL_QTRYPY.CZDWMC
  is '操作单位名称';
comment on column T_GZGL_QTRYPY.ZXBS
  is '注销标识（''0'':正常；''1'':注销；''2'':删除）';
comment on column T_GZGL_QTRYPY.SCSJ
  is '删除时间';
comment on column T_GZGL_QTRYPY.QTRYID
  is '乞讨人员ID（关联乞讨人员表ID）';

 
 --流浪乞讨人员家庭成员和亲友信息表--主键序列
 -- Create sequence 
create sequence SEQ_GZGL_QTRYQYID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;

--其他服务表
-- Create table
create table T_GZGL_QTFW
(
  ID      VARCHAR2(22),
  FWSJ    DATE,
  FWNR    VARCHAR2(400),
  BZ      VARCHAR2(400),
  SSJWQDM VARCHAR2(12),
  SSJWQMC VARCHAR2(120),
  JBRXM   VARCHAR2(30),
  DJSJ    DATE,
  DJRXM   VARCHAR2(30),
  DJRJH   VARCHAR2(30),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(120),
  CZRXM   VARCHAR2(30),
  CZSJ    DATE,
  CZDWDM  VARCHAR2(12),
  CZDWMC  VARCHAR2(120),
  CZRJH   VARCHAR2(30),
  ZXBS    VARCHAR2(2),
  SCSJ    DATE
);
-- Add comments to the table 
comment on table T_GZGL_QTFW
  is '为民服务--其他服务表';
-- Add comments to the columns 
comment on column T_GZGL_QTFW.ID
  is '6位行政编码+6位日期+10位序列号';
comment on column T_GZGL_QTFW.FWSJ
  is '服务时间';
comment on column T_GZGL_QTFW.FWNR
  is '服务内容';
comment on column T_GZGL_QTFW.BZ
  is '备注';
comment on column T_GZGL_QTFW.SSJWQDM
  is '所属警务区代码';
comment on column T_GZGL_QTFW.SSJWQMC
  is '所属警务区名称';
comment on column T_GZGL_QTFW.JBRXM
  is '经办人姓名';
comment on column T_GZGL_QTFW.DJSJ
  is '登记时间';
comment on column T_GZGL_QTFW.DJRXM
  is '登记人姓名';
comment on column T_GZGL_QTFW.DJRJH
  is '登记人警号';
comment on column T_GZGL_QTFW.DJDWDM
  is '登记单位代码';
comment on column T_GZGL_QTFW.DJDWMC
  is '登记单位名称';
comment on column T_GZGL_QTFW.CZRXM
  is '操作人姓名';
comment on column T_GZGL_QTFW.CZSJ
  is '操作时间';
comment on column T_GZGL_QTFW.CZDWDM
  is '操作单位代码';
comment on column T_GZGL_QTFW.CZDWMC
  is '操作单位名称';
comment on column T_GZGL_QTFW.CZRJH
  is '操作人警号';
comment on column T_GZGL_QTFW.ZXBS
  is '注销标识（''0'':正常；''1'':注销；''2'':删除）';
comment on column T_GZGL_QTFW.SCSJ
  is '删除时间';

 
 --其他服务表--主键序列
 -- Create sequence 
create sequence SEQ_GZGL_QTFWID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;
 