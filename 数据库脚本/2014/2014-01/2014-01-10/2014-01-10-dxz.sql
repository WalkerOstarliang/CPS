--平台管理用户执行
insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001602', '预警签收', 'SQJW1000001123', '/zdry/ckyj/toCkyjListPage.action', '1', 1, '', '', '_self');

insert into ptgl.td_sm_function (FUNCTION_ID, NAME, PARENT_ID, PATH, TYPE, FUNCTION_SN, IMGPATH, FUNCTION_DESC, TARGET)
values ('SQJW1000001620', '预警反馈', 'SQJW1000001123', '/zdry/ckyj/toYjqsListPage.action', '1', 1, '', '', '_self');

--社区警务用户执行

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSLX', '处置措施', '1', '抓捕', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSLX', '处置措施', '2', '管控', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSLX', '处置措施', '3', '经营', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSLX', '处置措施', '4', '关注', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSLX', '处置措施', '9', '其他', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '001', '常规检测', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '002', '社会帮控', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '003', '外围调查', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '004', '当面告诫', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '005', '落到查控', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '006', '劝返带回', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZCSXL', '处置措施细类', '999', '其他', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZJG', '处置结果', '01', '处置中', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZJG', '处置结果', '11', '已防范', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_CZJG', '处置结果', '21', '已稳控', '', '', '1', '');


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '100000', '人员类', '0', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101000', '公安', '100000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101001', '暂住人口登记信息', '101000', '暂住人口登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101002', '工作对象管理信息', '101000', '工作对象管理', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101003', '出租屋租住人登记信息', '101000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101004', '实有人口登记信息', '101000', '实有人口登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101005', '旅馆旅客住宿登记信息', '101000', '旅客住宿登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101006', '娱乐场所住宿登记信息', '101000', '娱乐场所住宿登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101007', '互联网上网服务营业场所上网人员信息', '101000', '网吧上网人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101008', '监所关押人员登记信息', '101000', '监所关押人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101010', '驾驶证业务办理信息', '101000', '驾驶证业务办理', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101011', '机动车业务办理信息', '101000', '机动车业务办理', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101012', '驾驶人违法处罚信息', '101000', '驾驶人违法处罚', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101013', '出入境证件办理信息', '101000', '出入境证件办理', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101014', '出入境记录', '101000', '出入境记录', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101015', '出入境人员边防检查信息', '101000', '出入境人员边检', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101016', '外国人签证签发信息', '101000', '外国人签证签发', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101020', '人员核查录入信息', '101000', '人员核查录入', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '102000', '民航业', '100000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '102001', '民航旅客订票信息', '102000', '民航旅客订票', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '102002', '民航进港航班旅客信息', '102000', '民航旅客进港', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '102003', '民航离港航班旅客信息', '102000', '民航旅客离港', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '103000', '银行业', '100000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '103001', '银行联网核查日志信息', '103000', '银行联网核查', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '104000', '通讯业', '100000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '104001', '手机用户实名登记信息', '104000', '手机用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '200000', '物品类', '0', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '201000', '公安', '200000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '201001', '卡口车辆登记信息', '201000', '卡口车辆登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '210000', '公路运输', '200000', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '210602', '高速公路车辆收费信息', '210000', '高速车辆收费', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '900000', '其它类', '0', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101017', '常住人口户口迁移信息', '101000', '常住户口迁移', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101018', '居民身份证受理信息', '101000', '身份证办理', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101019', '案件涉案人员登记信息', '101000', '涉案登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101022', '接处警相关人员信息', '101000', '处警相关人员', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101023', '交通违法人员处罚信息', '101000', '交通违法人员处罚', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101024', '娱乐服务场所从业人员登记信息', '101000', '娱乐所从业人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101025', '典当业从业人员登记信息', '101000', '典当从业人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101026', '典当业交易人员登记信息', '101000', '典当交易人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101027', '出租屋房东登记信息', '101000', '出租屋房东登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101028', '二手手机交易人员登记信息', '101000', '二手机交易人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101029', '检查站、卡口人员登记信息', '101000', '卡口人员登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101030', '非机动车车主登记信息', '101000', '非机动车车主', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101908', '监所关押人员出所信息', '101000', '监所关押人员', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101910', '驾驶证办理登记信息', '101000', '驾驶证办理登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101911', '机动车落户登记信息', '101000', '机动车落户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101913', '出入证件签发信息', '101000', '出入证件签发', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '101914', '出入证件签注信息', '101000', '出入证件签注', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '102011', '铁路旅客实名购票信息', '102000', '铁路旅客购票', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '102030', '出租车驾驶人信息', '102000', '出租车驾驶人', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '103902', '银行联网多笔核查日志信息', '103000', '银行联网多笔核查', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '103903', '银行联网核查批量比对信息', '103000', '银行联网批量比对', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '104002', '固定电话用户登记信息', '104000', '固定电用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '104003', '家庭宽带上网用户信息', '104000', '家庭上网用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106000', '公用事业', '0', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106001', '社保参保人员登记信息', '106000', '社保参保登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106002', '供水用户登记信息', '106000', '供水用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106003', '供电用户登记信息', '106000', '供电用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106004', '燃气用户登记信息', '106000', '燃气用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106005', '有线电视用户登记信息', '106000', '有线电视用户登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106007', '医疗机构患者信息', '106000', '医病人', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106008', '公交驾驶员信息', '106000', '公交驾驶员', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106009', '公交乘车卡用户信息', '106000', '公交卡用户', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106010', '房管房主登记信息', '106000', '房管房主登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106011', '高校学生登记信息', '106000', '高校学生', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106012', '初高中学生登记信息', '106000', '中学生', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '106016', '学生家长登记信息', '106000', '学生家长', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '109000', '社会单位', '0', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '109005', '社会单位会员登记信息', '109000', '社会单位会员', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '109006', '劳务市场用工登记信息', '109000', '劳务市场用工登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '109012', '旅游业游客预约登记信息', '109000', '游客预约登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110000', '政府部门', '0', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110001', '刑释解教人员信息', '110000', '刑释解教', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110010', '计划生育服务对象登记信息', '110000', '计生服务对象登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110011', '民政残疾人登记信息', '110000', '民政登记残疾人', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110012', '信访局上访人员登记信息', '110000', '信访上访人员', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110013', '社会体育指导员登记信息', '110000', '社会体育指导员', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110021', '企业法人登记信息', '110000', '企业法人登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '110022', '地税纳税人登记信息', '110000', '地税纳税人登记', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '201002', '卡口车辆盘查信息', '210000', '卡口车辆盘查', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '900018', '民航旅客进港订座信息', '900000', '民航进港订座', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '900019', '民航旅客离港订座信息', '900000', '民航离港订座', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_DTXXLB', '重点人员动态信息类别', '900022', '驾驶证考试体检信息', '900000', '驾考体检', '1', '');


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_JSDLX', '接收地类型', '1', '活动地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_JSDLX', '接收地类型', '2', '管控地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_JSDLX', '接收地类型', '3', '立案地', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_JSDLX', '接收地类型', '4', '户籍地', '', '', '1', '');


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '10', '流动性较强职业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '11', '旅游从业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '12', '空乘', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '13', '商品营销', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '14', '物流从业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '15', '长途客运从业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '19', '其他流动性较强职业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_ZYLX', '职业类型', '20', '流动性不强职业', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_MBFXZT', '目标发现状态', '0', '未发现', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_MBFXZT', '目标发现状态', '1', '已发现', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_NJJG', '尿检结果', '0', '阴性', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_NJJG', '尿检结果', '1', '阳性', '', '', '1', '');


insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_YJJB', '预警级别', '2', '橙色预警', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_YJJB', '预警级别', '4', '黄色预警', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_YJJB', '预警级别', '5', '蓝色预警', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_YJJB', '预警级别', '1', '红色预警', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '10', '认定为犯罪嫌疑人', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '20', '有重大作案嫌疑但证据不足', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '30', '有作案嫌疑', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '40', '有违法行为', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '50', '未发现犯罪嫌疑', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '60', '未发现预警对象', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '70', '排除在本地作案嫌疑', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '80', '冒用身份或其他虚假信息预警', '', '', '1', '');

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (seq_common.nextval, 'ZDRY_LXZCGZPG', '重点人员立线侦查工作评估结果', '80', '冒用身份或其他虚假信息预警', '', '', '1', '');
commit;