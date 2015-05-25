create or replace function f_getmjbycode(v_orgcode varchar2) return varchar2 as
  v_mj varchar2(4000);
begin
    v_mj := '';
    select wmsys.wm_concat(realname) into v_mj
    from v_common_organization o 
       inner join v_common_orguser ou on o.orgid=ou.orgid 
       inner join v_common_user u on u.userid=ou.userid and u.isvalid = '1'
    where o.orgcode = v_orgcode;
   return substr(v_mj,0,20);
end f_getmjbycode;
/
insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75683, 'QBXS_JJCD', '紧急程度', '1', '一般', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75684, 'QBXS_JJCD', '紧急程度', '4', '重要', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75685, 'QBXS_JJCD', '紧急程度', '8', '紧急', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75686, 'QBXS_XXLY', '情报信息来源', '04', '阵地控制', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75687, 'QBXS_XXLY', '情报信息来源', '01', '日常工作', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75688, 'QBXS_XXLY', '情报信息来源', '06', '群众举报', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75689, 'QBXS_XXLY', '情报信息来源', '08', '手机短信', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75690, 'QBXS_XXLY', '情报信息来源', '07', '互联网监察', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75691, 'QBXS_XXLY', '情报信息来源', '10', '社会传闻', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75692, 'QBXS_XXLY', '情报信息来源', '99', '其它', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75693, 'QBXS_XXLY', '情报信息来源', '02', '专案工作', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75694, 'QBXS_XXLY', '情报信息来源', '03', '隐蔽力量', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75695, 'QBXS_XXLY', '情报信息来源', '05', '刑嫌调控', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75696, 'QBXS_XXLY', '情报信息来源', '09', '电话', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75697, 'QBXS_SSLB', '涉事类别', '2209', '破坏生产经营、聚众哄抢、故意损坏公私财物等犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75698, 'QBXS_SSLB', '涉事类别', '2210', '涉及互联网违法犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75699, 'QBXS_SSLB', '涉事类别', '2211', '涉疆涉藏刑事案件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75700, 'QBXS_SSLB', '涉事类别', '2212', '组织、运送他人偷越国（边）境和偷越国（边）境犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75701, 'QBXS_SSLB', '涉事类别', '2401', '走私毒品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75702, 'QBXS_SSLB', '涉事类别', '2404', '非法持有毒品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75703, 'QBXS_SSLB', '涉事类别', '3103', '涉及省级以上重要会议、重大活动的反映', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75704, 'QBXS_SSLB', '涉事类别', '3104', '涉及知名人士的反映', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75705, 'QBXS_SSLB', '涉事类别', '1303', '由国家公职人员引发的群体性事件：决策失当，作风粗暴，管理失误，执法不公，权力寻租，腐败行为等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75706, 'QBXS_SSLB', '涉事类别', '1410', '围绕敏感时点预谋的各类活动', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75707, 'QBXS_SSLB', '涉事类别', '2104', '涉及公复场所管理的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75708, 'QBXS_SSLB', '涉事类别', '2106', '涉及赌博违法犯罪的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75709, 'QBXS_SSLB', '涉事类别', '2107', '扰乱公共秩序等妨害社会管理秩序', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75710, 'QBXS_SSLB', '涉事类别', '1100', '政治事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75711, 'QBXS_SSLB', '涉事类别', '1105', '境内外敌对分子、敌对组织，非法组织、非法刊物及其骨干分子的活动信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75712, 'QBXS_SSLB', '涉事类别', '1107', '境外宗教组织、非政府组织、邪教组织对我进行渗透活动的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75713, 'QBXS_SSLB', '涉事类别', '1109', '影响高校稳定的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75714, 'QBXS_SSLB', '涉事类别', '1112', '各种“维权”组织的机构、人员、活动等情况的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75715, 'QBXS_SSLB', '涉事类别', '1199', '其他可能引发政治事件、危害国家安全和社会稳定的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75716, 'QBXS_SSLB', '涉事类别', '2108', '违反户籍、身份证件、出租房、流动人口登记等管理', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75717, 'QBXS_SSLB', '涉事类别', '2201', '杀人、伤害致死、爆炸、决水、纵火、投毒、强奸、绑架、劫持人质、劫机、劫船（车）等重大暴力犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75718, 'QBXS_SSLB', '涉事类别', '2203', '涉及枪支弹药及爆炸性、剧毒性、放射性等危险物品犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75719, 'QBXS_SSLB', '涉事类别', '2206', '涉及省级以上领导干部及社会知名人士的犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75720, 'QBXS_SSLB', '涉事类别', '2302', '妨害公司企业管理秩序', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75721, 'QBXS_SSLB', '涉事类别', '2303', '职务侵占', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75722, 'QBXS_SSLB', '涉事类别', '2304', '挪用资金、特定款物', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75723, 'QBXS_SSLB', '涉事类别', '2305', '破坏金融管理秩序', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75724, 'QBXS_SSLB', '涉事类别', '2306', '金融诈骗', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75725, 'QBXS_SSLB', '涉事类别', '2310', '走私', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75726, 'QBXS_SSLB', '涉事类别', '2402', '贩卖运输毒品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75727, 'QBXS_SSLB', '涉事类别', '1301', '由改革措施引发的群体性事件：企业改制，教育改革，医疗改革，住房改革等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75728, 'QBXS_SSLB', '涉事类别', '1307', '由涉众犯罪问题引发的群体性事件：非法吸收公众存款，集资诈骗，非法经营，传销等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75729, 'QBXS_SSLB', '涉事类别', '1400', '综合性事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75730, 'QBXS_SSLB', '涉事类别', '2101', '涉及火灾事故的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75731, 'QBXS_SSLB', '涉事类别', '2102', '涉及交通事故的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75732, 'QBXS_SSLB', '涉事类别', '2105', '涉及卖淫嫖娼、淫秽物品等违法犯罪的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75733, 'QBXS_SSLB', '涉事类别', '2202', '拐卖、残害妇女儿童', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75734, 'QBXS_SSLB', '涉事类别', '2204', '黑恶势力犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75735, 'QBXS_SSLB', '涉事类别', '2205', '破坏电力、电信、交通等公共设施', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75736, 'QBXS_SSLB', '涉事类别', '2403', '制造毒品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75737, 'QBXS_SSLB', '涉事类别', '2408', '强迫引诱教唆欺骗容留他人吸毒', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75738, 'QBXS_SSLB', '涉事类别', '2409', '其它涉毒犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75739, 'QBXS_SSLB', '涉事类别', '1101', '“藏独”活动信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75740, 'QBXS_SSLB', '涉事类别', '1102', '“疆独”活动信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75741, 'QBXS_SSLB', '涉事类别', '1103', '“台独”活动信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75742, 'QBXS_SSLB', '涉事类别', '1104', '国内、境外发生的可能影响我国稳定的事件信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75743, 'QBXS_SSLB', '涉事类别', '1106', '非法宗教、邪教组织、秘密结社组织的活动信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75744, 'QBXS_SSLB', '涉事类别', '1108', '境内外“法轮功”组织、有害气功组织、其他邪教组织针对国家重大活动策划进行捣乱的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75745, 'QBXS_SSLB', '涉事类别', '1110', '可能引发民族矛盾和纠纷进而危害社会稳定的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75746, 'QBXS_SSLB', '涉事类别', '1111', '社会各界对国内外形势发生重大变化、国内外重大事件和重要活动的反映，特别是可能危害社会稳定的情报信息', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75747, 'QBXS_SSLB', '涉事类别', '1200', '暴力恐怖事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75748, 'QBXS_SSLB', '涉事类别', '1202', '大规模袭击、劫持平民', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75749, 'QBXS_SSLB', '涉事类别', '1203', '利用爆炸手段，袭击党政军首脑机关、警卫现场、城市标志性建筑、公众聚集场所、国家重要基础设施、主要军事设施、民生设施、航空器、公共交通工具', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75750, 'QBXS_SSLB', '涉事类别', '1204', '袭击外国驻华机构及其人员寓所等重要敏感涉外场所', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75751, 'QBXS_SSLB', '涉事类别', '1207', '利用核爆炸、核辐射进行袭击或攻击核设施、核材料装运工具', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75752, 'QBXS_SSLB', '涉事类别', '1208', '大规模打、砸、抢、烧、杀等社会骚乱', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75753, 'QBXS_SSLB', '涉事类别', '1304', '由涉农问题引发的群体性事件：农民负担过重，村委会换届选举，山林水与归属纠纷，乡镇财务不清，拖欠农民工工资，宗族纠纷，邻里纠纷等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75754, 'QBXS_SSLB', '涉事类别', '1305', '由涉军问题引发的群体性事件：军队转退人员待遇问题，军队转退人员身份问题，其他历史遗留问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75755, 'QBXS_SSLB', '涉事类别', '1306', '由意外事故引发的群体性事件：交通事故，医疗事故，校园安全事故，公共安全事故等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75756, 'QBXS_SSLB', '涉事类别', '1309', '由污染居住或工作环境而引发的群体性事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75757, 'QBXS_SSLB', '涉事类别', '1420', '围绕重大活动预谋的各类活动', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75758, 'QBXS_SSLB', '涉事类别', '1299', '其他严重影响公众安全感、造成社会恐慌和严重后果的事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75759, 'QBXS_SSLB', '涉事类别', '1302', '由工程建设引发的群体性事件：经济补偿，人员安置，工程施工，土地转让，移民问题等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75760, 'QBXS_SSLB', '涉事类别', '1308', '由历史遗留问题引发的群体性事件：离退休待遇问题，民办教师问题，荣誉人员待遇问题等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75761, 'QBXS_SSLB', '涉事类别', '1310', '新型社会问题引发的群体性事件：物业公司与业主纠纷而引发的群体性事件等', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75762, 'QBXS_SSLB', '涉事类别', '1399', '其它问题引发的群体性事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75763, 'QBXS_SSLB', '涉事类别', '2109', '涉及危险物品管理的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75764, 'QBXS_SSLB', '涉事类别', '2110', '涉疆涉藏治安案事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75765, 'QBXS_SSLB', '涉事类别', '2112', '其它治安管理类线索', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75766, 'QBXS_SSLB', '涉事类别', '2300', '经济犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75767, 'QBXS_SSLB', '涉事类别', '1201', '袭击、劫持国家公务员、重要人事、军警人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75768, 'QBXS_SSLB', '涉事类别', '1205', '劫持航空器剂公共交通工具(火车、汽车、船舶)', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75769, 'QBXS_SSLB', '涉事类别', '1206', '利用生物战剂、化学毒剂进行大规模袭击或攻击生产、贮存、运输生产毒化物设施、工具', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75770, 'QBXS_SSLB', '涉事类别', '1300', '群体性事件', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75771, 'QBXS_SSLB', '涉事类别', '2100', '治安管理', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75772, 'QBXS_SSLB', '涉事类别', '2103', '涉及出入境管理的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75773, 'QBXS_SSLB', '涉事类别', '2111', '涉及警卫常用住地、参观点安全的', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75774, 'QBXS_SSLB', '涉事类别', '2200', '刑事犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75775, 'QBXS_SSLB', '涉事类别', '2207', '涉及侵害金融机构、党政机关等要害部位的犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75776, 'QBXS_SSLB', '涉事类别', '2208', '抢劫、抢夺、盗窃、诈骗、敲诈勒索等侵财性犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75777, 'QBXS_SSLB', '涉事类别', '2213', '其它刑事犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75778, 'QBXS_SSLB', '涉事类别', '2301', '涉及生产销售伪劣商品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75779, 'QBXS_SSLB', '涉事类别', '2307', '侵犯知识产权', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75780, 'QBXS_SSLB', '涉事类别', '2311', '其它涉及经济违法、犯罪的线索', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75781, 'QBXS_SSLB', '涉事类别', '2312', '经济运行过程中的不良动向', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75782, 'QBXS_SSLB', '涉事类别', '2308', '扰乱市场秩序', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75783, 'QBXS_SSLB', '涉事类别', '2309', '危害税收征管', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75784, 'QBXS_SSLB', '涉事类别', '2400', '毒品犯罪', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75785, 'QBXS_SSLB', '涉事类别', '2500', '自然灾害与安全生产事故', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75786, 'QBXS_SSLB', '涉事类别', '2502', '安全生产事故', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75787, 'QBXS_SSLB', '涉事类别', '3101', '涉及省级以上重要领导人的反映', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75788, 'QBXS_SSLB', '涉事类别', '3105', '涉警舆情', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75789, 'QBXS_SSLB', '涉事类别', '3106', '其它舆情社情', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75790, 'QBXS_SSLB', '涉事类别', '2405', '走私制毒物品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75791, 'QBXS_SSLB', '涉事类别', '2406', '非法买卖制毒物品', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75792, 'QBXS_SSLB', '涉事类别', '2407', '非法种植毒品原植物', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75793, 'QBXS_SSLB', '涉事类别', '2501', '自然灾害事故', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75794, 'QBXS_SSLB', '涉事类别', '2503', '其它事故', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75795, 'QBXS_SSLB', '涉事类别', '3100', '社情民意类', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75796, 'QBXS_SSLB', '涉事类别', '3102', '涉及政府相关政策的反映', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75797, 'QBXS_SSLB', '涉事类别', '4100', '其它类', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75798, 'QBXS_SSZT', '涉事主体类型', '10', '民族分裂组织', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75799, 'QBXS_SSZT', '涉事主体类型', '27', '境外人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75800, 'QBXS_SSZT', '涉事主体类型', '28', '复转军人', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75801, 'QBXS_SSZT', '涉事主体类型', '29', '有犯罪前科人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75802, 'QBXS_SSZT', '涉事主体类型', '99', '其他', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75803, 'QBXS_SSZT', '涉事主体类型', '01', '非法宗教势力', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75804, 'QBXS_SSZT', '涉事主体类型', '02', '法论功团体', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75805, 'QBXS_SSZT', '涉事主体类型', '09', '其他邪教团体', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75806, 'QBXS_SSZT', '涉事主体类型', '11', '非政府组织', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75807, 'QBXS_SSZT', '涉事主体类型', '25', '个体工商业者', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75808, 'QBXS_SSZT', '涉事主体类型', '21', '机关企事业人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75809, 'QBXS_SSZT', '涉事主体类型', '24', '农民', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75810, 'QBXS_SSZT', '涉事主体类型', '22', '下岗失业人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75811, 'QBXS_SSZT', '涉事主体类型', '23', '离退休人员', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75812, 'QBXS_SSZT', '涉事主体类型', '26', '教师学生', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75813, 'QBXS_SJMGSD', '涉及敏感时点', '999', '其他敏感时点', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75814, 'QBXS_SJMGSD', '涉及敏感时点', '001', '“3·14”（涉藏）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75815, 'QBXS_SJMGSD', '涉及敏感时点', '002', '“4·5”（清明节，多项）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75816, 'QBXS_SJMGSD', '涉及敏感时点', '005', '“7·5”（涉疆）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75817, 'QBXS_SJMGSD', '涉及敏感时点', '006', '“8·1”（涉军）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75818, 'QBXS_SJMGSD', '涉及敏感时点', '003', '“4·25”（取缔“法论功”）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75819, 'QBXS_SJMGSD', '涉及敏感时点', '004', '“6·4”（八九年平息动暴乱日）', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75820, 'QBXS_SJRSGM', '涉及人数规模', '04', '4500人以上', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75821, 'QBXS_SJRSGM', '涉及人数规模', '03', '3100-500人', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75822, 'QBXS_SJRSGM', '涉及人数规模', '01', '120人以下', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75823, 'QBXS_SJRSGM', '涉及人数规模', '02', '220-100人', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75824, 'QBXS_ZDHD', '涉及重大活动', '003', '运动会', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75825, 'QBXS_ZDHD', '涉及重大活动', '005', '广交会', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75826, 'QBXS_ZDHD', '涉及重大活动', '002', '国庆', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75827, 'QBXS_ZDHD', '涉及重大活动', '004', '世博会', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75828, 'QBXS_ZDHD', '涉及重大活动', '999', '其它重大活动', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75829, 'QBXS_ZDHD', '涉及重大活动', '001', '“两会”', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75830, 'QBXS_SSGM', '涉及损失规模', '03', '3500-2000万', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75831, 'QBXS_SSGM', '涉及损失规模', '04', '42000万-1亿', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75832, 'QBXS_SSGM', '涉及损失规模', '05', '51亿以上', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75833, 'QBXS_SSGM', '涉及损失规模', '02', '2100-500万', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75834, 'QBXS_SSGM', '涉及损失规模', '01', '1100万以下', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75835, 'QBXS_BXXS', '情报表现形式', '21', '围堵要害部门', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75836, 'QBXS_BXXS', '情报表现形式', '38', '涉枪涉爆', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75837, 'QBXS_BXXS', '情报表现形式', '24', '串联聚会', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75838, 'QBXS_BXXS', '情报表现形式', '31', '罢工', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75839, 'QBXS_BXXS', '情报表现形式', '99', '其他', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75840, 'QBXS_BXXS', '情报表现形式', '01', '上访', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75841, 'QBXS_BXXS', '情报表现形式', '10', '请愿', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75842, 'QBXS_BXXS', '情报表现形式', '11', '静坐', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75843, 'QBXS_BXXS', '情报表现形式', '23', '聚众滋事', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75844, 'QBXS_BXXS', '情报表现形式', '25', '非法游行', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75845, 'QBXS_BXXS', '情报表现形式', '32', '罢课', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75846, 'QBXS_BXXS', '情报表现形式', '33', '罢市', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75847, 'QBXS_BXXS', '情报表现形式', '34', '聚众械斗', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75848, 'QBXS_BXXS', '情报表现形式', '36', '打砸抢烧', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75849, 'QBXS_BXXS', '情报表现形式', '37', '骚乱', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75850, 'QBXS_BXXS', '情报表现形式', '02', '进京上访', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75851, 'QBXS_BXXS', '情报表现形式', '20', '冲击党政机关', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75852, 'QBXS_BXXS', '情报表现形式', '22', '聚众阻塞交通', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75853, 'QBXS_BXXS', '情报表现形式', '26', '非法示威', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75854, 'QBXS_BXXS', '情报表现形式', '35', '聚众哄抢', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75855, 'QBXS_SSYY', '涉事诱因', '01', '民族矛盾', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75856, 'QBXS_SSYY', '涉事诱因', '04', '执法问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75857, 'QBXS_SSYY', '涉事诱因', '10', '就业问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75858, 'QBXS_SSYY', '涉事诱因', '15', '医患纠纷', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75859, 'QBXS_SSYY', '涉事诱因', '08', '工资福利待遇', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75860, 'QBXS_SSYY', '涉事诱因', '09', '集资问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75861, 'QBXS_SSYY', '涉事诱因', '13', '征地搬迁', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75862, 'QBXS_SSYY', '涉事诱因', '19', '三农问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75863, 'QBXS_SSYY', '涉事诱因', '22', '移民问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75864, 'QBXS_SSYY', '涉事诱因', '14', '运输管理纠纷', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75865, 'QBXS_SSYY', '涉事诱因', '18', '学校管理纠纷', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75866, 'QBXS_SSYY', '涉事诱因', '20', '农村征地', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75867, 'QBXS_SSYY', '涉事诱因', '21', '征矿林水草场土地', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75868, 'QBXS_SSYY', '涉事诱因', '02', '宗教矛盾', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75869, 'QBXS_SSYY', '涉事诱因', '03', '非法组织', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75870, 'QBXS_SSYY', '涉事诱因', '05', '官员腐败', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75871, 'QBXS_SSYY', '涉事诱因', '06', '官僚主义', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75872, 'QBXS_SSYY', '涉事诱因', '07', '企业改制破产兼并', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75873, 'QBXS_SSYY', '涉事诱因', '11', '股票问题', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75874, 'QBXS_SSYY', '涉事诱因', '12', '环境污染', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75875, 'QBXS_SSYY', '涉事诱因', '16', '交通纠纷', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75876, 'QBXS_SSYY', '涉事诱因', '17', '民间纠纷', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75877, 'QBXS_SSYY', '涉事诱因', '99', '其它', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75878, 'QBXS_ASJDDLB', '案件地点类别', '10', '学校', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75879, 'QBXS_ASJDDLB', '案件地点类别', '99', '其他', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75880, 'QBXS_ASJDDLB', '案件地点类别', '01', '城镇', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75881, 'QBXS_ASJDDLB', '案件地点类别', '02', '农村', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75882, 'QBXS_ASJDDLB', '案件地点类别', '04', '交通枢纽', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75883, 'QBXS_ASJDDLB', '案件地点类别', '07', '旅游景区', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75884, 'QBXS_ASJDDLB', '案件地点类别', '09', '企事业单位', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75885, 'QBXS_ASJDDLB', '案件地点类别', '11', '车站码头', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75886, 'QBXS_ASJDDLB', '案件地点类别', '12', '金融机构', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75887, 'QBXS_ASJDDLB', '案件地点类别', '03', '党政机关', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75888, 'QBXS_ASJDDLB', '案件地点类别', '05', '大型活动场所', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75889, 'QBXS_ASJDDLB', '案件地点类别', '06', '要害部位', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75890, 'QBXS_BGCX', '报告次序', '1', '续报', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75891, 'QBXS_BGCX', '报告次序', '0', '原报', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75900, 'QBXS_FSZT', '发生状态', '0', '未发生', '', '', '1', null);

insert into t_common_dictionary (ID, ZDLB, ZDMC, DM, MC, PARENT_DM, JC, ISYX, SN)
values (75901, 'QBXS_FSZT', '发生状态', '1', '已发生', '', '', '1', null);
commit;

-- Create sequence 
create sequence SEQ_QBXS_ID
minvalue 10000000000000000000
maxvalue 99999999999999999999
start with 10000000000000000000
increment by 1
cache 20;
