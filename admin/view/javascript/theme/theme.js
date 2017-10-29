$(document).ready(function() {
	
	$('.btn-toggle').click(function() {
		$(this).find('.btn').toggleClass('btn-success active');  
	});
	
	//======= Create Dropdown as Select =======
	$("ul.store_dropdown li").each(function() {
		var ua = navigator.userAgent,
		event = (ua.match(/iPad/i)) ? "touchstart" : "click";
		
		$(this).bind(event, function(){
			var selText = $(this).children().text();
			$(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
			
			$("ul.store_dropdown li").removeClass("active");
			$(this).addClass("active");
			
			$(".tab-content-main").find('> .tab-pane').removeClass('active');
			$($(this).find('a').attr('href')).addClass('active');
			
		});
	});
	
	//======= Create Cookies ======= 
	var store_id ='';
	$('.main_tabs_vertical li a').bind('click', function(){
		menuTabs = $(this).attr('href').replace('#', '').replace ('tab-', '');
		storeId = menuTabs.substr(menuTabs.length - 1);
		$.cookie('main_tabs_vertical',menuTabs);
		$.cookie('store_id',storeId);
		
	});
	
	main_tabs = $.cookie('main_tabs_vertical');
	store_id = $.cookie('store_id');
	if (main_tabs) changeMainTabs(main_tabs,store_id);
	
	$('.store_dropdown li a').bind('click', function(){
		$.cookie('stores',$(this).attr('href').replace('#', '').replace ('tab-', ''));
	});
	store_tabs = $.cookie('stores');
	if (store_tabs) dropdownStore(store_tabs);
	
	
	//======= Font Setting======= 
	$(".fonts-change").each( function(){
		var $this = this;
		$(".items-font",$this).hide();  
		$(".font-"+$(".type-fonts:checked",$this).val(), this).show();
	 
		$(".type-fonts", this).change( function(){
			$(".items-font",$this).hide();
			$(".font-"+$(this).val(), $this).show();
		} );
	});
	
	
	
})

function dropdownStore($menuItem){
	$(".store_dropdown > li").each(function() {
		if($(this).find('a').attr('href').indexOf($menuItem)!= -1){
			var selText = $(this).children().text();
			$(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
		}
	});
	$(".store_dropdown").find('> li').removeClass('active');
	$(".store_dropdown > li").each(function() {
		if($(this).find('a').attr('href').indexOf($menuItem)!= -1) $(this).addClass('active');
	});
	$(".tab-content-main  > .tab-pane").removeClass('active');
	$(".tab-content-main  > .tab-pane").each(function() {
		$("#tab-" + $menuItem).addClass('active');
		
	});
}

function changeMainTabs($menuItem,$store_id){
	$store_tab = 'tab-store'+$store_id;
	$('#'+$store_tab+' .main_tabs_vertical').find('> li').removeClass('active');
	$('#'+$store_tab+' .main_tabs_vertical > li').each(function() {
		if($(this).find('a').attr('href').indexOf($menuItem)!= -1) $(this).addClass('active');
	});
	$('#'+$store_tab+' .sidebar +.tab-content').find('> .tab-pane').removeClass('active');
	console.log($store_tab);
	$('#'+$store_tab+' .sidebar +.tab-content > .tab-pane').each(function() {
		$("#tab-" + $menuItem).addClass('active');
		
	});
}

