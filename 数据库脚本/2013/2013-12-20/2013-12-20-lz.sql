insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800050, 'ZDY_RYTSSX', '人员特殊属性', '011', '重点人口', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800051, 'ZDY_RYTSSX', '人员特殊属性', '012', '村/居委会干部', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800052, 'ZDY_RYTSSX', '人员特殊属性', '013', '协警/辅警', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800053, 'ZDY_RYTSSX', '人员特殊属性', '014', '专职巡逻队员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800054, 'ZDY_RYTSSX', '人员特殊属性', '015', '治保会成员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800055, 'ZDY_RYTSSX', '人员特殊属性', '016', '信息员/耳目', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800056, 'ZDY_RYTSSX', '人员特殊属性', '017', '协管员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (800057, 'ZDY_RYTSSX', '人员特殊属性', '018', '志愿者', '', '', '1', null);
commit;



CREATE OR REPLACE VIEW V_LSGL_FWRK AS
SELECT
        B.RYBH,
        B.XM,
        B.XMPY,
        B.SFZH,
        B.XB,
        B.GJ,
        B.MZ,
        B.CSRQ,
        B.BMCH,
        B.BYZK,
        B.YWM,
        B.WHCD,
        B.ZJZL,
        B.ZJHM,
        B.ZZMM,
        B.HYZK,
        B.SG,
        B.XX,
        B.ZZXY,
        B.ZC,
        B.LXDH,
        B.FWCS,
        B.ZYDM,
        B.ZW,
        B.SF,
        B.JG,
        B.HJDQH,
        B.HJDXZ,
        B.XZZQH,
        B.XZZQHMC,
        B.XZZXZ,
        B.XZZZRQ,
        B. RYSX,
        B.RYLB,
        GL.RKFWGLID,
        GL.FWID,
        GL.DZID,
        TO_CHAR(GL.RZSJ,'YYYY-MM-DD') AS RZSJ,
        TO_CHAR(GL.BLSJ,'YYYY-MM-DD') AS BLSJ,
        GL.ZXBS,
        GL.ZXSJ,
        GL.ZXMJXM,
        GL.ZXDWDM,
        GL.ZXDWMC,
        GL.ZXYY
FROM T_LSGL_RKFW_GL GL INNER JOIN V_LSGL_RK_JBXX B ON GL.RYBH=B.RYBH;







CREATE OR REPLACE VIEW V_LSGL_RK_JBXX AS
SELECT /*+index(JBXX T_LSGL_RK_JBXX_SFZH)*/ JBXX.RYBH,
       JBXX.XM,
       JBXX.XMPY,
       JBXX.SFZH,
       JBXX.XB,
       JBXX.GJ,
       JBXX.MZ,
       TO_CHAR(JBXX.CSRQ,'yyyy-MM-dd') AS CSRQ,
       JBXX.BMCH,
       JBXX.BYZK,
       JBXX.YWM,
       JBXX.WHCD,
       JBXX.ZJZL,
       JBXX.ZJHM,
       JBXX.ZZMM,
       JBXX.HYZK,
       JBXX.SG,
       JBXX.XX,
       JBXX.ZZXY,
       JBXX.ZC,
       JBXX.LXDH,
       JBXX.FWCS,
       JBXX.ZYDM,
       JBXX.ZW,
       JBXX.SF,
       JBXX.JG,
       JBXX.RYSX,
       JBXX.RYLB,
       JBXX.HJDQH,
       JBXX.HJDXZ,
       JBXX.SSGAJGJGDM,
       JBXX.SSGAJGJGMC,
       JBXX.SSPCSDM,
       JBXX.SSPCSMC,
       JBXX.XZZQH,
       JBXX.XZZQHMC,
       JBXX.XZZXZ,
       JBXX.XZZZRQ,
       JBXX.CZSJ,
       JBXX.CZDWDM,
       JBXX.CZDWMC,
       JBXX.CZRJH,
       JBXX.CZRXM,
       JBXX.CZBS,
       JBXX.SWRQ,
       JBXX.RYTSSX,
       JBXX.SWZMBH,
       '1'  AS RN
  FROM T_LSGL_RK_JBXX JBXX;
  
  
  
  
  -- Add comments to the columns 
comment on column T_AF_XLDXX.XLDLX
  is '巡逻队类型；1专职；2-义务';