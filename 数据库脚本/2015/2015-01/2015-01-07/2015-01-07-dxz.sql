-- Create table
create table T_ZA_WBDWSH
(
  id      VARCHAR2(20) not null,
  jgbh    VARCHAR2(27) not null,
  tjrsfzh VARCHAR2(18),
  tjrjh   VARCHAR2(20),
  tjrxm   VARCHAR2(30),
  tjdwdm  VARCHAR2(12),
  tjdwmc  VARCHAR2(120),
  tjsj    DATE,
  czlx    VARCHAR2(1),
  shrjh   VARCHAR2(20),
  shrxm   VARCHAR2(30),
  shrsfzh VARCHAR2(18),
  shdwdm  VARCHAR2(12),
  shdwmc  VARCHAR2(120),
  shsj    DATE,
  shzt    VARCHAR2(1),
  zxsj    DATE,
  zxyy    VARCHAR2(200),
  sfyx    VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_ZA_WBDWSH
  is '危爆单位审核表';
-- Add comments to the columns 
comment on column T_ZA_WBDWSH.id
  is '主键ID';
comment on column T_ZA_WBDWSH.jgbh
  is '机构编号';
comment on column T_ZA_WBDWSH.tjrsfzh
  is '提交人身份证';
comment on column T_ZA_WBDWSH.tjrjh
  is '提交人警号';
comment on column T_ZA_WBDWSH.tjrxm
  is '提交人姓名';
comment on column T_ZA_WBDWSH.tjdwdm
  is '提交单位代码';
comment on column T_ZA_WBDWSH.tjdwmc
  is '提交单位名称';
comment on column T_ZA_WBDWSH.tjsj
  is '提交时间';
comment on column T_ZA_WBDWSH.czlx
  is '操作类型（1：新增 4：注销）';
comment on column T_ZA_WBDWSH.shrjh
  is '审核人警号';
comment on column T_ZA_WBDWSH.shrxm
  is '审核人姓名';
comment on column T_ZA_WBDWSH.shrsfzh
  is '审核人身份证';
comment on column T_ZA_WBDWSH.shdwdm
  is '审核单位代码';
comment on column T_ZA_WBDWSH.shdwmc
  is '审核单位名称';
comment on column T_ZA_WBDWSH.shsj
  is '审核时间';
comment on column T_ZA_WBDWSH.shzt
  is '审核状态（0：未审核 1：通过 2：不通过）';
comment on column T_ZA_WBDWSH.zxsj
  is '注销时间';
comment on column T_ZA_WBDWSH.zxyy
  is '注销原因';
comment on column T_ZA_WBDWSH.sfyx
  is '是否有效（0:有效  1:无效）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_WBDWSH
  add primary key (ID);
  
-- Create sequence 
create sequence SEQ_WBDW_WXHX
minvalue 10000001
maxvalue 99999999
start with 10000001
increment by 1
cache 20;  


CREATE OR REPLACE VIEW V_ZA_DWJC AS
SELECT jc.jlbh,
     dw.jgbh,
     dw.dwmc,
     jc.jcryxm,
     jc.jcsj,
     dw.hylb,
     '' AS dwfl,
     dw.sfnbgl,
     dw.sfzagl
  FROM t_za_dw_aqjcxx jc, t_za_jg_jbxx dw
 WHERE jc.jgbh = dw.jgbh
    --不是内保单位
   AND (dw.sfnbgl = '0' or dw.sfnbgl is null)
    --不是危爆单位
    and not exists( select 1 from  t_za_jg_jbxx jg where jg.jgbh = dw.jgbh and instr(dw.hylb,04) > 0 
     and dw.sfzagl = '1' )
   AND dw.zxbs = '0'
UNION
--危爆物品
--枪支检查
SELECT to_char(qzjc.id) AS jlbh,
     dw.jgbh,
     dw.dwmc,
     qzjc.jcrxm AS jcryxm,
     to_char(qzjc.jcrq, 'yyyy-mm-dd') AS jcsj,
     dw.hylb,
     wxwpdw.dwfl,
     dw.sfnbgl,
     dw.sfzagl
  FROM t_za_wbdw_qzjc qzjc, t_za_dw_wxwpdw wxwpdw, t_za_jg_jbxx dw
 WHERE qzjc.jgbh = dw.jgbh
   AND wxwpdw.jgbh = dw.jgbh
   AND dw.zxbs = '0'
UNION
--剧毒化学品检查
SELECT to_char(jc.id) AS jlbh,
     dw.jgbh,
     dw.dwmc,
     jc.djrxm AS jcryxm,
     to_char(jc.djsj, 'yyyy-mm-dd') AS jcsj,
     dw.hylb,
     wxwpdw.dwfl,
     dw.sfnbgl,
     dw.sfzagl
  FROM t_za_wbdw_jdhx jc, t_za_dw_wxwpdw wxwpdw, t_za_jg_jbxx dw
 WHERE jc.jgbh = dw.jgbh
   AND wxwpdw.jgbh = dw.jgbh
   AND dw.zxbs = '0'
UNION
--危险易爆品检查
SELECT to_char(jc.id) AS jlbh,
     dw.jgbh,
     dw.dwmc,
     jc.djrxm AS jcryxm,
     to_char(jc.djsj, 'yyyy-mm-dd') AS jcsj,
     dw.hylb,
     wxwpdw.dwfl,
     dw.sfnbgl,
     dw.sfzagl
  FROM t_za_wbdw_wxhx jc, t_za_dw_wxwpdw wxwpdw, t_za_jg_jbxx dw
 WHERE jc.jgbh = dw.jgbh
   AND wxwpdw.jgbh = dw.jgbh
   AND dw.zxbs = '0'
UNION
--内保单位检查
SELECT jc.id AS jlbh,
     dw.jgbh,
     dw.dwmc,
     jc.jcmjxm AS jcryxm,
     to_char(jc.jcrq, 'yyyy-mm-dd') AS jcsj,
     dw.hylb,
     dwhc.dwfl,
     dw.sfnbgl,
     dw.sfzagl
  FROM t_za_nb_dwjc jc,
     t_za_jg_jbxx dw,
     (SELECT dwhc.*
      FROM t_za_dwhc dwhc,
         (SELECT jgbh, MAX(hcsj) AS hcsj FROM t_za_dwhc GROUP BY jgbh) dwhc2
     WHERE dwhc.jgbh = dwhc2.jgbh
       AND dwhc.hcsj = dwhc2.hcsj
       AND dwhc.nbhc = '1') dwhc
 WHERE dw.jgbh = dwhc.jgbh
   AND dw.sfnbgl = '1'
   AND dw.zxbs = '0'
   AND jc.jgbh = dw.jgbh;
