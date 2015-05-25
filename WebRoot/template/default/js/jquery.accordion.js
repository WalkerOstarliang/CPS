(function($){
	$.fn.extend({
		accordion : function(opts)
		{
			return this.each(function(){
				var $this = $(this);
				$this.find("a[class^=left_menu_main_]").bind("click",function(){
					$this.find("a[class^=left_menu_main_]").each(function(){
						$(this).next("div:first").hide();
					})
					$(this).next("div:first").show();
					$this.find("a[class^=left_menu_main_]").removeClass("left_menu_main_a").addClass("left_menu_main_b");
					$(this).removeClass("left_menu_main_b").addClass("left_menu_main_a");
				});
				
				$this.find("a[class^=left_menu_item_]").bind("click",function(){
					$this.find("a[class^=left_menu_item_]").removeClass("left_menu_item_c").addClass("left_menu_item_d");
					$(this).removeClass("left_menu_item_d").addClass("left_menu_item_c");
				});
			});
		}
	})
})(jQuery)