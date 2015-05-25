-- Create table
create table T_KHKP_JFZ
(
  ID             VARCHAR2(10) not null,
  ORGCODE        VARCHAR2(12),
  ORGNAME        VARCHAR2(120),
  TJQSSJ         DATE,
  TJZZSJ         DATE,
  ZFZ            NUMBER,
  JCXXCJSLFZ     NUMBER,
  XXWFFZ         NUMBER,
  XXZLFZ         NUMBER,
  XFSJWFFZ       NUMBER,
  WTQSGLFZ       NUMBER,
  ZKDJZLFZ       NUMBER,
  XFJCGZFZ       NUMBER,
  ZAJCGZFZ       NUMBER,
  GBJCGZFZ       NUMBER,
  XZJCGZFZ       NUMBER,
  WJJCGZFZ       NUMBER,
  NBJCGZFZ       NUMBER,
  JDJCGZFZ       NUMBER,
  QBSJFZ         NUMBER,
  QBYYFZ         NUMBER,
  DYPCXQKYRYFZ   NUMBER,
  LRPCXXBZQFZ    NUMBER,
  DYPCZHWSZTRYFZ NUMBER,
  JPCFXFBDZDRYFZ NUMBER,
  GKZDRYBZACFFZ  NUMBER,
  GKZDRYBXSCFFZ  NUMBER,
  LSRKCJBZACFFZ  NUMBER,
  LSRKCJBXSCFFZ  NUMBER,
  FFRSDQAJFZ     NUMBER
);
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
comment on column T_KHKP_JFZ.ZFZ
  is '总分值';
comment on column T_KHKP_JFZ.JCXXCJSLFZ
  is '基础信息采集数量 5分 大类：两实信息采集维护25分';
comment on column T_KHKP_JFZ.XXWFFZ
  is '信息维护10分 大类：两实信息采集维护25分';
comment on column T_KHKP_JFZ.XXZLFZ
  is '信息质量10分 大类：两实信息采集维护25分';
comment on column T_KHKP_JFZ.XFSJWFFZ
  is '下发数据维护8分 大类：重点人员动态管控20分';
comment on column T_KHKP_JFZ.WTQSGLFZ
  is '委托签收管理6分 大类：重点人员动态管控20分';
comment on column T_KHKP_JFZ.ZKDJZLFZ
  is '在控登记质量6分 大类：重点人员动态管控20分';
comment on column T_KHKP_JFZ.XFJCGZFZ
  is '消防基础工作5分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.ZAJCGZFZ
  is '治安基础工作5分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.GBJCGZFZ
  is '国保基础工作2分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.XZJCGZFZ
  is '刑侦基础工作2分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.WJJCGZFZ
  is '网技基础工作2分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.NBJCGZFZ
  is '内保基础工作2分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.JDJCGZFZ
  is '禁毒基础工作2分 大类：相关警种基础工作20分';
comment on column T_KHKP_JFZ.QBSJFZ
  is '情报收集2分 大类：情报信息收集报送5分';
comment on column T_KHKP_JFZ.QBYYFZ
  is '情报运用3分 大类：情报信息收集报送5分';
comment on column T_KHKP_JFZ.DYPCXQKYRYFZ
  is '当月盘查辖区10名以上可疑人员  大类：安全防范日常管理5分';
comment on column T_KHKP_JFZ.LRPCXXBZQFZ
  is '录入盘查信息不准确的  大类：安全防范日常管理5分';
comment on column T_KHKP_JFZ.DYPCZHWSZTRYFZ
  is '当月盘查抓获网上在逃人员  大类：安全防范日常管理5分';
comment on column T_KHKP_JFZ.JPCFXFBDZDRYFZ
  is '经盘查发现非本派出所的重点人员   安全防范日常管理5分';
comment on column T_KHKP_JFZ.GKZDRYBZACFFZ
  is '管控的重点人员被治安处罚 安全防范日常管理5分';
comment on column T_KHKP_JFZ.GKZDRYBXSCFFZ
  is '管控的重点人员被刑事处罚 安全防范日常管理5分';
comment on column T_KHKP_JFZ.LSRKCJBZACFFZ
  is '两实人口采集被治安处罚以上的 安全防范日常管理5分';
comment on column T_KHKP_JFZ.LSRKCJBXSCFFZ
  is '两实人口采集被刑事处罚以上的 安全防范日常管理5分';
comment on column T_KHKP_JFZ.FFRSDQAJFZ
  is '防范入室盗窃案件8分';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_KHKP_JFZ
  add primary key (ID);
  

--平台管理  
  
  insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001660', '考核考评', 'SQJW1000001340', '', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001661', '考核考评', 'SQJW1000001660', '/xtgl/khkp/toKhkpPage.action', '1', 1, '', '', '_self');

  commit;
