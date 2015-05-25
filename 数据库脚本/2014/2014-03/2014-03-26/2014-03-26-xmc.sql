CREATE OR REPLACE FUNCTION F_GET_DWLEVE(V_ORGCODE VARCHAR2) RETURN NUMBER
--获取单位所在级别 1：省厅 2：市级3：县级4:派出所5：警务室
AS
       V_LEVE     NUMBER;
BEGIN
       --省级用户
       IF SUBSTR(V_ORGCODE,3,2)='00' THEN
          V_LEVE:=1;
        --市级级
       ELSIF SUBSTR(V_ORGCODE,5,2)='00' THEN
          V_LEVE:=2;
       --县级用户
       ELSIF SUBSTR(V_ORGCODE,7,2)='00' OR (SUBSTR(V_ORGCODE,7,2)>='91' AND SUBSTR(V_ORGCODE,7,2)<='98') OR (SUBSTR(V_ORGCODE,7,2) >='01' AND SUBSTR(V_ORGCODE,7,2)<='40')  THEN
           V_LEVE:=3;
       --森林公安局 高支队
       ELSIF INSTR(upper(V_ORGCODE),'S')>=1 OR INSTR(upper(V_ORGCODE),'G')>=1 THEN
          V_LEVE:=3;
       ELSIF SUBSTR(V_ORGCODE,7,2)='99' AND SUBSTR(V_ORGCODE,9,4)='0000' THEN
          V_LEVE:=3;
       --派出所 88--森林公安局 89--看守所
       ELSIF SUBSTR(V_ORGCODE,7,2)>='41' AND SUBSTR(V_ORGCODE,7,2)<='89' AND SUBSTR(V_ORGCODE,9,2) !='31' THEN
          V_LEVE:=4;
       --责任区
       ELSIF SUBSTR(V_ORGCODE,7,2)>='41' AND SUBSTR(V_ORGCODE,7,2)<='89' AND SUBSTR(V_ORGCODE,9,4)='3100' THEN
          V_LEVE:=4;
        --警务室
       ELSIF SUBSTR(V_ORGCODE,9,2)='31' AND SUBSTR(V_ORGCODE,11,2) >= '01' AND SUBSTR(V_ORGCODE,11,2)<='99' THEN
          V_LEVE:=5;
       END IF;
       RETURN V_LEVE;
END;
/


-- Create table
create table T_COMMON_STXX_BGJL
(
  ID        VARCHAR2(27) not null,
  QYSTID    VARCHAR2(30) not null,
  FROMSQDM  VARCHAR2(12),
  FROMJWQDM VARCHAR2(12),
  TOSQDM    VARCHAR2(12),
  TOJWQDM   VARCHAR2(12),
  CZDWDM    VARCHAR2(12),
  CZDWMC    VARCHAR2(120),
  CZSJ      DATE,
  CZRSFZH   VARCHAR2(18),
  CZRJH     VARCHAR2(6),
  CZRXM     VARCHAR2(30),
  ISEXEC    VARCHAR2(1)
);
-- Add comments to the table 
comment on table T_COMMON_STXX_BGJL
  is '实体迁移记录';
-- Add comments to the columns 
comment on column T_COMMON_STXX_BGJL.ID
  is 'ID';
comment on column T_COMMON_STXX_BGJL.QYSTID
  is '迁移实体ID';
comment on column T_COMMON_STXX_BGJL.FROMSQDM
  is '迁移前所属社区代码';
comment on column T_COMMON_STXX_BGJL.FROMJWQDM
  is '迁移前警务区代码';
comment on column T_COMMON_STXX_BGJL.TOSQDM
  is '迁移后社区代码';
comment on column T_COMMON_STXX_BGJL.TOJWQDM
  is '迁移后警务区代码';
comment on column T_COMMON_STXX_BGJL.CZDWDM
  is '操作单位代码';
comment on column T_COMMON_STXX_BGJL.CZDWMC
  is '操作单位名称';
comment on column T_COMMON_STXX_BGJL.CZSJ
  is '操作时间';
comment on column T_COMMON_STXX_BGJL.CZRSFZH
  is '操作人身份证号';
comment on column T_COMMON_STXX_BGJL.CZRJH
  is '操作人警号';
comment on column T_COMMON_STXX_BGJL.CZRXM
  is '操作人姓名';
comment on column T_COMMON_STXX_BGJL.ISEXEC
  is '是否运行 0：未执行 1：已执行';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_COMMON_STXX_BGJL
  add primary key (ID);
