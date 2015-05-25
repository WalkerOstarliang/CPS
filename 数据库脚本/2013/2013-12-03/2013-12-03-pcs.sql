-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add jls number;
alter table T_COMMON_ORGANIZATION_OTHER add szjxcjl number;
alter table T_COMMON_ORGANIZATION_OTHER add jjjl number;
alter table T_COMMON_ORGANIZATION_OTHER add jgjl number;
alter table T_COMMON_ORGANIZATION_OTHER add xjjl number;
alter table T_COMMON_ORGANIZATION_OTHER add tjjl number;
alter table T_COMMON_ORGANIZATION_OTHER add xjjxcjl number;
alter table T_COMMON_ORGANIZATION_OTHER add jdxldys number;
alter table T_COMMON_ORGANIZATION_OTHER add fjs number;
alter table T_COMMON_ORGANIZATION_OTHER add pcsfjs number;
alter table T_COMMON_ORGANIZATION_OTHER add jwspbfjs number;
alter table T_COMMON_ORGANIZATION_OTHER add jb varchar2(30);
alter table T_COMMON_ORGANIZATION_OTHER add lb varchar2(30);
alter table T_COMMON_ORGANIZATION_OTHER add dj varchar2(30);
alter table T_COMMON_ORGANIZATION_OTHER add szjb varchar2(30);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.jls
  is '警力数';
comment on column T_COMMON_ORGANIZATION_OTHER.szjxcjl
  is '市州局下沉警力';
comment on column T_COMMON_ORGANIZATION_OTHER.jjjl
  is '交警警力';
comment on column T_COMMON_ORGANIZATION_OTHER.jgjl
  is '监管警力';
comment on column T_COMMON_ORGANIZATION_OTHER.xjjl
  is '巡警警力';
comment on column T_COMMON_ORGANIZATION_OTHER.tjjl
  is '特警警力';
comment on column T_COMMON_ORGANIZATION_OTHER.xjjxcjl
  is '县级局下沉警力';
comment on column T_COMMON_ORGANIZATION_OTHER.jdxldys
  is '街道巡逻队员数';
comment on column T_COMMON_ORGANIZATION_OTHER.fjs
  is '辅警数';
comment on column T_COMMON_ORGANIZATION_OTHER.pcsfjs
  is '派出所辅警数';
comment on column T_COMMON_ORGANIZATION_OTHER.jwspbfjs
  is '警务室配备辅警数';
comment on column T_COMMON_ORGANIZATION_OTHER.jb
  is '级别';
comment on column T_COMMON_ORGANIZATION_OTHER.lb
  is '类别';
comment on column T_COMMON_ORGANIZATION_OTHER.dj
  is '等级';
comment on column T_COMMON_ORGANIZATION_OTHER.szjb
  is '所长级别';
