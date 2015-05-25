/**一次滚动的距离**/
var img_width;
/**图片移动速度（px/s）**/
var img_v;

/**窗口高度**/
var win_width;
/**窗口宽度**/
var win_height;

/**下翻按钮**/
var down_button;
/**上翻按钮**/
var up_button;
/**图片列表**/
var img_list;
/**图片容器**/
var img_main;
/**显示图片的div**/
var img_show;
/** 是否自身打开 **/
var is_self;


/**操作标识(true:上翻，false:下翻)**/
var op_flag;
/**上翻时间标识**/
var up_time;
/**下翻时间标识**/
var down_time;
/**计数器**/
var number_flag;

/**初始化元素**/
function initElement(){
	img_width = 325;
	img_v = 10;
	
	if(parent.pic){
		is_self = false;
		win_width = parent.document.documentElement.clientWidth ;
		win_height = parent.document.documentElement.clientHeight ;
	}else{
		is_self = true;
		win_width = document.body.clientWidth ;
		win_height = document.body.clientHeight ;
	}
	down_button = document.getElementById("down");
	up_button = document.getElementById("up");
	img_list = document.getElementById("imgList");
	if(is_self){
		img_main = document.getElementById("img_main");
		img_show = document.getElementById("img");
	}
}


/**图片滚动**/
function imgMove(){
	if(op_flag){                /**上翻操作**/
		img_list.scrollLeft = img_list.scrollLeft - img_v;
		number_flag = number_flag - img_v;
		if(number_flag < 0 ){
			clearInterval(up_time); 
		}
	}else{                      /** 下翻操作 **/
		img_list.scrollLeft = img_list.scrollLeft + img_v;
		number_flag = number_flag + img_v;
		
		if(number_flag > img_width){
			clearInterval(down_time);
		}
	}
}

/**显示大图**/
function imgShow(img){
	if(is_self){
		img_main.style.display = "block";
		img_main.style.position = "absolute";
		img_main.style.left = (win_width/2 - img.width/2 - 10) + "px";
		img_main.style.top = (win_height/2 - (img.height/2) - 10) + "px";
		
		img_show.style.width = img.width + "px"; 
		img_show.style.height = img.height + "px";
		img_show.appendChild(img);
	}else{
		var src = img.src;
		img = new Image();
		img.src=src;
		if(parent.document.getElementById("img_main")){
			img_main.style.display = "block";
			img_main.style.position = "absolute";
			img_main.style.left = (win_width/2 - img.width/2 - 10) + "px";
			img_main.style.top = (win_height/2 - (img.height/2) - 10) + "px";
		
			img_show.style.width = img.width + "px"; 
			img_show.style.height = img.height + "px";
			img_show.appendChild(img);
			
		}else{
			
			img_main = parent.document.createElement("div");
			img_main.id = "img_main";
			img_main.style.border = "1xp solid #ccc";
			img_main.style.backgroundColor = "#eee";
			img_main.style.display = "block";
			img_main.style.position = "absolute";
			img_main.style.left = (win_width/2 - img.width/2 - 10) + "px";
			img_main.style.top = (win_height/2 - (img.height/2) - 10) + "px";
			
			img_show = parent.document.createElement("div");
			img_show.style.margin = "5px";
			img_show.style.width = img.width + "px"; 
			img_show.style.height = img.height + "px";
//			img_show.innerHTML = "<img src='" + img.src + "' />";
			
			img_show.appendChild(img);
			img_main.appendChild(img_show);
			parent.document.appendChild(img_main);
		}
	}
}

/**隐藏大图**/
function imgHidden(){
	if(is_self){
		img_main.style.display = "none";
		while(img_show.hasChildNodes()){
			img_show.removeChild(img_show.firstChild);
		}
	}else{
		if(img_main){
			img_main.style.display = "none";
			while(img_show.hasChildNodes()){
				img_show.removeChild(img_show.firstChild);
			}
		}
	}
}

/**加载图片**/
function onloadImg(){
	var imgs = [];
	var lis = [];
	
	var imgs_bak = [];
	for(var i=1;i<=3;i++){
		var img = new Image();
		img.src =  "../pic/ss/"+i+"1.jpg";
		
		var img_bak = img.cloneNode();
		imgs_bak[i-1] = img_bak;
		 
		img.style.width= 60;
		img.style.height = 75;
		imgs[i-1] = img;
	}
	
	if(imgs.length < 5){
		for(var i = 0 ; i < imgs.length;i++){
			var li = document.createElement("li");
		  li.style.styleFloat="none";
			li.appendChild(imgs[i]);
			li.style.cursor = "hand";
			li.setAttribute("index",i);
			
			li.onmouseover = function(){
				var liIndex = this.getAttribute("index");
				this.style.border = "1px solid red";
				imgShow(imgs_bak[liIndex]);
			}
			
			li.onmouseout = function(){
				this.style.border = "1px solid #bbb";
				imgHidden();
			}
			
			lis[i] = li;
		}
	}else{
		for(var i = 0 ; i < imgs.length;i++){
			var li = document.createElement("li");
			li.appendChild(imgs[i]);
			li.style.cursor = "hand";
			li.setAttribute("index",i);
			
			li.onmouseover = function(){
				var liIndex = this.getAttribute("index");
				this.style.border = "1px solid red";
				imgShow(imgs_bak[liIndex]);
			}
			
			li.onmouseout = function(){
				this.style.border = "1px solid #bbb";
				imgHidden();
			}
			lis[i] = li;
		}
	}	

	for(var i = 0 ; i < lis.length ; i++ ){
		img_list.appendChild(lis[i]);
	}
	
}


window.onload = function(){
	initElement();
	onloadImg();
	
	/**下翻操作**/
	down_button.onclick = function(){
		op_flag = false;
		number_flag = 0;
		
		down_time = setInterval("imgMove()",img_v);
	}
	
	/**上翻操作**/
	up_button.onclick = function(){
		op_flag = true;
		number_flag = img_width;
		
		up_time = setInterval("imgMove()",1);
	}
}


