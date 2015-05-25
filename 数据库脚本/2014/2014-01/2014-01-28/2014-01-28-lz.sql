CREATE OR REPLACE FUNCTION F_GET_DWLEVE(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取单位所在级别 1：省厅 2：市级3：县级4:派出所5：警务室
AS
       V_LEVE     NUMBER;
BEGIN
       --省级用户
       IF SUBSTR(V_ORGCODE,3,2)='00' THEN
          V_LEVE:=1;
        --市级级
       ELSIF SUBSTR(V_ORGCODE,5,2)='00' THEN
          V_LEVE:=2;
       --县级用户
       ELSIF SUBSTR(V_ORGCODE,7,2)='00' OR (SUBSTR(V_ORGCODE,7,2) >='01' AND SUBSTR(V_ORGCODE,7,2)<='40' OR SUBSTR(V_ORGCODE,7,2) >='71')  THEN
          V_LEVE:=3;
       --派出所
       ELSIF SUBSTR(V_ORGCODE,7,2)>='41' AND SUBSTR(V_ORGCODE,7,2)<='70' AND SUBSTR(V_ORGCODE,9,2) !='31' THEN
          V_LEVE:=4;
       --责任区
       ELSIF SUBSTR(V_ORGCODE,7,2)>='41' AND SUBSTR(V_ORGCODE,7,2)<='70' AND SUBSTR(V_ORGCODE,9,4)='3100' THEN
          V_LEVE:=4;
        --警务室
       ELSIF SUBSTR(V_ORGCODE,9,2)='31' AND SUBSTR(V_ORGCODE,11,2) >= '01' AND SUBSTR(V_ORGCODE,11,2)<='40' THEN
          V_LEVE:=5;
       END IF;
       RETURN V_LEVE;
END;
