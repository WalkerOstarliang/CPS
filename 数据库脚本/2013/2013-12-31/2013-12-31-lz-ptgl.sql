insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001123', '重点人员', 'SQJW1000001106', '', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001561', '实有人口', 'SQJW1000001560', '/lsgl/rk/toSyrkListPage.action', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001560', '人口管理', 'SQJW1000001106', '', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001562', '常住人口', 'SQJW1000001560', '/lsgl/rk/toSyrkListPage.action?queryBean.rylb=1', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001563', '流动人口', 'SQJW1000001560', '/lsgl/rk/toSyrkListPage.action?queryBean.rylb=2', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001565', '寄住人口', 'SQJW1000001560', '/lsgl/rk/toSyrkListPage.action?queryBean.rylb=5', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001566', '未落户常口', 'SQJW1000001560', '/lsgl/rk/toSyrkListPage.action?queryBean.rylb=3', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001567', '境外人口', 'SQJW1000001560', '/lsgl/rk/toSyrkListPage.action?queryBean.rylb=4', '1', 1, '', '', '_self');


commit;