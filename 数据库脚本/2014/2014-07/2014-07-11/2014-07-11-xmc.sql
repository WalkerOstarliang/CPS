create or replace function f_get_hzstmc(v_stid varchar2)
return varchar2
--合并实体名称
as
       V_DZMC     VARCHAR2(1000);
       V_XZQH     VARCHAR2(12);
       V_XZQHMC   VARCHAR2(120);
       V_JDXZDM   VARCHAR2(12);
       V_JDXZMC   VARCHAR2(120);
       V_SQDM     VARCHAR2(12);
       V_SQMC     VARCHAR2(120);
       V_JLXMC      VARCHAR2(120);
       V_MPH      VARCHAR2(100);
       V_XQZ      VARCHAR2(100);
       V_LDXZ     VARCHAR2(120);
begin
      V_DZMC:='';
      BEGIN
          IF V_STID IS NOT NULL THEN
             SELECT ST.XZQH,ST.XZQHMC,ST.JDXZDM,ST.JDXZMC,ST.SQDM,ST.SQMC,ST.JLXMC,ST.MPH,ST.XQZ,ST.LDXZ
                    INTO V_XZQH,V_XZQHMC,V_JDXZDM,V_JDXZMC,V_SQDM,V_SQMC,V_JLXMC,V_MPH,V_XQZ,V_LDXZ
             FROM T_COMMON_STXX ST
             WHERE ST.ID=V_STID;
             
             IF INSTR(V_MPH,'号') <=0 THEN
                V_MPH:=V_MPH||'号';
             END IF;
             
             BEGIN
                    SELECT JC INTO V_XZQHMC
                    FROM T_COMMON_HNXZQH
                    WHERE DM= V_XZQH||'000000' ;

                    SELECT JC INTO V_JDXZMC
                    FROM T_COMMON_HNXZQH
                    WHERE DM= V_JDXZDM;

                   SELECT JC INTO V_SQMC FROM T_COMMON_HNXZQH WHERE DM=V_SQDM;

                   EXCEPTION WHEN OTHERS THEN
                       V_SQMC:='';
             END;
             
              V_DZMC:=V_XZQHMC||V_JDXZMC||V_SQMC||V_JLXMC||V_MPH||V_XQZ||V_LDXZ;
          END IF;
       EXCEPTION WHEN OTHERS THEN
             V_DZMC:='';
       END;
       RETURN V_DZMC;
end;
/

create or replace function f_get_dicmc(v_zdlb varchar2,v_dm varchar2)
return varchar2
as
   v_mc varchar2(250);
begin
    select MC into v_mc from t_common_dictionary where zdlb=v_zdlb and dm=v_dm;
    return v_mc;
end;
/