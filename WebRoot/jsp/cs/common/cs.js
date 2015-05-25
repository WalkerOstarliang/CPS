$(function(){
	//$("#zfba_rightbox").width(width - 160)
	$(".zfba_menu").find("a").bind("click",function(){
		$(".zfba_menu").find("a").removeClass("zfba_a").addClass("zfba_b");
		$(this).removeClass("zfba_b").addClass("zfba_a");
		$(".menubox").find("a").removeClass("zfba_e").addClass("zfba_d");
	});
	
	$(".zfba_menu").find("a[class=zfba_c]").bind("click",function(){
		var $this = $(this);
		$(this).next("div[class=menubox]").first().toggle();
	});
	
	$(".menubox").find("a").bind("click",function(){
		$(".menubox").find("a").removeClass("zfba_e").addClass("zfba_d");
		$(this).removeClass("zfba_d").addClass("zfba_e");
	});
});
