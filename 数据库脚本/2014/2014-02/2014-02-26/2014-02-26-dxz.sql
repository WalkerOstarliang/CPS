-- Create table
create table T_KHKP_KFXPZ
(
  KHLX VARCHAR2(30),
  BT   VARCHAR2(200),
  KFGZ VARCHAR2(4000),
  SQL  VARCHAR2(4000),
  FHZ  VARCHAR2(4000),
  CLLJ VARCHAR2(400)
);
-- Add comments to the table 
comment on table T_KHKP_KFXPZ
  is '考核扣分配置';
-- Add comments to the columns 
comment on column T_KHKP_KFXPZ.KHLX
  is '考核类型';
comment on column T_KHKP_KFXPZ.BT
  is '标题';
comment on column T_KHKP_KFXPZ.KFGZ
  is '考核规则';
comment on column T_KHKP_KFXPZ.SQL
  is 'sql语句 格式{tablename:sql;} tablename 与 t_khkp_pagetable 中的tablename对应';
comment on column T_KHKP_KFXPZ.FHZ
  is '返回字段 格式{tablename:...;} tablename 与 t_khkp_pagetable 中的tablename对应 各返回值之间用逗号隔开顺序与t_khkp_pagetablehead中的对应';
comment on column T_KHKP_KFXPZ.CLLJ
  is '处理路径';
  
  
  -- Create table
create table T_KHKP_PAGETABLE
(
  TABLENAME VARCHAR2(50),
  TITLE     VARCHAR2(100),
  CLASS     VARCHAR2(50),
  STYLE     VARCHAR2(400),
  WIDTH     VARCHAR2(10),
  KHLX      VARCHAR2(200)
);
-- Add comments to the columns 
comment on column T_KHKP_PAGETABLE.TABLENAME
  is '用于关联表头';
comment on column T_KHKP_PAGETABLE.TITLE
  is '描述，显示表格的标题';
comment on column T_KHKP_PAGETABLE.KHLX
  is '考核类型，与t_khkp_kfxpz中的考核类型(khlx)对应';
  
  
  -- Create table
create table T_KHKP_PAGETABLEHEAD
(
  TABLENAME VARCHAR2(20),
  TITLE     VARCHAR2(60),
  ALIGN     VARCHAR2(10),
  STYLE     VARCHAR2(4000),
  WIDTH     VARCHAR2(10),
  XH        NUMBER
);
-- Add comments to the table 
comment on table T_KHKP_PAGETABLEHEAD
  is '考核扣分表头';
-- Add comments to the columns 
comment on column T_KHKP_PAGETABLEHEAD.TABLENAME
  is '表名 与 t_khkp_pagetable 中tablename对应';
comment on column T_KHKP_PAGETABLEHEAD.TITLE
  is '标题';
comment on column T_KHKP_PAGETABLEHEAD.XH
  is '排放位置序号';
  