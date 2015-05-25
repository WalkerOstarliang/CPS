CREATE OR REPLACE FUNCTION F_GET_DZMC_BYFWID(V_FWID VARCHAR2) RETURN VARCHAR2
--通过地址ID获取地址名称
AS
       V_STID     VARCHAR2(24);
       v_dzid     varchar2(30);
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
       V_DYHMC    VARCHAR2(10);
       V_LCMC     VARCHAR2(50);
       V_FJH      VARCHAR2(50);
       V_FSDZ     VARCHAR2(400);
BEGIN
       BEGIN
           SELECT DZID INTO V_DZID FROM T_LSGL_FW_JBXX WHERE FWID=V_FWID;
           SELECT STID INTO V_STID FROM T_COMMON_DZXX DZ WHERE DZ.DZID=V_DZID;

           SELECT ST.XZQH,ST.XZQHMC,ST.JDXZDM,ST.JDXZMC,ST.SQDM,ST.SQMC,ST.JLXMC,ST.MPH,ST.XQZ,ST.LDXZ
                  INTO V_XZQH,V_XZQHMC,V_JDXZDM,V_JDXZMC,V_SQDM,V_SQMC,V_JLXMC,V_MPH,V_XQZ,V_LDXZ
           FROM T_COMMON_STXX ST
           WHERE ST.ID=V_STID;

       EXCEPTION WHEN OTHERS THEN
             V_STID:=NULL;
             V_DZMC:='';
       END;

       IF V_STID IS NOT NULL THEN
             SELECT (SELECT MC FROM T_COMMON_DICTIONARY WHERE ZDLB='ZDY_DYH' AND DM=DZ.DYH),
                    NVL2(DZ.LCH,DZ.LCH||(SELECT MC FROM T_COMMON_DICTIONARY WHERE ZDLB='ZDY_LCHZ' AND DM=DZ.LCHZ),''),
                    NVL2(DZ.FJH,DZ.FJH||(SELECT MC FROM T_COMMON_DICTIONARY WHERE ZDLB='ZDY_SHHZ' AND DM=DZ.SHHZ),''),
                    FSDZ
                    INTO V_DYHMC,V_LCMC,V_FJH,V_FSDZ
             FROM T_COMMON_DZXX DZ
             WHERE DZ.DZID=V_DZID;

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

             V_DZMC:=V_XZQHMC||V_JDXZMC||V_SQMC||V_JLXMC||V_MPH||V_XQZ||V_LDXZ||V_DYHMC||V_FJH||V_FSDZ;

        END IF;
        RETURN V_DZMC;
END;
/