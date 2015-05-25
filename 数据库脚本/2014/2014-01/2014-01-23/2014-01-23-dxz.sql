drop table T_KHKP_JFZ;

-- Create table
create table T_KHKP_JFZ
(
  ID      VARCHAR2(10) not null,
  ORGCODE VARCHAR2(12) not null,
  ORGNAME VARCHAR2(120) not null,
  JWQFL   VARCHAR2(3) not null,
  TJQSSJ  DATE,
  TJZZSJ  DATE,
  JSSJ    DATE,
  JSJD    VARCHAR2(1),
  ZFZ     NUMBER default 0,
  A00000  NUMBER default 0,
  A10000  NUMBER default 0,
  A20000  NUMBER default 0,
  A20001  NUMBER default 0,
  A20002  NUMBER default 0,
  A20003  NUMBER default 0,
  A20004  NUMBER default 0,
  A20005  NUMBER default 0,
  A20006  NUMBER default 0,
  A20007  NUMBER default 0,
  A30000  NUMBER default 0,
  A30001  NUMBER default 0,
  A30002  NUMBER default 0,
  A30003  NUMBER default 0,
  A30004  NUMBER default 0,
  B00000  NUMBER default 0,
  B10000  NUMBER default 0,
  B10001  NUMBER default 0,
  B10002  NUMBER default 0,
  B20000  NUMBER default 0,
  B20001  NUMBER default 0,
  B20002  NUMBER default 0,
  B30000  NUMBER default 0,
  B30001  NUMBER default 0,
  B30002  NUMBER default 0,
  C00000  NUMBER default 0,
  C10000  NUMBER default 0,
  C20000  NUMBER default 0,
  C30000  NUMBER default 0,
  C40000  NUMBER default 0,
  C50000  NUMBER default 0,
  C60000  NUMBER default 0,
  C70000  NUMBER default 0,
  D00000  NUMBER default 0,
  D10000  NUMBER default 0,
  D10001  NUMBER default 0,
  D10002  NUMBER default 0,
  D20000  NUMBER default 0,
  D20001  NUMBER default 0,
  D20002  NUMBER default 0,
  D20003  NUMBER default 0,
  D20004  NUMBER default 0,
  E00000  NUMBER default 0,
  E10001  NUMBER default 0,
  E10002  NUMBER default 0,
  E20001  NUMBER default 0,
  E20002  NUMBER default 0,
  E30001  NUMBER default 0,
  E30002  NUMBER default 0,
  E40001  NUMBER default 0,
  E40002  NUMBER default 0,
  F00000  NUMBER default 0
);
-- Add comments to the table 
comment on table T_KHKP_JFZ
  is '系统考核分值表';
-- Add comments to the columns 
comment on column T_KHKP_JFZ.ID
  is 'ID';
comment on column T_KHKP_JFZ.ORGCODE
  is '机构代码';
comment on column T_KHKP_JFZ.ORGNAME
  is '机构名称';
comment on column T_KHKP_JFZ.TJQSSJ
  is '统计起始时间';
comment on column T_KHKP_JFZ.TJZZSJ
  is '统计截止时间';
comment on column T_KHKP_JFZ.JSSJ
  is '计算时间';
comment on column T_KHKP_JFZ.JSJD
  is '计算阶段1：1号到10号 2：1号到20号  3：1号到30号';
comment on column T_KHKP_JFZ.ZFZ
  is '总分值';
comment on column T_KHKP_JFZ.A00000
  is '两实信息采集维护25分';
comment on column T_KHKP_JFZ.A10000
  is '采集数量5分';
comment on column T_KHKP_JFZ.A20000
  is '信息维护10分';
comment on column T_KHKP_JFZ.A20001
  is '流动人口延期或主动注销2分';
comment on column T_KHKP_JFZ.A20002
  is '流动人口系统自动注销1分';
comment on column T_KHKP_JFZ.A20003
  is '从业人员提醒处理1分';
comment on column T_KHKP_JFZ.A20004
  is '常口异动提醒处理1分';
comment on column T_KHKP_JFZ.A20005
  is '境外人员提醒处理1分';
comment on column T_KHKP_JFZ.A20006
  is '出租屋巡查2分';
comment on column T_KHKP_JFZ.A20007
  is '出租房屋登记提醒处理1分';
comment on column T_KHKP_JFZ.A30000
  is '信息质量10分';
comment on column T_KHKP_JFZ.A30001
  is '两实信息质量3分';
comment on column T_KHKP_JFZ.A30002
  is '实有人口逻辑错误3分';
comment on column T_KHKP_JFZ.A30003
  is '单位信息质量1分';
comment on column T_KHKP_JFZ.A30004
  is '实体标注和地址关联3分';
comment on column T_KHKP_JFZ.B00000
  is '重点人员动态管控20分';
comment on column T_KHKP_JFZ.B10000
  is '下发数据维护8分';
comment on column T_KHKP_JFZ.B10001
  is '首次重点人员信息2分';
comment on column T_KHKP_JFZ.B10002
  is '原有重点人员信息6分';
comment on column T_KHKP_JFZ.B20000
  is '委托签收管理6分';
comment on column T_KHKP_JFZ.B20001
  is '未按规定签收管理4分';
comment on column T_KHKP_JFZ.B20002
  is '按规定签收管理2分';
comment on column T_KHKP_JFZ.B30000
  is '在控登记质量6分';
comment on column T_KHKP_JFZ.B30001
  is '关系人信息质量2分';
comment on column T_KHKP_JFZ.B30002
  is '重点人员信息质量4分';
comment on column T_KHKP_JFZ.C00000
  is '相关警种基础工作20分';
comment on column T_KHKP_JFZ.C10000
  is '消防基础工作5分';
comment on column T_KHKP_JFZ.C20000
  is '治安基础工作5分';
comment on column T_KHKP_JFZ.C30000
  is '国保基础工作2分';
comment on column T_KHKP_JFZ.C40000
  is '刑侦基础工作2分';
comment on column T_KHKP_JFZ.C50000
  is '网技基础工作2分';
comment on column T_KHKP_JFZ.C60000
  is '内保基础工作2分';
comment on column T_KHKP_JFZ.C70000
  is '禁毒基础工作2分';
comment on column T_KHKP_JFZ.D00000
  is '情报信息收集报送5分';
comment on column T_KHKP_JFZ.D10000
  is '情报收集2分';
comment on column T_KHKP_JFZ.D10001
  is '当月收集上报的线索信息不少于4条，每少1条扣0.5分';
comment on column T_KHKP_JFZ.D10002
  is '上报线索信息中，涉事人员身份证号码不足18位或缺失联系方式的，每条扣0.3分';
comment on column T_KHKP_JFZ.D20000
  is '情报运用3分';
comment on column T_KHKP_JFZ.D20001
  is '收集上报的线索信息被市局引用的，每条加0.3分；';
comment on column T_KHKP_JFZ.D20002
  is '被认定为重要线索的，每条加0.5分。';
comment on column T_KHKP_JFZ.D20003
  is '迟报、漏报、误报，每条扣0.3分';
comment on column T_KHKP_JFZ.D20004
  is '被认定为虚假信息的，每条扣1分';
comment on column T_KHKP_JFZ.E00000
  is '安全防范日常管理5分';
comment on column T_KHKP_JFZ.E10001
  is '当月通过警务通盘查辖区10名以上可疑人员,每少1人扣0.5分';
comment on column T_KHKP_JFZ.E10002
  is '录入盘查信息中，姓名和身份证号不匹配的，无照片的，联系电话号码长度少于8位的，每人扣0.3分';
comment on column T_KHKP_JFZ.E20001
  is '当月通过警务通盘查抓获网上在逃人员的，每抓获1人加1分。';
comment on column T_KHKP_JFZ.E20002
  is '经盘查发现非本派出所管辖的重点人员，每采集1人分别加0.3分。';
comment on column T_KHKP_JFZ.E30001
  is '通过防范管理工作，对基础平台纳入警务区管控的重点人员，被治安处罚以上的，当月每人次加0.5分';
comment on column T_KHKP_JFZ.E30002
  is '通过防范管理工作，对基础平台纳入警务区管控的重点人员,被刑事处罚以上的，当月每人次加1分';
comment on column T_KHKP_JFZ.E40001
  is '两实人口采集，被治安处罚以上的，当月每人次加0.5分';
comment on column T_KHKP_JFZ.E40002
  is '两实人口采集,被认定为虚假信息的，每条扣1分';
comment on column T_KHKP_JFZ.F00000
  is '防控入室盗窃案件8分';



-- Create table
create table T_COMMON_ORGANIZATION_SJJS
(
  ORGID        VARCHAR2(50),
  ORGCODE      VARCHAR2(12),
  ORGNAME      VARCHAR2(120),
  PARENT_ORGID VARCHAR2(50),
  PARENT_CODE  VARCHAR2(12),
  ORGJC        VARCHAR2(120),
  LEVE         NUMBER,
  JWQFL        VARCHAR2(2)
);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_SJJS.ORGJC
  is '简称';
comment on column T_COMMON_ORGANIZATION_SJJS.JWQFL
  is '警务区分类代码';
