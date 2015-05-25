insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001621', '重点人员管理', 'SQJW1000001100', '', '1', 1, '', '', '_self');

commit;

update ptgl.td_sm_function
set parent_id='SQJW1000001621'
where function_id='SQJW1000001123';
commit;