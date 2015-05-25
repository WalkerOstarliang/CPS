-- Create table
create table t_lsgl_ldrk_JZZXX
(
  JZZXXBH VARCHAR2(20),
  FZRQ    VARCHAR2(8),
  YXQX    VARCHAR2(1),
  DJSJ    VARCHAR2(14),
  DJDW    VARCHAR2(12),
  DJDWMC  VARCHAR2(100),
  DJR     VARCHAR2(6),
  DJRXM   VARCHAR2(30),
  XGSJ    VARCHAR2(14),
  XGR     VARCHAR2(6),
  XGDW    VARCHAR2(12),
  XGRXM   VARCHAR2(30),
  XGDWMC  VARCHAR2(100),
  JZZRYBH VARCHAR2(20),
  JZZDYZT VARCHAR2(2),
  JZZZXBS VARCHAR2(1),
  ZPBH    VARCHAR2(20),
  JZZZXSJ VARCHAR2(8),
  JZZZXYY VARCHAR2(1)
)
;
-- Add comments to the table 
comment on table t_lsgl_ldrk_JZZXX
  is '居住证信息';
  
  -- Add comments to the columns 
comment on column T_LSGL_LDRK_JZZXX.JZZZXBS
  is '1 注销   0 未注销';