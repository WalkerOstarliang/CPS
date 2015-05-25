CREATE OR REPLACE FUNCTION F_GET_HJDLXBYSFZH(V_SFZH VARCHAR2) RETURN VARCHAR2
AS
       V_HJDLX    VARCHAR2(2);
       V_XZQH     VARCHAR2(6);
       V_XZSUB    NUMBER;
BEGIN
       BEGIN
           V_XZQH:=SUBSTR(V_SFZH,1,6);
           
           SELECT NVL(HJDQH,SUBSTR(V_SFZH,1,6)) INTO V_XZQH FROM T_LSGL_RK_JBXX WHERE SFZH=V_SFZH AND ROWNUM<2;
           V_XZSUB:=TO_NUMBER(SUBSTR(V_XZQH,5,2));
           
           --省内市
           IF SUBSTR(V_XZQH,1,2)='43' AND V_XZSUB<=20 THEN
               V_HJDLX:='03';
           
           --省内县
           ELSIF SUBSTR(V_XZQH,1,2)='43' AND  V_XZSUB>20 THEN
               V_HJDLX:='05';
               
           --省外市
           ELSIF SUBSTR(V_XZQH,1,2)<>'43' AND V_XZSUB<=20 THEN
               V_HJDLX:='04';
           --省外县
           ELSIF SUBSTR(V_XZQH,1,2)<>'43' AND V_XZSUB>20 THEN
               V_HJDLX:='06';
           ELSE
               V_HJDLX:='00';
           END IF;
           EXCEPTION WHEN OTHERS THEN
               V_HJDLX:='99';
       END;
       RETURN V_HJDLX;

END;
/
-- Create table
create table T_TJFX_ZZRKTJBB
(
  ORGCODE       VARCHAR2(12),
  ORGNAME       VARCHAR2(120),
  PARENT_CODE   VARCHAR2(12),
  LEVE          NUMBER,
  TJYF          VARCHAR2(6),
  TJSJ          DATE,
  JZSYDM        VARCHAR2(2),
  JZSYMC        VARCHAR2(50),
  XBMNUM        NUMBER,
  XBWNUM        NUMBER,
  NJZQXBNYXNUM  NUMBER,
  NJZQXBNZWNNUM NUMBER,
  NJZQXWNYS     NUMBER,
  HJDLXSNS      NUMBER,
  HJDLXSNX      NUMBER,
  HJDLXSWS      NUMBER,
  HJDLXSWX      NUMBER,
  HJDLXGAT      NUMBER,
  HJDLXGW       NUMBER,
  HJDLXQT       NUMBER,
  ZZCSLJ        NUMBER,
  ZZCSJMJZ      NUMBER,
  ZZCSDWNB      NUMBER,
  ZZCSGDXC      NUMBER,
  ZZCSZLFW      NUMBER,
  ZZCSQT        NUMBER
)
tablespace TS_DT_SQJW
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table T_TJFX_ZZRKTJBB
  is '暂住人口管理统计报表';
-- Add comments to the columns 
comment on column T_TJFX_ZZRKTJBB.ORGCODE
  is '机构代码';
comment on column T_TJFX_ZZRKTJBB.ORGNAME
  is '机构名称';
comment on column T_TJFX_ZZRKTJBB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_ZZRKTJBB.LEVE
  is '层级';
comment on column T_TJFX_ZZRKTJBB.TJYF
  is '统计月份';
comment on column T_TJFX_ZZRKTJBB.TJSJ
  is '统计时间';
comment on column T_TJFX_ZZRKTJBB.JZSYDM
  is '居住事由代码';
comment on column T_TJFX_ZZRKTJBB.JZSYMC
  is '居住事由名称';
comment on column T_TJFX_ZZRKTJBB.XBMNUM
  is '性别男';
comment on column T_TJFX_ZZRKTJBB.XBWNUM
  is '性别女';
comment on column T_TJFX_ZZRKTJBB.NJZQXBNYXNUM
  is '居住期限半年以下';
comment on column T_TJFX_ZZRKTJBB.NJZQXBNZWNNUM
  is '居住期限半年至五年';
comment on column T_TJFX_ZZRKTJBB.NJZQXWNYS
  is '居住期限五年以上';
comment on column T_TJFX_ZZRKTJBB.HJDLXSNS
  is '户籍地类型省内市';
comment on column T_TJFX_ZZRKTJBB.HJDLXSNX
  is '户籍地类型省内县';
comment on column T_TJFX_ZZRKTJBB.HJDLXSWS
  is '户籍地类型省外市';
comment on column T_TJFX_ZZRKTJBB.HJDLXSWX
  is '户籍地类型省外县';
comment on column T_TJFX_ZZRKTJBB.HJDLXGAT
  is '户籍地类型港澳台';
comment on column T_TJFX_ZZRKTJBB.HJDLXGW
  is '户籍地类型国外';
comment on column T_TJFX_ZZRKTJBB.HJDLXQT
  is '户籍地类型其他';
comment on column T_TJFX_ZZRKTJBB.ZZCSLJ
  is '暂住处所旅居';
comment on column T_TJFX_ZZRKTJBB.ZZCSJMJZ
  is '暂住处所居民家中';
comment on column T_TJFX_ZZRKTJBB.ZZCSDWNB
  is '暂住处所单位内保';
comment on column T_TJFX_ZZRKTJBB.ZZCSGDXC
  is '暂住处所工地现场';
comment on column T_TJFX_ZZRKTJBB.ZZCSZLFW
  is '暂住处所租赁房屋';
comment on column T_TJFX_ZZRKTJBB.ZZCSQT
  is '暂住处所其他';
