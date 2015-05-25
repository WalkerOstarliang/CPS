-- Create table
create table T_COMMON_XZQH_PZ
(
  xzqh    VARCHAR2(6),
  xzqhmc  VARCHAR2(200),
  yxzqh   VARCHAR2(6),
  yxzqhmc VARCHAR2(200)
);
comment on table T_COMMON_XZQH_PZ
  is '行政区划配置';
-- Add comments to the columns 
comment on column T_COMMON_XZQH_PZ.xzqh
  is '行政区划';
comment on column T_COMMON_XZQH_PZ.xzqhmc
  is '行政区划名称';
comment on column T_COMMON_XZQH_PZ.yxzqh
  is '源行政区划';
comment on column T_COMMON_XZQH_PZ.yxzqhmc
  is '源行政区划名称';

  

INSERT INTO t_common_xzqh_pz VALUES ('430396','湘潭九华区','430302','湘潭雨湖区');
INSERT INTO t_common_xzqh_pz VALUES ('430694','岳阳屈原管理区','430681','岳阳汨罗区');
COMMIT;