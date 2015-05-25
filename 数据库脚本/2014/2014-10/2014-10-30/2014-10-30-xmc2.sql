-- Add/modify columns 
alter table T_FWQZ_JFTJDJXX add ZCRXM VARCHAR2(30);
alter table T_FWQZ_JFTJDJXX add ZCRDWJZW VARCHAR2(120);
alter table T_FWQZ_JFTJDJXX add DSRYXM VARCHAR2(30);
alter table T_FWQZ_JFTJDJXX add DSRYXB VARCHAR2(1);
alter table T_FWQZ_JFTJDJXX add DSRYNL number;
alter table T_FWQZ_JFTJDJXX add DSRYSFHM VARCHAR2(20);
alter table T_FWQZ_JFTJDJXX add DSRYGZDWJZY VARCHAR2(120);
alter table T_FWQZ_JFTJDJXX add DSRYJTZZ VARCHAR2(120);
alter table T_FWQZ_JFTJDJXX add DSREXM VARCHAR2(30);
alter table T_FWQZ_JFTJDJXX add DSREXB VARCHAR2(1);
alter table T_FWQZ_JFTJDJXX add DSRENL number;
alter table T_FWQZ_JFTJDJXX add DSRESFHM VARCHAR2(20);
alter table T_FWQZ_JFTJDJXX add DSREGZDWJZY VARCHAR2(120);
alter table T_FWQZ_JFTJDJXX add DSREJTZZ VARCHAR2(120);
alter table T_FWQZ_JFTJDJXX add TJJZRXM VARCHAR2(30);
alter table T_FWQZ_JFTJDJXX add TJJZRJTZZ VARCHAR2(120);
alter table T_FWQZ_JFTJDJXX add TJJZRLXFS VARCHAR2(20);
alter table T_FWQZ_JFTJDJXX add ZYSS clob;
-- Add comments to the columns 
comment on column T_FWQZ_JFTJDJXX.ZCRXM
  is '主持人';
comment on column T_FWQZ_JFTJDJXX.ZCRDWJZW
  is '主持人单位及职务';
comment on column T_FWQZ_JFTJDJXX.TJJZRXM
  is '调解见证人姓名';
comment on column T_FWQZ_JFTJDJXX.TJJZRJTZZ
  is '调解见证人家庭住址';
comment on column T_FWQZ_JFTJDJXX.TJJZRLXFS
  is '调解见证人联系方式';
comment on column T_FWQZ_JFTJDJXX.ZYSS
  is '主要事实';
-- Add comments to the columns 
comment on column T_FWQZ_JFTJDJXX.DSRYXM
  is '当事人1姓名';
comment on column T_FWQZ_JFTJDJXX.DSRYXB
  is '当事人1性别';
comment on column T_FWQZ_JFTJDJXX.DSRYNL
  is '当事人1年龄';
comment on column T_FWQZ_JFTJDJXX.DSRYSFHM
  is '当事人1身份证号';
comment on column T_FWQZ_JFTJDJXX.DSRYGZDWJZY
  is '当事人1工作单位及职务';
comment on column T_FWQZ_JFTJDJXX.DSRYJTZZ
  is '当事人1家庭住址';
comment on column T_FWQZ_JFTJDJXX.DSREXM
  is '当事人2姓名';
comment on column T_FWQZ_JFTJDJXX.DSREXB
  is '当事人2性别';
comment on column T_FWQZ_JFTJDJXX.DSRENL
  is '当事人2年龄';
comment on column T_FWQZ_JFTJDJXX.DSRESFHM
  is '当事人2身份证号';
comment on column T_FWQZ_JFTJDJXX.DSREGZDWJZY
  is '当事人2工作单位及职务';
comment on column T_FWQZ_JFTJDJXX.DSREJTZZ
  is '当事人2家庭住址';
  
-- Add/modify columns 
alter table T_FWQZ_JFTJDJXX add ZATJLX VARCHAR2(1);
-- Add comments to the columns 
comment on column T_FWQZ_JFTJDJXX.ZATJLX
  is '治安调解协议书 1:治安调解 2:现场治安调解';
  
  

alter table T_FWQZ_JFTJDJXX add DCXYNR clob;
comment on column T_FWQZ_JFTJDJXX.DCXYNR
  is '达成协议内容';
  
  
update T_FWQZ_JFTJDJXX
set DCXYNR=DCXY;
commit;

alter table T_FWQZ_JFTJDJXX drop DCXY;

-- Drop columns 
alter table T_FWQZ_JFTJDJXX drop column DCXY;

  