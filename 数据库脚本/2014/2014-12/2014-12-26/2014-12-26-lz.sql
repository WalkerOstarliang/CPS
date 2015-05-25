-- Create table
create table T_ZA_WBDW_WXHX
(
  id      NUMBER primary key,
  djrxm   VARCHAR2(30),
  djrjh   VARCHAR2(20),
  djrsfzh VARCHAR2(18),
  djrdwid VARCHAR2(12),
  djsj    DATE,
  czrxm   VARCHAR2(30),
  czrjh   VARCHAR2(20),
  czrsfzh VARCHAR2(18),
  czdwid  VARCHAR2(12),
  czsj    DATE,
  jgbh    VARCHAR2(27),
  czbs    CHAR(1),
  wxhx01  CHAR(1),
  wxhx02  VARCHAR2(400),
  wxhx03  CHAR(1),
  wxhx04  CHAR(1),
  wxhx05  VARCHAR2(400),
  wxhx06  CHAR(1),
  wxhx07  CHAR(1),
  wxhx08  VARCHAR2(400),
  wxhx09  CHAR(1),
  wxhx10  CHAR(1),
  wxhx11  VARCHAR2(400),
  wxhx12  CHAR(1),
  wxhx13  CHAR(1),
  wxhx14  VARCHAR2(400),
  wxhx15  CHAR(1),
  wxhx16  CHAR(1),
  wxhx17  VARCHAR2(400),
  wxhx18  CHAR(1),
  wxhx19  CHAR(1),
  wxhx20  VARCHAR2(400),
  wxhx21  CHAR(1),
  wxhx22  CHAR(1),
  wxhx23  VARCHAR2(400),
  wxhx24  CHAR(1),
  wxhx25  CHAR(1),
  wxhx26  VARCHAR2(400),
  wxhx27  CHAR(1),
  wxhx28  CHAR(1),
  wxhx29  VARCHAR2(400),
  wxhx30  CHAR(1),
  wxhx31  CHAR(1),
  wxhx32  VARCHAR2(400),
  wxhx33  CHAR(1),
  wxhx34  CHAR(1),
  wxhx35  VARCHAR2(400),
  wxhx36  CHAR(1),
  wxhx37  CHAR(1),
  wxhx38  VARCHAR2(400),
  wxhx39  CHAR(1),
  wxhx40  CHAR(1),
  wxhx41  VARCHAR2(400),
  wxhx42  CHAR(1),
  wxhx43  CHAR(1),
  wxhx44  VARCHAR2(400),
  wxhx45  CHAR(1),
  wxhx46  CHAR(1),
  wxhx47  VARCHAR2(400),
  wxhx48  CHAR(1),
  wxhx49  CHAR(1),
  wxhx50  VARCHAR2(400),
  wxhx51  CHAR(1),
  wxhx52  CHAR(1),
  wxhx53  VARCHAR2(400),
  wxhx54  CHAR(1),
  wxhx55  CHAR(1),
  wxhx56  VARCHAR2(400),
  wxhx57  CHAR(1),
  wxhx58  CHAR(1),
  wxhx59  VARCHAR2(400),
  wxhx60  CHAR(1),
  wxhx61  CHAR(1),
  wxhx62  VARCHAR2(400),
  wxhx63  CHAR(1),
  wxhx64  CHAR(1),
  wxhx65  VARCHAR2(400),
  wxhx66  CHAR(1),
  wxhx67  CHAR(1),
  wxhx68  VARCHAR2(400),
  wxhx69  CHAR(1),
  wxhx70  CHAR(1),
  wxhx71  VARCHAR2(400),
  wxhx72  CHAR(1),
  wxhx73  CHAR(1),
  wxhx74  VARCHAR2(400),
  wxhx75  CHAR(1),
  wxhx76  CHAR(1),
  wxhx77  VARCHAR2(400),
  wxhx78  CHAR(1),
  wxhx79  CHAR(1),
  wxhx80  VARCHAR2(400),
  wxhx81  CHAR(1)
);
-- Add comments to the columns 
comment on column T_ZA_WBDW_WXHX.id
  is '主键id';
comment on column T_ZA_WBDW_WXHX.djrxm
  is '登记人姓名';
comment on column T_ZA_WBDW_WXHX.djrjh
  is '登记人警号';
comment on column T_ZA_WBDW_WXHX.djrsfzh
  is '登记人身份证号';
comment on column T_ZA_WBDW_WXHX.djrdwid
  is '登记人单位id';
comment on column T_ZA_WBDW_WXHX.djsj
  is '登记时间';
comment on column T_ZA_WBDW_WXHX.czrxm
  is '操作人姓名';
comment on column T_ZA_WBDW_WXHX.czrjh
  is '操作人警号';
comment on column T_ZA_WBDW_WXHX.czrsfzh
  is '操作人身份证号';
comment on column T_ZA_WBDW_WXHX.czdwid
  is '操作人单位id';
comment on column T_ZA_WBDW_WXHX.czsj
  is '操作时间';
comment on column T_ZA_WBDW_WXHX.jgbh
  is '机构编号（关联）';
comment on column T_ZA_WBDW_WXHX.czbs
  is '操作标识(1:新增、2:修改、3:删除)';
comment on column T_ZA_WBDW_WXHX.wxhx01
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx02
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx03
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx04
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx05
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx06
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx07
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx08
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx09
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx10
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx11
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx12
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx13
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx14
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx15
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx16
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx17
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx18
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx19
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx20
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx21
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx22
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx23
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx24
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx25
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx26
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx27
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx28
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx29
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx30
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx31
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx32
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx33
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx34
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx35
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx36
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx37
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx38
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx39
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx40
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx41
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx42
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx43
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx44
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx45
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx46
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx47
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx48
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx49
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx50
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx51
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx52
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx53
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx54
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx55
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx56
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx57
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx58
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx59
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx60
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx61
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx62
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx63
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx64
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx65
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx66
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx67
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx68
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx69
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx70
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx71
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx72
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx73
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx74
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx75
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx76
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx77
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx78
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx79
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx80
  is '易制爆危险化学品或爆炸物品登记';
comment on column T_ZA_WBDW_WXHX.wxhx81
  is '易制爆危险化学品或爆炸物品登记';

-- Create sequence 
create sequence SEQ_WBDW_WXHX
minvalue 10000001
maxvalue 99999999
start with 10000001
increment by 1;
