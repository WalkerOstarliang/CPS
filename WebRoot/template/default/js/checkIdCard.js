/**
 * 下面是 身份证号码的规则:

身份证号码共18位.

前6位是地址码.

7--14位是出生年月日

后面4位是生成的代码,

第17位用来做性别判定:偶数 -- 女 ; 奇数--- 男 .

第十八位数字的计算方法为： 
1.将前面的身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2 
2.将这17位数字和系数相乘的结果相加。 
3.用加出来和除以11，看余数是多少？ 
4余数只可能有0 1 2 3 4 5 6 7 8 9 10这11个数字。其分别对应的最后一位身份证的号码为1 0 X 9 8 7 6 5 4 3 2。 
5.通过上面得知如果余数是2，就会在身份证的第18位数字上出现罗马数字的Ⅹ。如果余数是10，身份证的最后一位号码就是2。
 * @param {Object} idCardObj
 * @return {TypeName} 
 */

//校验身份证
function checkIDC (idCardObj) {

	var idCard = $(idCardObj).val();
	var result = isIdCardNoNew(idCard);
	if (result != true)
	{
		return result;
	}
	/**
		var idCard=$(idCardObj).val();
		var msg = "";
	
	    //是否为空  
	    if(idCard == '')  
	    {   msg = "* 请输入身份证号，身份证号不能为空。";
	        return msg;  
	    }  
	    //校验长度，类型  
	    if(isIdCardNo(idCard) == false)  
	    {  
	        msg = "* 您输入的身份证号码不正确，请重新输入。";
	        return msg;  
	    }  
	    //检查省份  
	    if(checkProvince(idCard) == false)  
	    {  
	        msg = "* 您输入的身份证号码不正确，请重新输入。"; 
	        return msg;  
	    }  
	    //校验生日  
	    if(checkBirthday(idCard) == false)  
	    {  
	        msg = "* 您输入的身份证号码不正确，请重新输入。";  
	        return msg;  
	    }
    **/
} 

function isSfzh(sfzh)
{
    //是否为空  
    if(sfzh == "")  
    {   
        return false;  
    }
    //校验长度，类型  
    if(isIdCardNo(sfzh) == false)  
    {  
        return false;  
    }  
    //检查省份  
    if(checkProvince(sfzh) == false)  
    {  
        return false;  
    }  
    //校验生日  
    if(checkBirthday(sfzh) == false)  
    {  
        return false;  
    }
    return true;
}

var vcity = { 11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",  
              21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",  
              33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",  
              42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",  
              51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",  
              63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"  
           	};

//检查号码是否符合规范，包括长度，类型
function isIdCardNo(idCard) {
	//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
    if (isIdCardNoNew(idCard) != true)
    {
    	 return false; 
    }
	return true;
}

//取身份证前两位,校验省份
function checkProvince(idCard) {
	var province = idCard.substr(0,2);  
    if(vcity[province] == undefined)  
    {  
        return false;  
    }  
    return true;
}

//检查生日是否正确 
function checkBirthday(idCard) {
	var len = idCard.length;  
    //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字  
    if(len == 15)  
    {  
        var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;   
        var arr_data = idCard.match(re_fifteen);  
        var year = arr_data[2];  
        var month = arr_data[3];  
        var day = arr_data[4];  
        var birthday = new Date('19'+year+'/'+month+'/'+day);  
        return verifyBirthday('19'+year,month,day,birthday);  
    }  
    //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X  
    if(len == 18)  
    {  
        var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;  
        var arr_data = idCard.match(re_eighteen);  
        var year = arr_data[2];  
        var month = arr_data[3];  
        var day = arr_data[4];  
        var birthday = new Date(year+'/'+month+'/'+day);  
        return verifyBirthday(year,month,day,birthday);  
    }  
    return false;  
}

//校验日期 
function verifyBirthday(year,month,day,birthday) {
	var now = new Date();  
    var now_year = now.getFullYear();  
    //年月日是否合理  
    if(birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day)  
    {  
        //判断年份的范围（0岁到100岁之间)  
        var time = now_year - year;  
       
        if(time >= 0 && time <= 130)  
        {  
            return true;  
        }  
        return false;  
    }  
    return false; 
}

function getCsrqBySfzh(idCard)
{
	var birthday = null;
	if (idCard.length == 15)
	{
		var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;   
        var arr_data = idCard.match(re_fifteen);  
        var year = arr_data[2];  
        var month = arr_data[3];  
        var day = arr_data[4]; 
        birthday = new Date('19'+year+'/'+month+'/'+day);  
	}
	else if (idCard.length == 18)
	{
		var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;  
        var arr_data = idCard.match(re_eighteen);  
        var year = arr_data[2];  
        var month = arr_data[3];  
        var day = arr_data[4];  
        birthday = new Date(year+'/'+month+'/'+day);  
	}
	return birthday;
}


function isIdCardNoNew(num) 
{ 
	var factorArr = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1); 
	var error; 
	var varArray = new Array(); 
	var intValue; 
	var lngProduct = 0; 
	var intCheckDigit; 
	var sfzh = num;
	var intStrLen = num.length; 
	var idNumber = num; 
	if ((intStrLen != 15) && (intStrLen != 18)) 
	{ 
		error = "输入身份证号码长度不对."; 
		return error; 
	} 

	for(i=0;i<intStrLen;i++) 
	{ 
		varArray[i] = idNumber.charAt(i); 
		if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) 
		{ 
			error = "错误的身份证号码."; 
			return error; 
		} 
		else if (i < 17) 
		{ 
			varArray[i] = varArray[i]*factorArr[i]; 
		} 
	} 
	if (intStrLen == 18) 
	{ 
		if (checkDate(sfzh) == false) 
		{ 
			error = "身份证中日期信息不正确."; 
			return error; 
		} 
		for(i=0;i<17;i++) 
		{ 
			lngProduct = lngProduct + varArray[i]; 
		} 
		intCheckDigit = 12 - lngProduct % 11; 
		switch (intCheckDigit) 
		{ 
			case 10: 
				intCheckDigit = 'X'; 
				break; 
			case 11: 
				intCheckDigit = 0; 
				break; 
			case 12: 
				intCheckDigit = 1; 
				break; 
		} 

		if (varArray[17].toUpperCase() != intCheckDigit) 
		{ 
			error = "身份证效验位验证码错误."; 
			return error; 
		} 
	} 
	else
	{ 
		if (checkDate(sfzh) == false) 
		{ 
			error = "身份证号码日期信息有误.";
			return error; 
		} 
	} 
	return true; 
} 

function checkDate(sfzh) 
{ 
	return checkBirthday(sfzh);
} 



function IDNum15To18(_15idnum){
   var _18idnum = "";//升位后18位身份证号码
   var sum = 0;
   var j = 0;
   var w = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);//加权因子
   var a = new Array("1","0","X","9","8","7","6","5","4","3","2");//验证码
   if(_15idnum.length!=15){
	return _15idnum;//如果身份证号码不是15位，返回原来值。
   }else{
       //补充年份80－－>1980
	_18idnum = _15idnum.substring(0,6)+"19"+_15idnum.substring(6);
   }
   //求和
   for(var i = 0 ; i<17; i++){
      j = w[i]*parseInt(_18idnum.substring(i,i+1));
      sum = sum + j;
   }
   //取余数
   sum = sum % 11;
   //添加验证码
   _18idnum = _18idnum +a[sum];
   //返回18位身份证号码
   return _18idnum;	
}
function IDNum18To15(_18idnum){
   var _15idnum = "";
   if(_18idnum.length!=18){
   	return _18idnum;//如果身份证号码不是18位，返回原来值。
   }else{
   	_15idnum = _18idnum.substring(0,6)+_18idnum.substring(8,17);
   }
   return _15idnum;	
}