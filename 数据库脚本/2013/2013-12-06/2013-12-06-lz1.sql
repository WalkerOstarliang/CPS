-- Create table
create table T_COMMON_ORGANIZATION_FJ
(
  ID           NUMBER not null,
  FJXM         VARCHAR2(30),
  FJJH         VARCHAR2(10),
  SFZH         VARCHAR2(20),
  XB           VARCHAR2(4),
  MZ           VARCHAR2(4),
  WHCD         VARCHAR2(4),
  GZGW         VARCHAR2(100),
  ZW           VARCHAR2(4),
  SFCZBZ       VARCHAR2(4),
  SFGAJGGLSYKH VARCHAR2(4),
  HJD          VARCHAR2(200),
  XZZ          VARCHAR2(200),
  CYFJSJ       NUMBER,
  DNJLCS       NUMBER,
  DNCCCS       NUMBER,
  DNJZYWPXCS   NUMBER,
  LXFS         VARCHAR2(20),
  SSDWDM       VARCHAR2(20),
  SSDWMC       VARCHAR2(120)
);
-- Add comments to the table 
comment on table T_COMMON_ORGANIZATION_FJ
  is '辅警';
-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_FJ.ID
  is '主键Id';
comment on column T_COMMON_ORGANIZATION_FJ.FJXM
  is '辅警姓名
';
comment on column T_COMMON_ORGANIZATION_FJ.FJJH
  is '辅警号 ';
comment on column T_COMMON_ORGANIZATION_FJ.SFZH
  is '身份证号码	
';
comment on column T_COMMON_ORGANIZATION_FJ.XB
  is '性别
';
comment on column T_COMMON_ORGANIZATION_FJ.MZ
  is '民族
';
comment on column T_COMMON_ORGANIZATION_FJ.WHCD
  is '文化程度
';
comment on column T_COMMON_ORGANIZATION_FJ.GZGW
  is '工作岗位（社区警务室辅警需填写警务室名称）
';
comment on column T_COMMON_ORGANIZATION_FJ.ZW
  is '职务
';
comment on column T_COMMON_ORGANIZATION_FJ.SFCZBZ
  is '是否财政保障
';
comment on column T_COMMON_ORGANIZATION_FJ.SFGAJGGLSYKH
  is '是否公安机关管理使用考核
';
comment on column T_COMMON_ORGANIZATION_FJ.HJD
  is '户籍地	
';
comment on column T_COMMON_ORGANIZATION_FJ.XZZ
  is '现住址	
';
comment on column T_COMMON_ORGANIZATION_FJ.CYFJSJ
  is '从事辅警时间（年）
';
comment on column T_COMMON_ORGANIZATION_FJ.DNJLCS
  is '当年奖励次数
';
comment on column T_COMMON_ORGANIZATION_FJ.DNCCCS
  is '当年惩处次数
';
comment on column T_COMMON_ORGANIZATION_FJ.DNJZYWPXCS
  is '当年集中业务培训次数
';
comment on column T_COMMON_ORGANIZATION_FJ.LXFS
  is '联系方式	
';
comment on column T_COMMON_ORGANIZATION_FJ.SSDWDM
  is '所属单位代码';
comment on column T_COMMON_ORGANIZATION_FJ.SSDWMC
  is '所属单位名称';



-- Add/modify columns 
alter table T_COMMON_USER_LXFS add mz varchar2(4);
alter table T_COMMON_USER_LXFS add whcd varchar2(4);
alter table T_COMMON_USER_LXFS add gzgw varchar2(100);
alter table T_COMMON_USER_LXFS add zw varchar2(4);
alter table T_COMMON_USER_LXFS add xzjb varchar2(4);
alter table T_COMMON_USER_LXFS add gzsj date;
alter table T_COMMON_USER_LXFS add cjsj date;
alter table T_COMMON_USER_LXFS add pcsgzsj date;
alter table T_COMMON_USER_LXFS add sfzzsqmj varchar2(4);
alter table T_COMMON_USER_LXFS add sqmjsfcwhjz varchar2(4);
alter table T_COMMON_USER_LXFS add cssqjwsj date;
alter table T_COMMON_USER_LXFS add dnjlcs number;
alter table T_COMMON_USER_LXFS add dncccs number;
alter table T_COMMON_USER_LXFS add dnjzywpxcs number;
-- Add comments to the columns 
comment on column T_COMMON_USER_LXFS.mz
  is '民族';
comment on column T_COMMON_USER_LXFS.whcd
  is '文化程度
';
comment on column T_COMMON_USER_LXFS.gzgw
  is '工作岗位（社区民警需填写警务室名称）
';
comment on column T_COMMON_USER_LXFS.zw
  is '职务
';
comment on column T_COMMON_USER_LXFS.xzjb
  is '行政级别
';
comment on column T_COMMON_USER_LXFS.gzsj
  is '工作时间
';
comment on column T_COMMON_USER_LXFS.cjsj
  is '从警时间
';
comment on column T_COMMON_USER_LXFS.pcsgzsj
  is '派出所工作时间
';
comment on column T_COMMON_USER_LXFS.sfzzsqmj
  is '是否专职社区民警
';
comment on column T_COMMON_USER_LXFS.sqmjsfcwhjz
  is '社区民警是否村（居）委会兼职
';
comment on column T_COMMON_USER_LXFS.cssqjwsj
  is '从事社区警务时间
';
comment on column T_COMMON_USER_LXFS.dnjlcs
  is '当年奖励次数
';
comment on column T_COMMON_USER_LXFS.dncccs
  is '当年惩处次数
';
comment on column T_COMMON_USER_LXFS.dnjzywpxcs
  is '当年集中业务培训次数
';





-- Add/modify columns 
alter table T_COMMON_ORGANIZATION_OTHER add bzs number;
alter table T_COMMON_ORGANIZATION_OTHER add jwmsd number;
alter table T_COMMON_ORGANIZATION_OTHER add jwmss number;
alter table T_COMMON_ORGANIZATION_OTHER add dsmc1 varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add dsmc2 varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add dsmc3 varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add dsmc4 varchar2(100);
alter table T_COMMON_ORGANIZATION_OTHER add zbmsb number;
alter table T_COMMON_ORGANIZATION_OTHER add zbmsl number;
alter table T_COMMON_ORGANIZATION_OTHER add zbjc number;
alter table T_COMMON_ORGANIZATION_OTHER add zbrsjl number;
alter table T_COMMON_ORGANIZATION_OTHER add zbrslds number;
alter table T_COMMON_ORGANIZATION_OTHER add zbrsfjs number;
alter table T_COMMON_ORGANIZATION_OTHER add xzjd varchar2(200);
alter table T_COMMON_ORGANIZATION_OTHER add szsfjrxzbz varchar2(4);
alter table T_COMMON_ORGANIZATION_OTHER add sqs number;
alter table T_COMMON_ORGANIZATION_OTHER add xzcs number;
alter table T_COMMON_ORGANIZATION_OTHER add sqjwss number;
alter table T_COMMON_ORGANIZATION_OTHER add sqmjs number;
alter table T_COMMON_ORGANIZATION_OTHER add zzsqmjs number;
alter table T_COMMON_ORGANIZATION_OTHER add sqmjzjlb number;
alter table T_COMMON_ORGANIZATION_OTHER add sqmjrjpbfjs number;
alter table T_COMMON_ORGANIZATION_OTHER add xqmj number;
alter table T_COMMON_ORGANIZATION_OTHER add hjrks number;
alter table T_COMMON_ORGANIZATION_OTHER add zzrks number;
alter table T_COMMON_ORGANIZATION_OTHER add zddxs number;
alter table T_COMMON_ORGANIZATION_OTHER add zddws number;
alter table T_COMMON_ORGANIZATION_OTHER add zdcss number;
alter table T_COMMON_ORGANIZATION_OTHER add SQMJPBFJS number;


-- Add comments to the columns 
comment on column T_COMMON_ORGANIZATION_OTHER.bzs
  is '编制数';
comment on column T_COMMON_ORGANIZATION_OTHER.jwmsd
  is '警务模式(队)';
  comment on column T_COMMON_ORGANIZATION_OTHER.jwmss
  is '警务模式(室)';
comment on column T_COMMON_ORGANIZATION_OTHER.dsmc1
  is '队室名称(一队)';
comment on column T_COMMON_ORGANIZATION_OTHER.dsmc2
  is '队室名称(二队)';
comment on column T_COMMON_ORGANIZATION_OTHER.dsmc3
  is '队室名称(三队)';
comment on column T_COMMON_ORGANIZATION_OTHER.dsmc4
  is '队室名称(室)';
comment on column T_COMMON_ORGANIZATION_OTHER.zbmsb
  is '值班模式(班)';
comment on column T_COMMON_ORGANIZATION_OTHER.zbmsl
  is '值班模式(轮)';
comment on column T_COMMON_ORGANIZATION_OTHER.zbjc
  is '值班警车';
comment on column T_COMMON_ORGANIZATION_OTHER.zbrsjl
  is '值班人数（警力）';
comment on column T_COMMON_ORGANIZATION_OTHER.zbrslds
  is '值班人数（领导数）';
comment on column T_COMMON_ORGANIZATION_OTHER.zbrsfjs
  is '值班人数（辅警数）';
comment on column T_COMMON_ORGANIZATION_OTHER.xzjd
  is '乡镇（街道）';
comment on column T_COMMON_ORGANIZATION_OTHER.szsfjrxzbz
  is '所长是否进乡镇（街道）班子';
comment on column T_COMMON_ORGANIZATION_OTHER.sqs
  is '社区数';
comment on column T_COMMON_ORGANIZATION_OTHER.xzcs
  is '行政村数';
comment on column T_COMMON_ORGANIZATION_OTHER.sqjwss
  is '社区警务室数';
comment on column T_COMMON_ORGANIZATION_OTHER.sqmjs
  is '社区民警数';
comment on column T_COMMON_ORGANIZATION_OTHER.zzsqmjs
  is '专职社区民警数';
comment on column T_COMMON_ORGANIZATION_OTHER.sqmjzjlb
  is '社区民警占警力比';
comment on column T_COMMON_ORGANIZATION_OTHER.sqmjrjpbfjs
  is '社区民警人均配备辅警数';
comment on column T_COMMON_ORGANIZATION_OTHER.xqmj
  is '辖区面积';
comment on column T_COMMON_ORGANIZATION_OTHER.hjrks
  is '户籍人口数';
comment on column T_COMMON_ORGANIZATION_OTHER.zzrks
  is '暂住人口数';
comment on column T_COMMON_ORGANIZATION_OTHER.zddxs
  is '重点对象数';
comment on column T_COMMON_ORGANIZATION_OTHER.zddws
  is '重点单位数';
comment on column T_COMMON_ORGANIZATION_OTHER.zdcss
  is '重点场所数';
comment on column T_COMMON_ORGANIZATION_OTHER.SQMJPBFJS
  is '其中社区（驻村）民警配备辅警数';






    