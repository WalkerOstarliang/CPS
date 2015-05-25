package com.chinacreator.zagl.dwjc.bean;


import java.util.List;

import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.OperateBean;

public class NbaqjcBean extends OperateBean {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 217735943672349940L;

	/**
	 * 判断是否保存成功 默认为false，保存成功了则改为true
	 */
	private boolean issave=false;
	
	/**
	 * NbAqJcZpBean
	 */
	
	private List<NbAqJcZpBean> nbaqjczplist= null;
	
	
	private String  yhzd01 ;   // (银行、金融机构-社区民警)单位内部治安突发事件处置紧急预案
	private String  yhzd02 ;   // (银行、金融机构-社区民警)组织开展紧急预案演练
	private String  yhzd03 ;   // (银行、金融机构-社区民警)组织员工安全保卫学习
	private String  yhjf01 ;   // (银行、金融机构-社区民警)营业网点门前和大厅安装视频监控
	private String  yhjf02 ;   // (银行、金融机构-社区民警)营业网点大厅安装入侵报警
	private String  yhjf04 ;   // (银行、金融机构-社区民警)营业网点出入口和沿街窗户安装入侵报警
	private String  yhjf05 ;   // (银行、金融机构-社区民警)自助银行应安装环境、门外视频监控
	private String  yhjf06 ;   // (银行、金融机构-社区民警)自助银行安装紧急求助按钮或求助电话及防电信诈骗语音提示
	private String  yhwf01 ;   // (银行、金融机构-社区民警)营业网点出入口防盗门
	private String  yhwf02 ;   // (银行、金融机构-社区民警)营业网点二层（含二层）以下防盗窗或防弹玻璃
	private String  yhrf01 ;   // (银行、金融机构-社区民警)配备专职（兼职）保卫人员
	private String  yhrf02 ;   // (银行、金融机构-社区民警)定期开展培训
	private String  yhrf03 ;   // (银行、金融机构-社区民警)配备使用防卫器械和报警装备
	private String  yh_jzba01 ;   // (银行、金融机构-社区民警)保安员全部持《保安员证》上岗
	private String  yh_jzba02 ;   // (银行、金融机构-社区民警)定期开展教育、培训 
	private String  yh_jzba03 ;   // (银行、金融机构-社区民警)保安员是否着符合要求的保安员服装上岗 
	private String  yh_jzba04 ;   // (银行、金融机构-社区民警)保安员是否认真履职，有较强的安全防范意识
	private String  jyzd01 ;   // (三电油气)成立安全防范领导小组
	private String  jyzd02 ;   // (三电油气)值班守护制度
	private String  jyzd03 ;   // (三电油气)收费管理制度
	private String  jyzd04 ;   // (三电油气)现金管理制度
	private String  jyzd05 ;   // (三电油气)防范设施管理制度
	private String  jyzd06 ;   // (三电油气)处置突发事件预案
	private String  jyzd07 ;   // (三电油气)消防、安全生产(经营)制度 
	private String  jyzd08 ;   // (三电油气)组织处置突发事件演练
	private String  jyzd09 ;   // (三电油气)对员工安全防范培训
	private String  jysp01 ;   // (三电油气)加油(气)站出入口安装视频监控
	private String  jysp02 ;   // (三电油气)收费处(现金存放室)IC卡充值安装视频监控
	private String  jysp03 ;   // (三电油气)加油区、油库(罐)区等重要部位安装视频监控
	private String  jysp04 ;   // (三电油气)视频监控图像
	private String  jysp05 ;   // (三电油气)视频监控图像回放
	private String  jysp06 ;   // (三电油气)监控录制时间24小时 
	private String  jysp07 ;   // (三电油气)图像存储时间满足规定的30天期限要求
	private String  jysp08 ;   // (三电油气)视频监控是否与公安联网
	private String  jybj01 ;   // (三电油气)具备入侵条件的油库(罐)区入侵警报装置
	private String  jybj02 ;   // (三电油气)入侵警报装置与公安局110联网或与值班室联网
	private String  jybj03 ;   // (三电油气)重要部门入侵警报装置
	private String  jybj04 ;   // (三电油气)收费处、IC卡充值紧急报警按钮
	private String  jybj05 ;   // (三电油气)紧急报警按钮与公安110联网
	private String  jywf01 ;   // (三电油气)收费处(现金存放室)IC卡充值出入口防盗门
	private String  jywf02 ;   // (三电油气)收费柜台上方安装金属防护栏或防弹玻璃 
	private String  jywf03 ;   // (三电油气)收费处(现金存放室)IC卡充值窗口金属防护栏
	private String  jywf04 ;   // (三电油气)油库(罐)区应对加、取油口等部位采取防破坏、防盗窃防护措施
	private String  jyrf01 ;   // (三电油气)配备专职保卫人员(1:聘请保安,2:聘请物业,3:自建防护力量)
	private String  jyrf02 ;   // (三电油气)佩戴防卫装备
	private String  jy_jzba01 ;   // (三电油气)保安员全部持《保安员证》上岗
	private String  jy_jzba02 ;   // (三电油气)定期开展教育、培训
	private String  jy_jzba03 ;   // (三电油气)保安员是否着符合要求的保安员服装上岗 
	private String  jy_jzba04 ;   // (三电油气)保安员是否认真履职，有较强的安全防范意识
	private String  zbzd01 ;   // (大型商场超市、金银珠宝店检查表)制定单位内部治安突发事件处置紧急预案
	private String  zbzd02 ;   // (大型商场超市、金银珠宝店检查表)组织开展紧急预案演练 
	private String  zbzd03 ;   // (大型商场超市、金银珠宝店检查表)制定和落实内部治安保卫制度
	private String  zbzd04 ;   // (大型商场超市、金银珠宝店检查表)落实内部治安保卫工作责任制
	private String  zbzd05 ;   // (大型商场超市、金银珠宝店检查表)对员工安全防范培训
	private String  zbsp01 ;   // (大型商场超市、金银珠宝店检查表)视频监控
	private String  zbsp02 ;   // (大型商场超市、金银珠宝店检查表)门前环境视频监控
	private String  zbsp03 ;   // (大型商场超市、金银珠宝店检查表)视频监控图像
	private String  zbsp04 ;   // (大型商场超市、金银珠宝店检查表)视频监控图像回放
	private String  zbsp05 ;   // (大型商场超市、金银珠宝店检查表)图像存储时间满足规定的30天期限要求
	private String  zbsp06 ;   // (大型商场超市、金银珠宝店检查表)监控录制时间24小时
	private String  zbsp07 ;   // (大型商场超市、金银珠宝店检查表)视频监控存在盲区
	private String  zbbj01 ;   // (大型商场超市、金银珠宝店检查表)入侵报警
	private String  zbbj02 ;   // (大型商场超市、金银珠宝店检查表)入侵报警存在盲区
	private String  zbbj03 ;   // (大型商场超市、金银珠宝店检查表)紧急报警按钮
	private String  zbbj04 ;   // (大型商场超市、金银珠宝店检查表)紧急报警按钮安装位置符合要求情况
	private String  zbbj05 ;   // (大型商场超市、金银珠宝店检查表)入侵报警与公安110联网
	private String  zbbj06 ;   // (大型商场超市、金银珠宝店检查表)紧急报警按钮与公安110联网
	private String  zbwf01 ;   // (大型商场超市、金银珠宝店检查表)金银珠宝饰品柜台安装防砸玻璃
	private String  zbwf02 ;   // (大型商场超市、金银珠宝店检查表)营业柜台有进出柜台门并上锁
	private String  zbwf03 ;   // (大型商场超市、金银珠宝店检查表)夜间金银饰品存放专用保险箱
	private String  zbwf04 ;   // (大型商场超市、金银珠宝店检查表)保险箱与地面或墙面固定
	private String  zbrf01 ;   // (大型商场超市、金银珠宝店检查表)配备专职或兼职保卫人员
	private String  zbrf02 ;   // (大型商场超市、金银珠宝店检查表)配备防护装备
	private String  sc_jzba01 ;   // (大型商场超市、金银珠宝店检查表)保安员全部持《保安员证》上岗
	private String  sc_jzba02 ;   // (大型商场超市、金银珠宝店检查表)定期开展教育、培训
	private String  sc_jzba03 ;   // (大型商场超市、金银珠宝店检查表)保安员是否着符合要求的保安员服装上岗
	private String  sc_jzba04 ;   // (大型商场超市、金银珠宝店检查表)保安员是否认真履职，有较强的安全防范意识
	private String  whzd01 ;   // (文化部门)制定和落实内部治安保卫制度及工作责任制
	private String  whzd02 ;   // (文化部门)制定突发事件处置紧急预案并组织开展演练
	private String  whzd03 ;   // (文化部门)落实员工安全防范培训教育
	private String  whzd04 ;   // (文化部门)门卫实行人员物品出入查验登记手续
	private String  whjf01 ;   // (文化部门)单位主要出入口及通道安装视频监控
	private String  whjf02 ;   // (文化部门)车库（地下车库）安装视频监控装置
	private String  whjf03 ;   // (文化部门)单位重点要害部位安装视频监控和入侵报警
	private String  whjf04 ;   // (文化部门)设置周界报警装置
	private String  whjf05 ;   // (文化部门)设置监控中心，对重要防护部位24小时实时报警
	private String  whjf06 ;   // (文化部门)视频监控和回放图像质量、图像存储时间、监控录制时间达标情况
	private String  whwf01 ;   // (文化部门)单位出入口安装门禁门
	private String  whwf02 ;   // (文化部门)重点要害部位出入口安装防盗门、防盗窗
	private String  whrf01 ;   // (文化部门)设置与治安保卫任务相适应的治安保卫机构
	private String  whrf02 ;   // (文化部门)配备专职保卫人员
	private String  whrf03 ;   // (文化部门)单位出入口设值班室、配专职门卫
	private String  whrf04 ;   // (文化部门)配备使用防卫器械和报警装备 
	private String  whrf05 ;   // (文化部门)设置保卫力量巡逻巡更设备
	private String  wh_jzba01 ;   // (文化部门)保安员全部持《保安员证》上岗
	private String  wh_jzba02 ;   // (文化部门)定期开展教育、培训
	private String  wh_jzba03 ;   // (文化部门)保安员是否着符合要求的保安员服装上岗
	private String  wh_jzba04 ;   // (文化部门)保安员是否认真履职，有较强的安全防范意识
	private String  xxzd01 ;   // (中小学幼儿园检查表)校园封闭式管理是否落实到位
	private String  xxzd02 ;   // (中小学幼儿园检查表)门卫制度是否严格执行
	private String  xxzd03 ;   // (中小学幼儿园检查表)是否制定保卫制度
	private String  xxzd04 ;   // (中小学幼儿园检查表)上学、放学时段单位护校人员是否到岗
	private String  xxzd05 ;   // (中小学幼儿园检查表)预案与演练是否制定和开展
	private String  xxzd06 ;   // (中小学幼儿园检查表)校园周边巡防力量是否到位
	private String  xxjf01 ;   // (中小学幼儿园检查表)护卫装备是否配备齐全（两种以上）
	private String  xxjf02 ;   // (中小学幼儿园检查表)110联网紧急报警系统是否安装
	private String  xxjf03 ;   // (中小学幼儿园检查表)视频监控安装情况
	private String  xxjf04 ;   // (中小学幼儿园检查表)周界报警安装情况
	private String  xxwf01 ;   // (中小学幼儿园检查表)主要出入口安装金属防护门
	private String  xxwf02 ;   // (中小学幼儿园检查表)重要部位安装符合国家标准的防盗门
	private String  xxwf03 ;   // (中小学幼儿园检查表)重要部位窗户安装金属防护栏
	private String  xxwf04 ;   // (中小学幼儿园检查表)事故易发部位设置防护设施和警示标志
	private String  xxwf05 ;   // (中小学幼儿园检查表)供水、供电、供气、供热等部位设置实体防护装置
	private String  xxrf01 ;   // (中小学幼儿园检查表)配备专职保卫人员
	private String  xxrf02 ;   // (中小学幼儿园检查表)定期开展教育和培训
	private String  xx_jzba01 ;   // (中小学幼儿园检查表)保安员全部持《保安员证》上岗
	private String  xx_jzba02 ;   // (中小学幼儿园检查表)定期开展教育、培训
	private String  xx_jzba03 ;   // (中小学幼儿园检查表)保安员是否着符合要求的保安员服装上岗
	private String  xx_jzba04 ;   // (中小学幼儿园检查表)保安员是否认真履职，有较强的安全防范意识
	private String  id ;   // 主键ID
	private String  jgbh ;   // 机构编号
	private String  dwlb ;   // 单位类别
	private String  dwlbmc;
	private String  dwmc ;   // 单位名称
	private String  sspcsdm ;   // 所属派出所代码
	private String  sspcsmc ;   // 所属派出所名称
	private String  jcmjjh ;   // 检查民警警号
	private String  jcmjxm ;   // 检查民警姓名
	private String  jcrq ;   // 检查日期
	private String  jcqkms ;   // 检查情况描述
	/*
	private String  xczp ;   // 现场照片
	private String  yhzp ;   // 隐患照片
	*/
	private String  yhms ;   // 隐患描述
	private String  mjclyj ;   // 民警处理意见
	private String  mjcl ;   // 民警处理
	private String  mjzgqx ;   // 民警整改期限
	private String  tjsldjh ;   // 提交所领导警号
	private String  tjsldxm ;   // 提交所领导姓名
	private String  yhtjmjjh ;   // 隐患提交民警警号
	private String  yhtjmjxm ;   // 隐患提交民警姓名
	private String  mjclsj ;   // 民警处理时间
	private String  sldspyj ;   // 所领导审批意见
	private String  sldzgqx ;   // 所领导整改期限
	private String  sldcl ;   // 所领导处理
	private String  sldjh ;   // 所领导警号
	private String  sldxm ;   // 所领导姓名
	private String  sldspsj ;   // 所领导审批时间
	private String  czbs ;   // 操作标识
	private String  sfsp ;   // 是否审批（1：已审批 0：未审批）
	private String  czrsfzh ;   // 操作人身份证
	private String  jzzd01 ;   // （内保重点单位）制定和落实内部治安保卫制度
	private String  jzzd02 ;   // （内保重点单位）制定单位内部治安突发事件处置紧急预案
	private String  jzzd03 ;   // （内保重点单位）组织开展紧急预案演练
	private String  jzzd04 ;   // （内保重点单位）设置治安保卫机构
	private String  jzzd05 ;   // （内保重点单位）配备专职保卫人员
	private String  jzzd06 ;   // （内保重点单位）落实内部治安保卫工作责任制
	private String  jzzd07 ;   // （内保重点单位）对员工安全防范培训
	private String  jzzd08 ;   // （内保重点单位）人员、物品、车辆出入登记手续
	private String  jzsp01 ;   // （内保重点单位）重点要害部位安装入侵报警系统
	private String  jzsp02 ;   // （内保重点单位）重点要害部位安装的入侵报警系统与市局110联网
	private String  jzsp03 ;   // （内保重点单位）重点要害部位安装视频监控
	private String  jzsp04 ;   // （内保重点单位）视频监控图像
	private String  jzsp05 ;   // （内保重点单位）回放图像质量
	private String  jzba03 ;   // （内保重点单位）保安员是否着符合要求的保安员服装上岗
	private String  jzba04 ;   // （内保重点单位）保安员是否认真履职，有较强的安全防范意识
	private String  gxjf06 ;   // （内保高校检查）设置监控中心并24小时值守
	private String  gxjf07 ;   // （内保高校检查）视频监控和回放图像质量清晰，监控24小时录像，存储时间不少于30天
	private String  gxjf08 ;   // （内保高校检查）学校所属的学生宿舍（公寓）出入口安装门禁系统
	private String  gxwf01 ;   // （内保高校检查）学校主要出入口安装防撞击金属门
	private String  gxwf02 ;   // （内保高校检查）学校主要出入口、主干道设置机动车减速装置
	private String  gxwf03 ;   // （内保高校检查）重点要害部位安装符合标准的防盗门、窗或金属护栏
	private String  gxwf04 ;   // （内保高校检查）财务室保险箱与墙面或地面固定
	private String  gxwf05 ;   // （内保高校检查）对供水、供电、供气、供热、供油等场所、部位设置相应的实体防护设施
	private String  gxwf06 ;   // （内保高校检查）对高台、楼梯、水域等易发生坠落、踩踏、溺水等安全事故的场所、部位设置警示标志和相应的防护设施
	private String  gxrf01 ;   // （内保高校检查）设置专职安全保卫机构
	private String  gxrf02 ;   // （内保高校检查）配备专职保卫力量和保安人员
	private String  gxrf03 ;   // （内保高校检查）主要出入口保安（门卫）人员24小时在岗
	private String  gxrf04 ;   // （内保高校检查）主要出入口保安（门卫）人员对外来人员、车辆实行登记、确认、查验管理
	private String  gxba01 ;   // （内保高校检查）保安员全部持《保安员证》上岗
	private String  gxba02 ;   // （内保高校检查）定期开展教育、培训
	private String  gxba03 ;   // （内保高校检查）保安员是否着符合要求的保安员服装上岗
	private String  gxba04 ;   // （内保高校检查）保安员是否认真履职，有较强的安全防范意识
	private String  jrzd01 ;   // (银行、金融机构-内保民警)制定和落实内部治安保卫制度
	private String  jrzd02 ;   // (银行、金融机构-内保民警)制定单位内部治安突发事件处置紧急预案
	private String  jrzd03 ;   // (银行、金融机构-内保民警)组织开展紧急预案演练
	private String  jrzd04 ;   // (银行、金融机构-内保民警)设置治安保卫机构
	private String  jrzd05 ;   // (银行、金融机构-内保民警)配备专职保卫人员或兼职保卫人员
	private String  jrzd06 ;   // (银行、金融机构-内保民警)落实内部治安保卫工作责任制
	private String  jrzd07 ;   // (银行、金融机构-内保民警)对员工安全防范培训
	private String  jrjf01 ;   // (银行、金融机构-内保民警)营业网点大厅、库包交接视频监控全覆盖
	private String  jrjf02 ;   // (银行、金融机构-内保民警)营业网点出入口现金和非现金区域安装视频监控（含隐蔽探头）
	private String  jrjf03 ;   // (银行、金融机构-内保民警)营业网点大厅、出入口、现金区域、沿街门窗安装入侵报警
	private String  jrjf04 ;   // (银行、金融机构-内保民警)现金和非现金柜台安装紧急按钮
	private String  jrjf05 ;   // (银行、金融机构-内保民警)自助银行应安装环境、门外、现金装填区域视频监控
	private String  jrjf06 ;   // (银行、金融机构-内保民警)自助银行能实现报警图像、声音、对讲广播等信息的远程传输和监控功能
	private String  jrjf07 ;   // (银行、金融机构-内保民警)自助银行安装紧急求助按钮或求助电话及防电信诈骗语音提示
	private String  jrjf08 ;   // (银行、金融机构-内保民警)自助银行现金装填区安装有、无线入侵报警
	private String  jrjf09 ;   // (银行、金融机构-内保民警)视频监控回放图像清晰，保存时间不少于30天，实现远程监控
	private String  jrjf10 ;   // (银行、金融机构-内保民警)自助设备视频监控系统具有自检功能，死机时能自动重启
	private String  jrjf11 ;   // (银行、金融机构-内保民警)自助设备电子屏幕显示必要的安全提示
	private String  jrjf12 ;   // (银行、金融机构-内保民警)离行式自助设备安装环境视频监控及防电信诈骗语音提示
	private String  jrjf13 ;   // (银行、金融机构-内保民警)离行式自助设备安装防撬和入侵报警装置
	private String  jrjf14 ;   // (银行、金融机构-内保民警)其他技防符合GA38-2004、GA745-2008规定
	private String  jrwf01 ;   // (银行、金融机构-内保民警)营业网点出入口防盗门 
	private String  jrwf02 ;   // (银行、金融机构-内保民警)营业网点二层（含二层）以下防盗窗或防弹玻璃
	private String  jrwf03 ;   // (银行、金融机构-内保民警)自助设备与安装地面牢固连接
	private String  jrwf04 ;   // (银行、金融机构-内保民警)自助设备各种外接线缆有防护措施，接插件应置于封闭的刚性防护体内
	private String  jrwf05 ;   // (银行、金融机构-内保民警)离行式自助设备加钞区应在砖墙或钢质封闭区内
	private String  jrwf06 ;   // (银行、金融机构-内保民警)其他物防符合GA38-2004、GA745-2008规定
	private String  jrrf01 ;   // (银行、金融机构-内保民警)配备专职保卫人员
	private String  jrrf02 ;   // (银行、金融机构-内保民警)定期开展教育、培训
	private String  jrrf03 ;   // (银行、金融机构-内保民警)配备使用防卫器械和报警装备
	private String  jrrf04 ;   // (银行、金融机构-内保民警)保卫力量巡逻巡更设备
	private String  jr_jzba01 ;   // (银行、金融机构-内保民警)保安员全部持《保安员证》上岗
	private String  jr_jzba02 ;   // (银行、金融机构-内保民警)定期开展教育、培训 
	private String  jr_jzba03 ;   // (银行、金融机构-内保民警)保安员是否着符合要求的保安员服装上岗
	private String  jr_jzba04 ;   // (银行、金融机构-内保民警)保安员是否认真履职，有较强的安全防范意识
	private String  jzrf01 ;   // （内保重点单位）配备足够数量的安保人员
	private String  jzrf02 ;   // （内保重点单位）进行上岗前培训和定期开展培训
	private String  jzrf03 ;   // （内保重点单位）配备使用防卫器械和报警装备
	private String  dzba01 ;   // （内保党政机关）保安员全部持《保安员证》上岗
	private String  dzba02 ;   // （内保党政机关）定期开展教育、培训
	private String  dzba03 ;   // （内保党政机关）保安员是否着符合要求的保安员服装上岗
	private String  dzba04 ;   // （内保党政机关）保安员是否认真履职，有较强的安全防范意识
	private String  jzwf02 ;   // （内保重点单位）重点要害部位防盗窗
	private String  jzwf03 ;   // （内保重点单位）财务室防盗门
	private String  jzwf04 ;   // （内保重点单位）财务室防盗窗
	private String  jzwf05 ;   // （内保重点单位）财务室保险箱是否与墙面或地面固定
	private String  j1zd01 ;   // （内保一般单位）制定和落实内部治安保卫制度
	private String  j1zd03 ;   // （内保一般单位）落实内部治安保卫工作责任制
	private String  j1zd04 ;   // （内保一般单位）落实员工安全防范培训教育
	private String  jzrf04 ;   // （内保重点单位）重点要害部位值守力量是否到位
	private String  j1zd05 ;   // （内保一般单位）人员物品出入登记手续
	private String  j1jf01 ;   // （内保一般单位）重点要害部位安装视频监控或入侵报警系统
	private String  j1jf02 ;   // （内保一般单位）视频监控或入侵报警系统运转正常
	private String  j1wf01 ;   // （内保一般单位）重点要害部位出入口防盗门
	private String  j1wf02 ;   // （内保一般单位）重点要害部位防盗窗
	private String  j1wf03 ;   // （内保一般单位）财务室防盗门
	private String  j1wf04 ;   // （内保一般单位）财务室防盗窗
	private String  j1rf01 ;   // （内保一般单位）配备足够数量的安保人员
	private String  j1rf02 ;   // （内保一般单位）进行上岗前培训和定期开展培训
	private String  j1rf03 ;   // （内保一般单位）配备使用防卫器械和报警装备
	private String  j1ba01 ;   // （内保一般单位）保安员全部持《保安员证》上岗
	private String  j1ba02 ;   // （内保一般单位）定期开展教育、培训
	private String  j1ba03 ;   // （内保一般单位）保安员是否着符合要求的保安员服装上岗
	private String  j1ba04 ;   // （内保一般单位）保安员是否认真履职，有较强的安全防范意识
	private String  dzzd01 ;   // （内保党政机关）制定和落实内部治安保卫制度及工作责任制
	private String  dzzd02 ;   // （内保党政机关）制定突发事件处置紧急预案并组织开展演练
	private String  dzzd03 ;   // （内保党政机关）落实员工安全防范培训教育
	private String  dzzd04 ;   // （内保党政机关）门卫实行人员物品出入查验登记手续
	private String  dzjf01 ;   // （内保党政机关）机关大院主要出入口安装视频监控
	private String  dzjf02 ;   // （内保党政机关）重点要害部位安装视频监控和入侵报警
	private String  dzjf03 ;   // （内保党政机关）公共部门主要通道安装视频监控
	private String  dzjf04 ;   // （内保党政机关）车库（地下车库）安装视频监控装置
	private String  dzjf05 ;   // （内保党政机关）设置周界报警装置
	private String  dzjf06 ;   // （内保党政机关）设置监控中心，对重要防护部位24小时实时报警
	private String  dzjf07 ;   // （内保党政机关）重点要害部位、办公大楼出入口安装门禁控制装置
	private String  dzjf08 ;   // （内保党政机关）视频监控和回放图像质量、图像存储时间、监控录制时间达标情况
	private String  dzwf01 ;   // （内保党政机关）机关大院出入口安装门禁门
	private String  dzwf02 ;   // （内保党政机关）重点要害部位出入口安装防盗门
	private String  dzwf03 ;   // （内保党政机关）重点要害部位安装防盗门、防盗窗
	private String  dzrf01 ;   // （内保党政机关）设置治安保卫机构并配备专职保卫人员
	private String  dzrf02 ;   // （内保党政机关）出入口设值班室、专职门卫
	private String  dzrf03 ;   // （内保党政机关）配备使用防卫器械和报警装备
	private String  dzrf04 ;   // （内保党政机关）设置保卫力量巡逻巡更设备
	private String  jzba01 ;   // （内保重点单位）保安员全部持《保安员证》上岗
	private String  jzba02 ;   // （内保重点单位）定期开展教育、培训
	private String  jzsp06 ;   // （内保重点单位）图像存储时间满足规定的30天期限要求
	private String  jzsp07 ;   // （内保重点单位）监控录制时间24小时
	private String  jzbj02 ;   // （内保重点单位）重点区域安装周界报警
	private String  jzbj08 ;   // （内保重点单位）主要出入口门禁系统
	private String  jzwf01 ;   // （内保重点单位）重点要害部位出入口防盗门
	private String  wszd01 ;   // （内保卫生系统）制定和落实内部治安保卫制度及工作责任制
	private String  wszd02 ;   // （内保卫生系统）制定突发事件处置紧急预案并组织开展演练
	private String  wszd03 ;   // （内保卫生系统）落实员工安全防范培训教育
	private String  wszd04 ;   // （内保卫生系统）设立警务室
	private String  wsjs01 ;   // （内保卫生系统）医院出入口及主要通道安装视频监控
	private String  wsjs02 ;   // （内保卫生系统）停车场或地下机动车库通往地面的出口处安装视频监控
	private String  wsjs03 ;   // （内保卫生系统）挂号、收费或现金结算处安装视频监控
	private String  wsjs04 ;   // （内保卫生系统）门急诊输液室、急诊抢救室、重症监护室安装视频监控
	private String  wsjs05 ;   // （内保卫生系统）药库房和放射源或剧毒麻醉药品存放地安装视频监控及入侵报警系统
	private String  wsjs06 ;   // （内保卫生系统）电梯、配电间、贵重仪器设备存放地安装视频监控
	private String  wsjs07 ;   // （内保卫生系统）病区过道走廊以及医患沟通部门安装视频监控
	private String  wsjs08 ;   // （内保卫生系统）重症监护室、院长办公室安装门禁装置
	private String  wsjs09 ;   // （内保卫生系统）设置安防控制中心，图像回放质量、图像存储时间、监控录制时间均应达标
	private String  wswf01 ;   // （内保卫生系统）医院周界封闭屏障应安装金属防护栏或实体墙
	private String  wswf02 ;   // （内保卫生系统）药库房、剧毒精麻药品存放地、放射源、中心供氧站、配电间、挂号收费处、安防控制中心等部位应安装防盗门和金属防护栏
	private String  wsrf01 ;   // （内保卫生系统）设置与治安保卫任务相适应的治安保卫机构
	private String  wsrf02 ;   // （内保卫生系统）配备专职保卫人员
	private String  wsrf03 ;   // （内保卫生系统）安防控制中心有专人值守并做好值班记录
	private String  wsba01 ;   // （内保卫生系统）保安员全部持《保安员证》上岗
	private String  wsba02 ;   // （内保卫生系统）定期开展教育、培训
	private String  wsba03 ;   // （内保卫生系统）保安员是否着符合要求的保安员服装上岗
	private String  wsba04 ;   // （内保卫生系统）保安员是否认真履职，有较强的安全防范意识
	private String  gxzd01 ;   // （内保高校检查）制定和落实内部治安保卫制度及工作责任制
	private String  gxzd02 ;   // （内保高校检查）针对各类突发事件、灾害事件、安全事故等制定紧急处置预案
	private String  gxzd03 ;   // （内保高校检查）根据预案每年至少组织一次演练
	private String  gxzd04 ;   // （内保高校检查）落实师生及员工的安全防范培训教育
	private String  gxjf01 ;   // （内保高校检查）学校主要出入口安装视频监控
	private String  gxjf02 ;   // （内保高校检查）重点要害部位安装视频监控
	private String  gxjf03 ;   // （内保高校检查）重点要害部位安装入侵报警装置
	private String  gxjf04 ;   // （内保高校检查）校内公共部位主要通道安装视频监控
	private String  gxjf05 ;   // （内保高校检查）停车场、车库（地下车库）安装视频监控装置
	public boolean isIssave() {
		return issave;
	}
	public void setIssave(boolean issave) {
		this.issave = issave;
	}
	public String getYhzd01() {
		return yhzd01;
	}
	public void setYhzd01(String yhzd01) {
		this.yhzd01 = yhzd01;
	}
	public String getYhzd02() {
		return yhzd02;
	}
	public void setYhzd02(String yhzd02) {
		this.yhzd02 = yhzd02;
	}
	public String getYhzd03() {
		return yhzd03;
	}
	public void setYhzd03(String yhzd03) {
		this.yhzd03 = yhzd03;
	}
	public String getYhjf01() {
		return yhjf01;
	}
	public void setYhjf01(String yhjf01) {
		this.yhjf01 = yhjf01;
	}
	public String getYhjf02() {
		return yhjf02;
	}
	public void setYhjf02(String yhjf02) {
		this.yhjf02 = yhjf02;
	}
	public String getYhjf04() {
		return yhjf04;
	}
	public void setYhjf04(String yhjf04) {
		this.yhjf04 = yhjf04;
	}
	public String getYhjf05() {
		return yhjf05;
	}
	public void setYhjf05(String yhjf05) {
		this.yhjf05 = yhjf05;
	}
	public String getYhjf06() {
		return yhjf06;
	}
	public void setYhjf06(String yhjf06) {
		this.yhjf06 = yhjf06;
	}
	public String getYhwf01() {
		return yhwf01;
	}
	public void setYhwf01(String yhwf01) {
		this.yhwf01 = yhwf01;
	}
	public String getYhwf02() {
		return yhwf02;
	}
	public void setYhwf02(String yhwf02) {
		this.yhwf02 = yhwf02;
	}
	public String getYhrf01() {
		return yhrf01;
	}
	public void setYhrf01(String yhrf01) {
		this.yhrf01 = yhrf01;
	}
	public String getYhrf02() {
		return yhrf02;
	}
	public void setYhrf02(String yhrf02) {
		this.yhrf02 = yhrf02;
	}
	public String getYhrf03() {
		return yhrf03;
	}
	public void setYhrf03(String yhrf03) {
		this.yhrf03 = yhrf03;
	}
	public String getYh_jzba01() {
		return yh_jzba01;
	}
	public void setYh_jzba01(String yh_jzba01) {
		this.yh_jzba01 = yh_jzba01;
	}
	public String getYh_jzba02() {
		return yh_jzba02;
	}
	public void setYh_jzba02(String yh_jzba02) {
		this.yh_jzba02 = yh_jzba02;
	}
	public String getYh_jzba03() {
		return yh_jzba03;
	}
	public void setYh_jzba03(String yh_jzba03) {
		this.yh_jzba03 = yh_jzba03;
	}
	public String getYh_jzba04() {
		return yh_jzba04;
	}
	public void setYh_jzba04(String yh_jzba04) {
		this.yh_jzba04 = yh_jzba04;
	}
	public String getJyzd01() {
		return jyzd01;
	}
	public void setJyzd01(String jyzd01) {
		this.jyzd01 = jyzd01;
	}
	public String getJyzd02() {
		return jyzd02;
	}
	public void setJyzd02(String jyzd02) {
		this.jyzd02 = jyzd02;
	}
	public String getJyzd03() {
		return jyzd03;
	}
	public void setJyzd03(String jyzd03) {
		this.jyzd03 = jyzd03;
	}
	public String getJyzd04() {
		return jyzd04;
	}
	public void setJyzd04(String jyzd04) {
		this.jyzd04 = jyzd04;
	}
	public String getJyzd05() {
		return jyzd05;
	}
	public void setJyzd05(String jyzd05) {
		this.jyzd05 = jyzd05;
	}
	public String getJyzd06() {
		return jyzd06;
	}
	public void setJyzd06(String jyzd06) {
		this.jyzd06 = jyzd06;
	}
	public String getJyzd07() {
		return jyzd07;
	}
	public void setJyzd07(String jyzd07) {
		this.jyzd07 = jyzd07;
	}
	public String getJyzd08() {
		return jyzd08;
	}
	public void setJyzd08(String jyzd08) {
		this.jyzd08 = jyzd08;
	}
	public String getJyzd09() {
		return jyzd09;
	}
	public void setJyzd09(String jyzd09) {
		this.jyzd09 = jyzd09;
	}
	public String getJysp01() {
		return jysp01;
	}
	public void setJysp01(String jysp01) {
		this.jysp01 = jysp01;
	}
	public String getJysp02() {
		return jysp02;
	}
	public void setJysp02(String jysp02) {
		this.jysp02 = jysp02;
	}
	public String getJysp03() {
		return jysp03;
	}
	public void setJysp03(String jysp03) {
		this.jysp03 = jysp03;
	}
	public String getJysp04() {
		return jysp04;
	}
	public void setJysp04(String jysp04) {
		this.jysp04 = jysp04;
	}
	public String getJysp05() {
		return jysp05;
	}
	public void setJysp05(String jysp05) {
		this.jysp05 = jysp05;
	}
	public String getJysp06() {
		return jysp06;
	}
	public void setJysp06(String jysp06) {
		this.jysp06 = jysp06;
	}
	public String getJysp07() {
		return jysp07;
	}
	public void setJysp07(String jysp07) {
		this.jysp07 = jysp07;
	}
	public String getJysp08() {
		return jysp08;
	}
	public void setJysp08(String jysp08) {
		this.jysp08 = jysp08;
	}
	public String getJybj01() {
		return jybj01;
	}
	public void setJybj01(String jybj01) {
		this.jybj01 = jybj01;
	}
	public String getJybj02() {
		return jybj02;
	}
	public void setJybj02(String jybj02) {
		this.jybj02 = jybj02;
	}
	public String getJybj03() {
		return jybj03;
	}
	public void setJybj03(String jybj03) {
		this.jybj03 = jybj03;
	}
	public String getJybj04() {
		return jybj04;
	}
	public void setJybj04(String jybj04) {
		this.jybj04 = jybj04;
	}
	public String getJybj05() {
		return jybj05;
	}
	public void setJybj05(String jybj05) {
		this.jybj05 = jybj05;
	}
	public String getJywf01() {
		return jywf01;
	}
	public void setJywf01(String jywf01) {
		this.jywf01 = jywf01;
	}
	public String getJywf02() {
		return jywf02;
	}
	public void setJywf02(String jywf02) {
		this.jywf02 = jywf02;
	}
	public String getJywf03() {
		return jywf03;
	}
	public void setJywf03(String jywf03) {
		this.jywf03 = jywf03;
	}
	public String getJywf04() {
		return jywf04;
	}
	public void setJywf04(String jywf04) {
		this.jywf04 = jywf04;
	}
	public String getJyrf01() {
		return jyrf01;
	}
	public void setJyrf01(String jyrf01) {
		this.jyrf01 = jyrf01;
	}
	public String getJyrf02() {
		return jyrf02;
	}
	public void setJyrf02(String jyrf02) {
		this.jyrf02 = jyrf02;
	}
	public String getJy_jzba01() {
		return jy_jzba01;
	}
	public void setJy_jzba01(String jy_jzba01) {
		this.jy_jzba01 = jy_jzba01;
	}
	public String getJy_jzba02() {
		return jy_jzba02;
	}
	public void setJy_jzba02(String jy_jzba02) {
		this.jy_jzba02 = jy_jzba02;
	}
	public String getJy_jzba03() {
		return jy_jzba03;
	}
	public void setJy_jzba03(String jy_jzba03) {
		this.jy_jzba03 = jy_jzba03;
	}
	public String getJy_jzba04() {
		return jy_jzba04;
	}
	public void setJy_jzba04(String jy_jzba04) {
		this.jy_jzba04 = jy_jzba04;
	}
	public String getZbzd01() {
		return zbzd01;
	}
	public void setZbzd01(String zbzd01) {
		this.zbzd01 = zbzd01;
	}
	public String getZbzd02() {
		return zbzd02;
	}
	public void setZbzd02(String zbzd02) {
		this.zbzd02 = zbzd02;
	}
	public String getZbzd03() {
		return zbzd03;
	}
	public void setZbzd03(String zbzd03) {
		this.zbzd03 = zbzd03;
	}
	public String getZbzd04() {
		return zbzd04;
	}
	public void setZbzd04(String zbzd04) {
		this.zbzd04 = zbzd04;
	}
	public String getZbzd05() {
		return zbzd05;
	}
	public void setZbzd05(String zbzd05) {
		this.zbzd05 = zbzd05;
	}
	public String getZbsp01() {
		return zbsp01;
	}
	public void setZbsp01(String zbsp01) {
		this.zbsp01 = zbsp01;
	}
	public String getZbsp02() {
		return zbsp02;
	}
	public void setZbsp02(String zbsp02) {
		this.zbsp02 = zbsp02;
	}
	public String getZbsp03() {
		return zbsp03;
	}
	public void setZbsp03(String zbsp03) {
		this.zbsp03 = zbsp03;
	}
	public String getZbsp04() {
		return zbsp04;
	}
	public void setZbsp04(String zbsp04) {
		this.zbsp04 = zbsp04;
	}
	public String getZbsp05() {
		return zbsp05;
	}
	public void setZbsp05(String zbsp05) {
		this.zbsp05 = zbsp05;
	}
	public String getZbsp06() {
		return zbsp06;
	}
	public void setZbsp06(String zbsp06) {
		this.zbsp06 = zbsp06;
	}
	public String getZbsp07() {
		return zbsp07;
	}
	public void setZbsp07(String zbsp07) {
		this.zbsp07 = zbsp07;
	}
	public String getZbbj01() {
		return zbbj01;
	}
	public void setZbbj01(String zbbj01) {
		this.zbbj01 = zbbj01;
	}
	public String getZbbj02() {
		return zbbj02;
	}
	public void setZbbj02(String zbbj02) {
		this.zbbj02 = zbbj02;
	}
	public String getZbbj03() {
		return zbbj03;
	}
	public void setZbbj03(String zbbj03) {
		this.zbbj03 = zbbj03;
	}
	public String getZbbj04() {
		return zbbj04;
	}
	public void setZbbj04(String zbbj04) {
		this.zbbj04 = zbbj04;
	}
	public String getZbbj05() {
		return zbbj05;
	}
	public void setZbbj05(String zbbj05) {
		this.zbbj05 = zbbj05;
	}
	public String getZbbj06() {
		return zbbj06;
	}
	public void setZbbj06(String zbbj06) {
		this.zbbj06 = zbbj06;
	}
	public String getZbwf01() {
		return zbwf01;
	}
	public void setZbwf01(String zbwf01) {
		this.zbwf01 = zbwf01;
	}
	public String getZbwf02() {
		return zbwf02;
	}
	public void setZbwf02(String zbwf02) {
		this.zbwf02 = zbwf02;
	}
	public String getZbwf03() {
		return zbwf03;
	}
	public void setZbwf03(String zbwf03) {
		this.zbwf03 = zbwf03;
	}
	public String getZbwf04() {
		return zbwf04;
	}
	public void setZbwf04(String zbwf04) {
		this.zbwf04 = zbwf04;
	}
	public String getZbrf01() {
		return zbrf01;
	}
	public void setZbrf01(String zbrf01) {
		this.zbrf01 = zbrf01;
	}
	public String getZbrf02() {
		return zbrf02;
	}
	public void setZbrf02(String zbrf02) {
		this.zbrf02 = zbrf02;
	}
	public String getSc_jzba01() {
		return sc_jzba01;
	}
	public void setSc_jzba01(String sc_jzba01) {
		this.sc_jzba01 = sc_jzba01;
	}
	public String getSc_jzba02() {
		return sc_jzba02;
	}
	public void setSc_jzba02(String sc_jzba02) {
		this.sc_jzba02 = sc_jzba02;
	}
	public String getSc_jzba03() {
		return sc_jzba03;
	}
	public void setSc_jzba03(String sc_jzba03) {
		this.sc_jzba03 = sc_jzba03;
	}
	public String getSc_jzba04() {
		return sc_jzba04;
	}
	public void setSc_jzba04(String sc_jzba04) {
		this.sc_jzba04 = sc_jzba04;
	}
	public String getWhzd01() {
		return whzd01;
	}
	public void setWhzd01(String whzd01) {
		this.whzd01 = whzd01;
	}
	public String getWhzd02() {
		return whzd02;
	}
	public void setWhzd02(String whzd02) {
		this.whzd02 = whzd02;
	}
	public String getWhzd03() {
		return whzd03;
	}
	public void setWhzd03(String whzd03) {
		this.whzd03 = whzd03;
	}
	public String getWhzd04() {
		return whzd04;
	}
	public void setWhzd04(String whzd04) {
		this.whzd04 = whzd04;
	}
	public String getWhjf01() {
		return whjf01;
	}
	public void setWhjf01(String whjf01) {
		this.whjf01 = whjf01;
	}
	public String getWhjf02() {
		return whjf02;
	}
	public void setWhjf02(String whjf02) {
		this.whjf02 = whjf02;
	}
	public String getWhjf03() {
		return whjf03;
	}
	public void setWhjf03(String whjf03) {
		this.whjf03 = whjf03;
	}
	public String getWhjf04() {
		return whjf04;
	}
	public void setWhjf04(String whjf04) {
		this.whjf04 = whjf04;
	}
	public String getWhjf05() {
		return whjf05;
	}
	public void setWhjf05(String whjf05) {
		this.whjf05 = whjf05;
	}
	public String getWhjf06() {
		return whjf06;
	}
	public void setWhjf06(String whjf06) {
		this.whjf06 = whjf06;
	}
	public String getWhwf01() {
		return whwf01;
	}
	public void setWhwf01(String whwf01) {
		this.whwf01 = whwf01;
	}
	public String getWhwf02() {
		return whwf02;
	}
	public void setWhwf02(String whwf02) {
		this.whwf02 = whwf02;
	}
	public String getWhrf01() {
		return whrf01;
	}
	public void setWhrf01(String whrf01) {
		this.whrf01 = whrf01;
	}
	public String getWhrf02() {
		return whrf02;
	}
	public void setWhrf02(String whrf02) {
		this.whrf02 = whrf02;
	}
	public String getWhrf03() {
		return whrf03;
	}
	public void setWhrf03(String whrf03) {
		this.whrf03 = whrf03;
	}
	public String getWhrf04() {
		return whrf04;
	}
	public void setWhrf04(String whrf04) {
		this.whrf04 = whrf04;
	}
	public String getWhrf05() {
		return whrf05;
	}
	public void setWhrf05(String whrf05) {
		this.whrf05 = whrf05;
	}
	public String getWh_jzba01() {
		return wh_jzba01;
	}
	public void setWh_jzba01(String wh_jzba01) {
		this.wh_jzba01 = wh_jzba01;
	}
	public String getWh_jzba02() {
		return wh_jzba02;
	}
	public void setWh_jzba02(String wh_jzba02) {
		this.wh_jzba02 = wh_jzba02;
	}
	public String getWh_jzba03() {
		return wh_jzba03;
	}
	public void setWh_jzba03(String wh_jzba03) {
		this.wh_jzba03 = wh_jzba03;
	}
	public String getWh_jzba04() {
		return wh_jzba04;
	}
	public void setWh_jzba04(String wh_jzba04) {
		this.wh_jzba04 = wh_jzba04;
	}
	public String getXxzd01() {
		return xxzd01;
	}
	public void setXxzd01(String xxzd01) {
		this.xxzd01 = xxzd01;
	}
	public String getXxzd02() {
		return xxzd02;
	}
	public void setXxzd02(String xxzd02) {
		this.xxzd02 = xxzd02;
	}
	public String getXxzd03() {
		return xxzd03;
	}
	public void setXxzd03(String xxzd03) {
		this.xxzd03 = xxzd03;
	}
	public String getXxzd04() {
		return xxzd04;
	}
	public void setXxzd04(String xxzd04) {
		this.xxzd04 = xxzd04;
	}
	public String getXxzd05() {
		return xxzd05;
	}
	public void setXxzd05(String xxzd05) {
		this.xxzd05 = xxzd05;
	}
	public String getXxzd06() {
		return xxzd06;
	}
	public void setXxzd06(String xxzd06) {
		this.xxzd06 = xxzd06;
	}
	public String getXxjf01() {
		return xxjf01;
	}
	public void setXxjf01(String xxjf01) {
		this.xxjf01 = xxjf01;
	}
	public String getXxjf02() {
		return xxjf02;
	}
	public void setXxjf02(String xxjf02) {
		this.xxjf02 = xxjf02;
	}
	public String getXxjf03() {
		return xxjf03;
	}
	public void setXxjf03(String xxjf03) {
		this.xxjf03 = xxjf03;
	}
	public String getXxjf04() {
		return xxjf04;
	}
	public void setXxjf04(String xxjf04) {
		this.xxjf04 = xxjf04;
	}
	public String getXxwf01() {
		return xxwf01;
	}
	public void setXxwf01(String xxwf01) {
		this.xxwf01 = xxwf01;
	}
	public String getXxwf02() {
		return xxwf02;
	}
	public void setXxwf02(String xxwf02) {
		this.xxwf02 = xxwf02;
	}
	public String getXxwf03() {
		return xxwf03;
	}
	public void setXxwf03(String xxwf03) {
		this.xxwf03 = xxwf03;
	}
	public String getXxwf04() {
		return xxwf04;
	}
	public void setXxwf04(String xxwf04) {
		this.xxwf04 = xxwf04;
	}
	public String getXxwf05() {
		return xxwf05;
	}
	public void setXxwf05(String xxwf05) {
		this.xxwf05 = xxwf05;
	}
	public String getXxrf01() {
		return xxrf01;
	}
	public void setXxrf01(String xxrf01) {
		this.xxrf01 = xxrf01;
	}
	public String getXxrf02() {
		return xxrf02;
	}
	public void setXxrf02(String xxrf02) {
		this.xxrf02 = xxrf02;
	}
	public String getXx_jzba01() {
		return xx_jzba01;
	}
	public void setXx_jzba01(String xx_jzba01) {
		this.xx_jzba01 = xx_jzba01;
	}
	public String getXx_jzba02() {
		return xx_jzba02;
	}
	public void setXx_jzba02(String xx_jzba02) {
		this.xx_jzba02 = xx_jzba02;
	}
	public String getXx_jzba03() {
		return xx_jzba03;
	}
	public void setXx_jzba03(String xx_jzba03) {
		this.xx_jzba03 = xx_jzba03;
	}
	public String getXx_jzba04() {
		return xx_jzba04;
	}
	public void setXx_jzba04(String xx_jzba04) {
		this.xx_jzba04 = xx_jzba04;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJgbh() {
		return jgbh;
	}
	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}
	public String getDwlb() {
		return dwlb;
	}
	public void setDwlb(String dwlb) {
		this.dwlb = dwlb;
	}
	public String getDwmc() {
		return dwmc;
	}
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	public String getSspcsdm() {
		return sspcsdm;
	}
	public void setSspcsdm(String sspcsdm) {
		this.sspcsdm = sspcsdm;
	}
	public String getSspcsmc() {
		return sspcsmc;
	}
	public void setSspcsmc(String sspcsmc) {
		this.sspcsmc = sspcsmc;
	}
	public String getJcmjjh() {
		return jcmjjh;
	}
	public void setJcmjjh(String jcmjjh) {
		this.jcmjjh = jcmjjh;
	}
	public String getJcmjxm() {
		return jcmjxm;
	}
	public void setJcmjxm(String jcmjxm) {
		this.jcmjxm = jcmjxm;
	}
	public String getJcrq() {
		return jcrq;
	}
	public void setJcrq(String jcrq) {
		this.jcrq = jcrq;
	}
	public String getJcqkms() {
		return jcqkms;
	}
	public void setJcqkms(String jcqkms) {
		this.jcqkms = jcqkms;
	}
	/*
	public String getXczp() {
		return xczp;
	}
	public void setXczp(String xczp) {
		this.xczp = xczp;
	}
	public String getYhzp() {
		return yhzp;
	}
	public void setYhzp(String yhzp) {
		this.yhzp = yhzp;
	}
	*/
	public String getYhms() {
		return yhms;
	}
	public void setYhms(String yhms) {
		this.yhms = yhms;
	}
	public String getMjclyj() {
		return mjclyj;
	}
	public void setMjclyj(String mjclyj) {
		this.mjclyj = mjclyj;
	}
	public String getMjcl() {
		return mjcl;
	}
	public void setMjcl(String mjcl) {
		this.mjcl = mjcl;
	}
	public String getMjzgqx() {
		return mjzgqx;
	}
	public void setMjzgqx(String mjzgqx) {
		this.mjzgqx = mjzgqx;
	}
	public String getTjsldjh() {
		return tjsldjh;
	}
	public void setTjsldjh(String tjsldjh) {
		this.tjsldjh = tjsldjh;
	}
	public String getTjsldxm() {
		return tjsldxm;
	}
	public void setTjsldxm(String tjsldxm) {
		this.tjsldxm = tjsldxm;
	}
	public String getYhtjmjjh() {
		return yhtjmjjh;
	}
	public void setYhtjmjjh(String yhtjmjjh) {
		this.yhtjmjjh = yhtjmjjh;
	}
	public String getYhtjmjxm() {
		return yhtjmjxm;
	}
	public void setYhtjmjxm(String yhtjmjxm) {
		this.yhtjmjxm = yhtjmjxm;
	}
	public String getMjclsj() {
		return mjclsj;
	}
	public void setMjclsj(String mjclsj) {
		this.mjclsj = mjclsj;
	}
	public String getSldspyj() {
		return sldspyj;
	}
	public void setSldspyj(String sldspyj) {
		this.sldspyj = sldspyj;
	}
	public String getSldzgqx() {
		return sldzgqx;
	}
	public void setSldzgqx(String sldzgqx) {
		this.sldzgqx = sldzgqx;
	}
	public String getSldcl() {
		return sldcl;
	}
	public void setSldcl(String sldcl) {
		this.sldcl = sldcl;
	}
	public String getSldjh() {
		return sldjh;
	}
	public void setSldjh(String sldjh) {
		this.sldjh = sldjh;
	}
	public String getSldxm() {
		return sldxm;
	}
	public void setSldxm(String sldxm) {
		this.sldxm = sldxm;
	}
	public String getSldspsj() {
		return sldspsj;
	}
	public void setSldspsj(String sldspsj) {
		this.sldspsj = sldspsj;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}
	public String getSfsp() {
		return sfsp;
	}
	public void setSfsp(String sfsp) {
		this.sfsp = sfsp;
	}
	public String getCzrsfzh() {
		return czrsfzh;
	}
	public void setCzrsfzh(String czrsfzh) {
		this.czrsfzh = czrsfzh;
	}
	public String getJzzd01() {
		return jzzd01;
	}
	public void setJzzd01(String jzzd01) {
		this.jzzd01 = jzzd01;
	}
	public String getJzzd02() {
		return jzzd02;
	}
	public void setJzzd02(String jzzd02) {
		this.jzzd02 = jzzd02;
	}
	public String getJzzd03() {
		return jzzd03;
	}
	public void setJzzd03(String jzzd03) {
		this.jzzd03 = jzzd03;
	}
	public String getJzzd04() {
		return jzzd04;
	}
	public void setJzzd04(String jzzd04) {
		this.jzzd04 = jzzd04;
	}
	public String getJzzd05() {
		return jzzd05;
	}
	public void setJzzd05(String jzzd05) {
		this.jzzd05 = jzzd05;
	}
	public String getJzzd06() {
		return jzzd06;
	}
	public void setJzzd06(String jzzd06) {
		this.jzzd06 = jzzd06;
	}
	public String getJzzd07() {
		return jzzd07;
	}
	public void setJzzd07(String jzzd07) {
		this.jzzd07 = jzzd07;
	}
	public String getJzzd08() {
		return jzzd08;
	}
	public void setJzzd08(String jzzd08) {
		this.jzzd08 = jzzd08;
	}
	public String getJzsp01() {
		return jzsp01;
	}
	public void setJzsp01(String jzsp01) {
		this.jzsp01 = jzsp01;
	}
	public String getJzsp02() {
		return jzsp02;
	}
	public void setJzsp02(String jzsp02) {
		this.jzsp02 = jzsp02;
	}
	public String getJzsp03() {
		return jzsp03;
	}
	public void setJzsp03(String jzsp03) {
		this.jzsp03 = jzsp03;
	}
	public String getJzsp04() {
		return jzsp04;
	}
	public void setJzsp04(String jzsp04) {
		this.jzsp04 = jzsp04;
	}
	public String getJzsp05() {
		return jzsp05;
	}
	public void setJzsp05(String jzsp05) {
		this.jzsp05 = jzsp05;
	}
	public String getJzba03() {
		return jzba03;
	}
	public void setJzba03(String jzba03) {
		this.jzba03 = jzba03;
	}
	public String getJzba04() {
		return jzba04;
	}
	public void setJzba04(String jzba04) {
		this.jzba04 = jzba04;
	}
	public String getGxjf06() {
		return gxjf06;
	}
	public void setGxjf06(String gxjf06) {
		this.gxjf06 = gxjf06;
	}
	public String getGxjf07() {
		return gxjf07;
	}
	public void setGxjf07(String gxjf07) {
		this.gxjf07 = gxjf07;
	}
	public String getGxjf08() {
		return gxjf08;
	}
	public void setGxjf08(String gxjf08) {
		this.gxjf08 = gxjf08;
	}
	public String getGxwf01() {
		return gxwf01;
	}
	public void setGxwf01(String gxwf01) {
		this.gxwf01 = gxwf01;
	}
	public String getGxwf02() {
		return gxwf02;
	}
	public void setGxwf02(String gxwf02) {
		this.gxwf02 = gxwf02;
	}
	public String getGxwf03() {
		return gxwf03;
	}
	public void setGxwf03(String gxwf03) {
		this.gxwf03 = gxwf03;
	}
	public String getGxwf04() {
		return gxwf04;
	}
	public void setGxwf04(String gxwf04) {
		this.gxwf04 = gxwf04;
	}
	public String getGxwf05() {
		return gxwf05;
	}
	public void setGxwf05(String gxwf05) {
		this.gxwf05 = gxwf05;
	}
	public String getGxwf06() {
		return gxwf06;
	}
	public void setGxwf06(String gxwf06) {
		this.gxwf06 = gxwf06;
	}
	public String getGxrf01() {
		return gxrf01;
	}
	public void setGxrf01(String gxrf01) {
		this.gxrf01 = gxrf01;
	}
	public String getGxrf02() {
		return gxrf02;
	}
	public void setGxrf02(String gxrf02) {
		this.gxrf02 = gxrf02;
	}
	public String getGxrf03() {
		return gxrf03;
	}
	public void setGxrf03(String gxrf03) {
		this.gxrf03 = gxrf03;
	}
	public String getGxrf04() {
		return gxrf04;
	}
	public void setGxrf04(String gxrf04) {
		this.gxrf04 = gxrf04;
	}
	public String getGxba01() {
		return gxba01;
	}
	public void setGxba01(String gxba01) {
		this.gxba01 = gxba01;
	}
	public String getGxba02() {
		return gxba02;
	}
	public void setGxba02(String gxba02) {
		this.gxba02 = gxba02;
	}
	public String getGxba03() {
		return gxba03;
	}
	public void setGxba03(String gxba03) {
		this.gxba03 = gxba03;
	}
	public String getGxba04() {
		return gxba04;
	}
	public void setGxba04(String gxba04) {
		this.gxba04 = gxba04;
	}
	public String getJrzd01() {
		return jrzd01;
	}
	public void setJrzd01(String jrzd01) {
		this.jrzd01 = jrzd01;
	}
	public String getJrzd02() {
		return jrzd02;
	}
	public void setJrzd02(String jrzd02) {
		this.jrzd02 = jrzd02;
	}
	public String getJrzd03() {
		return jrzd03;
	}
	public void setJrzd03(String jrzd03) {
		this.jrzd03 = jrzd03;
	}
	public String getJrzd04() {
		return jrzd04;
	}
	public void setJrzd04(String jrzd04) {
		this.jrzd04 = jrzd04;
	}
	public String getJrzd05() {
		return jrzd05;
	}
	public void setJrzd05(String jrzd05) {
		this.jrzd05 = jrzd05;
	}
	public String getJrzd06() {
		return jrzd06;
	}
	public void setJrzd06(String jrzd06) {
		this.jrzd06 = jrzd06;
	}
	public String getJrzd07() {
		return jrzd07;
	}
	public void setJrzd07(String jrzd07) {
		this.jrzd07 = jrzd07;
	}
	public String getJrjf01() {
		return jrjf01;
	}
	public void setJrjf01(String jrjf01) {
		this.jrjf01 = jrjf01;
	}
	public String getJrjf02() {
		return jrjf02;
	}
	public void setJrjf02(String jrjf02) {
		this.jrjf02 = jrjf02;
	}
	public String getJrjf03() {
		return jrjf03;
	}
	public void setJrjf03(String jrjf03) {
		this.jrjf03 = jrjf03;
	}
	public String getJrjf04() {
		return jrjf04;
	}
	public void setJrjf04(String jrjf04) {
		this.jrjf04 = jrjf04;
	}
	public String getJrjf05() {
		return jrjf05;
	}
	public void setJrjf05(String jrjf05) {
		this.jrjf05 = jrjf05;
	}
	public String getJrjf06() {
		return jrjf06;
	}
	public void setJrjf06(String jrjf06) {
		this.jrjf06 = jrjf06;
	}
	public String getJrjf07() {
		return jrjf07;
	}
	public void setJrjf07(String jrjf07) {
		this.jrjf07 = jrjf07;
	}
	public String getJrjf08() {
		return jrjf08;
	}
	public void setJrjf08(String jrjf08) {
		this.jrjf08 = jrjf08;
	}
	public String getJrjf09() {
		return jrjf09;
	}
	public void setJrjf09(String jrjf09) {
		this.jrjf09 = jrjf09;
	}
	public String getJrjf10() {
		return jrjf10;
	}
	public void setJrjf10(String jrjf10) {
		this.jrjf10 = jrjf10;
	}
	public String getJrjf11() {
		return jrjf11;
	}
	public void setJrjf11(String jrjf11) {
		this.jrjf11 = jrjf11;
	}
	public String getJrjf12() {
		return jrjf12;
	}
	public void setJrjf12(String jrjf12) {
		this.jrjf12 = jrjf12;
	}
	public String getJrjf13() {
		return jrjf13;
	}
	public void setJrjf13(String jrjf13) {
		this.jrjf13 = jrjf13;
	}
	public String getJrjf14() {
		return jrjf14;
	}
	public void setJrjf14(String jrjf14) {
		this.jrjf14 = jrjf14;
	}
	public String getJrwf01() {
		return jrwf01;
	}
	public void setJrwf01(String jrwf01) {
		this.jrwf01 = jrwf01;
	}
	public String getJrwf02() {
		return jrwf02;
	}
	public void setJrwf02(String jrwf02) {
		this.jrwf02 = jrwf02;
	}
	public String getJrwf03() {
		return jrwf03;
	}
	public void setJrwf03(String jrwf03) {
		this.jrwf03 = jrwf03;
	}
	public String getJrwf04() {
		return jrwf04;
	}
	public void setJrwf04(String jrwf04) {
		this.jrwf04 = jrwf04;
	}
	public String getJrwf05() {
		return jrwf05;
	}
	public void setJrwf05(String jrwf05) {
		this.jrwf05 = jrwf05;
	}
	public String getJrwf06() {
		return jrwf06;
	}
	public void setJrwf06(String jrwf06) {
		this.jrwf06 = jrwf06;
	}
	public String getJrrf01() {
		return jrrf01;
	}
	public void setJrrf01(String jrrf01) {
		this.jrrf01 = jrrf01;
	}
	public String getJrrf02() {
		return jrrf02;
	}
	public void setJrrf02(String jrrf02) {
		this.jrrf02 = jrrf02;
	}
	public String getJrrf03() {
		return jrrf03;
	}
	public void setJrrf03(String jrrf03) {
		this.jrrf03 = jrrf03;
	}
	public String getJrrf04() {
		return jrrf04;
	}
	public void setJrrf04(String jrrf04) {
		this.jrrf04 = jrrf04;
	}
	public String getJr_jzba01() {
		return jr_jzba01;
	}
	public void setJr_jzba01(String jr_jzba01) {
		this.jr_jzba01 = jr_jzba01;
	}
	public String getJr_jzba02() {
		return jr_jzba02;
	}
	public void setJr_jzba02(String jr_jzba02) {
		this.jr_jzba02 = jr_jzba02;
	}
	public String getJr_jzba03() {
		return jr_jzba03;
	}
	public void setJr_jzba03(String jr_jzba03) {
		this.jr_jzba03 = jr_jzba03;
	}
	public String getJr_jzba04() {
		return jr_jzba04;
	}
	public void setJr_jzba04(String jr_jzba04) {
		this.jr_jzba04 = jr_jzba04;
	}
	public String getJzrf01() {
		return jzrf01;
	}
	public void setJzrf01(String jzrf01) {
		this.jzrf01 = jzrf01;
	}
	public String getJzrf02() {
		return jzrf02;
	}
	public void setJzrf02(String jzrf02) {
		this.jzrf02 = jzrf02;
	}
	public String getJzrf03() {
		return jzrf03;
	}
	public void setJzrf03(String jzrf03) {
		this.jzrf03 = jzrf03;
	}
	public String getDzba01() {
		return dzba01;
	}
	public void setDzba01(String dzba01) {
		this.dzba01 = dzba01;
	}
	public String getDzba02() {
		return dzba02;
	}
	public void setDzba02(String dzba02) {
		this.dzba02 = dzba02;
	}
	public String getDzba03() {
		return dzba03;
	}
	public void setDzba03(String dzba03) {
		this.dzba03 = dzba03;
	}
	public String getDzba04() {
		return dzba04;
	}
	public void setDzba04(String dzba04) {
		this.dzba04 = dzba04;
	}
	public String getJzwf02() {
		return jzwf02;
	}
	public void setJzwf02(String jzwf02) {
		this.jzwf02 = jzwf02;
	}
	public String getJzwf03() {
		return jzwf03;
	}
	public void setJzwf03(String jzwf03) {
		this.jzwf03 = jzwf03;
	}
	public String getJzwf04() {
		return jzwf04;
	}
	public void setJzwf04(String jzwf04) {
		this.jzwf04 = jzwf04;
	}
	public String getJzwf05() {
		return jzwf05;
	}
	public void setJzwf05(String jzwf05) {
		this.jzwf05 = jzwf05;
	}
	public String getJ1zd01() {
		return j1zd01;
	}
	public void setJ1zd01(String j1zd01) {
		this.j1zd01 = j1zd01;
	}
	public String getJ1zd03() {
		return j1zd03;
	}
	public void setJ1zd03(String j1zd03) {
		this.j1zd03 = j1zd03;
	}
	public String getJ1zd04() {
		return j1zd04;
	}
	public void setJ1zd04(String j1zd04) {
		this.j1zd04 = j1zd04;
	}
	public String getJzrf04() {
		return jzrf04;
	}
	public void setJzrf04(String jzrf04) {
		this.jzrf04 = jzrf04;
	}
	public String getJ1zd05() {
		return j1zd05;
	}
	public void setJ1zd05(String j1zd05) {
		this.j1zd05 = j1zd05;
	}
	public String getJ1jf01() {
		return j1jf01;
	}
	public void setJ1jf01(String j1jf01) {
		this.j1jf01 = j1jf01;
	}
	public String getJ1jf02() {
		return j1jf02;
	}
	public void setJ1jf02(String j1jf02) {
		this.j1jf02 = j1jf02;
	}
	public String getJ1wf01() {
		return j1wf01;
	}
	public void setJ1wf01(String j1wf01) {
		this.j1wf01 = j1wf01;
	}
	public String getJ1wf02() {
		return j1wf02;
	}
	public void setJ1wf02(String j1wf02) {
		this.j1wf02 = j1wf02;
	}
	public String getJ1wf03() {
		return j1wf03;
	}
	public void setJ1wf03(String j1wf03) {
		this.j1wf03 = j1wf03;
	}
	public String getJ1wf04() {
		return j1wf04;
	}
	public void setJ1wf04(String j1wf04) {
		this.j1wf04 = j1wf04;
	}
	public String getJ1rf01() {
		return j1rf01;
	}
	public void setJ1rf01(String j1rf01) {
		this.j1rf01 = j1rf01;
	}
	public String getJ1rf02() {
		return j1rf02;
	}
	public void setJ1rf02(String j1rf02) {
		this.j1rf02 = j1rf02;
	}
	public String getJ1rf03() {
		return j1rf03;
	}
	public void setJ1rf03(String j1rf03) {
		this.j1rf03 = j1rf03;
	}
	public String getJ1ba01() {
		return j1ba01;
	}
	public void setJ1ba01(String j1ba01) {
		this.j1ba01 = j1ba01;
	}
	public String getJ1ba02() {
		return j1ba02;
	}
	public void setJ1ba02(String j1ba02) {
		this.j1ba02 = j1ba02;
	}
	public String getJ1ba03() {
		return j1ba03;
	}
	public void setJ1ba03(String j1ba03) {
		this.j1ba03 = j1ba03;
	}
	public String getJ1ba04() {
		return j1ba04;
	}
	public void setJ1ba04(String j1ba04) {
		this.j1ba04 = j1ba04;
	}
	public String getDzzd01() {
		return dzzd01;
	}
	public void setDzzd01(String dzzd01) {
		this.dzzd01 = dzzd01;
	}
	public String getDzzd02() {
		return dzzd02;
	}
	public void setDzzd02(String dzzd02) {
		this.dzzd02 = dzzd02;
	}
	public String getDzzd03() {
		return dzzd03;
	}
	public void setDzzd03(String dzzd03) {
		this.dzzd03 = dzzd03;
	}
	public String getDzzd04() {
		return dzzd04;
	}
	public void setDzzd04(String dzzd04) {
		this.dzzd04 = dzzd04;
	}
	public String getDzjf01() {
		return dzjf01;
	}
	public void setDzjf01(String dzjf01) {
		this.dzjf01 = dzjf01;
	}
	public String getDzjf02() {
		return dzjf02;
	}
	public void setDzjf02(String dzjf02) {
		this.dzjf02 = dzjf02;
	}
	public String getDzjf03() {
		return dzjf03;
	}
	public void setDzjf03(String dzjf03) {
		this.dzjf03 = dzjf03;
	}
	public String getDzjf04() {
		return dzjf04;
	}
	public void setDzjf04(String dzjf04) {
		this.dzjf04 = dzjf04;
	}
	public String getDzjf05() {
		return dzjf05;
	}
	public void setDzjf05(String dzjf05) {
		this.dzjf05 = dzjf05;
	}
	public String getDzjf06() {
		return dzjf06;
	}
	public void setDzjf06(String dzjf06) {
		this.dzjf06 = dzjf06;
	}
	public String getDzjf07() {
		return dzjf07;
	}
	public void setDzjf07(String dzjf07) {
		this.dzjf07 = dzjf07;
	}
	public String getDzjf08() {
		return dzjf08;
	}
	public void setDzjf08(String dzjf08) {
		this.dzjf08 = dzjf08;
	}
	public String getDzwf01() {
		return dzwf01;
	}
	public void setDzwf01(String dzwf01) {
		this.dzwf01 = dzwf01;
	}
	public String getDzwf02() {
		return dzwf02;
	}
	public void setDzwf02(String dzwf02) {
		this.dzwf02 = dzwf02;
	}
	public String getDzwf03() {
		return dzwf03;
	}
	public void setDzwf03(String dzwf03) {
		this.dzwf03 = dzwf03;
	}
	public String getDzrf01() {
		return dzrf01;
	}
	public void setDzrf01(String dzrf01) {
		this.dzrf01 = dzrf01;
	}
	public String getDzrf02() {
		return dzrf02;
	}
	public void setDzrf02(String dzrf02) {
		this.dzrf02 = dzrf02;
	}
	public String getDzrf03() {
		return dzrf03;
	}
	public void setDzrf03(String dzrf03) {
		this.dzrf03 = dzrf03;
	}
	public String getDzrf04() {
		return dzrf04;
	}
	public void setDzrf04(String dzrf04) {
		this.dzrf04 = dzrf04;
	}
	public String getJzba01() {
		return jzba01;
	}
	public void setJzba01(String jzba01) {
		this.jzba01 = jzba01;
	}
	public String getJzba02() {
		return jzba02;
	}
	public void setJzba02(String jzba02) {
		this.jzba02 = jzba02;
	}
	public String getJzsp06() {
		return jzsp06;
	}
	public void setJzsp06(String jzsp06) {
		this.jzsp06 = jzsp06;
	}
	public String getJzsp07() {
		return jzsp07;
	}
	public void setJzsp07(String jzsp07) {
		this.jzsp07 = jzsp07;
	}
	public String getJzbj02() {
		return jzbj02;
	}
	public void setJzbj02(String jzbj02) {
		this.jzbj02 = jzbj02;
	}
	public String getJzbj08() {
		return jzbj08;
	}
	public void setJzbj08(String jzbj08) {
		this.jzbj08 = jzbj08;
	}
	public String getJzwf01() {
		return jzwf01;
	}
	public void setJzwf01(String jzwf01) {
		this.jzwf01 = jzwf01;
	}
	public String getWszd01() {
		return wszd01;
	}
	public void setWszd01(String wszd01) {
		this.wszd01 = wszd01;
	}
	public String getWszd02() {
		return wszd02;
	}
	public void setWszd02(String wszd02) {
		this.wszd02 = wszd02;
	}
	public String getWszd03() {
		return wszd03;
	}
	public void setWszd03(String wszd03) {
		this.wszd03 = wszd03;
	}
	public String getWszd04() {
		return wszd04;
	}
	public void setWszd04(String wszd04) {
		this.wszd04 = wszd04;
	}
	public String getWsjs01() {
		return wsjs01;
	}
	public void setWsjs01(String wsjs01) {
		this.wsjs01 = wsjs01;
	}
	public String getWsjs02() {
		return wsjs02;
	}
	public void setWsjs02(String wsjs02) {
		this.wsjs02 = wsjs02;
	}
	public String getWsjs03() {
		return wsjs03;
	}
	public void setWsjs03(String wsjs03) {
		this.wsjs03 = wsjs03;
	}
	public String getWsjs04() {
		return wsjs04;
	}
	public void setWsjs04(String wsjs04) {
		this.wsjs04 = wsjs04;
	}
	public String getWsjs05() {
		return wsjs05;
	}
	public void setWsjs05(String wsjs05) {
		this.wsjs05 = wsjs05;
	}
	public String getWsjs06() {
		return wsjs06;
	}
	public void setWsjs06(String wsjs06) {
		this.wsjs06 = wsjs06;
	}
	public String getWsjs07() {
		return wsjs07;
	}
	public void setWsjs07(String wsjs07) {
		this.wsjs07 = wsjs07;
	}
	public String getWsjs08() {
		return wsjs08;
	}
	public void setWsjs08(String wsjs08) {
		this.wsjs08 = wsjs08;
	}
	public String getWsjs09() {
		return wsjs09;
	}
	public void setWsjs09(String wsjs09) {
		this.wsjs09 = wsjs09;
	}
	public String getWswf01() {
		return wswf01;
	}
	public void setWswf01(String wswf01) {
		this.wswf01 = wswf01;
	}
	public String getWswf02() {
		return wswf02;
	}
	public void setWswf02(String wswf02) {
		this.wswf02 = wswf02;
	}
	public String getWsrf01() {
		return wsrf01;
	}
	public void setWsrf01(String wsrf01) {
		this.wsrf01 = wsrf01;
	}
	public String getWsrf02() {
		return wsrf02;
	}
	public void setWsrf02(String wsrf02) {
		this.wsrf02 = wsrf02;
	}
	public String getWsrf03() {
		return wsrf03;
	}
	public void setWsrf03(String wsrf03) {
		this.wsrf03 = wsrf03;
	}
	public String getWsba01() {
		return wsba01;
	}
	public void setWsba01(String wsba01) {
		this.wsba01 = wsba01;
	}
	public String getWsba02() {
		return wsba02;
	}
	public void setWsba02(String wsba02) {
		this.wsba02 = wsba02;
	}
	public String getWsba03() {
		return wsba03;
	}
	public void setWsba03(String wsba03) {
		this.wsba03 = wsba03;
	}
	public String getWsba04() {
		return wsba04;
	}
	public void setWsba04(String wsba04) {
		this.wsba04 = wsba04;
	}
	public String getGxzd01() {
		return gxzd01;
	}
	public void setGxzd01(String gxzd01) {
		this.gxzd01 = gxzd01;
	}
	public String getGxzd02() {
		return gxzd02;
	}
	public void setGxzd02(String gxzd02) {
		this.gxzd02 = gxzd02;
	}
	public String getGxzd03() {
		return gxzd03;
	}
	public void setGxzd03(String gxzd03) {
		this.gxzd03 = gxzd03;
	}
	public String getGxzd04() {
		return gxzd04;
	}
	public void setGxzd04(String gxzd04) {
		this.gxzd04 = gxzd04;
	}
	public String getGxjf01() {
		return gxjf01;
	}
	public void setGxjf01(String gxjf01) {
		this.gxjf01 = gxjf01;
	}
	public String getGxjf02() {
		return gxjf02;
	}
	public void setGxjf02(String gxjf02) {
		this.gxjf02 = gxjf02;
	}
	public String getGxjf03() {
		return gxjf03;
	}
	public void setGxjf03(String gxjf03) {
		this.gxjf03 = gxjf03;
	}
	public String getGxjf04() {
		return gxjf04;
	}
	public void setGxjf04(String gxjf04) {
		this.gxjf04 = gxjf04;
	}
	public String getGxjf05() {
		return gxjf05;
	}
	public void setGxjf05(String gxjf05) {
		this.gxjf05 = gxjf05;
	}
	public List<NbAqJcZpBean> getNbaqjczplist() {
		return nbaqjczplist;
	}
	public void setNbaqjczplist(List<NbAqJcZpBean> nbaqjczplist) {
		this.nbaqjczplist = nbaqjczplist;
	}
	public String getDwlbmc() {
		if(ValidateHelper.isNotEmptyString(this.dwlb)){
			dwlbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_NBDWLB", this.dwlb);
		}
		return dwlbmc;
	}
	public void setDwlbmc(String dwlbmc) {
		this.dwlbmc = dwlbmc;
	}
	
}
