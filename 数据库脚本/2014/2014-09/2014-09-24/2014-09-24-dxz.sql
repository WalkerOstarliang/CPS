DELETE  t_common_dictionary WHERE zdlb = 'ZDY_FJLB' AND dm IN ('4','5','6');

UPDATE t_common_dictionary SET mc = '政法协辅警' WHERE zdlb = 'ZDY_FJLB' AND dm = '3';

COMMIT;


UPDATE t_common_dictionary SET parent_dm = '1' WHERE zdlb = 'ZDY_LKXGYGW' AND dm IN ('1','2','3') ;
COMMIT;


INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','巡防队员岗位','4','巡逻防控','2','','1','');
INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','巡防队员岗位','5','其他','2','','1','');

INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','协辅警岗位','6','巡逻防控','3','','1','');
INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','协辅警岗位','7','社区警务','3','','1','');
INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','协辅警岗位','8','刑侦','3','','1','');
INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','协辅警岗位','9','内勤','3','','1','');
INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_LKXGYGW','协辅警岗位','10','其他','3','','1','');

COMMIT;