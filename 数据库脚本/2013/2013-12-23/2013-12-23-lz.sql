create or replace function f_get_pcsfjs(v_orgcode varchar2)
return NUMBER
--获取单位的最后一次单位检查时间
as
        v_fjs    number;
begin
       select count(1) into v_fjs from t_common_organization_fj  fj where fj.ssdwdm=v_orgcode;
       return v_fjs;
end;
/


CREATE OR REPLACE FUNCTION F_GET_XZCSCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--行政村数
AS
       V_LEVE     NUMBER;
       V_COUNT    NUMBER;
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       IF V_LEVE=1 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                and cxfl='200' or cxfl='220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,2)||'%';

       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                 and cxfl='200' or cxfl='220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,4)||'%';

       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                and cxfl='200' or cxfl='220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,6)||'%';

       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                and cxfl='200' or cxfl='220'
                AND SSPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';

       ELSIF V_LEVE=5 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE LEVE='5'
                and cxfl='200' or cxfl='220'
                AND SSJWSDM=V_ORGCODE;

      END IF;
      RETURN  V_COUNT;
END;
/