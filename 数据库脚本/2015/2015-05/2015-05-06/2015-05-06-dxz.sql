CREATE OR REPLACE FUNCTION f_get_dwcountbydwfl(orgcode VARCHAR2,
                         dwfl    VARCHAR2,
                         jssj_s  varchar2,
                         jssj_e  varchar2) RETURN NUMBER IS
  v_orgleve NUMBER;
  v_total   NUMBER;
  v_sqlstr  VARCHAR2(4000);
BEGIN
  v_orgleve := f_get_dwleve(orgcode);
  v_sqlstr  := 'select count(1) from t_za_jg_jbxx dw where (dw.zxbs = ''0'' or dw.zxbs is null) ';
  IF v_orgleve = 5 THEN
    v_sqlstr := v_sqlstr || ' and dw.djdwdm = ''' || orgcode || '''';
  ELSE
    v_sqlstr := v_sqlstr || ' and  dw.djdwdm like ''' ||
          substr(orgcode, 1, v_orgleve * 2) || '%''';
  END IF;
  IF dwfl IS NOT NULL THEN
    v_sqlstr := v_sqlstr || ' and instr(dw.hylb,''' || dwfl || ''') >= 1 ';
  END IF;
  IF jssj_s IS NOT NULL THEN
    v_sqlstr := v_sqlstr || ' and dw.djsj >=to_date('''||jssj_s||''',''yyyymmdd'')';
  END IF;
  IF jssj_e IS NOT NULL THEN
    v_sqlstr := v_sqlstr || ' and dw.djsj <=to_date('''||jssj_e||''',''yyyymmdd'')';
  END IF;
  EXECUTE IMMEDIATE v_sqlstr
    INTO v_total;
  RETURN v_total;
END f_get_dwcountbydwfl;
/
declare
  v_count   number;
begin
	select count(1) into v_count from t_common_dictionary where zdlb='ZDY_ZBHCYZW';
	if v_count<4 then
		insert into t_common_dictionary values (seq_common.nextval,'ZDY_ZBHCYZW','治保会成员职务','01','主任','','','1','');
		insert into t_common_dictionary values (seq_common.nextval,'ZDY_ZBHCYZW','治保会成员职务','02','副主任','','','1','');
		insert into t_common_dictionary values (seq_common.nextval,'ZDY_ZBHCYZW','治保会成员职务','03','成员','','','1','');
		insert into t_common_dictionary values (seq_common.nextval,'ZDY_ZBHCYZW','治保会成员职务','99','其他','','','1','');
		commit;
	end if;
end;
/