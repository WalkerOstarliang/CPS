insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001340', '系统管理', 'SQJW1000001100', '', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001341', '行政机构管理', 'SQJW1000001340', '', '1', 1, '', '', '_self');


update ptgl.td_sm_function
set parent_id='SQJW1000001341',name='警员信息管理'
where function_id='SQJW1000001262';


delete ptgl.td_sm_function
where function_id='SQJW1000001260';

update ptgl.td_sm_function
set parent_id='SQJW1000001341'
where function_id='SQJW1000001158';

commit;