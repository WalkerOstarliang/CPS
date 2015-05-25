-- Drop columns 
alter table T_ZA_DW_ABSS drop column SSMC;
alter table T_ZA_DW_ABSS drop column ABSSSL;
alter table T_ZA_DW_ABSS drop column SSAZWZ;
alter table T_ZA_DW_ABSS drop column SSYXQK;
alter table T_ZA_DW_ABSS drop column AZSJ;
alter table T_ZA_DW_ABSS drop column CCSJ;
alter table T_ZA_DW_ABSS drop column BJSSLJ;
alter table T_ZA_DW_ABSS add xtmc varchar2(200);
alter table T_ZA_DW_ABSS add sydwmc varchar2(200);
alter table T_ZA_DW_ABSS add ysdw varchar2(1);
alter table T_ZA_DW_ABSS add sydwdz varchar2(200);
alter table T_ZA_DW_ABSS add xtjcqk varchar2(1);
alter table T_ZA_DW_ABSS add afglsx varchar2(2);
alter table T_ZA_DW_ABSS add afxtgly varchar2(30);
alter table T_ZA_DW_ABSS add afxtzsdh varchar2(30);
alter table T_ZA_DW_ABSS add ywrqbjzxt varchar2(1);
alter table T_ZA_DW_ABSS add tcqsl number;
alter table T_ZA_DW_ABSS add gdmbs number;
alter table T_ZA_DW_ABSS add ydmbs number;
alter table T_ZA_DW_ABSS add rqxtlwqk varchar2(2);
alter table T_ZA_DW_ABSS add ywspjkzxt varchar2(1);
alter table T_ZA_DW_ABSS add sgdw varchar2(200);
alter table T_ZA_DW_ABSS add sxjsl number;
alter table T_ZA_DW_ABSS add spjkxtlwqk varchar2(2);
alter table T_ZA_DW_ABSS add txbcts number;
alter table T_ZA_DW_ABSS add yxqk varchar2(1);
alter table T_ZA_DW_ABSS add xtzj number;
alter table T_ZA_DW_ABSS add ywcrkjkzxt varchar2(1);
alter table T_ZA_DW_ABSS add ywdzxcxt varchar2(1);
alter table T_ZA_DW_ABSS add ywtckglzxt varchar2(1);
-- Add comments to the columns 
comment on column T_ZA_DW_ABSS.xtmc
  is '系统名称';
comment on column T_ZA_DW_ABSS.sydwmc
  is '使用单位名称';
comment on column T_ZA_DW_ABSS.ysdw
  is '验收单位';
comment on column T_ZA_DW_ABSS.sydwdz
  is '使用单位地址';
comment on column T_ZA_DW_ABSS.xtjcqk
  is '系统检测情况';
comment on column T_ZA_DW_ABSS.afglsx
  is '安防管理属性';
comment on column T_ZA_DW_ABSS.afxtgly
  is '安防系统管理员';
comment on column T_ZA_DW_ABSS.afxtzsdh
  is '安防系统值守电话';
comment on column T_ZA_DW_ABSS.ywrqbjzxt
  is '有无入侵报警子系统 （0:无 1:有）';
comment on column T_ZA_DW_ABSS.tcqsl
  is '探测器数量';
comment on column T_ZA_DW_ABSS.gdmbs
  is '固定目标数';
comment on column T_ZA_DW_ABSS.ydmbs
  is '移动目标数';
comment on column T_ZA_DW_ABSS.rqxtlwqk
  is '入侵报警子系统联网情况';
comment on column T_ZA_DW_ABSS.ywspjkzxt
  is '有无视频监控子系统（0：无 1：有）';
comment on column T_ZA_DW_ABSS.sgdw
  is '施工单位';
comment on column T_ZA_DW_ABSS.sxjsl
  is '摄像机数量';
comment on column T_ZA_DW_ABSS.spjkxtlwqk
  is '视频监控系统联网情况';
comment on column T_ZA_DW_ABSS.txbcts
  is '图像保存天数';
comment on column T_ZA_DW_ABSS.yxqk
  is '运行情况';
comment on column T_ZA_DW_ABSS.xtzj
  is '系统造价';
comment on column T_ZA_DW_ABSS.ywcrkjkzxt
  is '有无出入口监控子系统(0:无 1：有)';
comment on column T_ZA_DW_ABSS.ywdzxcxt
  is '有无电子巡查子系统（0：无 1：有）';
comment on column T_ZA_DW_ABSS.ywtckglzxt
  is '有无停车库管理子系统（0：无 1：有）';
  
  
  
  
  

--验收单位
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YSDW','安防系统验收单位','1','公安机关','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YSDW','安防系统验收单位','2','甲方','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YSDW','安防系统验收单位','3','其他单位','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YSDW','安防系统验收单位','4','未验收','','','1','');

--系统检测情况
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_JCQK','安防系统检测情况','1','55所','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_JCQK','安防系统检测情况','2','计算机检测中心','','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_JCQK','安防系统检测情况','3','未检测','','','1','');

--安防管理属性
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','10','经文保','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','11','党政机关','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','12','金融系统','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','13','电力、通信系统','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','14','教育系统','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','15','医院','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','16','重要物资存放单位','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','17','水、电、气单位','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','19','其他','10','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','20','治安类','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','21','涉危、爆单位','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','22','居民小区','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','23','重要交通枢纽','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','24','洗浴、歌舞、娱乐场所','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','25','宾馆、饭店、招待所','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','26','网吧、电子游戏室','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','27','公共运营车辆','20','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFGLSX','安防管理属性','29','其他','20','','1','');

--联网情况
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_LWQK','联网情况','14','公安机关110联网','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_LWQK','联网情况','22','其他单位联网','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_LWQK','联网情况','23','报警公司联网','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_LWQK','联网情况','90','未联网','0','','1','');

--运行情况
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YXQK','运情况','1','正常','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YXQK','运情况','2','基本正常','0','','1','');
insert into t_common_dictionary values (seq_common.nextval,'ZDY_AFXT_YXQK','运情况','3','瘫痪','0','','1','');  
