-- Add/modify columns 
alter table T_KHKP_JFZ add C20001 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add C20002 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add C20003 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add C50001 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add C50002 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add A30005 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add A30006 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add A30007 NUMBER(5,2) default 0;
alter table T_KHKP_JFZ add B40000 NUMBER(5,2);
alter table T_KHKP_JFZ add B50000 NUMBER(5,2);
alter table T_KHKP_JFZ add B50001 NUMBER(5,2);
alter table T_KHKP_JFZ add B50002 NUMBER(5,2);
alter table T_KHKP_JFZ add B50003 NUMBER(5,2);
alter table T_KHKP_JFZ add B50004 NUMBER(5,2);
alter table T_KHKP_JFZ add B50005 NUMBER(5,2);
alter table T_KHKP_JFZ add B50006 NUMBER(5,2);
alter table T_KHKP_JFZ add C70001 NUMBER(5,2);
alter table T_KHKP_JFZ add C70002 NUMBER(5,2);
alter table T_KHKP_JFZ add C70003 NUMBER(5,2);
alter table T_KHKP_JFZ add F00001 NUMBER(5,2);
alter table T_KHKP_JFZ add F00002 NUMBER(5,2);
alter table T_KHKP_JFZ add F00001_01 NUMBER(5,2);
alter table T_KHKP_JFZ add F00001_02 NUMBER(5,2);
alter table T_KHKP_JFZ add C60001 NUMBER(5,2);
alter table T_KHKP_JFZ add C60002 NUMBER(5,2);
alter table T_KHKP_JFZ add F00002_01 NUMBER(5,2);
-- Add comments to the columns 
comment on column T_KHKP_JFZ.C20001
  is '治安基础工作5分  旅馆业管理2分';
comment on column T_KHKP_JFZ.C20002
  is '治安基础工作5分  娱乐场所管理2分';
comment on column T_KHKP_JFZ.C20003
  is '治安基础工作5分  枪支弹药、危爆物品管理1分';
comment on column T_KHKP_JFZ.C50001
  is '网技基础工作2分 网吧实地检查情况 1分';
comment on column T_KHKP_JFZ.C50002
  is '网技基础工作2分  实名上网登记情况 1分';
comment on column T_KHKP_JFZ.A30005
  is '信息质量  信息数据重复录入2分';
comment on column T_KHKP_JFZ.A30006
  is '信息质量  信息应采未采系统比对2分';
comment on column T_KHKP_JFZ.A30007
  is '信息质量  电话号码采集率2分';
comment on column T_KHKP_JFZ.B40000
  is '重点人员重新违法犯罪 2分';
comment on column T_KHKP_JFZ.B50000
  is '取保候审、监视居住 2分';
comment on column T_KHKP_JFZ.B50001
  is '取保候审、监视居住 首次';
comment on column T_KHKP_JFZ.B50002
  is '重点人员重新违法犯罪 原有';
comment on column T_KHKP_JFZ.B50003
  is '取保候审、监视居住 重新违法犯罪';
comment on column T_KHKP_JFZ.B50004
  is '取保候审、监视居住 关系人信息。。缺失';
comment on column T_KHKP_JFZ.B50005
  is '取保候审、监视居住 经济来源信息。。缺失';
comment on column T_KHKP_JFZ.B50006
  is '取保候审、监视居住 委托管理 未接管、未退回 ';
comment on column T_KHKP_JFZ.C70001
  is '禁毒基础工作2分 签收 1分';
comment on column T_KHKP_JFZ.C70002
  is '禁毒基础工作2分 管理 1.5分';
comment on column T_KHKP_JFZ.C70003
  is '禁毒基础工作2分 被拘留 罚款 0.5分';
comment on column T_KHKP_JFZ.F00001
  is '当月入室盗窃案件同环比得分';
comment on column T_KHKP_JFZ.F00002
  is '入室盗窃 系统自动比对扣分 案件类别变更';
comment on column T_KHKP_JFZ.F00001_01
  is '当月入室盗窃案件同比得分';
comment on column T_KHKP_JFZ.F00001_02
  is '当月入室盗窃案件环比得分';
comment on column T_KHKP_JFZ.C60001
  is '单位信息登记 1分';
comment on column T_KHKP_JFZ.C60002
  is '安全防范检查1分';
comment on column T_KHKP_JFZ.F00002_01
  is '入室盗窃 系统自动比对扣分 110接处警比对';
