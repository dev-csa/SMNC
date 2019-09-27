/******** viewport 분기 /********/
$(document).ready(function() {	
	(function(doc) {
        var viewport = document.getElementById('viewport');
        if ( navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/Android/i) )  {
            viewport.setAttribute("content", "user-scalable=yes");
        } else if ( navigator.userAgent.match(/iPad/i) ) {
            viewport.setAttribute("content", "user-scalable=yes");
        } else {
            viewport.setAttribute("content", "user-scalable=yes");
        } 
    }(document));
});

/****************/
$(document).ready(function(){
	datepicker(); 
	formCommon();

	trActive();
	tableTheadFixed();

	errorPagePosition();

	// tab
	var $tab_area = $('.tab_area');
	for (var i = 0; i < $tab_area.length; i++) {
		tabEvent($tab_area.eq(i));
	}
});

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
// form ui 공통부분
function formCommon() {
	// form radio, checkbox
	var $label = $('.radioInp label,.checkboxInp label');
	matchLabel($label);
	matchName();
	checkboxAll();
}


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
$(window).resize(function() {

	if ($('.modal.show').length != 0) {
		if ($('.modal.show').length > 1)
		{
			$('.modal.show').each(function(){
				setModalMaxHeight(this);
				setModalMarginTop(this);
			});
		} else {
			setModalMaxHeight($('.modal.show'));
			setModalMarginTop($('.modal.show'));
		}
		
	}
});	

//////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// modal layerpopup window기준 max-height 재설정 // modal-body에 스크롤 생성
var setModalMaxHeight = function(element) {
	this.$element     = $(element);  
	this.$content     = this.$element.find('.modalWrap');
	this.$dialog      = this.$element.find('.modalDialog');

	var borderWidth   = this.$content.outerHeight() - this.$content.innerHeight();
    var dialogMargin  = $(window).width() < 768 ? 80 : 80;
    var contentHeight = $(window).height() - (dialogMargin + borderWidth);
    var headerHeight  = this.$element.find('.modal_header').outerHeight(true) || 0;
    var footerHeight  = this.$element.find('.modal_footer').outerHeight(true) || 0;
    var maxHeight     = contentHeight - (headerHeight + footerHeight);

	this.$content.css({
		'overflow': 'hidden'
	});

	if(this.$dialog.hasClass('fullWidth')){
		this.$element
		.find('.modal_body').css({
			'max-height': maxHeight,
			'min-height': maxHeight,
			'overflow-y': 'auto'
		});
	} else {
		this.$element
		.find('.modal_body').css({
			'max-height': maxHeight,
			'overflow-y': 'auto'
		});
	} 	
}

var setModalMarginTop = function(element) {
	this.$element     = $(element);  
	this.$dialog      = this.$element.find('.modalDialog');
	var dialogHeight  = this.$dialog.height();
	
	this.$dialog.css({
		'margin-top' : -dialogHeight/2
	});
}

var setModalPosition = function(){
	setModalMaxHeight($('.modalPopup'));
	setModalMarginTop($('.modalPopup'));

	setModalMaxHeight($('.modalPopup2'));
	setModalMarginTop($('.modalPopup2'));
}

//////////////////////////////////////////////////////////////////////////
//모달 레이어 팝업 띄우기// ajax방식으로 띄울 레이버 팝업 페이지(url방식 호출)다 불러옵니다
function layerPopup(url, popupId, param, width) {
	
	var pDivId = popupId; //띄울 팝업 아이디 생성
	if ($('.modalPopup').length != 0) {
		var pDiv = '<div id="' + pDivId + '" class="modalPopup2 modal" role="dialog" aria-modal="true"><div class="modalDialog"></div></div>'; // ajax로 html을 넣을 div 생성
	} else {
		var pDiv = '<div id="' + pDivId + '" class="modalPopup modal" role="dialog" aria-modal="true"><div class="modalDialog"></div></div>'; // ajax로 html을 넣을 div 생성
	}
	var paramData = '';

	var tWidth = width; //레이어 팝업의  width 강제설정
	
	if(width == ''){
		tWidth = '500'; //기본넓이
	}else if (width == 'full'){
		tWidth = '96%';
	}else{
		tWidth = width;
	}	


	if(param == null){
		paramData = popupId;
	}else{
		paramData = param;
	}
	
		
	$.ajax({
		type : "GET", //get 또는 post 방식으로변경하여 사용
		url : url,
		data : paramData ,
		async : true,
		success : function(html) {
			var page = html;
			$('body').append(pDiv);
			$('#' + pDivId + '> .modalDialog').html(page);
			
			
		},		
		complete : function(){//ajax로 html을 넣기가 완료되면			
			
			$('#' + pDivId).removeClass('in').data('bs.modal', null);
			$('#' + pDivId)
			/**/
			.modal({
				backdrop: 'static', 
				keyboard: false
			})
			
			.find('.modalDialog')
			.css({
				'width': tWidth
			});
			$('#' + pDivId).next('.modal-backdrop').remove();
			
			
			////////////////			
			datepicker();
			formCommon();			
			
			trActive();
			tableTheadFixed();

			setModalPosition();
		}
	});
}


// 모달 레이어 팝업 삭제 닫기
function closeModal(obj){
	var divObj = null;
	var parents = $(obj).parents();
	
	for (var i=0;i<parents.length;i++) {
		var parent = parents[i];
		if ($(parent).hasClass("modal")) {
			divObj = parent;
			break;
		}
	}

	var thisPopId = divObj.id;
	if ($('#' + thisPopId).hasClass('modalPopup2')){
		$('#' + thisPopId).modal('toggle').remove();
		$('body').addClass('modal-open');
	} else {
		$('#' + thisPopId).modal('toggle').remove();
	}	
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
/******** table thead fixed 스크립트 *******/
function tableTheadFixed() {
	$('table.theadFix').each(function() {
	
		var curTable = $(this);
		var curTableHeight = curTable.attr('data-role-height');
	
		//table 자신을 감싸는 div tableWrapBox 생성 및 table 의  data-role-height를 가져와 div tableWrapBox에 height를 넣어줌
		function tableWrapBoxMake(){
			curTable.wrapAll('<div class="tableWrapBox" />');
			curTable.parent('.tableWrapBox').css({'height' : curTableHeight });
		}	
		
		//table 자신을 복사하여 tbody는 제거하고 table 자신 다음에 div tableTheadWarpBox를 생성하고 여기에 복사해 넣음
		function tableTheadFixed(){
			var curTableClone = curTable.clone();
			tableWrapBoxMake();
			
			curTable.before("<div class='tableTheadWarpBox'></div>");
			curTableClone.removeClass('theadFix').find('tbody, tfoot').remove();
			
			curTable.prev('.tableTheadWarpBox').html(curTableClone);
			
			
			curTable.parent('.tableWrapBox').on('scroll', function() {
				var e =  $(this);
				var curHeight = e.scrollTop();
				e.find('.tableTheadWarpBox').css('top' , curHeight);
			});
		}
			
		if (curTable.hasClass('theadFixEnd')){//중복으로 작업이 일어나지 않게 가상의 class theadFixEnd 존재 확인
			//
		} else {
			curTable.addClass('theadFixEnd');//중복으로 작업이 일어나지 않게 가상의 class theadFixEnd 추가
			tableTheadFixed();
		}
	});
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
// matching id (form element & lable)
var matchLabel = function(e){
	for (var i = 0; i < e.length; i++) {
	// set label input matching
	if (!e.eq(i).prev('input').attr('id')) {
		e.eq(i).prev('input').attr('id', 'temp_id_' + (i + 1));
	}
		e.eq(i).attr('for', e.eq(i).prev('input').attr('id'));
	}
}

// matching name (input radio) 
var matchName = function() {
	// set radio name
	var $radioName = $('.radio_name');
	for (var i = 0; i < $radioName.length; i++) {
		$radio = $radioName.eq(i).find('.radioInp input');
		for (var j = 0; j < $radio.length; j++) {
			if (!$radio.eq(j).attr('name')) {
				$radio.attr('name', 'temp_name_' + (i + 1));
			}
		}
	};
}

// checkbox all toggle 클릭
var checkboxAll = function() {
	$('body').on('click', function(e) {
		var $target = $(e.target);
		var $nodeName = e.target.nodeName;
		if ($target.parent().hasClass('checkboxInp') && $nodeName == 'INPUT') {
			if ($target.hasClass('all')) {
				var $checkbox = $target.parents('.checkbox_all').find('.checkboxInp').find('input').not('all');
				if ($target.is(':checked')) {
					$checkbox.prop('checked', true);
				} else {
					$checkbox.prop('checked', false);
				}
			} else if($target.hasClass('subAll')){
				var $checkbox = $target.parents('.checkbox_subAll').find('.checkboxInp').find('input').not('subAll');
				if ($target.is(':checked')) {
					$checkbox.prop('checked', true);
				} else {
					//alert('test');
					var $checkbox_all = $target.parents('.checkbox_all').find('.checkboxInp').find('input.all');
					$checkbox_all.prop('checked', false);
					$checkbox.prop('checked', false);
				}
			} else {
				var $checkbox_all = $target.parents('.checkbox_all').find('.checkboxInp').find('input.all');
				var $checkbox_subAll = $target.parents('.checkbox_subAll').find('.checkboxInp').find('input.subAll');
				if (!$target.is(':checked')) {
					$checkbox_all.prop('checked', false);
					$checkbox_subAll.prop('checked', false);
				}
			}
		}
	});
}


/******** tab  *******/ 
// tab event common
var tabEvent = function(container) {
	var $tab_area = container;
	var $tab_menu = $tab_area.find('.tab_menu > ul').eq(0).children('li').children('a');
	var $tab_cont = $tab_area.find('.tab_cont').eq(0).children('.cont');

	if ($tab_menu.parent('li').hasClass('active')) { //활성 tab을 지정했을 경우
		var j = $tab_menu.parent('.active').index();
		$tab_cont.eq(j).addClass('active').siblings().removeClass('active');
	} else { // 활성 tab을 지정하지 않았을 경우 첫번째 tab 노출
		$tab_menu.parent('li').eq(0).addClass('active');
	}

	for (var i = 0; i < $tab_menu.length; i++) {
		$tab_menu.eq(i).on('click', (function(index) {
			return function(event) {
				$tab_menu.eq(index).parent('li').addClass('active').siblings().removeClass('active');
				$tab_cont.eq(index).addClass('active').siblings().removeClass('active');
				event.preventDefault();
			}
		})(i));
	}
}


/******** 일반 table tr 클릭시 해당 tr부분을 활성화표시하는 스크립트 *******/
var trActive = function() {
	$(document).on("click", "table.amb_table.trActive tbody tr", function(){
		$(this).addClass('trActived').siblings().addClass('trNoActived').removeClass('trActived');
	});
	$(document).on("click", "table.amb_table.trActive tfoot", function(){
		$(this).parent('table.trActive').find('tr').removeClass('trActived , trNoActived');
	});
}

/******** menuActive ********/
// 페이지 마다 설정된 value를 이용해 좌메뉴에 active설정
var menuActive = function(d1, d2){
	var t1 = d1;
	var t2 = d2;
		
	$gnb = $(".gnb");

	$gnb.find('li').removeClass('active');
	$gnb.find('li').removeClass('open');
	
	$gnb.find('li[data-depth='+t1+']').addClass('active').addClass('open');
	if(!t2 == ''){
		$gnb.find('li[data-depth='+t2+']').addClass('active');
	}
	


};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
/// datepicker 스크립트
function datepicker() {

	$('.datepicker').each(function() {
		if($(this).hasClass('months'))
		{
			$(this).datepicker({
				language : "ko",
				//todayBtn: "linked",
				//keyboardNavigation: false,
				calendarWeeks: false, //20170915 수정 
				autoclose: true,
				format: "yyyy-mm",
				viewMode: "months", 
				minViewMode: "months"
			}).prop('readony', true);
			
		} 
		else if ($(this).hasClass('years')){
			$(this).datepicker({
				language : "ko",
				//todayBtn: "linked",
				//keyboardNavigation: false,
				calendarWeeks: false, //20170915 수정 
				autoclose: true,
				format: "yyyy",
				viewMode: "years", 
				minViewMode: "years"
			}).prop('readony', true);
		}
		else
		{	
			$(this).datepicker({
				language : "ko",
				//todayBtn: "linked",
				//keyboardNavigation: false,
				calendarWeeks: false, //20170915 수정 
				autoclose: true,
				format: "yyyy-mm-dd",
			}).prop('readony', true);
		}
	
	});

	$('.datepickerRange').each(function(index, element) {		

		$(this).find('input.datepicker:eq(0)').addClass("from"+index);
		    
		/* Find 'To' */ 
		$(this).find('input.datepicker:eq(1)').addClass("to"+index);			
		
		var startDate = $(".from"+index).datepicker("getDate");
		var FromEndDate = $(".to"+index).datepicker("getDate");		
		
		$(".from"+index).datepicker(
			'setEndDate', FromEndDate
		).on('changeDate', function(selected){		        
			var startDate = $(this).datepicker("getDate");
			$('.to'+index).datepicker("setStartDate",startDate);
		});

		$('.to'+index).datepicker(
			'setStartDate', startDate
		).on('changeDate', function(selected){
			var FromEndDate = $(this).datepicker("getDate");
			$('.from'+index).datepicker('setEndDate', FromEndDate);
		});  			
	});	
}

//error페이지 센터 정렬관련
var errorPagePosition = function() {
	var $this = $('.errorPage');
	var thisWidth = $this.outerWidth();
	var thisHeight = $this.outerHeight();
	var marginLeftValue = thisWidth/2;
	var marginTopValue = thisHeight/2;

	//fullPageError
	if ($('body').hasClass('fullPage'))
	{
		$this.css({'margin-left': - marginLeftValue + 'px' , 'margin-top': - marginTopValue + 'px'});
	} 
	
	//insidePageError
	else 			
	{				
		//자신의 상위에 #content 가 있을시
		if ($this.parents('.content').hasClass('content'))
		{
			$this.parents('.content').addClass('insidePageError');
		} 
		
		//자신의 상위에 #content 가 없을시
		else 
		{
			return;
		}			    
	}
}




			

