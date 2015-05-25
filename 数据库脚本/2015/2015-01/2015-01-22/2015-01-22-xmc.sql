update t_common_dictionary
set mc='省级重点'
where zdlb='ZAGL_ZDDJ' and dm='1';

update t_common_dictionary
set mc='市级重点'
where zdlb='ZAGL_ZDDJ' and dm='2';

update t_common_dictionary
set mc='县区重点'
where zdlb='ZAGL_ZDDJ' and dm='3';
commit;
