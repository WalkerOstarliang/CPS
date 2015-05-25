-- Add/modify columns 
alter table T_GZGL_ERMXXY add czrxm varchar2(30);
alter table T_GZGL_ERMXXY add czrjh varchar2(20);
alter table T_GZGL_ERMXXY add czsj date;
alter table T_GZGL_ERMXXY add czdwdm varchar2(12);
alter table T_GZGL_ERMXXY add czdwmc varchar2(120);
alter table T_GZGL_ERMXXY add czrsfzh varchar2(20);
alter table T_GZGL_ERMXXY add jljz varchar2(500);
alter table T_GZGL_ERMXXY add fyqkjyjz varchar2(2000);
alter table T_GZGL_ERMXXY add bz varchar2(500);
alter table T_GZGL_ERMXXY add czbs varchar2(1);
alter table T_GZGL_ERMXXY add ssdwdm varchar2(12);
alter table T_GZGL_ERMXXY add ssdwmc varchar2(120);
-- Add comments to the columns 
comment on column T_GZGL_ERMXXY.ssdwdm
  is '所属单位代码';
comment on column T_GZGL_ERMXXY.ssdwmc
  is '所属单位名称';
comment on column T_GZGL_ERMXXY.bm
  is '别名';
comment on column T_GZGL_ERMXXY.qkqk
  is '前科情况（禁用）';
comment on column T_GZGL_ERMXXY.grjl
  is '个人简历（禁用）';
comment on column T_GZGL_ERMXXY.jtjsh
  is '家庭及社会关系（禁用）';
comment on column T_GZGL_ERMXXY.sxzzqk
  is '思想政治情况（禁用）';
comment on column T_GZGL_ERMXXY.glsymj
  is '管理使用民警（禁用）';
comment on column T_GZGL_ERMXXY.tzsyszyj
  is '停止使用意见';
comment on column T_GZGL_ERMXXY.xsbx
  is '现实表现（禁用）';
comment on column T_GZGL_ERMXXY.wjrxm
  is '物建人姓名';
comment on column T_GZGL_ERMXXY.wjsj
  is '物建时间';
comment on column T_GZGL_ERMXXY.wjryj
  is '物建人意见';
comment on column T_GZGL_ERMXXY.ldxm
  is '领导姓名（禁用）';
comment on column T_GZGL_ERMXXY.ldszdwdm
  is '领导所在单位代码（禁用）';
comment on column T_GZGL_ERMXXY.ldszdwmc
  is '领导所在单位名称（禁用）';
comment on column T_GZGL_ERMXXY.ldshsj
  is '领导审核时间（禁用）';
comment on column T_GZGL_ERMXXY.czrxm
  is '操作人姓名';
comment on column T_GZGL_ERMXXY.czrjh
  is '操作人警号';
comment on column T_GZGL_ERMXXY.czsj
  is '操作时间';
comment on column T_GZGL_ERMXXY.czdwdm
  is '操作单位代码';
comment on column T_GZGL_ERMXXY.czdwmc
  is '操作单位名称';
comment on column T_GZGL_ERMXXY.czrsfzh
  is '操作人身份证号';
  comment on column T_GZGL_ERMXXY.jljz
  is '奖励记载';
comment on column T_GZGL_ERMXXY.fyqkjyjz
  is '反映情况简要记载';
comment on column T_GZGL_ERMXXY.bz
  is '备注';
comment on column T_GZGL_ERMXXY.czbs
  is '操作标识';
  
  
  -- Add/modify columns 
alter table T_GZGL_ERMFKXX add djrsfzh varchar2(20);
-- Add comments to the columns 
comment on column T_GZGL_ERMFKXX.djrsfzh
  is '登记人身份证号';
