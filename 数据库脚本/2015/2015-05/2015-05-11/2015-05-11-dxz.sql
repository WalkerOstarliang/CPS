CREATE OR REPLACE PACKAGE SQJW_RHZF_TJ AS

	-- 统计一般走访数量
	FUNCTION f_get_ybzfcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end   varchar2,
							 orgleve    NUMBER) RETURN NUMBER;

	-- 统计入室盗窃回访
	FUNCTION f_get_rsdqhfcount(orgcode    VARCHAR2,
							   tjsj_start varchar2,
							   tjsj_end   varchar2,
							   orgleve    NUMBER) RETURN NUMBER;

	--统计单位法人                                                   
	FUNCTION f_get_dwfrcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end   varchar2,
							 orgleve    NUMBER) RETURN NUMBER;
  	--统计办公室主任                                             
	FUNCTION f_get_bgszrcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end   varchar2,
							 orgleve    NUMBER) RETURN NUMBER;             

	--统计单位治安保卫人员                                                  
	FUNCTION f_get_dwzbrycount(orgcode    VARCHAR2,
							   tjsj_start varchar2,
							   tjsj_end   varchar2,
							   orgleve    NUMBER) RETURN NUMBER;

	--统计小区/组干部                                                 
	FUNCTION f_get_xqzgbcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end   varchar2,
							  orgleve    NUMBER) RETURN NUMBER;

	--统计社区/村干部                                                
	FUNCTION f_get_sqcgbcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end   varchar2,
							  orgleve    NUMBER) RETURN NUMBER;

	--统计街道/乡镇干部                                               
	FUNCTION f_get_jdxzgbcount(orgcode    VARCHAR2,
							   tjsj_start varchar2,
							   tjsj_end   varchar2,
							   orgleve    NUMBER) RETURN NUMBER;

	--统计楼栋长                                              
	FUNCTION f_get_ldzgbcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end   varchar2,
							  orgleve    NUMBER) RETURN NUMBER;


	--统计业主委员会成员                                          
	FUNCTION f_get_yzwyhcycount(orgcode    VARCHAR2,
								tjsj_start varchar2,
								tjsj_end   varchar2,
								orgleve    NUMBER) RETURN NUMBER;

	--统计物管负责人                                         
	FUNCTION f_get_wgfzrcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end   varchar2,
							  orgleve    NUMBER) RETURN NUMBER;

	--统计人大代表                                       
	FUNCTION f_get_rddbcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end   varchar2,
							 orgleve    NUMBER) RETURN NUMBER;

	--统计政协委员                                      
	FUNCTION f_get_zxwycount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end   varchar2,
							 orgleve    NUMBER) RETURN NUMBER;

END SQJW_RHZF_TJ;
/
CREATE OR REPLACE PACKAGE BODY SQJW_RHZF_TJ IS
--一般入户走访 
 FUNCTION f_get_ybzfcount(orgcode    VARCHAR2,
               tjsj_start varchar2,
               tjsj_end varchar2,
               orgleve    NUMBER) RETURN NUMBER AS
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'select count(1) from t_za_rhzf zf,t_lsgl_fw_jbxx fw where zf.dzid = fw.dzid 
                and (fw.zxbs = ''0'' or fw.zxbs is null) and zf.czbs <> ''4'' and zf.zflx = ''01''
                and fw.sssq = ' || orgcode ;
    ELSE
      v_sqlstr := 'select count(1)    from t_za_rhzf zf where zf.zflx = ''01'' and zf.czbs <> ''4''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and zf.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and zf.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
    END IF;
    IF tjsj_start IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and zf.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    IF tjsj_end IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and zf.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
  END f_get_ybzfcount;
  
--入室盗窃走访
  FUNCTION f_get_rsdqhfcount(orgcode    VARCHAR2,
               tjsj_start varchar2,
               tjsj_end varchar2,
               orgleve    NUMBER) RETURN NUMBER AS
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'select count(1) from t_za_rhzf zf,t_lsgl_fw_jbxx fw where zf.dzid = fw.dzid 
                and (fw.zxbs = ''0'' or fw.zxbs is null) and zf.czbs <> ''4'' and zf.zflx = ''02''
                and fw.sssq = ' || orgcode;
    ELSE
      v_sqlstr := 'select count(1) from t_za_rhzf zf where zf.zflx = ''02'' and zf.czbs <> ''4''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and zf.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and zf.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
    END IF;
    IF tjsj_start IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and zf.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    IF tjsj_end IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and zf.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
  END f_get_rsdqhfcount;
  
  	--统计单位法人                                                   
	FUNCTION f_get_dwfrcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end varchar2,
							 orgleve    NUMBER) RETURN NUMBER
  as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT count(1)
                  FROM t_za_ry_cyry ry, t_za_jg_jbxx dw
                 WHERE ry.jgbh = dw.jgbh
                   AND ry.zxbs = ''0''
                   AND (dw.zxbs = ''0''
                    OR dw.zxbs IS NULL)
                  and ry.zw = ''01''
                  and dw.sssqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT count(1)
                  FROM t_za_ry_cyry ry, t_za_jg_jbxx dw
                 WHERE ry.jgbh = dw.jgbh
                   AND ry.zxbs = ''0''
                   AND (dw.zxbs = ''0''
                    OR dw.zxbs IS NULL)
                  and ry.zw = ''01''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and ry.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and ry.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
    END IF;
    IF tjsj_start IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and ry.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    IF tjsj_end IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and ry.djsj <=to_date('''||tjsj_end||''',''yyyy-mm-dd'')';
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
   end  f_get_dwfrcount;
   
   --统计办公室主任
   FUNCTION f_get_bgszrcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end varchar2,
							 orgleve    NUMBER) RETURN NUMBER
  as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT count(1)
                  FROM t_za_ry_cyry ry, t_za_jg_jbxx dw
                 WHERE ry.jgbh = dw.jgbh
                   AND ry.zxbs = ''0''
                   AND (dw.zxbs = ''0''
                    OR dw.zxbs IS NULL)
                  and ry.zw = ''39''
                  and dw.sssqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT count(1)
                  FROM t_za_ry_cyry ry, t_za_jg_jbxx dw
                 WHERE ry.jgbh = dw.jgbh
                   AND ry.zxbs = ''0''
                   AND (dw.zxbs = ''0''
                    OR dw.zxbs IS NULL)
                  and ry.zw = ''39''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and ry.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and ry.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
    END IF;
    IF tjsj_start IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and ry.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    IF tjsj_end IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and ry.djsj <=to_date('''||tjsj_end||''',''yyyy-mm-dd'')';
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
   end  f_get_bgszrcount;
   
   --统计单位治安保卫人员                                                  
	FUNCTION f_get_dwzbrycount(orgcode    VARCHAR2,
							   tjsj_start varchar2,
							   tjsj_end varchar2,
							   orgleve    NUMBER) RETURN NUMBER
  as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT count(1)
                  FROM t_za_ry_cyry ry, t_za_jg_jbxx dw
                 WHERE ry.jgbh = dw.jgbh
                   AND ry.zxbs = ''0''
                   AND (dw.zxbs = ''0''
                    OR dw.zxbs IS NULL)
                  and ry.sfabry = ''1''
                  and dw.sssqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT count(1)
                  FROM t_za_ry_cyry ry, t_za_jg_jbxx dw
                 WHERE ry.jgbh = dw.jgbh
                   AND ry.zxbs = ''0''
                   AND (dw.zxbs = ''0''
                    OR dw.zxbs IS NULL)
                  and ry.sfabry = ''1''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and ry.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and ry.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
    END IF;
    IF tjsj_start IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and ry.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    IF tjsj_end IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and ry.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
   end  f_get_dwzbrycount;
   
   
   --统计社区/村干部                                                
	FUNCTION f_get_sqcgbcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end varchar2,
							  orgleve    NUMBER) RETURN NUMBER
    as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_af_sqgbxx
                 WHERE (zxbs = ''1'' OR zxbs IS NULL)
                   AND lx = ''1''
                   AND sssqbh = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_af_sqgbxx
                 WHERE (zxbs = ''1'' OR zxbs IS NULL)
                   AND lx = ''1''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
    END IF;
    IF tjsj_start IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    IF tjsj_end IS NOT NULL THEN
      v_sqlstr := v_sqlstr || ' and djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_sqcgbcount;                           
    
    
   --统计街道/乡镇干部                                               
	FUNCTION f_get_jdxzgbcount(orgcode    VARCHAR2,
							   tjsj_start varchar2,
							   tjsj_end varchar2,
							   orgleve    NUMBER) RETURN NUMBER
    as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT 0 FROM dual';
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                      FROM t_af_sqgbxx
                     WHERE (zxbs = ''1'' OR zxbs IS NULL)
                       AND lx = ''3''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
      IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
      END IF;
      IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
      END IF;
    END IF;
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_jdxzgbcount;
    
    
    --统计小区/组干部                                                 
	FUNCTION f_get_xqzgbcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end varchar2,
							  orgleve    NUMBER) RETURN NUMBER   
     as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'select count(1) from t_af_sqgbxx gb,t_za_wyxq xq 
                        where (gb.zxbs = ''1'' or gb.zxbs is null) and lx = ''2'' 
                        and gb.sssqbh = xq.id and xq.sssqdm =' || orgcode;
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                      FROM t_af_sqgbxx gb
                     WHERE (zxbs = ''1'' OR zxbs IS NULL)
                       AND lx = ''2''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
     END IF;
    
     IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and gb.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
     IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and gb.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
    
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_xqzgbcount;
    
    --统计楼栋长                                              
	FUNCTION f_get_ldzgbcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end varchar2,
							  orgleve    NUMBER) RETURN NUMBER
     as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT COUNT(1)
                      FROM t_zfdx_ldz
                     WHERE zxbs = ''0''
                       and sqdm =' || orgcode;
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                      FROM t_zfdx_ldz
                     WHERE zxbs = ''0''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and djdwdm like substr(''' ||
              orgcode || ''',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
     END IF;
    
     IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
     IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
    
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_ldzgbcount;
    
    --统计业主委员会成员                                          
	FUNCTION f_get_yzwyhcycount(orgcode    VARCHAR2,
								tjsj_start varchar2,
								tjsj_end varchar2,
								orgleve    NUMBER) RETURN NUMBER 
      as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT count(1)
                      FROM t_zfdx_yzwyhcy a, t_zfdx_yzwyh b
                     WHERE a.yzwyhid = b.id
                       AND b.zxbs = ''0''
                       AND a.zxbs = ''0''
                       and b.sqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT count(1)
              FROM t_zfdx_yzwyhcy a, t_zfdx_yzwyh b
             WHERE a.yzwyhid = b.id
               AND b.zxbs = ''0''
               AND a.zxbs = ''0''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and a.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and a.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
     END IF;
    
     IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and a.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
     IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and a.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
    
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_yzwyhcycount; 
    
    	--统计物管负责人                                         
	FUNCTION f_get_wgfzrcount(orgcode    VARCHAR2,
							  tjsj_start varchar2,
							  tjsj_end varchar2,
							  orgleve    NUMBER) RETURN NUMBER  
    as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_za_wyxq a
                 WHERE a.dwfzr IS NOT NULL
                   AND a.ywwygs = ''1''
                   AND a.zxbs = ''0''
                   AND a.sssqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_za_wyxq a
                 WHERE a.dwfzr IS NOT NULL
                   AND a.ywwygs = ''1''
                   AND a.zxbs = ''0''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and a.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and a.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
     END IF;
    
     IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and a.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
     IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and a.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
    
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_wgfzrcount;   
    
    --统计人大代表                                       
	FUNCTION f_get_rddbcount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end varchar2,
							 orgleve    NUMBER) RETURN NUMBER
     as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_zfdx_ddb a
                 WHERE a.zxbs = ''0''
                   AND a.sfrddb <> ''0''
                   AND a.sqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_zfdx_ddb a
                 WHERE a.zxbs = ''0''
                   AND a.sfrddb <> ''0''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and a.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and a.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
     END IF;
    
     IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and a.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
     IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and a.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
    
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_rddbcount;
    
    --统计政协委员                                      
	FUNCTION f_get_zxwycount(orgcode    VARCHAR2,
							 tjsj_start varchar2,
							 tjsj_end varchar2,
							 orgleve    NUMBER) RETURN NUMBER  
   as 
    v_total   NUMBER;
    v_orgleve NUMBER;
    v_sqlstr  VARCHAR2(4000);
  BEGIN
    v_orgleve := 0;
    v_total   := 0;
    IF orgleve IS NULL THEN
      v_orgleve := f_get_dwleve(orgcode);
    ELSE
      v_orgleve := orgleve;
    END IF;
    IF v_orgleve = 6 THEN
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_zfdx_ddb a
                 WHERE a.zxbs = ''0''
                   AND a.sfzxwy <> ''0''
                   AND a.sqdm = ' || orgcode;
    ELSE
      v_sqlstr := 'SELECT COUNT(1)
                  FROM t_zfdx_ddb a
                 WHERE a.zxbs = ''0''
                   AND a.sfzxwy <> ''0''';
      IF v_orgleve = 5 THEN
        v_sqlstr := v_sqlstr || ' and a.djdwdm = ' || orgcode;
      ELSE
        v_sqlstr := v_sqlstr || ' and a.djdwdm like substr(' ||
              orgcode || ',1,' || v_orgleve * 2 || ')||''%''';
      END IF;
     END IF;
    
     IF tjsj_start IS NOT NULL THEN
          v_sqlstr := v_sqlstr || ' and a.djsj >=to_date('''||tjsj_start||' 00:00:00'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
     IF tjsj_end IS NOT NULL THEN
         v_sqlstr := v_sqlstr || ' and a.djsj <= to_date('''|| tjsj_end ||' 23:59:59'',''yyyy-mm-dd hh24:mi:ss'')';
     END IF;
    
    EXECUTE IMMEDIATE v_sqlstr
      INTO v_total;
    RETURN v_total;
    end f_get_zxwycount;                                                                   
END SQJW_RHZF_TJ;
/