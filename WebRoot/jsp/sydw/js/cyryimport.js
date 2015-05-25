function openSelectJzdpcs(textfieldid)
{
	openDwSelect2({
			rootOrgCode : '430000000000',
			mutilSelect : false,
			nodeSelectedType : "ps",
			nodeNotSelectedType : "ps"
		}, 
		function(orgbean) 
		{
			if (orgbean != null) 
			{
				if (orgbean.leve == 4)
				{
					var jzdpcs = orgbean.id + "-" + orgbean.name;
					$("#" + textfieldid).val(jzdpcs);
				}
				else
				{
					alert("请选择派出所.")
				}
			}
		}
	);
}


function exportCyryZdryList()
{
	$("#cyryformlist").attr("action",contextPath + "/zagl/cyry/exportCyryZdryList.action");
	$("#cyryformlist").attr("target","_blank");
	$("#cyryformlist").submit();
}