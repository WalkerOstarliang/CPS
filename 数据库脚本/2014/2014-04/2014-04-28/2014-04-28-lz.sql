-- Create table
create table t_za_dw_nbaqjc
(
  id       varchar2(32),
  jcdwdm   varchar2(12),
  jcdwmc   varchar2(120),
  sspcsdm  varchar2(12),
  sspcsmc  varchar2(120),
  jcmjjh   varchar2(200),
  jcmjxm   varchar2(50),
  jcrq     date,
  jcqkms   varchar2(500),
  xhms     varchar2(200),
  mjclyj   varchar2(500),
  cl       varchar2(500),
  zgqx     number,
  tjsldjh  varchar2(200),
  tjsldxm  varchar2(50),
  yhtjmjjh varchar2(200),
  yhtjmjxm varchar2(50),
  mjclsj   date,
  sldspyj  varchar2(1000),
  sldzgqx  number,
  sldcl    varchar2(500),
  sldjh    varchar2(200),
  sldxm    varchar2(50),
  sldspsj  date,
  JZZD01   varchar2(2),
  JZZD02   varchar2(2),
  JZZD03   varchar2(2),
  JZZD04   varchar2(2),
  JZZD05   varchar2(2),
  JZZD06   varchar2(2),
  JZZD07   varchar2(2),
  JZZD08   varchar2(2),
  JZSP01   varchar2(2),
  JZSP02   varchar2(2),
  JZSP03   varchar2(2),
  JZSP04   varchar2(2),
  JZSP05   varchar2(2),
  JZSP06   varchar2(2),
  JZSP07   varchar2(2),
  JZBJ02   varchar2(2),
  JZBJ08   varchar2(2),
  JZWF01   varchar2(2),
  JZWF02   varchar2(2),
  JZWF03   varchar2(2),
  JZWF04   varchar2(2),
  JZWF05   varchar2(2),
  JZRF01   varchar2(2),
  JZRF02   varchar2(2),
  JZRF03   varchar2(2),
  JZRF04   varchar2(2),
  JZBA01   varchar2(2),
  JZBA02   varchar2(2),
  JZBA03   varchar2(2),
  JZBA04   varchar2(2)
)
;
-- Add comments to the table 
comment on table t_za_dw_nbaqjc
  is '内保(重点)企事业检查单';
-- Add comments to the columns 
comment on column t_za_dw_nbaqjc.id
  is '主键id';
comment on column t_za_dw_nbaqjc.jcdwdm
  is '检查单位代码';
comment on column t_za_dw_nbaqjc.jcdwmc
  is '检查单位名称';
comment on column t_za_dw_nbaqjc.sspcsdm
  is '所属派出所代码';
comment on column t_za_dw_nbaqjc.sspcsmc
  is '所属派出所名称';
comment on column t_za_dw_nbaqjc.jcmjjh
  is '检查民警警号';
comment on column t_za_dw_nbaqjc.jcmjxm
  is '检查民警姓名';
comment on column t_za_dw_nbaqjc.jcrq
  is '检查日期';
comment on column t_za_dw_nbaqjc.jcqkms
  is '检查情况描述';
comment on column t_za_dw_nbaqjc.xhms
  is '隐患描述';
comment on column t_za_dw_nbaqjc.mjclyj
  is '民警处理意见';
comment on column t_za_dw_nbaqjc.cl
  is '处理';
comment on column t_za_dw_nbaqjc.zgqx
  is '整改期限';
comment on column t_za_dw_nbaqjc.tjsldjh
  is '提交所领导警号';
comment on column t_za_dw_nbaqjc.tjsldxm
  is '提交所领导姓名';
comment on column t_za_dw_nbaqjc.yhtjmjjh
  is '隐患提交民警警号';
comment on column t_za_dw_nbaqjc.yhtjmjxm
  is '隐患提交民警姓名';
comment on column t_za_dw_nbaqjc.mjclsj
  is '民警处理时间';
comment on column t_za_dw_nbaqjc.sldspyj
  is '所领导审批意见';
comment on column t_za_dw_nbaqjc.sldzgqx
  is '所领导提出的整改期限';
comment on column t_za_dw_nbaqjc.sldcl
  is '所领导处理';
comment on column t_za_dw_nbaqjc.sldjh
  is '所领导警号';
comment on column t_za_dw_nbaqjc.sldxm
  is '所领导姓名';
comment on column t_za_dw_nbaqjc.sldspsj
  is '所领导审批';
comment on column t_za_dw_nbaqjc.JZZD01
  is '制定和落实内部治安保卫制度 *';
comment on column t_za_dw_nbaqjc.JZZD02
  is '制定单位内部治安突发事件处置紧急预案 *';
comment on column t_za_dw_nbaqjc.JZZD03
  is '组织开展紧急预案演练 *';
comment on column t_za_dw_nbaqjc.JZZD04
  is '设置治安保卫机构 *';
comment on column t_za_dw_nbaqjc.JZZD05
  is '配备专职保卫人员*';
comment on column t_za_dw_nbaqjc.JZZD06
  is '落实内部治安保卫工作责任制 *';
comment on column t_za_dw_nbaqjc.JZZD07
  is '对员工安全防范培训 *';
comment on column t_za_dw_nbaqjc.JZZD08
  is '人员、物品、车辆出入登记手续 *';
comment on column t_za_dw_nbaqjc.JZSP01
  is '重点要害部位安装入侵报警系统 *';
comment on column t_za_dw_nbaqjc.JZSP02
  is '重点要害部位安装的入侵报警系统与市局110联网 *';
comment on column t_za_dw_nbaqjc.JZSP03
  is '重点要害部位安装视频监控 *';
comment on column t_za_dw_nbaqjc.JZSP04
  is '视频监控图像 *';
comment on column t_za_dw_nbaqjc.JZSP05
  is '回放图像质量 *';
comment on column t_za_dw_nbaqjc.JZSP06
  is '图像存储时间满足规定的30天期限要求 *';
comment on column t_za_dw_nbaqjc.JZSP07
  is '监控录制时间24小时 *';
comment on column t_za_dw_nbaqjc.JZBJ02
  is '重点区域安装周界报警 *';
comment on column t_za_dw_nbaqjc.JZBJ08
  is '主要出入口门禁系统 *';
comment on column t_za_dw_nbaqjc.JZWF01
  is '重点要害部位出入口防盗门 *';
comment on column t_za_dw_nbaqjc.JZWF02
  is '重点要害部位防盗窗 *';
comment on column t_za_dw_nbaqjc.JZWF03
  is '财务室防盗门 *';
comment on column t_za_dw_nbaqjc.JZWF04
  is '财务室防盗窗 *';
comment on column t_za_dw_nbaqjc.JZWF05
  is '财务室保险箱是否与墙面或地面固定 *';
comment on column t_za_dw_nbaqjc.JZRF01
  is '配备足够数量的安保人员 *';
comment on column t_za_dw_nbaqjc.JZRF02
  is '进行上岗前培训和定期开展培训 *';
comment on column t_za_dw_nbaqjc.JZRF03
  is '配备使用防卫器械和报警装备 *';
comment on column t_za_dw_nbaqjc.JZRF04
  is '重点要害部位值守力量是否到位 *';
comment on column t_za_dw_nbaqjc.JZBA01
  is '保安员全部持《保安员证》上岗 *';
comment on column t_za_dw_nbaqjc.JZBA02
  is '定期开展教育、培训 *';
comment on column t_za_dw_nbaqjc.JZBA03
  is '保安员是否着符合要求的保安员服装上岗 *';
comment on column t_za_dw_nbaqjc.JZBA04
  is '保安员是否认真履职，有较强的安全防范意识 *';

  
  
  
  
  -- Create sequence 
create sequence SEQ_T_ZA_DW_NBAQJC_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;