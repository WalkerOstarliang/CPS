-- Add/modify columns 
alter table T_LSGL_RK_JBXX add HJDQH VARCHAR2(6);
alter table T_LSGL_RK_JBXX add HJDXZ VARCHAR2(120);
alter table T_LSGL_RK_JBXX add SSGAJGJGDM VARCHAR2(12);
alter table T_LSGL_RK_JBXX add SSGAJGJGMC VARCHAR2(120);
alter table T_LSGL_RK_JBXX add SSPCSDM VARCHAR2(12);
alter table T_LSGL_RK_JBXX add SSPCSMC VARCHAR2(120);
-- Add comments to the columns 
comment on column T_LSGL_RK_JBXX.HJDQH
  is '户籍地区划';
comment on column T_LSGL_RK_JBXX.HJDXZ
  is '户籍地祥址';
comment on column T_LSGL_RK_JBXX.SSGAJGJGDM
  is '所属公安机构机构代码';
comment on column T_LSGL_RK_JBXX.SSGAJGJGMC
  is '所属公安机构机构名称';
comment on column T_LSGL_RK_JBXX.SSPCSDM
  is '所属派出所代码';
comment on column T_LSGL_RK_JBXX.SSPCSMC
  is '所属派出所名称';

  
  -- Add/modify columns 
alter table T_LSGL_RK_JBXX add SWRQ date;
alter table T_LSGL_RK_JBXX add SWZMBH VARCHAR2(80);
alter table T_LSGL_RK_JBXX add ZWBH VARCHAR2(20);
alter table T_LSGL_RK_JBXX add DNABH VARCHAR2(20);
alter table T_LSGL_RK_JBXX add XXJB VARCHAR2(1);
alter table T_LSGL_RK_JBXX add CZSJ date;
alter table T_LSGL_RK_JBXX add CZDWDM VARCHAR2(12);
alter table T_LSGL_RK_JBXX add CZDWMC VARCHAR2(120);
alter table T_LSGL_RK_JBXX add CZRJH VARCHAR2(6);
alter table T_LSGL_RK_JBXX add CZRXM VARCHAR2(30);
alter table T_LSGL_RK_JBXX add CZBS VARCHAR2(1);
-- Add comments to the columns 
comment on column T_LSGL_RK_JBXX.SWRQ
  is '死亡日期';
comment on column T_LSGL_RK_JBXX.SWZMBH
  is '死亡证明编号';
comment on column T_LSGL_RK_JBXX.ZWBH
  is '指纹编号';
comment on column T_LSGL_RK_JBXX.DNABH
  is 'DNA编号';
comment on column T_LSGL_RK_JBXX.XXJB
  is '信息级别';
comment on column T_LSGL_RK_JBXX.CZSJ
  is '操作时间';
comment on column T_LSGL_RK_JBXX.CZDWDM
  is '操作单位代码';
comment on column T_LSGL_RK_JBXX.CZDWMC
  is '操作单位名称';
comment on column T_LSGL_RK_JBXX.CZRJH
  is '操作人警号';
comment on column T_LSGL_RK_JBXX.CZRXM
  is '操作人姓名';
comment on column T_LSGL_RK_JBXX.CZBS
  is '操作标识 1 ：新增 2：修改3删除';
  
  
-- Add/modify columns 
alter table T_LSGL_RK_JBXX add XZZQH VARCHAR2(6);
alter table T_LSGL_RK_JBXX add XZZQHMC VARCHAR2(120);
alter table T_LSGL_RK_JBXX add XZZXZ VARCHAR2(120);
alter table T_LSGL_RK_JBXX add XZZZRQ VARCHAR2(12);
-- Add comments to the columns 
comment on column T_LSGL_RK_JBXX.XZZQH
  is '现住址区划';
comment on column T_LSGL_RK_JBXX.XZZQHMC
  is '现住址区划名称';
comment on column T_LSGL_RK_JBXX.XZZXZ
  is '现住址详址';
comment on column T_LSGL_RK_JBXX.XZZZRQ
  is '现住址责任区';
  
  
-- Add/modify columns 
alter table T_LSGL_FW_JBXX add SSSQBH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_FW_JBXX.SSSQBH
  is '所属社区编号';
  
 
-- Add/modify columns 
alter table T_LSGL_RK_JWRKXX add SSQHBH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_JWRKXX.SSQHBH
  is '所属社区编号';
  
-- Add/modify columns 
alter table T_LSGL_RK_JZRKXX add SSSQBH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_JZRKXX.SSSQBH
  is '所属社区编号';
  
  
-- Add/modify columns 
alter table T_LSGL_RK_LDRKZZXX add SSSQBH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_LDRKZZXX.SSSQBH
  is '所属社区编号';
  
-- Add/modify columns 
alter table T_LSGL_RK_CZRK add HJSSSQBH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_CZRK.HJSSSQBH
  is '户籍所属社区编号'; 
  
  
-- Add/modify columns 
alter table T_LSGL_RK_WLHCZHK add SSSQBH VARCHAR2(20);
-- Add comments to the columns 
comment on column T_LSGL_RK_WLHCZHK.SSSQBH
  is '所属社区编号';

  