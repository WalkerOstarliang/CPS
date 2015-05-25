-- Add/modify columns 
alter table T_COMMON_PCSJBQKTJB add parentcode VARCHAR2(12);
-- Add comments to the columns 
comment on column T_COMMON_PCSJBQKTJB.parentcode
  is '机构父类代码';

  
  
-- Add/modify columns 
alter table T_AF_XLDYXX add BWZW VARCHAR2(50);
alter table T_AF_XLDYXX add SFFTJZRY VARCHAR2(1);
alter table T_AF_XLDYXX add ZZHJZ VARCHAR2(1);
alter table T_AF_XLDYXX add DWDH VARCHAR2(20);
alter table T_AF_XLDYXX add ZZDH VARCHAR2(20);
alter table T_AF_XLDYXX add TC VARCHAR2(200);
alter table T_AF_XLDYXX add JLQK clob;
alter table T_AF_XLDYXX add GRJL clob;
alter table T_AF_XLDYXX add TJCY VARCHAR2(1000);
-- Add comments to the columns 
comment on column T_AF_XLDYXX.XLDYLXDH
  is '手机号码';
comment on column T_AF_XLDYXX.SGRQ
  is '参加保卫工作时间';
comment on column T_AF_XLDYXX.ZGZT
  is '在岗状态；1：在岗；2：离岗';
comment on column T_AF_XLDYXX.BWZW
  is '保卫职务';
comment on column T_AF_XLDYXX.SFFTJZRY
  is '是否复退军转人员';
comment on column T_AF_XLDYXX.ZZHJZ
  is '专职或兼职 1：专职 2：兼职';
comment on column T_AF_XLDYXX.DWDH
  is '单位电话';
comment on column T_AF_XLDYXX.ZZDH
  is '住宅电话';
comment on column T_AF_XLDYXX.TC
  is '特长';
comment on column T_AF_XLDYXX.JLQK
  is '奖励情况';
comment on column T_AF_XLDYXX.GRJL
  is '个人简历';
comment on column T_AF_XLDYXX.TJCY
  is '家庭成员';
  
 -- Add/modify columns 
alter table T_AF_XLDYXX add XZZW VARCHAR2(50);
-- Add comments to the columns 
comment on column T_AF_XLDYXX.XZZW
  is '行政职务';
 
 
 -- Add/modify columns 
alter table T_AF_XLDYXX rename column TJCY to JTCY;
 