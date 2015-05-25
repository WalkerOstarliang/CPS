-- Created on 2015-1-28 by ADMINISTRATOR 
declare 
  v_count  number;
begin
  select count(1) into v_count from t_common_dictionary where zdlb='ZAGL_CLQK' and dm='5';
  if v_count = 0 then
	  insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
	  values (seq_common.nextval, 'ZAGL_CLQK', '检查处理情况', '5', '吊销许可证', '', '', '1', null);
  	  commit;
  end if;
end;
/


-- Create table
create table T_TJFX_DWAQJCTJBB
(
  ORGCODE     VARCHAR2(12),
  ORGNAME     VARCHAR2(120),
  PARENT_CODE VARCHAR2(12),
  LEVE        NUMBER,
  TJSJ        DATE,
  ZS          NUMBER,
  THJCS       NUMBER,
  GCJCS       NUMBER,
  NBJCS       NUMBER,
  WXPJCS      NUMBER,
  WBJCS       NUMBER,
  SWJCS       NUMBER,
  LGJCS       NUMBER,
  KSJCS       NUMBER,
  SPJCS       NUMBER,
  WLJCS       NUMBER,
  QTJCS       NUMBER,
  JCLBZJCS    NUMBER,
  XFJCS       NUMBER,
  AQJCS       NUMBER,
  YZGQKS      NUMBER,
  WZGQKS      NUMBER,
  FXWTS       NUMBER,
  JGS         NUMBER,
  FKS         NUMBER,
  XFYHTZS     NUMBER,
  DXXKZS      NUMBER,
  QTS         NUMBER
);
-- Add comments to the table 
comment on table T_TJFX_DWAQJCTJBB
  is '单位安全检查统计表';
-- Add comments to the columns 
comment on column T_TJFX_DWAQJCTJBB.ORGCODE
  is '机构代码';
comment on column T_TJFX_DWAQJCTJBB.ORGNAME
  is '机构名称';
comment on column T_TJFX_DWAQJCTJBB.PARENT_CODE
  is '父类代码';
comment on column T_TJFX_DWAQJCTJBB.LEVE
  is '层级';
comment on column T_TJFX_DWAQJCTJBB.TJSJ
  is '统计时间';
comment on column T_TJFX_DWAQJCTJBB.ZS
  is '总数';
comment on column T_TJFX_DWAQJCTJBB.THJCS
  is '特行检查数';
comment on column T_TJFX_DWAQJCTJBB.GCJCS
  is '公共场所检查数';
comment on column T_TJFX_DWAQJCTJBB.NBJCS
  is '内保单位检查数';
comment on column T_TJFX_DWAQJCTJBB.WXPJCS
  is '危险品单位检查数';
comment on column T_TJFX_DWAQJCTJBB.WBJCS
  is '网吧检查数';
comment on column T_TJFX_DWAQJCTJBB.SWJCS
  is '涉外单位检查数';
comment on column T_TJFX_DWAQJCTJBB.LGJCS
  is '旅馆检查数';
comment on column T_TJFX_DWAQJCTJBB.KSJCS
  is '开锁业检查数';
comment on column T_TJFX_DWAQJCTJBB.SPJCS
  is '商店门铺检查数';
comment on column T_TJFX_DWAQJCTJBB.WLJCS
  is '物流检查数';
comment on column T_TJFX_DWAQJCTJBB.QTJCS
  is '其他检查数';
comment on column T_TJFX_DWAQJCTJBB.JCLBZJCS
  is '检查类别总检查数';
comment on column T_TJFX_DWAQJCTJBB.XFJCS
  is '消防检查数';
comment on column T_TJFX_DWAQJCTJBB.AQJCS
  is '安全检查数';
comment on column T_TJFX_DWAQJCTJBB.YZGQKS
  is '已整改情况数';
comment on column T_TJFX_DWAQJCTJBB.WZGQKS
  is '为整改情况数';
comment on column T_TJFX_DWAQJCTJBB.FXWTS
  is '发现问题数';
comment on column T_TJFX_DWAQJCTJBB.JGS
  is '警告数';
comment on column T_TJFX_DWAQJCTJBB.FKS
  is '罚款数';
comment on column T_TJFX_DWAQJCTJBB.XFYHTZS
  is '下发隐患通知数';
comment on column T_TJFX_DWAQJCTJBB.DXXKZS
  is '吊销许可证数';
comment on column T_TJFX_DWAQJCTJBB.QTS
  is '其他数';
