declare
  v_count   number;
begin
  select count(1) into v_count from t_common_dictionary where zdlb='GB_XZQH' and dm='431102';
  if v_count =0 then
     insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
     values (seq_common.nextval, 'GB_XZQH', '行政区划', '431102', '湖南省永州市零陵区', '431100', '零陵区', '1', null);
     commit;
  end if;
end;
/