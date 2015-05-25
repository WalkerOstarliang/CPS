insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JGSB', '旅馆技防设备', '9', '其他', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JGSB', '旅馆技防设备', '2', '防盗报警', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JGSB', '旅馆技防设备', '1', '视频监控', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDY_JGSB', '旅馆技防设备', '0', '未安装', '', '', '1', null);


commit;

-- Add/modify columns 
alter table T_LSGL_RK_JWRKXX add YWX VARCHAR2(50);
alter table T_LSGL_RK_JWRKXX add YWM VARCHAR2(50);
-- Add comments to the columns 
comment on column T_LSGL_RK_JWRKXX.YWX
  is '英文姓';
comment on column T_LSGL_RK_JWRKXX.YWM
  is '英文名';

  
  
CREATE OR REPLACE VIEW V_LSGL_RK_JWRKXX AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      TO_CHAR(CSRQ,'YYYY-MM-DD') AS CSRQ,
      B.BMCH,
      B.BYZK,
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
      B.RYSX,
      '4' as RYLB,
      C.JWBH,
      C.RJZJZL,
      C.RJZJHM,
      TO_CHAR(C.ZJYXQ,'YYYY-MM-DD') AS ZJYXQ,
      C.QZZL,
      TO_CHAR(C.QZYXQ,'YYYY-MM-DD') AS QZYXQ,
      TO_CHAR(C.TLYXQ,'YYYY-MM-DD') AS TLYXQ,
      C.QZJG,
      C.TLSY,
      TO_CHAR(C.QFRQ,'YYYY-MM-DD') AS QFRQ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.JWRYLX,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.BZ,
      C.RKFWGLID,
      C.Ywx,
      C.Ywm,
      ROW_NUMBER() OVER(PARTITION BY B.RYBH ORDER BY DJSJ ASC) RN
FROM T_LSGL_RK_JBXX B
      INNER JOIN T_LSGL_RK_JWRKXX C ON B.RYBH = C.RYBH;
      
      
     
CREATE OR REPLACE FUNCTION F_GET_JZDZMC_BY_RKFWGLID(V_RKFWGLID VARCHAR2)
RETURN VARCHAR2
AS
       V_FWID     VARCHAR2(20);
       V_DZID     VARCHAR2(20);
BEGIN
       SELECT FWID, DZID INTO V_FWID,V_DZID
       FROM T_LSGL_RKFW_GL
       WHERE RKFWGLID=V_RKFWGLID;
       
       RETURN F_GET_DZMC(V_DZID);
       
END F_GET_JZDZMC_BY_RKFWGLID;
/

CREATE OR REPLACE VIEW V_LSGL_RK_JWRKXX AS
SELECT
      B.RYBH,
      B.XM,
      B.XMPY,
      B.SFZH,
      B.XB,
      B.GJ,
      B.MZ,
      TO_CHAR(CSRQ,'YYYY-MM-DD') AS CSRQ,
      B.BMCH,
      B.BYZK,
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
      B.RYSX,
      '4' as RYLB,
      C.JWBH,
      C.RJZJZL,
      C.RJZJHM,
      TO_CHAR(C.ZJYXQ,'YYYY-MM-DD') AS ZJYXQ,
      C.QZZL,
      TO_CHAR(C.QZYXQ,'YYYY-MM-DD') AS QZYXQ,
      TO_CHAR(C.TLYXQ,'YYYY-MM-DD') AS TLYXQ,
      C.QZJG,
      C.TLSY,
      TO_CHAR(C.QFRQ,'YYYY-MM-DD') AS QFRQ,
      C.CZBS,
      C.CZDWDM,
      C.CZDWMC,
      C.CZSJ,
      C.CZRXM,
      C.DJDWDM,
      C.DJDWMC,
      C.DJRXM,
      C.DJSJ,
      C.ZRDWDM,
      C.ZRDWMC,
      C.ZRMJXM,
      C.ZRMJJH,
      C.ZRMJLXDH,
      C.JWRYLX,
      C.ZXBS,
      C.ZXSJ,
      C.ZXYY,
      C.BZ,
      C.RKFWGLID,
      C.Ywx,
      C.Ywm,
      F_GET_JZDZMC_BY_RKFWGLID(C.Rkfwglid) as XZZXZ
FROM T_LSGL_RK_JBXX B
      INNER JOIN T_LSGL_RK_JWRKXX C ON B.RYBH = C.RYBH;

  