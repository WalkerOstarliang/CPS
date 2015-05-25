-- Create table
drop table T_AJ_JBXX;
create table T_AJ_JBXX
(
  ID                CHAR(32) default sys_guid(),
  ACTTIME           CHAR(17) default to_char(systimestamp,'YYYYMMDDHH24MISSFF3'),
  ACTFLAG           CHAR(1) default '1',
  ACTUSER           VARCHAR2(32),
  ANJIANBIAOZHI     CHAR(1),
  ANJIANBIANHAO     VARCHAR2(23),
  GONGANBIANHAO     CHAR(6),
  WENSHUNIANFEN     NUMBER,
  WENSHUBIANHAO     NUMBER,
  WENSHUWENHAO      VARCHAR2(128),
  ANYOU             VARCHAR2(200),
  ANJIANMINGCHENG   VARCHAR2(256),
  ANJIANZHUANGTAI   CHAR(2) default '00',
  ANJIANLAIYUAN     CHAR(2),
  BAOANRIQI         VARCHAR2(14),
  ANJIANLEIBIE      CHAR(6),
  FUANLEIBIE        VARCHAR2(512),
  JIANYAOANQING     CLOB,
  SHOULIRIQI        VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  SHEMIBIAOZHI      CHAR(1),
  LIANRIQI          VARCHAR2(8),
  LIANLEIXING       CHAR(1),
  LIANDANWEI        CHAR(12),
  POANRIQI          VARCHAR2(8),
  POANLEIXING       CHAR(2),
  POANDANWEI        CHAR(12),
  JIEANRIQI         VARCHAR2(8),
  JIEANLEIXING      CHAR(2),
  BANANREN1ID       CHAR(12),
  BANANREN2ID       CHAR(12),
  BANANDANWEIID     CHAR(12),
  YIJIAOQIANID      CHAR(12),
  FAANSHIJIANKAISHI VARCHAR2(14),
  FAANSHIJIANJIESHU VARCHAR2(14),
  SHIFOUWEITUO      CHAR(1) default '0',
  YUNXULIAN         CHAR(2) default '00',
  ZHISHU            CHAR(1) default '0',
  BYORDER           CHAR(17) default to_char(systimestamp,'YYYYMMDDHH24MISSFF3'),
  KPZT              CHAR(1) default '0',
  MSCORE            NUMBER,
  ZXKP              CHAR(1) default '0',
  ZSCORE            NUMBER,
  XYRFLAG           CHAR(1) default '0',
  SHRFLAG           CHAR(1) default '0',
  SCORE1            NUMBER,
  SCORE2            NUMBER,
  SCORE3            NUMBER,
  FAANSHEQU         VARCHAR2(14),
  CHEANRIQI         CHAR(8),
  LSHJFLAG          CHAR(1) default '1',
  ZJFLAG            CHAR(1) default '0',
  BLFLAG            CHAR(1) default '0',
  PGIS_X            VARCHAR2(32),
  PGIS_Y            VARCHAR2(32),
  HH                VARCHAR2(2),
  RBKSJ             DATE default SYSDATE,
  FARQ              VARCHAR2(8),
  FARQ_SQ           CHAR(1),
  FASJ_XS           VARCHAR2(2)
);
-- Add comments to the table 
comment on table T_AJ_JBXX
  is '案件基本信息表';
-- Add comments to the columns 
comment on column T_AJ_JBXX.ID
  is '数据id';
comment on column T_AJ_JBXX.ACTTIME
  is '操作时间';
comment on column T_AJ_JBXX.ACTFLAG
  is '操作标志  1=新增、2=修改、4=删除、8=临时数据';
comment on column T_AJ_JBXX.ACTUSER
  is '用户id';
comment on column T_AJ_JBXX.ANJIANBIAOZHI
  is '案件标志';
comment on column T_AJ_JBXX.ANJIANBIANHAO
  is '案件编号';
comment on column T_AJ_JBXX.GONGANBIANHAO
  is '公安编号';
comment on column T_AJ_JBXX.WENSHUNIANFEN
  is '文书年份';
comment on column T_AJ_JBXX.WENSHUBIANHAO
  is '文书编号';
comment on column T_AJ_JBXX.WENSHUWENHAO
  is '文书文号';
comment on column T_AJ_JBXX.ANYOU
  is '案由';
comment on column T_AJ_JBXX.ANJIANMINGCHENG
  is '案件名称';
comment on column T_AJ_JBXX.ANJIANZHUANGTAI
  is '案件状态';
comment on column T_AJ_JBXX.ANJIANLAIYUAN
  is '案件来源';
comment on column T_AJ_JBXX.BAOANRIQI
  is '报案日期';
comment on column T_AJ_JBXX.ANJIANLEIBIE
  is '案件类别';
comment on column T_AJ_JBXX.FUANLEIBIE
  is '副案类别';
comment on column T_AJ_JBXX.JIANYAOANQING
  is '简要案情';
comment on column T_AJ_JBXX.SHOULIRIQI
  is '受理日期';
comment on column T_AJ_JBXX.SHEMIBIAOZHI
  is '涉密标志';
comment on column T_AJ_JBXX.LIANRIQI
  is '立案日期';
comment on column T_AJ_JBXX.LIANLEIXING
  is '立案类型';
comment on column T_AJ_JBXX.LIANDANWEI
  is '立案单位';
comment on column T_AJ_JBXX.POANRIQI
  is '破案日期';
comment on column T_AJ_JBXX.POANLEIXING
  is '破案类型';
comment on column T_AJ_JBXX.POANDANWEI
  is '破案单位';
comment on column T_AJ_JBXX.JIEANRIQI
  is '结案日期';
comment on column T_AJ_JBXX.JIEANLEIXING
  is '结案类型';
comment on column T_AJ_JBXX.BANANREN1ID
  is '办案人id';
comment on column T_AJ_JBXX.BANANREN2ID
  is '办案人id';
comment on column T_AJ_JBXX.BANANDANWEIID
  is '办案单位id';
comment on column T_AJ_JBXX.YIJIAOQIANID
  is '移交前ID';
comment on column T_AJ_JBXX.FAANSHIJIANKAISHI
  is '发案时间开始';
comment on column T_AJ_JBXX.FAANSHIJIANJIESHU
  is '发案时间结束';
comment on column T_AJ_JBXX.SHIFOUWEITUO
  is '是否委托';
comment on column T_AJ_JBXX.YUNXULIAN
  is '允许立案';
comment on column T_AJ_JBXX.ZHISHU
  is '是否直属';
comment on column T_AJ_JBXX.BYORDER
  is '用于排序';
comment on column T_AJ_JBXX.KPZT
  is '考评状态：1待提交2待核查3核查不通过4待审批确认5审批通过（完成）6审批不通过';
comment on column T_AJ_JBXX.MSCORE
  is '日常考评分数';
comment on column T_AJ_JBXX.ZXKP
  is '考评状态';
comment on column T_AJ_JBXX.ZSCORE
  is '专项考评分数';
comment on column T_AJ_JBXX.XYRFLAG
  is '嫌疑人标志：0表示没有嫌疑人，1表示有嫌疑人';
comment on column T_AJ_JBXX.SHRFLAG
  is '受害人标志：0表示没有受害人，1表示有受害人';
comment on column T_AJ_JBXX.SCORE1
  is '专项考评省厅分数';
comment on column T_AJ_JBXX.SCORE2
  is '专项考评市局分数';
comment on column T_AJ_JBXX.SCORE3
  is '专项考评分县局分数';
comment on column T_AJ_JBXX.FAANSHEQU
  is '发案社区';
comment on column T_AJ_JBXX.CHEANRIQI
  is '撤案日期';
comment on column T_AJ_JBXX.LSHJFLAG
  is '律师会见许可的标志：0=否，1=是';
comment on column T_AJ_JBXX.ZJFLAG
  is '证据标志：0表示没有证据，1表示有证据';
comment on column T_AJ_JBXX.BLFLAG
  is '笔录标志：0表示没有笔录，1表示有笔录';
comment on column T_AJ_JBXX.HH
  is '发案时区';
comment on column T_AJ_JBXX.RBKSJ
  is '入本库时间';
comment on column T_AJ_JBXX.FARQ
  is '发案日期';
comment on column T_AJ_JBXX.FARQ_SQ
  is '发案时区 1-(0,6]; 2-(6,12]; 3-(12, 18]; 4-(18,24]';
comment on column T_AJ_JBXX.FASJ_XS
  is '发案时间_小时';
-- Create/Recreate indexes 
create index IDX_AJJBXXB_FARQ on T_AJ_JBXX (FARQ)
  tablespace TS_DT_SQJW ;
create index I_AJJBXXB_00 on T_AJ_JBXX (ID)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create bitmap index I_AJJBXXB_01 on T_AJ_JBXX (ACTFLAG)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create bitmap index I_AJJBXXB_02 on T_AJ_JBXX (ANJIANBIAOZHI)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index I_AJJBXXB_03 on T_AJ_JBXX (ANJIANBIANHAO)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index I_AJJBXXB_04 on T_AJ_JBXX (GONGANBIANHAO)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create bitmap index I_AJJBXXB_05 on T_AJ_JBXX (WENSHUNIANFEN)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index I_AJJBXXB_06 on T_AJ_JBXX (WENSHUBIANHAO)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index I_AJJBXXB_07 on T_AJ_JBXX (BANANREN1ID)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index I_AJJBXXB_08 on T_AJ_JBXX (BANANREN2ID)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index I_AJJBXXB_09 on T_AJ_JBXX (BANANDANWEIID)
  tablespace TS_DT_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index I_AJJBXXB_10 on T_AJ_JBXX (SHOULIRIQI)
  tablespace TS_IDX_SQJW
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320108', '消防安全检查不合格擅自投入使用、营业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320109', '未进行消防设计备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320110', '未进行竣工消防备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320111', '违法要求降低消防技术标准设计、施工', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320112', '不按照消防技术标准强制性要求进行消防设计', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320113', '违法施工降低消防施工质量', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320114', '违法监理降低消防施工质量', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320115', '消防设施、器材、消防安全标志配置、设置不符合标准', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320116', '消防设施、器材、消防安全标志未保持完好有效', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320117', '损坏、挪用消防设施、器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320118', '擅自停用、拆除消防设施、器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320119', '占用、堵塞、封闭疏散通道、安全出口', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320120', '其他妨碍安全疏散行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320121', '埋压、圈占、遮挡消火栓', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320122', '占用防火间距', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320123', '占用、堵塞、封闭消防车通道', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320124', '门窗设置影响逃生、灭火救援的障碍物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320125', '不及时消除火灾隐患', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320126', '易燃易爆危险品场所与居住场所设置在同一建筑物内', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080000', '贪污贿赂', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090000', '渎职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090021', '食品监管渎职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090003', '故意泄露国家秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100000', '军人违反职责', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '000000', '刑事案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320100', '消防法案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320101', '未经消防设计审核擅自施工', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320102', '消防设计审核不合格擅自施工', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320103', '消防设计抽查不合格不停止施工', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320104', '未经消防验收擅自投入使用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320105', '消防验收不合格擅自投入使用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320106', '投入使用后抽查不合格不停止使用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320107', '未经消防安全检查擅自投入使用、营业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320127', '易燃易爆危险品场所未与居住场所保持安全距离', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251200', '烟花爆竹安全管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251201', '违反许可事项经道路运输烟花爆竹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251202', '未携带许可证经道路运输烟花爆竹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251203', '烟花爆竹道路运输车辆未按规定悬挂、安装警示标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251204', '未按规定转载烟花爆竹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251205', '装载烟花爆竹的车厢载人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251206', '烟花爆竹运输车辆超速行驶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251207', '烟花爆竹运输车辆经停无人看守', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251208', '未按规定核销烟花爆竹道路运输许可证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251209', '非法举办大型焰火燃放活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010000', '危害国家安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010001', '背叛国家', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010002', '分裂国家', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010003', '煽动分裂国家', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010004', '武装叛乱、暴乱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010005', '策动武装暴乱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010006', '颠覆国家政权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010007', '煽动颠覆国家政权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010008', '资助危害国家安全犯罪活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010009', '投敌叛变', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010010', '叛逃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010011', '间谍', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010012', '资敌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010013', '为境外窃取国家秘密情报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010014', '为境外刺探国家秘密情报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010015', '为境外收买国家秘密情报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010016', '为境外非法提供国家秘密情报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '010099', '其他危害国家安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020000', '危害公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020302', '资助恐怖活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020100', '以危险方法危害公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020101', '放火', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020102', '决水', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020103', '爆炸', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020104', '投放危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020199', '以其他危险方法危害公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020105', '失火', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210320', '遗弃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210321', '强迫交易', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210322', '煽动民族仇恨、民族歧视', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210323', '刊载民族歧视、侮辱内容', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210324', '冒领、隐匿、毁弃、私自开拆、非法检查他人邮件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210325', '盗窃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210326', '诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210327', '哄抢', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210328', '抢夺', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210329', '敲诈勒索', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350212', '运输易制毒化学品货证不符', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350213', '运输易制毒化学品未携带许可证、备案证明', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350214', '违规携带易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350215', '拒不接受易制毒化学品监督检查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350300', '易制毒化学品购销和运输管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350301', '向无购买许可证、备案证明的单位、个人销售易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350302', '超出购买许可、备案范围销售易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350400', '麻醉药品和精神药品管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350401', '麻醉药品、精神药品流入非法渠道', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '351100', '湖南省公安机关办理吸毒类行政案件规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '351101', '娱乐场所经营单位发现本场所内有吸食、注射毒品等违法活动而不及时报告公安机关', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020106', '过失决水', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020107', '过失爆炸', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020108', '过失投放危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020109', '过失以危险方法危害公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020110', '危险驾驶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020200', '危害交通运输、公用设备安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020201', '破坏交通工具', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020202', '破坏交通设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020203', '破坏电力设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020204', '破坏易燃易爆设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020205', '破坏广播电视设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020206', '破坏公用电信设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020207', '过失损坏交通工具', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020208', '过失损坏交通设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020209', '过失损坏电力设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020210', '过失损坏易燃易爆设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020211', '过失损坏广播电视设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020212', '过失损坏公用电信设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020300', '实施恐怖、劫持', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020301', '组织、领导恐怖组织', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020306', '劫持航空器', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020305', '劫持船只', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020304', '劫持汽车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020307', '暴力危及飞行安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020400', '非法制造、买卖、运输、邮寄、储存枪支、弹药、爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020401', '非法制造枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020402', '非法买卖枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020403', '非法运输枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020404', '非法邮寄枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020405', '非法储存枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020406', '非法制造爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020407', '非法买卖爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020408', '非法运输爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020409', '非法邮寄爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020410', '非法储存爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020500', '非法制造、买卖、运输、储存危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251210', '违规从事燃放作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251211', '违规燃放烟花爆竹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251212', '非法运输烟花爆竹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251213', '非法邮寄、携带烟花爆竹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250100', '危险化学品安全管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250101', '未按照规定设置危险化学品安全设施、设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250102', '未在危险化学品生产、储存、使用场所设置有效通讯、报警装置', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250103', '未设专人管理危险化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250104', '危险化学品专用仓库不符合安全、消防标准', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250105', '危险化学品专用仓库未设置明显标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '351102', '为吸食、注射毒品等违法活动提供便利条件，尚未构成犯罪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391500', '旧货流通管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391501', '经营赃物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391507', '经营严重损坏且无法修复的物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391509', '经营行政法规明令禁止经营和特许经营的其他物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391511', '未对受他人委托代销的旧货进行查验', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391517', '旧货经营者未对委托处理旧货的单位和个人，未严格查验委托单位的授权委托书及委托人的居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391518', '旧货市场发现可疑人员未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391526', '违反《旧货流通管理办法》第三十一条规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391600', '湖南省流动人口服务和管理规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391601', '不及时申报流动人口暂住登记的', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310000', '违反交通管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410100', '中华人民共和国森林法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410101', '盗伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410102', '滥伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410103', '违法买卖林木采伐许可证、木材运输证件、批准出口文件、允许进出口证明书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410104', '在林区非法收购明知是盗伐、滥伐的林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410105', '违法开垦、采石、采砂、采土、采种、采脂和其他活动致毁林', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410106', '违法在幼林地和特种用途林内砍柴、放牧致毁林', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410200', '违反林业行政法规', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410201', '盗伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410202', '滥伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410203', '在林区非法经营〔含加工〕木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410204', '毁林采种或者违规采脂、挖笋、掘根、剥树皮及过度修枝致毁林', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410205', '擅自开垦林地致毁林', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410206', '逾期未完成更新造林任务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410207', '擅自改变林地用途', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410208', '逾期不归还临时占用的林地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410209', '无木材运输证运输木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410210', '超出木材运输证准运范围运输木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410211', '使用伪造、涂改的木材运输证运输木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410212', '承运无木材运输证的木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410213', '擅自移动或者毁坏林业服务标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410214', '非法改变林种', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410215', '未履行森林防火责任', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410216', '拒绝接受森林防火检查、逾期不消除火灾隐患', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410217', '非法野外用火', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410218', '非法进行实弹演习、爆破', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410219', '未依法设置森林防火警示宣传标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410220', '机动车辆未依法安装森林防火装置', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210330', '故意损毁财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210400', '妨害社会管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250106', '未定期检测危险化学品专用仓库的储存设备、安全设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250107', '未按规定存放、收发、保管剧毒化学品、构成重大危险源的危险化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250108', '未备案剧毒化学品、构成重大危险源的危险化学品的储存情况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250109', '未如实记录剧毒化学品相关情况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250110', '未采取剧毒化学品保安措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250111', '剧毒化学品误售、误用不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250112', '未记录剧毒化学品购买信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250113', '未按规定核对剧毒化学品销售情况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250114', '伪造、变造、买卖、出借、转让剧毒化学品许可证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250115', '使用作废的剧毒化学品许可证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250116', '违反押运、装载限制运输危险化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250117', '公路运输危险化学品中途住宿、无法正常运输不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250118', '公路运输危险化学品擅自进入禁止通行区域', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250119', '公路运输危险化学品未按规定时间、路线进入禁止通行区域', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250120', '剧毒化学品运输途中流散、泄露不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250121', '剧毒化学品运输途中被盗、丢失、流散、泄露未采取有效警示措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250122', '非法托运危险化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250200', '剧毒化学品购买和公路运输许可证件管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250201', '非法获取剧毒化学品购买、公路运输许可证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250202', '未按规定更正剧毒化学品购买许可证件回执填写错误', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250203', '未携带许可证经公路运输剧毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250204', '违反许可事项经公路运输剧毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250205', '未按规定缴交剧毒化学品购买证件回执', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250206', '未按规定缴交剧毒化学品公路运输通行证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250207', '未按规定缴交已使用剧毒化学品购买凭证存根', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250208', '未按规定缴交不再需要适用的剧毒化学品购买凭证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250209', '未按规定作废、缴交填写错误的剧毒化学品购买凭证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210401', '拒不执行紧急状态下的决定、命令', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210402', '阻碍执行职务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210403', '阻碍特种车辆通行', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210404', '冲闯警戒带、警戒区', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210405', '招摇撞骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210406', '伪造、变造、买卖公文、证件、证明文件、印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210407', '买卖、使用伪造、变造的公文、证件、证明文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210408', '伪造、变造、倒卖有价票证、凭证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210409', '伪造、变造船舶户牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210410', '买卖、使用伪造、变造的船舶户牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210411', '涂改船舶发动机号码', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210412', '驾船擅自进入、停靠国家管制的水域、岛屿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210413', '非法以社团名义活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250300', '放射性物品运输安全管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250301', '放射性物品运输车辆违反行驶规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250302', '放射性物品运输车辆未悬挂警示标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250303', '道路运输放射性物品未配备押运人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210000', '违反治安管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300199', '其他违反护照法行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340000', '违反中华人民共和国警察法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391506', '经营有走私嫌疑的物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '309900', '其他违反出入境管理行政案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391513', '旧货经营者未对应当登记出售旧货的单位名称和个人的居民身份证进行登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350299', '其他违反易制毒化学品管理行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391508', '经营法律法规明令禁止经营和特许经营的其他物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '400000', '林业案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410000', '林业行政案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250199', '其他违反危险化学品管理的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '229900', '其他违反人口管理行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '219900', '其他危害治安管理行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340199', '其他违反警察法的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391524', '旧货经营者发现公安机关要求协查的物品未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350000', '违反禁毒管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210607', '患有精神病', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220299', '其他违反暂住人口管理行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280199', '其他违反人民币管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210609', '丢失财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220199', '其他违反居民身份证法行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210414', '以被撤销登记的社团名义活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210415', '未获公安许可擅自经营', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210416', '煽动、策划非法集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210417', '不按规定登记住宿旅客信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210418', '不制止住宿旅客带入危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210419', '明知住宿旅客是犯罪嫌疑人不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210420', '将房屋出租给无身份证件人居住', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210421', '不按规定登记承租人信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210422', '明知承租人利用出租屋犯罪不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210423', '制造噪声干扰正常生活', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210424', '违法承接典当物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210425', '典当发现违法犯罪嫌疑人、赃物不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210426', '违法收购废旧专用器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210427', '收购赃物、有赃物嫌疑的物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210428', '收购国家禁止收购的其他物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210429', '隐藏、转移、变卖、损毁依法扣押、查封、冻结的财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210430', '伪造、隐匿、毁灭证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210431', '提供虚假证言', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210432', '谎报案情', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210433', '窝藏、转移、代销赃物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210434', '违反监督管理规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240000', '违反娱乐场所管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210600', '非案件警情', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210500', '不履行义务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230399', '其他违反印刷管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391522', '旧货经营者发现可疑人员未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391516', '旧货经营者未对应当登记受他人委托旧货的单位名称和个人的居民身份证进行登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250000', '违反危险物品管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210603', '自杀', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391525', '旧货经营者发现公安机关要求协查的走私物品未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '200000', '行政案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210604', '意外人身事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '359900', '其他涉毒案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210601', '正常死亡', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '259900', '其他违反危险物品管理的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330000', '违反信息网络安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020503', '非法运输危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020411', '非法携带爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020504', '非法储存危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020600', '违反枪支、弹药管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020605', '非法持有枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020606', '非法私藏枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020608', '非法出借枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020607', '非法出租枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020610', '丢失枪支不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020611', '非法携带枪支、弹药危及公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020700', '违反危险物品管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020701', '非法携带管制刀具危及公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020702', '非法携带危险品危及公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020800', '重大责任事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020810', '重大飞行事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020804', '铁路运营安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020801', '交通肇事', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020802', '重大劳动安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020808', '危险物品肇事', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020803', '工程重大安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020805', '教育设施重大安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020809', '消防责任事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021000', '抢劫枪支、弹药、爆炸物、危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021005', '抢劫枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021007', '抢劫国家机关枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021008', '抢劫军、警、民兵枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021003', '抢劫爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021009', '抢劫国家机关爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021010', '抢劫军、警、民兵爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020900', '盗窃枪支、弹药、爆炸物、危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020906', '盗窃枪支、弹药、爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020905', '盗窃枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020907', '盗窃国家机关枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020908', '盗窃军、警、民兵枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020903', '盗窃爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020909', '盗窃国家机关爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020910', '盗窃军、警、民兵爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021106', '抢夺枪支、弹药、爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210435', '协助组织、运送他人偷越国 ( 边 ) 境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210436', '为偷越国 ( 边 ) 境人员提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210437', '偷越国 ( 边 ) 境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210438', '故意损坏文物、名胜古迹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210439', '违法实施危及文物安全的活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210440', '偷开机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210441', '无证驾驶、偷开航空器、机动船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210442', '破坏、污损坟墓', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210443', '毁坏、丢弃尸骨、骨灰', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410221', '森林高火险期内，非法进入森林高火险区活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410222', '在禁猎区、禁猎期或者使用禁用的工具、方法猎捕野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410223', '未取得狩猎证或者未按狩猎证规定猎捕野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410224', '在自然保护区、禁猎区破坏国家或者地方重点保护野生动物主要生息繁衍场所', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410225', '伪造、倒卖、转让狞猎证或者驯养繁殖许可证或者允许进出口证明书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410226', '违法捕杀国家重点保护野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410227', '无证或超范围驯养繁殖国家重点保护野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410228', '外国人非法对国家重点保护野生动物进行野外考察、标本采集或者在野外拍摄电影、录像', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410229', '非法运输、邮寄、携带重点保护的野生动物及其产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410230', '非法收购、出售重点保护的野生动物及其产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410231', '非法经营省保护的有益的或者有重要经济、科学研究价值的野生动物及其产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410232', '在候鸟主要栖息地进行危及候鸟生存、繁衍活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410233', '非法采集国家重点保护野生植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410234', '非法收购、出售国家重点保护的野生植物及其产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410235', '伪造、倒卖、转让采集证、允许进出口证明书或者有关批准文件、标签', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410236', '外国人违法采集、收购、考察国家重点保护野生植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410237', '采伐、毁坏或者擅自移植古树名木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410238', '逃避检查或者强行冲关运输木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410239', '偷漏、拒交林业费用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410240', '生产、经营假、劣种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410241', '非法生产种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410242', '非法经营种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410243', '非法为境外制种的种子在国内销售', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410244', '非法采集、采伐国家重点保护的天然种质资源', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410245', '经营未包装的种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410246', '经营无标签或者标签内容不符规定的种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410247', '伪造、涂改标签或者试验、检验数据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410248', '未制作、保存种子生产、经营档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410249', '在异地设立分支机构未按规定备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410250', '未经审定经营、推广种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021105', '抢夺枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021107', '抢夺国家机关枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021108', '抢夺军、警、民兵枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021103', '抢夺爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021109', '抢夺国家机关爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021110', '抢夺军、警、民兵爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020904', '盗窃危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '029900', '其他危害公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030000', '破坏社会主义市场经济秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030100', '生产、销售伪劣商品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030101', '生产、销售伪劣产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030102', '生产、销售假药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030103', '生产、销售劣药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030109', '生产、销售伪劣兽药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030108', '生产、销售伪劣农药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030110', '生产、销售伪劣化肥', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030111', '生产、销售伪劣种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030104', '生产、销售不符合安全标准的食品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030105', '生产、销售有毒、有害食品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030106', '生产、销售不符合标准的医用器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030107', '生产、销售不符合安全标准的产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030112', '生产、销售不符合卫生标准的化妆品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030200', '走私', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '250304', '道路运输放射性物品脱离押运人员监管', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390900', '中华人民共和国民用航空安全保卫条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390901', '装载未采取安全措施的物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390902', '违法交运、捎带他人货物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390903', '托运人伪报品名托运', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390904', '托运人在托运货物中夹带危险物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390905', '携带、交运禁运物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390906', '违反警卫制度致使航空器失控', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390907', '违规出售客票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390908', '承运时未核对乘机人和行李', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390909', '承运人未核对登机旅客人数', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390910', '将未登机人员的行李装入、滞留航空器内', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390911', '承运人未全程监管承运物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390912', '配制、装载单位未对供应品采取安全措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390913', '未对承运货物采取安全措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390914', '未对航空邮件安检', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391000', '铁路运输安全保护条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391001', '危害铁路运输安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320128', '其他场所与居住场所设置在同一建筑物内不符合消防技术标准', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320129', '违规进入生产、储存易燃易爆危险品场所', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320130', '违反规定使用明火作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320131', '在具有火灾、爆炸危险的场所吸烟、使用明火', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320132', '指使、强令他人冒险作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320133', '过失引起火灾', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320134', '阻拦、不及时报告火警', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320135', '扰乱火灾现场秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320136', '拒不执行火灾现场指挥员指挥', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320137', '故意破坏、伪造火灾现场', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320138', '擅自拆封、使用被查封场所、部位', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410251', '非法采种', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410252', '非法收购种子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410253', '非法进行病虫害接种试验', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410254', '擅自移动或破坏自然保护区界标', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410255', '在国有林场内损毁林木及设施、设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410256', '在森林公园损毁花草树木及设施、设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410257', '在森林公园擅自采集野生药材和其他林副产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410258', '用病虫害种苗育苗或者造林', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410259', '发生病虫害不除治、除治不力致使蔓延成灾', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410260', '隐瞒、虚报病虫害致使蔓延成灾', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410261', '非法调运林木种苗或者木材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410262', '弄虚作假、虚报冒领退耕还林补助资金和粮食', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410263', '在沙化土地封禁保护区范围内从事破坏植被活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410264', '进行营利性治沙活动，造成土地沙化加重', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '410265', '不按治理方案进行营利性治沙', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420000', '林业刑事案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420101', '盗伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391002', '危害电气化铁路设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391003', '危害铁路通信、信号设施安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240101', '娱乐场所从事毒品违法犯罪活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240102', '娱乐场所为毒品违法犯罪活动提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240103', '娱乐场所组织、强迫、引诱、容留、介绍他人卖淫、嫖娼', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240104', '娱乐场所为组织、强迫、引诱、容留、介绍他人卖淫、嫖娼提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240105', '娱乐场所制作、贩卖、传播淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240106', '娱乐场所为制作、贩卖、传播淫秽物品提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240107', '娱乐场所提供营利性陪侍', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320139', '人员密集场所使用不合格、国家明令淘汰的消防产品逾期未改', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320140', '电器产品的安装、使用不符合规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330504', '未按规定上报计算机病毒分析结果', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330505', '未建立计算机病毒防治管理制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330506', '未采取计算机病毒安全技术防治措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330507', '未进行计算机病毒防治教育、培训', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330508', '未及时检测、清除计算机病毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330509', '未按规定使用具有销售许可证的计算机病毒防治产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330510', '未按规定检测、清除计算机病毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330511', '未依法保存计算机病毒检测、清除记录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310100', '中华人民共和国道路交通安全法实施条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '319900', '其他违反交通法行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310102', '无有效机动车驾驶证驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320141', '燃气用具的安装、使用不符合规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320142', '电器线路的设计、敷设、维护保养、检测不符合规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320143', '燃气管路的设计、敷设、维护保养、检测不符合规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320144', '不履行消防安全职责逾期未改', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320145', '不履行组织、引导在场人员疏散义务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320146', '消防技术服务机构出具虚假、失实文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210199', '其他扰乱公共秩序的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210101', '扰乱单位秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210102', '扰乱公共场所秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210103', '扰乱公共交通工具上的秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420102', '滥伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420103', '非法收购、运输盗伐、滥伐的林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420104', '非法采伐、毁坏国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420105', '非法收购、运输、加工、出售国家重点保护植物、国家重点保护植物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420106', '走私国家禁止进出口的货物、物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420107', '放火', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420108', '失火', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420109', '聚众哄抢', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420110', '破坏生产经营', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420111', '非法猎捕、杀害珍贵、濒危野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210444', '违法停放尸体', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210445', '卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210446', '嫖娼', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210447', '拉客招嫖', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210448', '引诱、容留、介绍卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210449', '制作、运输、复制、出售、出租淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210450', '传播淫秽信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210451', '组织播放淫秽音像', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210452', '组织淫秽表演', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210453', '进行淫秽表演', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210454', '参与聚众淫乱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210455', '为淫秽活动提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210456', '为赌博提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210457', '赌博', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210458', '非法种植毒品原植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210459', '非法买卖、运输、携带、持有毒品原植物种苗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240108', '娱乐场所从业人员从事营利性陪侍', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240109', '娱乐场所为提供、从事营利性陪侍提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240110', '娱乐场所为赌博提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240111', '娱乐场所从事邪教、迷信活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240112', '娱乐场所为从事邪教、迷信活动提供条件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240113', '娱乐场所设施不符合规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240114', '未按规定安装、使用娱乐场所闭路电视监控设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240115', '删改、未按规定留存娱乐场所监控录像资料', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240116', '未按规定配备娱乐场所安全检查设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240117', '未对进入娱乐场所人员进行安全检查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240118', '未按规定配备娱乐场所保安人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240119', '设置具有赌博功能的游戏设施设备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240120', '以现金、有价证券作为娱乐奖品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240121', '非法回购娱乐奖品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240122', '指使、纵容娱乐场所从业人员侵害消费者人身权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390799', '其他违反《企业事业单位内部治安保卫条例》的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390000', '违反其它行政法规', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390699', '其他破坏金融秩序的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230199', '其他违法旅馆管理的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391503', '经营来历不明物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391521', '旧货市场发现公安机关要求协查的走私物品未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210104', '妨碍交通工具正常行驶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210105', '破坏选举秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210106', '聚众扰乱单位秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210107', '聚众扰乱公共场所秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210108', '聚众扰乱公共交通工具上的秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210109', '聚众妨碍交通工具正常行驶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210110', '聚众破坏选举秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210460', '非法运输、买卖、储存、使用罂粟壳', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210461', '非法持有毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210462', '提供毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210463', '吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210464', '胁迫、欺骗开具麻醉药品、精神药品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210465', '教唆、引诱、欺骗吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210466', '为吸毒、赌博、卖淫、嫖娼人员通风报信', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210467', '放任动物恐吓他人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210468', '饲养动物干扰正常生活', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210501', '担保人不履行担保义务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340100', '中华人民共和国人民警察法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340101', '非法制造、贩卖、持有、使用警用标志、制式服装、警械、证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340200', '人民警察制式服装及其标志管理规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340201', '生产、销售仿制警用制式服装、标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '340202', '穿着、佩带仿制警用制式服装、标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390201', '侮辱国徽', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390300', '中华人民共和国国旗法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390301', '侮辱国旗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390600', '破坏金融秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390601', '出售、购买、运输假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390602', '金融工作人员购买假币、以假币换取货币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390603', '持有、使用假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390604', '变造货币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390605', '伪造、变造金融票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390614', '金融票据诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390615', '信用卡诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390616', '保险诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280000', '违法中华人民共和国银行法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420112', '非法收购、运输、出售珍贵、濒危野生动物、珍贵、濒危野生动物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420113', '非法狩猎', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420114', '走私珍贵动物、珍贵动物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420115', '非法经营', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420116', '伪造、变造、买卖国家机关公文、证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420117', '盗窃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420118', '抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420119', '抢夺', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420120', '掩饰、隐瞒犯罪所得、犯罪所得收益', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420121', '非法占用农用地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420122', '环境污染事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280101', '变造人民币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280102', '伪造人民币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210111', '强行进入大型活动场内', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210112', '违规在大型活动场内燃放物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210113', '在大型活动场内展示侮辱性物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210114', '围攻大型活动工作人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210115', '向大型活动场内投掷杂物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210116', '其他扰乱大型活动秩序的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210117', '谎报险情、虚构事实扰乱公共秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210118', '投放虚假危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210119', '扬言实施放火、爆炸、投放危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210120', '寻衅滋事', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210121', '组织、教唆、胁迫、诱骗、煽动从事邪教、会道门活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210122', '利用邪教、会道门、迷信活动危害社会', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210123', '冒用宗教、气功名义危害社会', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210124', '故意干扰无线电业务正常进行', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210125', '拒不消除对无线电台(站)的有害干扰', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210126', '非法侵入计算机信息系统', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210127', '非法改变计算机信息系统功能', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280103', '出售、运输伪造、变造的人民币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280104', '购买、持有、使用伪造、变造的人民币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280100', '中华人民共和国人民币管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '280105', '故意毁损人民币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390606', '伪造、出售伪造的增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390607', '非法出售增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390608', '非法购买增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390609', '非法制造、出售非法制造的可以用于骗取出口退税、抵扣税款的其他发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390610', '非法制造、出售非法制造的发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390611', '非法出售可以用于骗取出口退税、抵扣税款的其他发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210128', '非法改变计算机信息系统数据和应用程序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210129', '故意制作、传播计算机破坏性程序影响运行', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210200', '妨害公共安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210201', '非法制造、买卖、储存、运输、邮寄、携带、使用、提供、处置危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210202', '危险物质被盗、被抢、丢失不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210203', '非法携带枪支、弹药、管制器具', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210204', '盗窃、损毁公共设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210205', '移动、损毁边境、领土、领海标志设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210206', '非法进行影响国（边）界线走向的活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210207', '非法修建有碍国(边)境管理的设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310101', '以不正当手段取得机动车登记、驾驶许可', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310200', '机动车号牌生产管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310201', '生产不合格机动车号牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310202', '向无证企业转让机动车号牌生产计划', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310203', '未经许可生产机动车号牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310204', '机动车登记规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310205', '未按规定喷涂机动车牌号', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310206', '机动车牌号喷涂不清晰', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310207', '机动车喷涂、粘贴影响安全驾驶的标识、车身广告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390612', '非法出售发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390613', '购买伪造的增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240400', '严禁卖淫嫖娼', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240401', '放任卖淫、嫖娼活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270100', '违反集会游行示管理规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270101', '非法集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270102', '破坏集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270200', '大型群众活动安全管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270201', '擅自变更大型活动时间、地点、内容、举办规模', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270202', '未经许可举办大型活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270203', '举办大型活动发生安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270204', '大型活动发生安全事故不处置', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270205', '大型活动发生安全事故不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220100', '中华人民共和国居民身份证法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220101', '骗领居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220102', '出租、出借、转让居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220103', '非法扣押居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220104', '冒用居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220105', '使用骗领的居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220106', '购买、出售、使用伪造、变造的居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220200', '暂住证申领办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220201', '未按规定申报暂住户口登记、申领暂住证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220202', '骗取、冒领、转借、转让、买卖、伪造、变造暂住证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220203', '雇用无暂住证人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220204', '非法扣押暂住证、其他身份证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260100', '中华人民共和国枪支管理法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260101', '违规制造、销〔配〕售枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260102', '违规运输枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260103', '非法出租、出借枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310208', '未按规定安装防护装置、粘贴反光标识', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310209', '机动车未按期进行安全技术检验', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310210', '未按规定办理机动车变更登记手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310211', '未按规定办理机动车转移登记手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310212', '未按规定办理机动车转入手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310213', '擅自改变机动车外形、技术数据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310214', '以不正当手段办理补、换领机动车登记证书、号牌、行驶证、检验合格标志业务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310300', '机动车驾驶证申领和使用规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310301', '使用报失的机动车驾驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310302', '非法补领机动车驾驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350100', '中华人民共和国禁毒法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350101', '容留吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350102', '介绍买卖毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350200', '易制毒化学品管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350201', '未经许可或者备案擅自生产、经营、购买、运输易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350202', '骗取易制毒化学品购买、运输许可证、备案证明', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350203', '使用他人的许可证、备案证明购买、运输易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350204', '使用伪造、变造、失效的许可证、备案证明购买、运输易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350205', '易制毒化学品购买、运输单位未按规定建立安全管理制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350206', '转借易制毒化学品购买、运输许可证、备案证明', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350207', '超出购买许可、备案范围购买易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350208', '未按规定记录、保存、备案易制毒化学品交易情况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350209', '易制毒化学品丢失、被盗、被抢不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350210', '使用现金、实物交易易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '350211', '未按规定报告易制毒化学品年度经销、库存情况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210208', '盗窃、损坏、擅自移动航空设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210209', '强行进入航空器驾驶舱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210210', '在航空器上使用禁用物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210211', '盗窃、损毁、擅自移动铁路设施、设备、机车车辆配件、安全标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210212', '在铁路线上放置障碍物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210213', '故意向列车投掷物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210214', '在铁路沿线非法挖掘坑穴、采石取沙', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260104', '未按规定标准制造民用枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260105', '不上缴报废枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260106', '丢失枪支不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260107', '制造、销售仿真枪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251100', '民用爆炸物品安全管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251101', '未经许可购买、运输民用爆炸物品或者从事爆破作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251102', '未按规定对民用爆炸物品作出警示、登记标识', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251103', '未按规定对雷管编码打号', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251104', '超出许可购买民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251105', '使用现金、实物交易民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251106', '销售民用爆炸物品未按规定保存交易证明材料', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251107', '销售、购买、进出口民用爆炸物品未按规定备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251108', '未按规定建立民用爆炸物品登记制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251109', '未按规定核销民用爆炸物品运输许可证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251110', '违反许可事项运输民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251111', '未携带许可证运输民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251112', '违规混装民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251113', '民用爆炸物品运输车辆未按规定悬挂、安装警示标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251114', '违反行驶、停靠规定运输民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251115', '装载民用爆炸物品的车厢载人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251116', '运输民用爆炸物品发生危险未处置', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251117', '运输民用爆炸物品发生危险不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251118', '未按资质等级从事爆破作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251119', '营业性爆破作业单位跨区域作业未报告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251120', '违反标准实施爆破作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251121', '未按规定设置民用爆炸物品专用仓库技术防范设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251122', '违反制度致使民用爆炸物品丢失、被盗、被抢', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251123', '非法转让、出借、转借、抵押、赠送民用爆炸物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251124', '未履行民用爆炸物品安全管理责任', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251125', '未按照规定建立出入库检查、登记制度或者收存和发放民用爆炸物品，致使账物不符的', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251126', '超量储存、在非专用仓库储存或者违反储存标准和规范储存民用爆炸物品的', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251127', '有本条例规定的其他违反民用爆炸物品储存管理规定行为的', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251128', '爆破作业单位未按照规定建立民用爆炸物品领取登记制度、保存领取登记记录的', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210215', '在铁路线路上私设道口、平交过道', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210216', '擅自进入铁路防护网', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210217', '违法在铁路线上行走坐卧、抢越铁路', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210218', '擅自安装、使用电网', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210219', '安装、使用电网不符合安全规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210220', '道路施工不设置安全防护设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210221', '故意损毁、移动道路施工安全防护设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210222', '盗窃、损毁路面公共设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210223', '违规举办大型活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210224', '公共场所经营管理人员违反安全规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210300', '侵犯他人人身权利、财产权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210301', '组织、胁迫、诱骗进行恐怖、残忍表演', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210302', '强迫劳动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210303', '非法限制人身自由', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210304', '非法侵入住宅', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210305', '非法搜查身体', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210306', '胁迫、诱骗、利用他人乞讨', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210307', '以滋扰他人的方式乞讨', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210308', '威胁他人人身安全', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210309', '侮辱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210310', '诽谤', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210311', '诬告陷害', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210312', '威胁、侮辱、殴打、打击报复证人及其近亲属', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210313', '发送信息干扰正常生活', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210314', '侵犯隐私', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210315', '殴打他人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210316', '故意伤害', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210317', '猥亵', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210318', '在公共场所故意裸露身体', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210319', '虐待', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060112', '非法获取国家秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060118', '非法控制计算机信息系统', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060122', '扰乱无线电通讯管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060123', '聚众扰乱社会秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060124', '聚众冲击国家机关', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060125', '聚众扰乱公共场所秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060126', '聚众扰乱交通秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060129', '聚众斗殴', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060130', '寻衅滋事', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060135', '传授犯罪方法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060131', '组织、领导黑社会性质组织', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060132', '参加黑社会性质组织', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060133', '入境发展黑社会组织', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060134', '包庇、纵容黑社会性质组织', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060136', '非法集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060137', '非法携带武器参加集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060138', '非法携带管制刀具参加集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060139', '非法携带爆炸物参加集会、游行、示威', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060140', '破坏集会、示威、游行', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060141', '侮辱国旗、国徽', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060142', '组织、利用会道门、邪教组织、利用迷信破坏法律实施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060143', '组织、利用会道门、邪教组织、利用迷信致人死亡', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060144', '组织、利用会道门、邪教组织、利用迷信奸淫妇女', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060145', '组织、利用会道门、邪教组织、利用迷信诈骗钱财', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060146', '聚众淫乱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060147', '引诱未成年人聚众淫乱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060150', '开设赌场', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060148', '盗窃、侮辱尸体', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060149', '赌博', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060151', '故意延误投递邮件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060200', '妨害司法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060201', '伪证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060205', '诉讼代理人毁灭证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060209', '帮助毁灭伪造证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060208', '妨害作证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060210', '打击报复证人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060211', '扰乱法庭秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060212', '窝藏', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060214', '拒绝提供间谍犯罪证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060215', '掩饰犯罪所得', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060219', '拒不执行判决', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060221', '非法处置查封财产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060224', '破坏监管秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060225', '脱逃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300303', '协助骗取旅行证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300304', '台湾居民未按规定办理暂住登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030414', '转让金融机构经营许可证、批准文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030415', '高利转贷', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030419', '非法吸收公众存款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030432', '擅自发行股票、公司、企业债券', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030433', '内幕交易、泄露内幕信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030435', '编造并传播证券、期货交易虚假信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030436', '诱骗投资者买卖证券、期货合约', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030437', '操纵证券、期贷市场', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030408', '保险公司人员虚假理赔', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030407', '金融工作人员受贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030440', '违法发放贷款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030441', '吸收客户资金不入帐', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030434', '利用未公开信息交易', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030442', '违规出具金融票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240123', '未按规定备案娱乐场所营业执照', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240124', '未按规定建立娱乐场所从业人员名簿、营业日志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240125', '娱乐场所内发现违法犯罪行为不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240126', '未按规定悬挂娱乐场所警示标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240127', '娱乐场所赌博', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240100', '娱乐场所管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240200', '娱乐场所治安管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240201', '拒不补齐娱乐场所备案项目', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240202', '未按规定进行娱乐场所备案变更', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300305', '台湾居民非法居留', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300400', '中国公民因私事往来香港地区或者澳门地区的暂行管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300401', '持用无效往来港澳证件出境、入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300402', '冒用他人往来港澳证件出境、入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300403', '伪造、涂改、转让往来港澳证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240203', '要求娱乐场所保安人员从事非职务活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240204', '未按规定通报娱乐场所保安人员工作情况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240205', '未按规定建立、使用娱乐场所治安管理信息系统', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240300', '营业性演出管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240301', '发现有非法内容的营业性演出不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240302', '超过核准数量印制、出售营业性演出门票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240303', '印制、出售营业性演出观众区域以外的门票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240304', '未制止有非法内容的营业性演出', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230300', '印刷业管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230301', '印刷非法印刷品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230302', '印刷经营中发现违法犯罪行为未报告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230303', '单位内部设立印刷厂〔所〕未备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230304', '擅自印刷特种印刷品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230305', '再委托他人印刷特种印刷品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230306', '擅自承印特种印刷品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230307', '印刷业经营者伪造、变造国家机关、企业、事业单位、人民团体公文、证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230308', '擅自委托印刷特种印刷品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230309', '委托非指定印刷企业印刷特种印刷品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230310', '擅自设立印刷企业或者擅自从事印刷经营活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230100', '旅馆业治安管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230101', '旅馆变更登记未备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230102', '旅馆未如实登记住宿人员信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230104', '服务台、安全保卫、监控室未全天24小时值班', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390400', '租赁房屋治安管理规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390401', '不履行出租房屋治安责任', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390402', '转租、转借承租房屋未按规定报告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390403', '利用出租房屋非法生产、储存、经营危险物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230200', '废旧金属收购业治安管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230201', '非法设点收购废旧金属', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230202', '收购生产性废旧金属未如实登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230203', '收购国家禁止收购的金属物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230500', '报废汽车回收管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230501', '买卖、伪造、变造报废汽车回收证明', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230502', '非法赠与、转让报废汽车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230503', '自行拆解报废汽车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230504', '擅自拆解、改装、拼装、倒卖有犯罪嫌疑的汽车、零配件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230600', '机动车修理业、报废机动车回收业治安管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391510', '未对收购的旧货进行查验', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300404', '非法获取往来港澳证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300500', '中国公民出国旅游管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300501', '因滞留不归被遣返回国', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300600', '国际航班载运人员信息预报实施办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300601', '未准确预报国际航班载运人员信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300602', '延迟预报国际航班载运人员信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300700', '中华人民共和国边境管理区通行证管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300701', '持用伪造、涂改、过期、失效的边境管理区通行证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300702', '冒用他人边境管理区通行证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300703', '伪造、涂改、盗窃、贩卖边境管理区通行证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300800', '因私出入境中介活动管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300801', '擅自开展因私出入境中介活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300802', '跨区域开展因私出入境中介活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300803', '违规设立因私出入境中介分支机构', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300804', '承包、转包因私出入境中介活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300805', '委托无资质单位、个人代理因私出入境中介活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300806', '中介机构协助骗取出入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300900', '沿海船舶边防治安管理规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300901', '未携带有效证件出海', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300902', '骗领对台劳务人员登轮作业证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300903', '未按规定办理出海证件变更、注销手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300904', '涂改、转让对台劳务人员登轮作业证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300905', '未按规定办理船舶进出港边防签证手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300906', '未在指定停泊点登、离台湾渔船', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300907', '擅自容留非出海人员作业、住宿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300908', '大陆劳务人员携带违禁物品、国家机密资料', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300909', '擅自启用电台', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300910', '未申领有效证件擅自出海', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300911', '台湾渔船播放非法广播', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300912', '涂改、伪造、冒用、转借出海证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300913', '台湾渔船悬挂、显示非法标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300914', '拒不编刷船名、船号', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300915', '擅自拆换、遮盖、涂改船名、船号', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300916', '台湾渔船从事有损两岸关系其他活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300917', '悬挂活动船牌号', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300918', '擅自引带大陆居民登船', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300919', '台湾居民擅自上岸', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251299', '其他违反烟花爆竹管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210602', '非正常死亡', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '339900', '其它信息网络安全行政案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390499', '其他违反《租赁房屋治安管理规定》行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040205', '出售、非法提供公民个人信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080006', '行贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100019', '武器装备肇事', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100007', '阻碍执行军事职务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090022', '传染病防治失职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100021', '盗窃、抢夺武器装备、军用物资', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060623', '非法出售国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020807', '强令违章冒险作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021102', '抢夺弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100029', '战时残害居民、掠夺居民财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100028', '战时拒不救治伤病军人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080012', '私分国有资产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100031', '虐待俘虏', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090020', '环境监管失职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100017', '战时自伤', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060609', '非法运输珍贵、濒危野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060223', '非法处置冻结财产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100008', '指使部属违反职责', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030417', '骗取票据承兑', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080011', '隐瞒境外存款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060631', '非法运输盗伐、滥伐的林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090031', '办理偷越国〔边〕境人员出入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080009', '单位行贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100022', '非法出卖、转让武器装备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090033', '不解救被拐卖、绑架妇女、儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021006', '抢劫枪支、弹药、爆炸物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060508', '非法供应血液', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100013', '为境外窃取、刺探、收买、非法提供军事秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100016', '战时造谣惑众', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060203', '辩护人伪造证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030299', '走私其他货物、物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070004', '过失损坏武器装备、军事设施、军事通信', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100009', '违令作战消极', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100003', '拒传、假传军令', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090024', '非法低价出让国有土地使用权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030429', '变造股票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030809', '伪造有价票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020902', '盗窃弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090037', '失职造成珍贵文物损毁、流失', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090005', '徇私枉法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080005', '利用影响力受贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060619', '非法毁坏国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080003', '受贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100030', '私放俘虏', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080004', '单位受贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080007', '对单位行贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090006', '民事、行政枉法裁判', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060127', '投放虚假危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060519', '妨害动植物检疫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030406', '金融工作人员以假币换取货币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020502', '非法买卖危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090002', '玩忽职守', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060304', '提供变造的出入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020501', '非法制造危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100027', '遗弃伤病军人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090023', '非法批准征用、占用土地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090032', '放行偷越国〔边〕境人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060226', '劫夺被押解人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060227', '组织越狱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060228', '暴动越狱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060229', '聚众持械劫狱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060300', '妨害国〔边〕境管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060307', '偷越国〔边〕境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060301', '组织他人偷越国〔边〕境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060306', '运送他人偷越国〔边〕境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060302', '骗取出境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060303', '提供伪造的出入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060305', '出售出入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060308', '破坏界碑', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060310', '破坏永久性测量标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060400', '妨害文物管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060401', '故意损毁文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060403', '过失损毁文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060404', '非法向外国人出售珍贵文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060405', '非法向外国人赠送珍贵文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060406', '倒卖文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060407', '非法出售文物藏品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060408', '非法私赠文物藏品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060402', '故意损毁名胜古迹', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060409', '盗掘古文化遗址', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060410', '盗掘古墓葬', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060411', '盗掘古人类化石', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060413', '抢夺国有档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060414', '窃取国有档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060415', '擅自出卖国有档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060416', '擅自转让国有档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060500', '危害公共卫生', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060501', '妨害传染病防治', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060502', '传染病菌种扩散', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060504', '妨害国境卫生检疫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060505', '非法组织卖血', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060506', '强迫卖血', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060507', '非法采集血液', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060509', '非法制作血液制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060511', '采集血液事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060513', '制作血液制品事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060515', '医疗事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060516', '非法行医', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060517', '非法进行节育手术', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060518', '妨害动植物防疫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060600', '破坏环境资源保护', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060602', '重大环境污染事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060603', '非法处置进口固体废物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060604', '擅自进口固体废物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060601', '污染环境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060606', '非法猎捕珍贵、濒危野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060608', '非法收购珍贵、濒危野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060612', '非法运输珍贵、濒危野生动物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090008', '执行判决、裁定滥用职权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100015', '过失泄露军事秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090014', '滥用管理公司、证券职权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060216', '隐瞒犯罪所得', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090029', '动植物检疫失职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020901', '盗窃枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021101', '抢夺枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060624', '非法收购国家重点保护植物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060206', '诉讼代理人伪造证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020899', '其它重大责任事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100004', '投降', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020604', '企业违规销售枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090018', '国家机关工作人员签订、履行合同失职被骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090015', '徇私舞弊不征、少征税款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100006', '擅离、玩忽军事职守', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100018', '逃离部队', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060213', '包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050199', '其他抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030443', '对违法票据承兑、付款、保证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030438', '背信运用受托财产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030439', '违法运用资金', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030444', '逃汇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030445', '套汇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030446', '洗钱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030448', '非法买卖外汇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030447', '骗购外汇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030500', '金融诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030501', '集资诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030502', '贷款诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030503', '票据诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030504', '金融凭证诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030505', '信用证诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030506', '信用卡诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030507', '有价证券诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030508', '保险诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030600', '危害税收征管', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030601', '逃税', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030602', '抗税', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030603', '逃避追缴欠税', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030604', '骗取出口退税', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030619', '骗取国家出口免征税款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030605', '虚开增值税专用发票、用于骗取出口退税、抵扣税款发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030607', '伪造增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030608', '出售伪造的增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030606', '虚开发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030609', '非法出售增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030610', '非法购买增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030611', '购买伪造的增值税专用发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030612', '非法制造用于骗取出口退税、抵扣税款发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030613', '出售非法制造的用于骗取出口退税、抵扣税款发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030614', '非法制造发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030615', '出售非法制造的发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030616', '非法出售用于骗取出口退税、抵扣税款发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030617', '非法出售发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060613', '非法出售珍贵、濒危野生动物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060618', '非法采伐国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060628', '盗伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060629', '滥伐林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060630', '非法收购盗伐、滥伐的林木', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060605', '非法捕捞水产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060614', '非法狩猎', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060615', '非法占用农用地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060616', '非法采矿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060617', '破坏性采矿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060700', '走私、贩卖、运输、制造毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060701', '走私毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060702', '贩卖毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060703', '运输毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060704', '制造毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060705', '非法持有毒品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060706', '包庇毒品犯罪分子', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300920', '私自载运非出海人员出海', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300921', '擅自引航境外船舶进入未开放港口、锚地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300922', '涂改、转让台湾居民登陆证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300923', '擅自搭靠境外船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300924', '登陆人员未按规定返回、活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300925', '被迫搭靠境外船舶不及时报告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300926', '传播、散发非法物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300927', '擅自在非指定港口停泊、上下人员、装卸货物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300928', '台湾居民携带违禁物品上岸', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300929', '体罚、殴打台湾渔船大陆劳务人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300930', '携带、隐匿、留用、擅自处理违禁物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300931', '非法拦截、强行靠登、冲撞他人船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300932', '扰乱台湾渔船停泊点管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300933', '未按规定办理台湾渔船进出港手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300934', '非法扣押他人船舶、船上物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300935', '台湾渔船擅自搭靠其他船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300936', '"三无"船舶擅自出海作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300937', '擅自雇用大陆居民登船作业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300938', '擅自将大陆劳务人员带至境外登陆', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300939', '台湾渔船未经检查擅自离港', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300940', '台湾渔船无故滞留', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300941', '台湾渔船未在指定地点停泊', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330100', '中华人民共和国计算机信息系统安全保护条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330101', '违反计算机信息系统安全等级保护制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030699', '其他危害税收征管', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030618', '持有伪造的发票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030700', '侵犯知识产权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030701', '假冒注册商标', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030702', '销售假冒注册商标的商品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030703', '非法制造注册商标标识', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030704', '销售非法制造的注册商标标识', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030705', '假冒专利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030706', '侵犯著作权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030707', '销售侵权复制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030708', '侵犯商业秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030800', '扰乱市场秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030801', '损害商业信誉', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030802', '损害商品声誉', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030803', '虚假广告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030804', '串通投标', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030805', '合同诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030807', '非法经营', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030808', '强迫交易', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030806', '组织、领导传销活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030811', '倒卖车票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230601', '承修机动车不如实登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230602', '回收报废机动车不如实登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230603', '承修非法改装机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230604', '承修交通肇事逃逸车辆不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230605', '回收无报废证明的机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230606', '更改机动车发动机号码、车架号码', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230607', '非法拼〔组〕装汽车、摩托车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230400', '典当管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230401', '收当禁当财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230402', '未按规定记录、统计、报送典当信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230403', '典当行业发现禁当财物不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391100', '再生资源回收管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391101', '未按规定进行再生资源回收从业备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391102', '未按规定保存回收生产性废旧金属登记资料', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391103', '再生资源回收经营中发现赃物、有赃物嫌疑物品不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390700', '企业事业单位内部治安保卫条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390701', '不落实单位内部治安保卫措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391200', '保安服务管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391201', '未经审核变更保安服务公司法人代表', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391202', '未按规定进行自招保安员备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391203', '未按规定撤销自招保安员备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391204', '超范围开展保安服务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330102', '违反计算机信息系统国际联网备案制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330103', '计算机信息系统发生案件不报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330104', '拒不改进计算机信息系统安全状况', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330105', '故意输入计算机病毒、有害数据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330106', '未经许可出售计算机信息系统安全专用产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330200', '中华人民共和国计算机信息网络国际联网管理暂行规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330201', '擅自建立、使用非法定信道进行国际联网', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330202', '接入网络未通过互联网络接入国际联网', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330203', '未经许可从事国际联网经营业务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330204', '未经批准擅自进行国际联网', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330205', '未通过接入网络进行国际联网', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330206', '未经接入单位同意接入接入网络', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330207', '未办理登记手续接入接入网络', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330208', '违规经营国际互联网络业务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330300', '互联网上网服务营业场所管理条例', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060707', '窝藏、转移、隐瞒毒品、毒赃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060708', '走私制毒物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060709', '非法买卖制毒物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060710', '非法种植毒品原植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060711', '非法买卖毒品原植物种子、幼苗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060712', '非法运输毒品原植物种子、幼苗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060713', '非法携带毒品原植物种子、幼苗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060714', '非法持有毒品原植物种子、幼苗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060715', '引诱他人吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060716', '教唆他人吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060717', '欺骗他人吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060718', '强迫他人吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060719', '容留他人吸毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060720', '非法提供麻醉药品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060721', '非法提供精神药品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060800', '组织、强迫、引诱、容留、介绍卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060801', '组织卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060802', '强迫卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060803', '协助组织卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060804', '引诱卖淫案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060807', '引诱幼女卖淫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060805', '容留卖淫案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060806', '介绍卖淫案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060808', '传播性病', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391205', '违反规定条件招用保安员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391206', '未按规定核查保安服务合法性', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391207', '未报告违法保安服务要求', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391208', '未按规定签订、留存保安服务合同', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391209', '未按规定留存保安服务监控影像资料、报警记录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391210', '保安从业单位泄露保密信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391211', '保安从业单位使用监控设备侵犯他人合法权益', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391212', '保安从业单位删改、扩散保安服务监控影像资料、报警记录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391213', '保安从业单位指使、纵容保安员实施违法犯罪行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391214', '保安从业单位疏于管理导致发生保安员违法犯罪案件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391215', '保安员扣押、没收他人证件、财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391216', '保安员参与追索债务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391217', '保安员采用暴力、以暴力相威胁处置纠纷', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391218', '保安员删改、扩散保安服务监控影像资料、报警记录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391219', '保安员泄露保密信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391220', '未按规定进行保安员培训', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391300', '保安培训机构管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391301', '非法获取保安培训许可证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391302', '未按规定办理保安培训机构变更手续', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391303', '未按规定时间安排保安学员实习', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391304', '非法提供保安服务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100011', '军人叛逃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021001', '抢劫枪支', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090007', '执行判决、裁定失职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021004', '抢劫危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021002', '抢劫弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060207', '诉讼代理人妨害作证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060610', '非法出售珍贵、濒危野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090012', '徇私舞弊减刑、假释、暂予监外执行', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100001', '战时违抗命令', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060119', '非法获取计算机信息系统数据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060109', '变造居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030413', '变造金融机构经营许可证、批准文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040206', '非法获取公民个人信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060512', '供应血液事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020603', '企业违规制造枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060621', '非法运输国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030425', '非法提供信用卡信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090025', '放纵走私', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030310', '故意销毁会计凭证、会计帐簿、财务会计报告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100023', '遗弃武器装备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100026', '虐待部属', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060627', '非法出售国家重点保护植物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060217', '掩饰犯罪所得收益', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090030', '放纵制售伪劣商品犯罪行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060809', '嫖宿幼女', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060900', '制作、复制、出版、贩卖、传播淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060901', '制作淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060902', '复制淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060903', '出版淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060904', '贩卖淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060905', '传播淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060906', '为他人提供书号出版淫秽书刊', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060907', '组织播放淫秽音像制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060908', '组织淫秽表演', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070000', '危害国防利益', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070001', '阻碍军人执行职务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070002', '阻碍军事行动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070003', '破坏武器装备、军事设施、军事通信', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070005', '故意提供不合格武器装备、军事设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070006', '过失提供不合格武器装备、军事设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070007', '聚众冲击军事禁区', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070008', '聚众扰乱军事管理区秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070009', '冒充军人招摇撞骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070010', '煽动军人逃离部队', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070011', '雇佣逃离部队军人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070012', '接送不合格兵员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070013', '伪造、变造、买卖武装部队公文、证件、印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070014', '盗窃、抢夺武装部队公文、证件、印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070015', '非法生产、买卖武装部队制示服装', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070017', '战时拒绝、逃避征召、军事训练', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070018', '战时拒绝、逃避服役', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070019', '战时故意提供虚假敌情', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070020', '战时造谣扰乱军心', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070021', '战时窝藏逃离部队军人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070022', '战时拒绝、故意延误军事订货', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070023', '战时拒绝军事征用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330301', '利用上网服务营业场所制作、下载、复制、查阅、发布、传播、使用违法信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330302', '向上网消费者提供直接接入互联网的计算机', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330303', '未建立互联网上网服务营业场所巡查制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330304', '不制止、不举报上网消费者违法行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330305', '未按规定核对、登记上网消费者有效身份证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330306', '未按规定记录上网信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330307', '未按规定保存上网消费者登记内容、记录备份', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330308', '擅自修改、删除上网消费者登记内容、记录备份', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330309', '上网服务经营单位未依法办理变更登记注册事项、终止经营手续、备案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330310', '上网服务营业场所内利用明火照明', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030199', '生产、销售其他伪劣商品、产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060309', '破坏界桩', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030418', '骗取金融票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030899', '其他扰乱市场秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030399', '其他妨害对公司、企业管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100010', '拒不救援友邻部队', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100025', '擅自出卖、转让军队房地产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060202', '辩护人毁灭证据', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020601', '违规制造枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050109', '抢劫汽车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060412', '盗掘古脊椎动物化石', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030499', '其他破坏金融管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100002', '隐瞒、谎报军情', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021100', '抢夺枪支、弹药、爆炸物、危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090004', '过失泄露国家秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060503', '传染病毒种扩散', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060622', '非法加工国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030421', '变造金融票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090013', '徇私舞弊不移交刑事件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090028', '动植物检疫徇私舞弊', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060626', '非法加工国家重点保护植物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020806', '大型群众性活动重大安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020811', '不报、谎报安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060625', '非法运输国家重点保护植物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100005', '战时临阵脱逃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020303', '参加恐怖组织', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090016', '徇私舞弊发售发票、抵扣税款、出口退税', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030810', '倒卖伪造的有价票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '021104', '抢夺危险物质', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090027', '商检失职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060607', '非法杀害珍贵、濒危野生动物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090026', '商检徇私舞弊', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060204', '辩护人妨害作证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100012', '非法获取军事秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030315', '对国际公共组织官员行贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090001', '滥用职权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040408', '组织未成年人进行违法治安管理活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030799', '其他侵犯知识产权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090036', '招收公务员、学生徇私舞弊', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100020', '擅自改变武器装备编配用途', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030307', '违规不披露重要信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050110', '抢劫摩托车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060220', '拒不执行裁定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090009', '枉法仲裁', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060105', '抢夺国家机关公文、证件、印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030424', '收买信用卡信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090017', '违法提供出口退税凭证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020602', '违规销售枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080008', '介绍贿赂', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '059900', '其它侵犯财产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '020609', '非法出售枪支、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '070016', '伪造、盗窃、买卖、非法提供、非法使用武装部队专用标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060218', '隐瞒犯罪所得收益', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100014', '故意泄露军事秘密', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090035', '帮助犯罪分子逃避处罚', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030812', '倒卖船票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030813', '非法转让土地使用权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030814', '非法倒卖土地使用权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030815', '提供虚假证明文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330311', '上网服务营业场所内不制止吸烟行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330312', '上网服务营业场所未悬挂禁烟标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330313', '上网服务营业场所允许带入、存放易燃易爆物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330314', '上网服务营业场所安装固定封闭门窗栅栏', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330315', '上网服务营业场所营业期间封堵、锁闭门窗、安全疏散通道、安全出口', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330316', '上网服务营业场所擅自停止实施安全技术措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330400', '计算机信息网络国际联网安全保护管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330401', '利用国际联网制作、复制、查阅、传播违法信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330402', '擅自进入计算机信息网络', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330403', '擅自使用计算机信息网络资源', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330404', '擅自改变计算机信息网络功能', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330405', '擅自改变计算机信息网络数据、应用程序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330406', '故意制作、传播计算机破坏性程序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330407', '未建立国际联网安全保护管理制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330408', '未采取国际联网安全技术保护措施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330409', '未对网络用户进行安全教育、培训', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330410', '未按规定提供安全保护管理相关信息、资料、数据文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330411', '未依法审核网络发布信息内容', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330412', '未依法登记网络信息委托发布单位和个人信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330413', '未建立电子公告系统的用户登记、信息管理制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330414', '未按规定删除网络地址、目录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330415', '未按规定关闭网络服务器', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330416', '未建立公用账号使用登记制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330417', '违法转借、转让用户账号', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330418', '不履行国际联网备案职责', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330500', '计算机病毒防治管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330501', '制作、传播计算机病毒', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330502', '发布虚假计算机病毒疫情', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330503', '未按规定提交计算机病毒样本', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050301', '电信诈骗案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030816', '出具证明文件重大失实', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030817', '逃避商检', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '039900', '其他破坏社会主义市场经济秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040000', '侵犯公民人身权利、民主权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040100', '侵犯公民人身权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040101', '故意杀人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040102', '过失致人死亡', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040103', '故意伤害', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040105', '过失致人重伤', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040106', '强奸', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040107', '强制猥亵、侮辱妇女', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040108', '猥亵儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040109', '非法拘禁', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040110', '绑架', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040111', '拐卖妇女、儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040112', '收买被拐卖的妇女、儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040113', '聚众阻碍解救被收买的妇女、儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090034', '阻碍解救被拐卖、绑架妇女、儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040117', '非法搜查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040118', '非法侵入住宅', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040114', '诬告陷害', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040119', '侮辱', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040120', '诽谤', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040121', '刑讯逼供', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040122', '暴力取证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040123', '虐待被监管人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040104', '组织出卖人体器官', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040115', '强迫劳动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040200', '侵犯民主权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040201', '侵犯通信自由', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040202', '私自开拆邮件、电报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040203', '隐匿邮件、电报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040204', '毁弃邮件、电报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040207', '报复陷害', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040208', '打击报复会计人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040209', '打击报复统计人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040210', '破坏选举', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040300', '破坏民族平等、宗教信仰', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040301', '煽动民族仇恨、民族歧视', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040302', '出版歧视、侮辱少数民族作品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040303', '非法剥夺公民宗教信仰自由', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040304', '侵犯少数民族风俗习惯', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040400', '妨害婚姻家庭权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040401', '暴力干涉婚姻自由', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040402', '重婚', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040403', '破坏军婚', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040404', '虐待', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040405', '遗弃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040406', '拐骗儿童', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '049900', '其它侵犯公民人身权利、民主权利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050000', '侵犯财产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050100', '抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050101', '入室抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050102', '拦路抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050103', '公共交通工具上抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050104', '抢劫银行或其它金融机构', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050105', '抢劫珠宝店', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050106', '抢劫提、送款人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050107', '抢劫运钞车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050108', '抢劫出租汽车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050111', '抢劫军用物资', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050112', '抢劫抢险、救灾、救济物资', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050113', '抢劫牲畜', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050114', '抢劫精神药物、麻醉药品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391305', '未按规定签订保安培训合同', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391306', '未按规定备案保安培训合同式样', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391307', '发布虚假招生广告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391308', '非法传授侦察技术手段', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391309', '未按规定内容、计划进行保安培训', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391310', '未按规定颁发保安培训结业证书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391311', '未按规定建立保安学员档案管理制度', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391312', '未按规定保存保安学员文书档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391313', '未按规定备案保安学员、师资人员档案', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391314', '违规收取保安培训费用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391315', '转包、违规委托保安培训业务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390800', '金融机构营业场所和金库安全防范设施建设许可实施办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390801', '安全防范设施建设方案未经许可施工', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390802', '安全防范设施建设工程未经验收投入使用', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391400', '安全技术防范产品管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391401', '未经许可生产实行生产登记制度的安全技术防范产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390500', '中华人民共和国安全生产法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390501', '发生重大生产安全事故逃匿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390502', '隐瞒、谎报、拖延不报生产安全事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390100', '中华人民共和国收养法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390101', '出卖亲生子女', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300100', '中华人民共和国护照法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300101', '骗取护照、出入境通行证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300102', '提供伪造、变造的护照、出入境通行证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300103', '出售护照、出入境通行证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300104', '持用伪造、变造护照、出入境通行证出境、入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300000', '违反出入境管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030431', '变造公司、企业债券', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '100024', '遗失武器装备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060128', '编造、故意传播虚假恐怖信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080010', '巨额财产来源不明', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060222', '非法处置扣押财产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060611', '非法收购珍贵、濒危野生动物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060510', '非法供应血液制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090011', '失职致使在押人员脱逃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090010', '私放在押人员', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040116', '雇佣童工从事危重劳动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060514', '供应血液制品事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '040407', '组织残疾人、儿童乞讨', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '090019', '违法发放林木采伐许可证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080013', '私分罚没财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060620', '非法收购国家重点保护植物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050116', '冒充军警持枪抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050115', '持枪抢劫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050117', '抢劫文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050200', '盗窃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050202', '入室盗窃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050222', '盗窃精神药物、麻醉药品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050221', '盗窃易制毒化学品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050215', '盗窃金融机构', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050216', '盗窃运输物资', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050217', '盗窃铁路器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050218', '盗窃珍贵文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050219', '盗窃电脑芯片', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050203', '盗窃货物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050204', '盗窃旅财', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050205', '盗窃路财', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050206', '盗窃汽车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050207', '盗窃摩托车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050209', '盗窃电瓶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050208', '盗窃非机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050214', '盗窃保险柜', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050211', '盗用他人通讯设施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050212', '盗接通信线路', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050220', '盗窃牲畜', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050201', '扒窃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050213', '盗窃通信电缆', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050210', '盗窃车内财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050300', '诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050400', '抢夺', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050600', '侵占', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050700', '职务侵占', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050800', '挪用资金', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080002', '挪用公款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050900', '挪用特定款物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '051000', '敲诈勒索', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '051100', '故意毁坏财物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '051200', '破坏生产经营', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050500', '聚众哄抢', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '051300', '拒不支付劳动报酬', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060100', '扰乱公共秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060101', '妨害公务', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060102', '煽动暴力抗拒法律实施', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060103', '招摇撞骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060107', '伪造公司、企业、事业单位、人民团体印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '390200', '中华人民共和国国徽法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '240199', '其他违反娱乐场所管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230000', '违反特种行业管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210605', '自然灾害事故', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391504', '经营抵押中的物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210608', '纠纷', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210699', '其他事件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391512', '未对受他人委托寄卖的旧货进行查验', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391523', '旧货经营者发现可疑物品未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391528', '违反《旧货流通管理办法》第三十七条规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330399', '其它违反互联网上网服务管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210399', '其他侵犯他人人身权利、财产权利的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391527', '违反《旧货流通管理办法》第三十二条规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330199', '其它违反计算机信息系统安全保护条例的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391505', '经营有赃物嫌疑的物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '320000', '违反消防管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260199', '其他违反枪支管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210610', '迷路走失', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270000', '违反集会游行示威管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391514', '旧货经营者未对应当登记寄卖旧货的单位名称和个人的居民身份证进行登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '420100', '违反林业刑事法规', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330599', '其他违反计算机病毒防治管理行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210299', '其他妨害公共安全的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230499', '其他违反典当管理的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210499', '其他妨害社会管理的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391519', '旧货市场发现可疑物品未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '260000', '违反枪支管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391502', '经营走私物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391520', '旧货市场发现公安机关要求协查的物品未及时向当地公安机关报告隐瞒包庇', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230299', '其他违反废旧金属收购管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391402', '未经许可销售实行生产登记制度的安全技术防范产品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '330499', '其他违反计算机信息网络国际联网安全保护管理办法的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '251199', '其他违反民用爆炸物品管理规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '270199', '其他违反集会游行示威规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230699', '其他违反机动车维修管理、报废汽车规定的行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210606', '患有严重传染病', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300999', '其他违反沿海船舶边防治安管理行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '391515', '旧货经营者未对应当登记受他人委托出售旧货的单位名称和个人的居民身份证进行登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '329900', '其他违反消防管理办法行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '220000', '违反人口管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030201', '走私武器、弹药', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060000', '妨害社会管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060104', '伪造、贩卖、盗窃国家机关公文、证件、印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060106', '毁灭国家机关公文、证件、印章', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060108', '伪造居民身份证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060110', '非法生产警用装备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060111', '非法买卖警用装备', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060113', '非法持有国家绝密、机密文件、资料、物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060114', '非法生产、销售间谍专用器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060115', '非法使用窃听专用器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060116', '非法使用窃照专用器材', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060117', '非法侵入计算机信息系统', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060121', '破坏计算机信息系统', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '230103', '不如实登记、及时传送住宿人员信息和旅馆从业人员信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300200', '扰乱口岸限定区域管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300201', '未办理临时入境手续登录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300202', '未办理登轮证件上下外国船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300203', '交通运输工具擅自出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300204', '交通运输工具擅自入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300205', '交通运输工具擅自改变出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300206', '交通运输工具擅自改变入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300207', '交通运输工具未按规定申报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300208', '交通运输工具拒绝协助边防检查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300209', '交通运输工具违反规定上下人员、装卸货物或者物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300210', '交通运输工具载运不准出境入境人员出境、入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300211', '(中国或者外国船舶)未经批准擅自搭靠外国船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300212', '(中国船舶、航空器)未经规定路线、航线行驶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300213', '(出境入境的船舶、航空器)返回规定驶入对外开放口岸以外地区', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300300', '中国公民往来台湾地区管理办法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300301', '持用无效旅行证件出境、入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '300302', '伪造、涂改、转让、倒卖旅行证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '060120', '提供侵入、非法控制计算机信息系统程序、工具', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030599', '其他金融诈骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '050299', '其他盗窃', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '080001', '贪污', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030202', '走私核材料', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030204', '走私文物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030203', '走私假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030205', '走私贵重金属', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030211', '走私黄金', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030212', '走私白银', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030206', '走私珍贵动物、珍贵动物制品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030207', '走私国家禁止进出口的货物、物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030208', '走私淫秽物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030210', '走私普通货物、物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030209', '走私废物', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030300', '妨害对公司、企业管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030301', '虚报注册资本', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030302', '虚假出资', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030303', '抽逃出资', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030304', '欺诈发行股票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030305', '欺诈发行债券', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030306', '违规披露重要信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030308', '妨害清算', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030309', '隐匿会计凭证、会计帐簿、财务会计报告', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030311', '虚假破产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030312', '非国家工作人员受贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030313', '对非国家工作人员行贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030314', '对外国公职人员行贿', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030316', '非法经营同类营业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030317', '为亲友非法牟利', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030318', '签订、履行合同失职被骗', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030319', '国有公司、企业、事业单位人员失职', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030320', '国有公司、企业、事业单位人员滥用职权', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030321', '徇私舞弊低价折股、出售国有资产', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030322', '背信损害上市公司利益', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030400', '破坏金融管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030401', '伪造货币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030402', '出售假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030403', '购买假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030404', '运输假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030405', '金融工作人员购买假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030409', '持有、使用假币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030410', '变造货币', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030426', '伪造国家有价证券', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030427', '变造国家有价证劵', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030428', '伪造股票', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030430', '伪造公司、企业债券', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030420', '伪造金融票证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030412', '伪造金融机构经营许可证、批准文件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030422', '妨害信用卡管理', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030423', '窃取信用卡信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030416', '骗取贷款', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '030411', '擅自设立金融机构', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '210100', '扰乱公共秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310400', '中华人民共和国道路交通安全法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310401', '未取得机动车驾驶证驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310402', '机动车驾驶证被吊销期间驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310403', '机动车驾驶证被暂扣期间驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310404', '驾驶与驾驶证载明的准驾车型不相符合的车辆', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310405', '机动车违反交通管制规定强行通行，不听劝阻', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310406', '造成交通事故后逃逸，尚不构成犯罪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310407', '饮酒后驾驶营运机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310408', '因饮酒后驾驶机动车被处罚，再次饮酒后驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310409', '非机动车违反交通管制的规定强行通行，不听劝阻', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310410', '强迫驾驶人违反交通安全法律、法规和安全驾驶要求驾驶机动车，造成交通事故但尚不构成犯罪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310411', '伪造机动车登记证书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310412', '变造机动车登记证书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310413', '伪造机动车号牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310414', '变造机动车号牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310415', '伪造其它机动车行驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310416', '变造其它机动车行驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310417', '伪造机动车检验合格标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310418', '变造机动车检验合格标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310419', '伪造机动车保险标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310420', '变造机动车保险标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310421', '伪造机动车驾驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310422', '变造机动车驾驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310423', '使用伪造的机动车登记证书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310424', '使用变造的机动车登记证书', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310425', '使用伪造的机动车检验合格标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310426', '使用变造的机动车检验合格标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310427', '使用伪造的机动车保险标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310428', '使用变造的机动车保险标志', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310429', '使用伪造的机动车号牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310430', '使用变造的机动车号牌', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310431', '使用伪造的机动车行驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310432', '使用变造的机动车行驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310433', '使用伪造的机动车驾驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310434', '使用变造的机动车驾驶证', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310435', '故意损毁交通设施，造成危害后果，尚不构成犯罪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310436', '故意移动交通设施，造成危害后果，尚不构成犯罪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310437', '故意涂改交通设施，造成危害后果，尚不构成犯罪', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310438', '非法扣留机动车辆，不听劝阻，造成交通严重阻塞、较大财产损失', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310439', '公路客运车辆超员载客', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310440', '再次饮酒后驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310441', '无有效机动车驾驶证驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301000', '中华人民共和国出境入境管理法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301001', '持用伪造证件出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301002', '持用伪造证件入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301003', '持用变造证件出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301004', '持用变造证件入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301005', '持用骗取证件出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301006', '持用骗取证件入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301007', '冒用证件出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301008', '冒用证件入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301009', '逃避边防检查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301010', '以其他方式非法出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301011', '以其他方式非法入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301012', '协助非法出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301013', '协助非法入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301014', '骗取签证、停留拘留证件等出境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301015', '骗取签证、停留拘留证件等入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301016', '违反规定为外国人出具申请材料', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301017', '(中国公民)出境后非法前往其他国家或者地区被遣返', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301018', '拒不接受查验出境入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301019', '拒不交验居留证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301020', '未按规定办理出生登记', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301021', '未按规定办理死亡申报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301022', '未按规定办理居留证件登记事项变更', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301023', '外国人冒用他人出境入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301024', '违反外国人住宿登记规定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301025', '未按规定报送外国人住宿登记信息', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301026', '擅自进入限制区域', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301027', '拒不执行限期迁离决定', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301028', '非法居留', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301029', '未尽监护义务致使外国人非法居留', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301030', '容留、藏匿非法入境、非法拘留的外国人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301031', '协助非法入境、非法拘留的外国人逃避检查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301032', '为非法居留的外国人违法提供出境入境证件', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301033', '非法就业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301034', '介绍外国人非法就业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301035', '非法聘用外国人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301036', '从事与停留居留事由不相符的活动', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301037', '违反中国法律规定不适宜在中国境内继续停留居留', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301038', '违反中国法规规定不适宜在中国境内继续停留居留', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301039', '扰乱口岸限定区域管理秩序', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301040', '未办理临时入境手续登录', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301041', '未办理登轮证件上下外国船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301042', '交通运输工具擅自出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301043', '交通运输工具擅自入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301044', '交通运输工具擅自改变出境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301045', '交通运输工具擅自改变入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301046', '交通运输工具未按规定申报', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301047', '交通运输工具拒绝协助边防检查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301048', '交通运输工具违反规定上下人员、装卸货物或者物品', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301049', '交通运输工具载运不准出境入境人员出境、入境', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301050', '(中国或者外国船舶)未经批准擅自搭靠外国船舶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301051', '(中国船舶、航空器)未经规定路线、航线行驶', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '301052', '(出境入境的船舶、航空器)返回规定驶入对外开放口岸以外地区', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '310103', '未取得机动车驾驶证驾驶机动车', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '360000', '治安管理处罚', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '360100', '中华人民共和国治安管理处罚法', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'DXF_AJLB', '东曦方-案件类别', '360101', '殴打他人', '', '', '1', '');

commit;