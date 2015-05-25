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
          WHERE  ISVALID='1' AND LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND DM LIKE SUBSTR(V_ORGCODE,1,2)||'%';

       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE  ISVALID='1' AND LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND DM LIKE SUBSTR(V_ORGCODE,1,4)||'%';

       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE  ISVALID='1' AND LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND DM LIKE SUBSTR(V_ORGCODE,1,6)||'%';

       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE  ISVALID='1' AND LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND SSPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';

       ELSIF V_LEVE=5 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE  ISVALID='1' AND LEVE='5'
                AND (CXFL='200' OR CXFL='210' OR CXFL='220')
                AND SSJWSDM=V_ORGCODE;

      END IF;
      RETURN  V_COUNT;
END;
/


CREATE OR REPLACE FUNCTION F_GET_GXXZSQCCOUNT(V_ORGCODE VARCHAR2) RETURN NUMBER
--管辖行政社区个数
AS
       V_LEVE     NUMBER;
       V_COUNT    NUMBER;
BEGIN
       V_LEVE:=F_GET_DWLEVE(V_ORGCODE);
       IF V_LEVE=1 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE ISVALID='1' AND LEVE='5' 
                AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,2)||'%';

       ELSIF V_LEVE=2 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE ISVALID='1' AND LEVE='5' 
                AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,4)||'%';

       ELSIF V_LEVE=3 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE ISVALID='1' AND LEVE='5' 
                AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND DM LIKE SUBSTR(V_ORGCODE,1,6)||'%';

       ELSIF V_LEVE=4 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE ISVALID='1' AND LEVE='5' 
                AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND SSPCSDM LIKE SUBSTR(V_ORGCODE,1,8)||'%';

       ELSIF V_LEVE=5 THEN
          SELECT COUNT(1) INTO V_COUNT
          FROM T_COMMON_HNXZQH
          WHERE ISVALID='1' AND LEVE='5' 
                AND CXFL<>'200' and cxfl<>'210' and cxfl<>'220'
                AND SSJWSDM=V_ORGCODE;

      END IF;
      RETURN  V_COUNT;
END;
/


-- Add/modify columns 
alter table T_COMMON_STXX add SFJWTDJ VARCHAR2(1);
-- Add comments to the columns 
comment on column T_COMMON_STXX.SFJWTDJ
  is '是否警务通登记 0 否， 1是';



declare 
  i integer;
begin
  select count(1) into i from t_common_dictionary where zdlb='ZDY_RYTSSX' and dm='4';
  if i=0 then
      insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
      values (seq_common.nextval, 'ZDY_RYTSSX', '人员特殊属性', '4', '残疾人', '', '', '1', null);
      commit;
  end if;

end;
/