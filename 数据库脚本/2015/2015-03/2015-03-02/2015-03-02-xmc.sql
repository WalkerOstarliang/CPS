-- Create table
create table T_YJCJ_XXFB
(
  XXID    VARCHAR2(50) not null,
  CONTENT CLOB,
  DJRXM   VARCHAR2(30),
  DJRSFZH VARCHAR2(20),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(120),
  DJSJ    DATE default sysdate
);
-- Add comments to the table 
comment on table T_YJCJ_XXFB
  is '信息发布';
-- Add comments to the columns 
comment on column T_YJCJ_XXFB.XXID
  is '消息ID';
comment on column T_YJCJ_XXFB.CONTENT
  is '消息内容';
comment on column T_YJCJ_XXFB.DJRXM
  is '发布人信么';
comment on column T_YJCJ_XXFB.DJRSFZH
  is '发布人身份证号';
comment on column T_YJCJ_XXFB.DJDWDM
  is '发布单位代码';
comment on column T_YJCJ_XXFB.DJDWMC
  is '发布单位名称';
comment on column T_YJCJ_XXFB.DJSJ
  is '发布时间';
  

-- Create table
create table T_YJCJ_XXFJ
(
  FJID           VARCHAR2(50) not null,
  XXID           VARCHAR2(50),
  UPLOAD         BLOB,
  UPLOADFILENAME VARCHAR2(100)
);
-- Add comments to the table 
comment on table T_YJCJ_XXFJ
  is '消息附件';
-- Add comments to the columns 
comment on column T_YJCJ_XXFJ.FJID
  is '附件ID';
comment on column T_YJCJ_XXFJ.XXID
  is '消息ID';
comment on column T_YJCJ_XXFJ.UPLOAD
  is '附件';
comment on column T_YJCJ_XXFJ.UPLOADFILENAME
  is '附件名称';


-- Add comments to the columns 
comment on column T_LSGL_RK_CZRK.SFJWTDJ
  is '数据来源标识 0：内网PC登记 1：警务通登记  3：外网平台登记';
  
  -- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.SFJWTDJ
  is '数据来源标识 0：内网PC登记 1：警务通登记  2：外网平台登记';
  
-- Add comments to the columns 
comment on column T_LSGL_RK_JZRKXX.SFJWTDJ
  is '数据来源标识 0：内网PC登记 1：警务通登记  2：外网平台登记';


-- Create/Recreate indexes 
create index T_YJCJ_XXFB_djsj on T_YJCJ_XXFB (djsj)
  tablespace TS_DT_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create index T_YJCJ_XXFB_xxid on T_YJCJ_XXFB (xxid)
  tablespace TS_IDX_SQJW
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


-- Add/modify columns 
alter table T_YJCJ_XXFB add TITLE VARCHAR2(100);
-- Add comments to the columns 
comment on column T_YJCJ_XXFB.TITLE
  is '消息标题';

