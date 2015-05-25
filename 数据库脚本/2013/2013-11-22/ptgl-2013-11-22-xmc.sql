insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001260', '用户信息管理', 'SQJW1000001105', '', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001262', '警员信息', 'SQJW1000001260', '/gzgl/userlxsfgl/toUserLxfsList.action', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001263', '派出所管理', 'SQJW1000001260', '/gzgl/gzjwsgl/toJwsList.action', '1', 1, '', '', '_self');

insert into td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001280', '为民服务', 'SQJW1000001110', '/qzgl/bmfwgl/toBmfwList.action', '1', 1, '', '', '_self');



update td_sm_function 
set parent_id='SQJW1000001105'
where function_id='SQJW1000001141';


update td_sm_function 
set parent_id='SQJW1000001105'
where function_id='SQJW1000001142';


update td_sm_function 
set parent_id='SQJW1000001105'
where function_id='SQJW1000001143';