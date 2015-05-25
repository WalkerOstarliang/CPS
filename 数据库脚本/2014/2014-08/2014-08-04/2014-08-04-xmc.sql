CREATE OR REPLACE FUNCTION F_GET_RYLBBYORGCODE(V_SFZH VARCHAR2, V_ORGCODE VARCHAR2)
RETURN VARCHAR2
  --V_SFZH：身份证号
  --V_ORGCODE：登记单位代码
 AS
  V_RYLB     VARCHAR2(2);
  V_RYCOUNT  NUMBER;
  V_CZRK_PCSDM VARCHAR2(12);
  V_FW_PCSDM VARCHAR2(12);
BEGIN
   V_FW_PCSDM:=SUBSTR(V_ORGCODE,1,8)||'0000';
  --从市外过来,全为流动 ,常口库找不到身份证则为流动人口
  --长沙市内部人员流动,查询T_LSGL_RK_RYLB表处理类别;
  --常住人口户籍地派出所等于房屋所在地派出所,则为常住人口
  -- V_RYLB 1:常口,2:流动人口;3:寄住人口
  SELECT COUNT(1)  INTO V_RYCOUNT
  FROM T_LSGL_RK_CZRK_ST
  WHERE SFHM = V_SFZH;

  IF V_RYCOUNT = 0 THEN
    V_RYLB := '2';
  ELSE
    --查询户箱地与房屋所在地派出所
    SELECT A.KC_SSSPCS INTO V_CZRK_PCSDM
    FROM T_LSGL_RK_CZRK_ST A
    WHERE A.SFHM = V_SFZH AND A.GLZT NOT IN ('2','3','4') AND ROWNUM<2;
    IF V_CZRK_PCSDM IS NULL THEN
         V_RYLB := '2';
    ELSE 
         IF V_CZRK_PCSDM = V_FW_PCSDM THEN
            V_RYLB := '1';
         ELSE
            IF SUBSTR(V_FW_PCSDM,1,4) <> SUBSTR(V_CZRK_PCSDM,1,4) THEN
                V_RYLB := '2';
            ELSE
              SELECT RY.RYLB
                INTO V_RYLB
                FROM T_LSGL_RK_RYLB RY
               WHERE RY.FROMQH = SUBSTR(V_CZRK_PCSDM, 0, 6)
                 AND RY.DESTQH = SUBSTR(V_FW_PCSDM, 0, 6);
            END IF;
        END IF;
    END IF ;
  END IF;
  RETURN V_RYLB;
  
END;
/

-- Add/modify columns 
alter table T_LSGL_RK_CZRK add SFJWTDJ VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_RK_CZRK.CZBS
  is '操作标示  1新增、2修改、3注销 4警务通修改';
comment on column T_LSGL_RK_CZRK.SFJWTDJ
  is '是否警务通登记 0：PC登记 1：警务通登记';
  
-- Add/modify columns 
alter table T_LSGL_RK_JBXX add SFJWTDJ VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_RK_JBXX.CZBS
  is '操作标识 1 ：新增 2：修改3删除 4警务通修改';
comment on column T_LSGL_RK_JBXX.SFJWTDJ
  is '是否警务通登记 0:否 1：是';


-- Add/modify columns 
alter table T_LSGL_RK_LDRKZZXX add SFJWTDJ VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.CZBS
  is '操作标示 1新增 2修改 3删除 4警务通修改';
comment on column T_LSGL_RK_LDRKZZXX.SFJWTDJ
  is '是否警务通登记 0：PC登记 1：警务通登记';


-- Add/modify columns 
alter table T_LSGL_RK_JWRKXX add sfjwtdj VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_RK_JWRKXX.CZBS
  is '操作标示 1新增 2修改 3删除 4警务通修改';
comment on column T_LSGL_RK_JWRKXX.sfjwtdj
  is '是否警务通登记 0：否 1是';


-- Add/modify columns 
alter table T_LSGL_RK_JZRKXX add SFJWTDJ VARCHAR2(1) default '0';
-- Add comments to the columns 
comment on column T_LSGL_RK_JZRKXX.CZBS
  is '操作标示 1新增、2修改、3注销 4警务通修改';
comment on column T_LSGL_RK_JZRKXX.SFJWTDJ
  is '是否警务通登记 0：PC登记 1：警务通登记';


-- Add/modify columns 
alter table T_LSGL_RK_WLHCZHK add SFJWTDJ VARCHAR2(1);
-- Add comments to the columns 
comment on column T_LSGL_RK_WLHCZHK.CZBS
  is '操作标示 1新增 2修改 3删除 4警务通修改';
comment on column T_LSGL_RK_WLHCZHK.SFJWTDJ
  is '是否警务通登记 0否 1是';


-- Add/modify columns 
alter table T_ZA_RY_CYRY add SFJWTDJ VARCHAR2(1);
-- Add comments to the columns 
comment on column T_ZA_RY_CYRY.CZBS
  is '操作标识 1新增 2修改 3删除 4警务通修改';
comment on column T_ZA_RY_CYRY.SFJWTDJ
  is '是否警务通登记 0否 1是';

