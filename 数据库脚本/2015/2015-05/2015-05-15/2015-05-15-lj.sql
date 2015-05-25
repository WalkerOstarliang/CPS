-- 单位发案统计
create or replace view v_aj_jg_tj as
select jg.djdwdm,
       jg.sssqdm as sqdm,
       aj.anjianbianhao as ajbh,
       jg.jgbh as jgbh,
       jg.dwlb,
       aj.anjianleibie as ajlb, 
       CASE
         WHEN (aj.anjianleibie = '050201') THEN
          '1' --扒窃
         WHEN (aj.anjianleibie ='050299') THEN
          '2' --其他盗窃
         WHEN (aj.anjianleibie = '050280') THEN
          '3' --其他入室盗窃
         WHEN (aj.anjianleibie = '050202') THEN
          '4' -- 入户盗窃
         WHEN (aj.anjianleibie = '050100') THEN
          '5' -- 抢劫
         WHEN (aj.anjianleibie = '050400') THEN
          '6' --抢夺
         WHEN (aj.anjianleibie = '050301') THEN
          '7' -- 电信诈骗
         WHEN (aj.anjianleibie <>  '050201' 
           AND aj.anjianleibie <>  '050299'
           AND aj.anjianleibie <>  '050280'
           AND aj.anjianleibie <>  '050202'
           AND aj.anjianleibie <>  '050100'
           AND aj.anjianleibie <>  '050400'
           AND aj.anjianleibie <>  '050301') THEN
          '8' -- 其他
       END new_ajlb,
       aj.lianriqi larq
  from t_ajjbxxb aj, t_za_jg_jbxx jg
 where aj.lianriqi is not null
   and aj.zddwdm is not null
   and aj.anjianleibie is not null
   and ( jg.zxbs = '0' or jg.zxbs is null )
   and aj.zddwdm = jg.jgbh;
