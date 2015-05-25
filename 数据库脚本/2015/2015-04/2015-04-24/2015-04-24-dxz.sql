declare 
	v_count		number;
begin
	select count(1) into v_count from t_common_dictionary where zdlb='ZDY_RY_FKLX' and dm='1';
	if v_count=0 then
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_RY_FKLX','人员反馈类型','1','房屋已转让','','',1,'');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_RY_FKLX','人员反馈类型','2','房屋已出租','','',1,'');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_RY_FKLX','人员反馈类型','3','地址已灭实','','',1,'');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_RY_FKLX','人员反馈类型','4','死亡未注销','','',1,'');
		insert into t_common_dictionary values(seq_common.nextval,'ZDY_RY_FKLX','人员反馈类型','9','其他','','',1,'');
		commit;
	end if;
end;
/
-- Add/modify columns 
alter table T_LSGL_RK_FK add fklx varchar2(1);
-- Add comments to the columns 
comment on column T_LSGL_RK_FK.fklx
  is '反馈类型';