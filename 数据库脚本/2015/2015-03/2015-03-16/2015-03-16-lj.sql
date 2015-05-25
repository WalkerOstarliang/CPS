-- Create table
create table T_TJFX_ZAPCTB
(
  ID         VARCHAR2(22),
  HJA        VARCHAR2(10),
  LLJF       VARCHAR2(10),
  ZDCQ       VARCHAR2(10),
  TQGZ       VARCHAR2(10),
  FZCSW      VARCHAR2(10),
  SFSS       VARCHAR2(10),
  QTYY       VARCHAR2(10),
  MJPCFX     VARCHAR2(10),
  HLWJH      VARCHAR2(10),
  DHJB       VARCHAR2(10),
  QZJB       VARCHAR2(10),
  HJB        VARCHAR2(10),
  QSYDW      VARCHAR2(10),
  DZJG       VARCHAR2(10),
  XX         VARCHAR2(10),
  JCCZ       VARCHAR2(10),
  GC         VARCHAR2(10),
  JJ         VARCHAR2(10),
  QTBW       VARCHAR2(10),
  BZWP       VARCHAR2(10),
  QZ         VARCHAR2(10),
  QY         VARCHAR2(10),
  JD         VARCHAR2(10),
  DJ         VARCHAR2(10),
  QTGJ       VARCHAR2(10),
  YJQTJZ     VARCHAR2(10),
  HJC        VARCHAR2(10),
  ESYX       VARCHAR2(10),
  ESZSS      VARCHAR2(10),
  SYZWS      VARCHAR2(10),
  SSYYS      VARCHAR2(10),
  WYRY       VARCHAR2(10),
  WLWGRY     VARCHAR2(10),
  SFRY       VARCHAR2(10),
  JSBR       VARCHAR2(10),
  QTRQ       VARCHAR2(10),
  ZACF       VARCHAR2(10),
  XSCF       VARCHAR2(10),
  RCWK       VARCHAR2(10),
  SJZY       VARCHAR2(10),
  LG         VARCHAR2(10),
  JDHXP      VARCHAR2(10),
  QZB        VARCHAR2(10),
  ZDB        VARCHAR2(10),
  QYB        VARCHAR2(10),
  DJDWDM     VARCHAR2(12),
  DJDWMC     VARCHAR2(150),
  PARENTCODE VARCHAR2(12),
  PARENTNAME VARCHAR2(150),
  LEVE       VARCHAR2(10),
  TJYF       VARCHAR2(6),
  TJQSRQ     VARCHAR2(8),
  TJJZRQ     VARCHAR2(8),
  TBSJ       DATE default sysdate,
  DJRJH      VARCHAR2(30),
  DJRXM      VARCHAR2(30),
  DJRSFZH    VARCHAR2(18),
  IP         VARCHAR2(100)
);
-- Add comments to the table 
comment on table T_TJFX_ZAPCTB
  is '省厅治安系统开展排查填报';
-- Add comments to the columns 
comment on column T_TJFX_ZAPCTB.ID
  is '主键ID：6位行政编码+6位日期+10位序列号';
comment on column T_TJFX_ZAPCTB.HJA
  is '排查发现可能引发个人极端暴力犯罪的线索数：合计(必须填写数字)';
comment on column T_TJFX_ZAPCTB.LLJF
  is '原因分析：邻里纠纷(必须填写数字)';
comment on column T_TJFX_ZAPCTB.ZDCQ
  is '原因分析：征地拆迁(必须填写数字)';
comment on column T_TJFX_ZAPCTB.TQGZ
  is '原因分析：拖欠工资(必须填写数字)';
comment on column T_TJFX_ZAPCTB.FZCSW
  is '原因分析：非正常死亡(必须填写数字)';
comment on column T_TJFX_ZAPCTB.SFSS
  is '原因分析：涉法涉诉(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QTYY
  is '原因分析：其他(必须填写数字)';
comment on column T_TJFX_ZAPCTB.MJPCFX
  is '线索来源渠道分析：民警排查发现(必须填写数字)';
comment on column T_TJFX_ZAPCTB.HLWJH
  is '线索来源渠道分析：互联网截获(必须填写数字)';
comment on column T_TJFX_ZAPCTB.DHJB
  is '线索来源渠道分析：110接报(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QZJB
  is '线索来源渠道分析：群众举报(必须填写数字)';
comment on column T_TJFX_ZAPCTB.HJB
  is '治安系统化解处置个人极端暴力犯罪案事件数：合计(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QSYDW
  is '预谋实施的场所部位分析：企事业单位(必须填写数字)';
comment on column T_TJFX_ZAPCTB.DZJG
  is '预谋实施的场所部位分析：党政机关(必须填写数字)';
comment on column T_TJFX_ZAPCTB.XX
  is '预谋实施的场所部位分析：学校(必须填写数字)';
comment on column T_TJFX_ZAPCTB.JCCZ
  is '预谋实施的场所部位分析：机场、车站、码头、地铁(必须填写数字)';
comment on column T_TJFX_ZAPCTB.GC
  is '预谋实施的场所部位分析：广场、商业网点等人员密集公共场所(必须填写数字)';
comment on column T_TJFX_ZAPCTB.JJ
  is '预谋实施的场所部位分析：进京(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QTBW
  is '预谋实施的场所部位分析：其他(必须填写数字)';
comment on column T_TJFX_ZAPCTB.BZWP
  is '使用工具情况分析：爆炸物品(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QZ
  is '使用工具情况分析：枪支(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QY
  is '使用工具情况分析：汽油等易燃物品(必须填写数字)';
comment on column T_TJFX_ZAPCTB.JD
  is '使用工具情况分析：剧毒化学品(必须填写数字)';
comment on column T_TJFX_ZAPCTB.DJ
  is '使用工具情况分析：刀具(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QTGJ
  is '使用工具情况分析：其他(必须填写数字)';
comment on column T_TJFX_ZAPCTB.YJQTJZ
  is '移交其他警种和政府有关部门(必须填写数字)';
comment on column T_TJFX_ZAPCTB.HJC
  is '稳控打击有个人极端暴力犯罪倾向的重点人数：合计(必须填写数字)';
comment on column T_TJFX_ZAPCTB.ESYX
  is '年龄阶段分析：20岁以下(必须填写数字)';
comment on column T_TJFX_ZAPCTB.ESZSS
  is '年龄阶段分析：20-40岁(必须填写数字)';
comment on column T_TJFX_ZAPCTB.SYZWS
  is '年龄阶段分析：41-50岁(必须填写数字)';
comment on column T_TJFX_ZAPCTB.SSYYS
  is '年龄阶段分析：51岁以上(必须填写数字)';
comment on column T_TJFX_ZAPCTB.WYRY
  is '重点人群分析：无业人员(必须填写数字)';
comment on column T_TJFX_ZAPCTB.WLWGRY
  is '重点人群分析：外来务工人员(必须填写数字)';
comment on column T_TJFX_ZAPCTB.SFRY
  is '重点人群分析：上访人员(必须填写数字)';
comment on column T_TJFX_ZAPCTB.JSBR
  is '重点人群分析：精神病人(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QTRQ
  is '重点人群分析：其他(必须填写数字)';
comment on column T_TJFX_ZAPCTB.ZACF
  is '采取处置措施情况：治安处罚(必须填写数字)';
comment on column T_TJFX_ZAPCTB.XSCF
  is '采取处置措施情况：刑事处罚(必须填写数字)';
comment on column T_TJFX_ZAPCTB.RCWK
  is '采取处置措施情况：日常稳控(必须填写数字)';
comment on column T_TJFX_ZAPCTB.SJZY
  is '收缴炸药（公斤）(必须填写数字)';
comment on column T_TJFX_ZAPCTB.LG
  is '雷管（枚）(必须填写数字)';
comment on column T_TJFX_ZAPCTB.JDHXP
  is '剧毒化学品（克）(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QZB
  is '枪支（把）(必须填写数字)';
comment on column T_TJFX_ZAPCTB.ZDB
  is '子弹（发）(必须填写数字)';
comment on column T_TJFX_ZAPCTB.QYB
  is '汽油等易燃物品（升）(必须填写数字)';
comment on column T_TJFX_ZAPCTB.DJDWDM
  is '登记单位代码';
comment on column T_TJFX_ZAPCTB.DJDWMC
  is '登记单位名称';
comment on column T_TJFX_ZAPCTB.PARENTCODE
  is '上级单位代码';
comment on column T_TJFX_ZAPCTB.PARENTNAME
  is '上级单位名称';
comment on column T_TJFX_ZAPCTB.LEVE
  is '单位级别';
comment on column T_TJFX_ZAPCTB.TJYF
  is '统计月份：（例如201501）';
comment on column T_TJFX_ZAPCTB.TJQSRQ
  is '统计起始日期（例如20150104）';
comment on column T_TJFX_ZAPCTB.TJJZRQ
  is '统计截至日期（例如20150202）';
comment on column T_TJFX_ZAPCTB.TBSJ
  is '填报时间';
comment on column T_TJFX_ZAPCTB.DJRJH
  is '登记人警号';
comment on column T_TJFX_ZAPCTB.DJRXM
  is '登记人姓名';
comment on column T_TJFX_ZAPCTB.DJRSFZH
  is '登记人身份证号';
comment on column T_TJFX_ZAPCTB.IP
  is '填写机器IP地址';

  

-- Create sequence 
create sequence SEQ_GZGL_STZAPCID
minvalue 1
maxvalue 9999999999
start with 1000000000
increment by 1
cache 20
cycle;
 