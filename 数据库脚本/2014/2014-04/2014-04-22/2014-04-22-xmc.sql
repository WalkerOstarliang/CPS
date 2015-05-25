create or replace view v_zfba_wfrjbxx as
select id,
       ANJIANBIANHAO as ajbh,
       ANJIANLEIBIE as ajlb,
       xingming as xm,
       xingbie as xb,
       chushengriqi as csrq,
       zhengjianhaoma as sfzh,
       RENYUANBIANHAO as rybh,
       gerengaishu as grgs,
       shexianzuimingdm as sxzmdm,
       shexianzuiming as sxzm,
       zhuahuoren as zhrxm,
       zhuahuoriqi as zhrq,
       zhuahuodidian as zhdd
from cs_jz_zfba.T_WFRJBXXB t;
