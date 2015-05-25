update t_common_dictionary
set mc='整改'
where zdlb='ZAGL_CLQK' and dm='4';
commit;


-- Add/modify columns 
alter table T_ZA_DW_AQJCXX add jclb VARCHAR2(20);
alter table T_ZA_DW_AQJCXX add sffxwt VARCHAR2(1);
alter table T_ZA_DW_AQJCXX add zgqk VARCHAR2(1);
-- Add comments to the columns 
comment on column T_ZA_DW_AQJCXX.jclb
  is '检查类别  1：消防检查,2：治安检查';
comment on column T_ZA_DW_AQJCXX.sffxwt
  is '是否发现问题 1：发现,2：未发现';
comment on column T_ZA_DW_AQJCXX.zgqk
  is '整改情况  1：未整改，2：已整改';

  
  
-- Created on 2015-1-28 by ADMINISTRATOR 
declare 
  v_count  number;
begin
  select count(1) into v_count from t_common_dictionary where zdlb='ZDY_DWJCLB';
  if v_count = 0 then
	 	insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
		values (seq_common.nextval, 'ZDY_DWJCLB', '检查类别', '1', '消防检查', '', '消防检查', '1', null);
		
		insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
		values (seq_common.nextval, 'ZDY_DWJCLB', '检查类别', '2', '治安检查', '', '治安检查', '1', null);
		commit;
  end if;
end;
/

