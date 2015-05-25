INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'KHKP_JWQFL','警务区分类','9','无','','','1','');
COMMIT;

UPDATE t_common_dictionary SET mc = '单独用房' WHERE zdlb = 'ZDY_BGDDLX' AND dm = '1';
UPDATE t_common_dictionary SET mc = '合署办公' WHERE zdlb = 'ZDY_BGDDLX' AND dm = '2';
UPDATE t_common_dictionary SET mc = '无' WHERE zdlb = 'ZDY_BGDDLX' AND dm = '3';
commit;

UPDATE t_common_dictionary SET mc = '选择社区（村）居委会内（相邻）' WHERE zdlb = 'ZDY_BGDD' AND dm = '1';
UPDATE t_common_dictionary SET mc = '单独选址' WHERE zdlb = 'ZDY_BGDD' AND dm = '2';
UPDATE t_common_dictionary SET mc = '其他' WHERE zdlb = 'ZDY_BGDD' AND dm = '3';
commit;

DELETE t_common_dictionary WHERE  zdlb = 'ZDY_FHZB' AND dm = '1';
DELETE t_common_dictionary WHERE  zdlb = 'ZDY_FHZB' AND dm = '2';
DELETE t_common_dictionary WHERE  zdlb = 'ZDY_FHZB' AND dm = '7';
COMMIT;

INSERT INTO t_common_dictionary VALUES (seq_common.nextval,'ZDY_JTGJ','交通工具','9','其他','','','1','');
COMMIT;

-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add qtfhzb varchar2(100);
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.qtfhzb
  is '其他防护装备';
