colModel : [
	{title : '序号',isNumber : true,align : 'center',sortable : false,expand : true,display: true,rowcallback : null,a : true},
	{title : '单位名称',field : 'orgname',align : 'left',sortable : false,expand : true,display: true,rowcallback : null,a : true},
	{title : '总数',field : 'zs',align : 'center',sortable : false,expand : true,display: true,rowcallback : null,a : true}
	{
		title : '实有人口数',composite:true,
		[
			{title : '总数',field : 'zs',align : 'center',sortable : false,expand : true,display: true,rowcallback : null,a : true},
			{title : '总数',field : 'zs',align : 'center',sortable : false,expand : true,display: true,rowcallback : null,a : true}
		]
	}
]