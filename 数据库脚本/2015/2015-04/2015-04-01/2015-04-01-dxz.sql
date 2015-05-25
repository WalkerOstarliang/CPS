
-- Add comments to the columns 
comment on column T_AF_SQGBXX.lx
  is '1:社区干部 2：小区组干部 3乡镇街道干部';
  
declare 
	v_count number;
begin
	select count(1) into v_count from t_common_dictionary where zdlb='ZDY_JDGB_ZW';
	if v_count=0 then
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','01','党工委书记','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','02','办事处主任','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','03','党工委副书记','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','04','纪工委书记','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','05','办事处副主任','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','06','主任助手','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','07','武装部长','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','08','综治处主任','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','09','人大工委主任','','','1','');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_JDGB_ZW','街道干部职务','99','其他','','','1','');
		commit;
	end if;
end;