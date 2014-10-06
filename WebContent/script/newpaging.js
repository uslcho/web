(function($) {
	$.fn.paginate = function(options) {
		var opts = $.extend({}, $.fn.paginate.defaults, options);
		return this.each(function() {
			$this = $(this);
			var o = $.meta ? $.extend({}, opts, $this.data()) : opts;
			var selectedpage = o.start;
			$.fn.draw(o,$this,selectedpage);	
		});
	};
	var outsidewidth_tmp = 0;
	var insidewidth 	 = 0;
	var bName = navigator.appName;
	var bVer = navigator.appVersion;
	if(bVer.indexOf('MSIE 7.0') > 0)
		var ver = "ie7";

	$.fn.draw = function(o,obj,selectedpage) {

		var _first = $(document.createElement("li")).html("<a onclick='nexpage(1);'>First</a>");
		$this.append(_first)		
		
		if(Number(selectedpage) > 1) {
			var _pre = $(document.createElement("li")).html("<a onclick='nexpage("+Number(selectedpage)+"-1);'>Prev</a>");
			$this.append(_pre)
		}
		
		var pageblock = 10;
		var lastpage = 0;
		var paging = Math.ceil(Number(selectedpage)/pageblock);

		if(Number(paging)*10 > o.count) {
			lastpage = o.count;
		} else {
			lastpage = paging*10;
		}
		
		var startpage = 1;
		if(paging > 1) {
			startpage = (Number(paging-1)*10)+1;
		}
		
		for(var i = startpage; i <= lastpage; i++) {
			var _obj = "";
			
			if(i == selectedpage) {
				_obj = $(document.createElement("li")).addClass("active").html("<a onclick='nexpage("+i+");'>"+ i +"</a>");
			} else {
				_obj = $(document.createElement("li")).html("<a onclick='nexpage("+i+");'>"+ i +"</a>");
			} 
			$this.append(_obj)
		}
		
		if(Number(selectedpage) < Number(o.count)) {
			var _next = $(document.createElement("li")).html("<a onclick='nexpage("+Number(selectedpage)+"+1);'>Next</a>");
			$this.append(_next);
		}
		
		var _last = $(document.createElement("li")).html("<a onclick='nexpage("+o.count+");'>Last</a>");
		$this.append(_last)
	}
	
	$.fn.applystyle = function(o,obj,a_css,hover_css,_first,_ul,_ulwrapdiv,_divwrapright){
				
	}
})(jQuery);