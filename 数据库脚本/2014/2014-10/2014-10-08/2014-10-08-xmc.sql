-- Create table
create table T_YJCJ_WTXXB
(
  WTID    VARCHAR2(20),
  TITLE   VARCHAR2(50),
  CONTENT CLOB,
  DJRXM   VARCHAR2(30),
  DJRSFZH VARCHAR2(20),
  DJDWDM  VARCHAR2(12),
  DJDWMC  VARCHAR2(120),
  DJRLXFS VARCHAR2(20)
);
-- Add comments to the table 
comment on table T_YJCJ_WTXXB
  is ' 问题信息表';
-- Add comments to the columns 
comment on column T_YJCJ_WTXXB.WTID
  is '问题ID';
comment on column T_YJCJ_WTXXB.TITLE
  is '标题';
comment on column T_YJCJ_WTXXB.CONTENT
  is '内容';
comment on column T_YJCJ_WTXXB.DJRXM
  is '登记人姓名';
comment on column T_YJCJ_WTXXB.DJRSFZH
  is '登记人身份证号';
comment on column T_YJCJ_WTXXB.DJDWDM
  is '登记单位代码';
comment on column T_YJCJ_WTXXB.DJDWMC
  is '登记单位名称';
comment on column T_YJCJ_WTXXB.DJRLXFS
  is '登记人联系方式';

-- Add/modify columns 
alter table T_YJCJ_WTXXB add SFFK VARCHAR2(1) default 0;
-- Add comments to the columns 
comment on column T_YJCJ_WTXXB.SFFK
  is '是否反馈 0 否 1是';
-- Add/modify columns 
alter table T_YJCJ_WTXXB add DJSJ date default sysdate;
-- Add comments to the columns 
comment on column T_YJCJ_WTXXB.DJSJ
  is '登记时间';


-- Create table
create table T_YJCJ_WTFJB
(
  FJID   VARCHAR2(20),
  WTID   VARCHAR2(20),
  UPLOAD BLOB,
  TYPE   VARCHAR2(1),
  WTHDID VARCHAR2(20)
);
-- Add comments to the table 
comment on table T_YJCJ_WTFJB
  is '问题附件表';
-- Add comments to the columns 
comment on column T_YJCJ_WTFJB.FJID
  is '附件ID';
comment on column T_YJCJ_WTFJB.WTID
  is '问题ID';
comment on column T_YJCJ_WTFJB.UPLOAD
  is '附件';
comment on column T_YJCJ_WTFJB.TYPE
  is '附件类型 1:问题附件 2:回答附件';
comment on column T_YJCJ_WTFJB.WTHDID
  is '问题回答ID';
  
-- Create table
create table T_YJCJ_WTHDB
(
  WTHDID    VARCHAR2(20),
  WTID      VARCHAR2(20),
  HDCONTENT CLOB,
  DJRXM     VARCHAR2(30),
  DJRSFZH   VARCHAR2(20),
  DJDWDM    VARCHAR2(12),
  DJDWMC    VARCHAR2(120),
  DJRLXFS   VARCHAR2(20)
);
-- Add comments to the table 
comment on table T_YJCJ_WTHDB
  is '问题回答表';
-- Add comments to the columns 
comment on column T_YJCJ_WTHDB.WTHDID
  is '问题回答ID';
comment on column T_YJCJ_WTHDB.WTID
  is '问题ID';
comment on column T_YJCJ_WTHDB.HDCONTENT
  is '回答内容';
comment on column T_YJCJ_WTHDB.DJRXM
  is '登记人姓名';
comment on column T_YJCJ_WTHDB.DJRSFZH
  is '登记人身份证号';
comment on column T_YJCJ_WTHDB.DJDWDM
  is '登记单位代码';
comment on column T_YJCJ_WTHDB.DJDWMC
  is '登记单位名称';
comment on column T_YJCJ_WTHDB.DJRLXFS
  is '登记联系方式';
  
  
-- Add/modify columns 
alter table T_YJCJ_WTHDB add DJDJ date;
-- Add comments to the columns 
comment on column T_YJCJ_WTHDB.DJDJ
  is '登记时间';
  
-- Add/modify columns 
alter table T_YJCJ_WTFJB modify FJID VARCHAR2(50);
-- Add/modify columns 
alter table T_YJCJ_WTFJB modify WTID VARCHAR2(50);
alter table T_YJCJ_WTFJB modify WTHDID VARCHAR2(50);
-- Add/modify columns 
alter table T_YJCJ_WTXXB modify WTID VARCHAR2(50);
-- Add/modify columns 
alter table T_YJCJ_WTHDB modify WTHDID VARCHAR2(50);
alter table T_YJCJ_WTHDB modify WTID VARCHAR2(50);

 
 
create index t_yjcj_wtfjb_fjid on t_yjcj_wtfjb(fjid);
create index t_yjcj_wtfjb_wtid on t_yjcj_wtfjb(wtid);
create index t_yjcj_wtfjb_WTHDID on t_yjcj_wtfjb(WTHDID);

create index t_yjcj_wthdb_WTHDID on t_yjcj_wthdb(WTHDID);
create index t_yjcj_wthdb_WTID on t_yjcj_wthdb(WTID);
 
create index t_yjcj_wtxxb_WTID on t_yjcj_wtxxb(WTID);

-- Create/Recreate primary, unique and foreign key constraints 
alter table T_YJCJ_WTXXB
  add constraint T_YJCJ_WTXXB_PK primary key (WTID);

  -- Create/Recreate primary, unique and foreign key constraints 
alter table T_YJCJ_WTHDB
  add constraint T_YJCJ_WTHDB_PK primary key (WTHDID);
  
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_YJCJ_WTFJB
  add constraint T_YJCJ_WTFJB_PK primary key (FJID);
  
  
  -- Add/modify columns 
alter table T_YJCJ_WTXXB modify TITLE VARCHAR2(200);
  
  