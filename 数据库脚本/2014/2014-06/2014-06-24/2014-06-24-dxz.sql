-- Create sequence 
create sequence SEQ_ZA_NBDWJC_ID
minvalue 10000000000000000001
maxvalue 99999999999999999999
start with 10000000000000000001
increment by 1;


INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','001','重点单位','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','002','一般单位','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','003','党政机关','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','004','卫生系统','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','005','高校','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','006','中小学幼儿园','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','007','文化部门、企事业单位','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','008','大型商场超市、金银珠宝店','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','009','加油（气）站经抱企事业单位','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','010','银行金融机构（社区民警）','','','1','');
INSERT INTO t_common_dictionary VALUES(seq_common.nextval,'ZDY_NBDWLB','内保单位类别','011','银行金融机构（内保民警）','','','1','');

commit;