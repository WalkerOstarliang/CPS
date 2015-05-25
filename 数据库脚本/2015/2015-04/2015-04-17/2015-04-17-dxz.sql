declare
	v_count 	number;
begin
	select count(1) into v_count from t_common_dictionary where zdlb='ZAGL_RY_ZW' and dm='39';
	if v_count=0 then
		insert into t_common_dictionary values(seq_common.nextval,'ZAGL_RY_ZW','职务','39','办公室主任','','','1','');
		commit;
	end if;
end;