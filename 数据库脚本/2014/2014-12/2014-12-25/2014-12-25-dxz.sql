update t_common_dictionary set parent_dm = '1' where zdlb = 'ZDY_HYLB' and dm in ('02','04','07');
update t_common_dictionary set parent_dm = '4' where zdlb = 'ZDY_HYLB' and dm = '05';
commit;