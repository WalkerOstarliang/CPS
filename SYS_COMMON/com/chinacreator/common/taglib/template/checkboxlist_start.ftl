<#assign i=0/>
<#if diclist??>
	<#list diclist as dic>
		<#assign i=i+1/>
		<#assign tm='false'/>
		<#if valueArr??>
			<#list valueArr as v>
				<#if dic.dm?trim==v?trim>
					<#assign tm='true'/>
					<#break/>
				</#if>
			</#list>
		</#if>
		<#if tm=='true'>
		&nbsp;<input type="checkbox"<#rt/>
				<#if id??>
					id="${id?if_exists}_${i}"<#rt/>
				</#if> 
				<#if name??>
				    name="${name?if_exists}"<#rt/>
				</#if> 
				value="${dic.dm}"<#rt/>
				checked="checked"<#rt/> 
				<#if disabled??>
				disabled="disabled"<#rt/>
				</#if>
				/>
				<label>${dic.mc?if_exists}</label>		
		</#if>
		<#if tm=='false'>
		&nbsp;<input type="checkbox"<#rt/>
				<#if id??>
					id="${id?if_exists}_${i}"<#rt/>
				</#if> 
				<#if name??>
				    name="${name?if_exists}"<#rt/>
				</#if> 
				value="${dic.dm}"<#rt/>
				<#if disabled??>
				    disabled="disabled"<#rt/>
				</#if>
				/>
				<label>${dic.mc?if_exists}</label>		
		</#if>
	</#list>
	<#if disabled??>
		<input type="hidden" id="${id?if_exists}_hidden" name="${name?if_exists}" value="${value?if_exists}">
	</#if>
</#if>
