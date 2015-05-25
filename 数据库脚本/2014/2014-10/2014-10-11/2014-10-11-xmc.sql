
update t_common_dictionary
set mc='技防单位',isyx='0'
where zdlb='ZDY_HYLB' and dm='09';


commit;

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_HYLB', '行业类别', '11', '商铺门店', '', '', '1', null);

commit;
