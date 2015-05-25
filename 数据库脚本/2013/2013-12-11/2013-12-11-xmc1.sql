insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001400', '治安管理', 'SQJW1000001100', '', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001401', '企事业单位', 'SQJW1000001408', '/zagl/dw/toDwcx.action?dwcx.hylb=03', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001402', '特种行业', 'SQJW1000001408', '/zagl/dw/toDwcx.action?dwcx.hylb=01', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001403', '公共场所', 'SQJW1000001408', '/zagl/dw/toDwcx.action?dwcx.hylb=02', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001404', '上网场所', 'SQJW1000001408', '/zagl/dw/toDwcx.action?dwcx.hylb=05', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001405', '从业人员', 'SQJW1000001408', '/zagl/dw/toCyryList.action', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001406', '大型活动', 'SQJW1000001408', '/dxhd/toDxhdList.action', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001407', '路面盘查', 'SQJW1000001409', '/afgl/lmpcxx/toLmpcList.action', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001408', '单位管理', 'SQJW1000001400', '', '1', 10, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001409', '盘查管理', 'SQJW1000001400', '', '1', 20, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001410', '安全防范', 'SQJW1000001100', '', '1', 1, '', '', '_self');

commit;

update ptgl.td_sm_function
set name='两室管理'
where function_id='SQJW1000001106';

delete ptgl.td_sm_function
where function_id in ('SQJW1000001321','SQJW1000001322');

update ptgl.td_sm_function
set parent_id='SQJW1000001410'
where function_id='SQJW1000001110';

update ptgl.td_sm_function
set parent_id='SQJW1000001410'
where function_id='SQJW1000001143';

update ptgl.td_sm_function
set parent_id='SQJW1000001410'
where function_id='SQJW1000001142';

update ptgl.td_sm_function
set parent_id='SQJW1000001410'
where function_id='SQJW1000001141';

commit;