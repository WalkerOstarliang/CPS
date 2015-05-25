update ptgl.td_sm_function
set name='人口管理'
where function_id='SQJW1000001123';


update ptgl.td_sm_function
set name='单位管理'
where function_id='SQJW1000001140';


update ptgl.td_sm_function
set name='房屋管理'
where function_id='SQJW1000001122';

commit;

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001380', '地址管理', 'SQJW1000001100', '', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001381', '实体管理', 'SQJW1000001380', '', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001382', '地址管理', 'SQJW1000001380', '', '1', 1, '', '', '_self');

commit;

update ptgl.td_sm_function
set parent_id='SQJW1000001106'
where function_id='SQJW1000001380';



delete 
from ptgl.td_sm_function
where function_id='SQJW1000001145';


delete 
from ptgl.td_sm_function
where function_id='SQJW1000001146';

commit;

-- Add/modify columns 
alter table T_COMMON_DZXX add STBM VARCHAR2(25);
-- Add comments to the columns 
comment on column T_COMMON_DZXX.STBM
  is '实体编码';

  
-- Add/modify columns 
alter table T_COMMON_STXX add DJDWDM VARCHAR2(12);
alter table T_COMMON_STXX add DJDWMC VARCHAR2(120);
alter table T_COMMON_STXX add DJRJH VARCHAR2(6);
alter table T_COMMON_STXX add DJRXM VARCHAR2(30);
alter table T_COMMON_STXX add DJSJ date default sysdate;
-- Add comments to the columns 
comment on column T_COMMON_STXX.DJDWDM
  is '登记单位代码';
comment on column T_COMMON_STXX.DJDWMC
  is '登记单位名称';
comment on column T_COMMON_STXX.DJRJH
  is '登记人警号';
comment on column T_COMMON_STXX.DJRXM
  is '登记人姓名';
comment on column T_COMMON_STXX.DJSJ
  is '登记时间';
  