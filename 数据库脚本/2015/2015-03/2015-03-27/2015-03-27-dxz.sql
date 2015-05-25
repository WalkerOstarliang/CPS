-- Create sequence 
create sequence SEQ_RHZF_ID
minvalue 10001
maxvalue 99999
start with 10001
increment by 1
cycle;

CREATE OR REPLACE FUNCTION f_get_syrktotalbydzid(v_dzid VARCHAR2)
	RETURN NUMBER AS
	v_ck    NUMBER;
	v_lk    NUMBER;
	v_jk    NUMBER;
	v_total NUMBER;
BEGIN
	--常口
	SELECT COUNT(1)
	  INTO v_ck
	  FROM t_lsgl_rk_jbxx rk, t_lsgl_rk_czrk ck, t_lsgl_rkfw_gl gl
	 WHERE rk.rybh = ck.rybh
	   AND gl.rkfwglid = ck.rkfwglid
	   AND gl.zxbs = '0'
	   AND ck.zxbs = '0'
	   AND gl.dzid = v_dzid;
	--流口
	SELECT COUNT(1)
	  INTO v_lk
	  FROM t_lsgl_rk_jbxx rk, t_lsgl_rk_ldrkzzxx lk, t_lsgl_rkfw_gl gl
	 WHERE rk.rybh = lk.rybh
	   AND gl.rkfwglid = lk.rkfwglid
	   AND gl.zxbs = '0'
	   AND lk.zxbs = '0'
	   AND gl.dzid = v_dzid;
	--寄口
	SELECT COUNT(1)
	  INTO v_jk
	  FROM t_lsgl_rk_jbxx rk, t_lsgl_rk_jzrkxx jk, t_lsgl_rkfw_gl gl
	 WHERE rk.rybh = jk.rybh
	   AND gl.rkfwglid = jk.rkfwglid
	   AND gl.zxbs = '0'
	   AND jk.zxbs = '0'
	   AND gl.dzid = v_dzid;
	v_total := v_ck + v_lk + v_jk;
	RETURN v_total;
END;
/

-- Create table
create table T_ZA_RHZF
(
  id      VARCHAR2(25) not null,
  dzid    VARCHAR2(20),
  dzmc    VARCHAR2(200),
  zflx    VARCHAR2(2),
  zfyy    VARCHAR2(200),
  zfnr    VARCHAR2(1000),
  zfrxm   VARCHAR2(30),
  zfrjh   VARCHAR2(20),
  zfsj    DATE,
  lrqk    VARCHAR2(200),
  djrxm   VARCHAR2(30),
  djrjh    VARCHAR2(20),
  djrsfzh VARCHAR2(18),
  djsj    DATE,
  djdwdm  VARCHAR2(12),
  djdwmc VARCHAR2(120),
  czsj    DATE,
  czrxm   VARCHAR2(30),
  czrjh   VARCHAR2(20),
  czrsfzh VARCHAR2(18),
  czdwdm  VARCHAR2(12),
  czdwmc  VARCHAR2(120),
  czbs    VARCHAR2(1)
);
-- Add comments to the columns 
comment on column T_ZA_RHZF.id
  is '主键ID';
comment on column T_ZA_RHZF.dzid
  is '地址id';
comment on column T_ZA_RHZF.dzmc
  is '地址名称';
comment on column T_ZA_RHZF.zflx
  is '走访分类';
comment on column T_ZA_RHZF.zfyy
  is '走访原因';
comment on column T_ZA_RHZF.zfnr
  is '走访内容';
comment on column T_ZA_RHZF.zfrxm
  is '走访人姓名';
comment on column T_ZA_RHZF.zfrjh
  is '走访人警号';
comment on column T_ZA_RHZF.zfsj
  is '走访时间';
comment on column T_ZA_RHZF.lrqk
  is '录入情况';
comment on column T_ZA_RHZF.djrxm
  is '登记人姓名';
comment on column T_ZA_RHZF.djrjh
  is '登记人警号';
comment on column T_ZA_RHZF.djrsfzh
  is '登记人身份证';
comment on column T_ZA_RHZF.djsj
  is '登记时间';
comment on column T_ZA_RHZF.djdwdm
  is '登记单位代码';
comment on column T_ZA_RHZF.djdwmc
  is '登记单位名称';
comment on column T_ZA_RHZF.czsj
  is '操作时间';
comment on column T_ZA_RHZF.czrxm
  is '操作人姓名';
comment on column T_ZA_RHZF.czrjh
  is '操作人警号';
comment on column T_ZA_RHZF.czrsfzh
  is '操作人身份证号';
comment on column T_ZA_RHZF.czdwdm
  is '操作单位代码';
comment on column T_ZA_RHZF.czdwmc
  is '操作单位名称';
comment on column T_ZA_RHZF.czbs
  is '操作标识(1 新增 2修改 4注销)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ZA_RHZF
  add primary key (ID);
  
-- Create table
create table T_ZA_RHZF_RY
(
  zfid VARCHAR2(25),
  rybh VARCHAR2(20)
);
-- Add comments to the columns 
comment on column T_ZA_RHZF_RY.zfid
  is '走访id';
comment on column T_ZA_RHZF_RY.rybh
  is '人员编号（已见面）';

  
insert into t_common_dictionary values (seq_common.nextval,'ZDY_ZFLX','走访类型','01','入室盗窃回访','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_ZFLX','走访类型','02','一般居民走访','','','1','');
commit;