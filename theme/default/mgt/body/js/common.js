
function select_item_all(whochecked,allitem,childitem)
{
	if(whochecked==true)
	{
		$('.'+allitem).attr('checked',true);
		$('.'+childitem).attr('checked',true);
		$('.itemtr').addClass('trselected');
	}
	else
	{
		$('.'+allitem).attr('checked',false);
		$('.'+childitem).attr('checked',false);
		$('.itemtr').removeClass('trselected');
	}
}

function delselected(sheet,where,childitem)
{

   var selected_ids='';
   var obj=$("input:checked[class='"+childitem+"']");
    $.each(obj, function(i,item){
       selected_ids+= $(item).val() +',';
     });

if(selected_ids)
{
	var a=confirm("CAUTION! You are going to delete a quantity of items.\n\rThese items will never be restored after deleted.\n\rSure to delete these items?");
if(a==0) return ;
}
else
{
	alert('You have not selected any item.');
	return;
}


$.post("/mgt/func/delete.php?"+Math.random(), {
sheet:sheet,
where:where,
equal:selected_ids
},function(data){tips('Items deleted.');nav();});

}

function menu_toggle(who, father)
{
	if($('#'+who).css("display")!="none")
	{
		$('#'+who).slideUp();
		$(father).addClass("plus");
	}
	else
	{
		$('#'+who).slideDown();
		$(father).removeClass("plus");
	}
}


function nav() {

$('#sr').css({"opacity":0.2, "cursor":"wait"});

var url=$('#url').val();
var page=$('#page').val();
var q=$('#q').val();
var f=$('#f').val();


destory_editor();
$.get(url+'?page='+page+'&f='+f+'&q='+q+'&rand='+Math.random(),
			 function(data){
				 $('#sr').html(data);
				 $('#sr').css({"opacity":1, "cursor":"auto"});
				 $('#wait').hide();
				 fancybox();
				 }
				 );
}

function ChangeValue(target,value) // for upload pic
{
	$('#'+target).val(value);
	$('#uploadbtn').hide();
	$('#uploaded').show();

	$('#fancy_outer').hide();
	$('#fancy_overlay').hide();
}
function hole_auto_generate(biz_id)
{
	var hole_from=$('#hole_from').val();
	var hole_to=$('#hole_to').val();
	if(hole_from==''||hole_to==''){alert('Please input number');return;}
	else if(hole_from>hole_to){alert('Invalid Number');return;}


	for(var i=hole_from; i<=hole_to; i++)
	$.post("func/add.php?"+Math.random(), {
								   sheet:'business_hole',
								   field:'business_id,hole_no',
								   value:biz_id+','+i
								   },
			function(data){},"json");
		nav();
}


function sele_item(a,url){
for(var i=0;i<document.getElementsByTagName("div").length;i++){
if(document.getElementsByTagName("div")[i].id=="itemid"){
document.getElementsByTagName("div")[i].className='item';
}
}
a.className='itemS';
$('#url').val(url);
$('#page').val('1');
$('#f').val('');
$('#q').val('');
nav();
}

function get(nothing,page)
{
$('#page').val(page);
nav();
}

function set(f,q)
{
$('#f').val(f);
$('#q').val(q);
$('#page').val('1');
nav();
}

function update(sheet,field,value,where,equal){
$('#sf').css("opacity",0.2);
$.post("/mgt/func/update_submit.php?"+Math.random(), {
field:field,
sheet:sheet,
value:value,
where:where,
equal:equal
},function(data){nav()});
}

function tips(content)
{
	$('#tips').html(content);
	$('#tips').show();

		var scrolltop = window.pageYOffset  || document.documentElement.scrollTop  || document.body.scrollTop || 0;
		var _clientheight=0;
  			  _clientheight = Math.min(document.body.clientHeight , document.documentElement.clientHeight);
   		if(_clientheight==0)
    		  _clientheight= Math.max(document.body.clientHeight , document.documentElement.clientHeight);
        var _clientwidth= document.documentElement.clientWidth || document.body.clientWidth;
        var _pageheight =  Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);

		var msgtop = (scrolltop+(_clientheight)/2)-250+"px";
		var msgleft = ((_clientwidth-650)/2)+"px";

		$('#tips').css('top', msgtop);
		$('#tips').css('left',  msgleft);


	setTimeout("$('#tips').hide()",2200);

}

function del(sheet,where,equal)
{
	var a=confirm("Sure to delete this item?");
	if(a==0) return ;

	$.post("/mgt/func/delete.php?"+Math.random(), {
	sheet:sheet,
	where:where,
	equal:equal
	},function(data){tips('Item deleted.');nav();});
}

function del_event(sheet,where,equal)
{
    var a=confirm("Sure to delete this item?");
    if(a==0) return ;

    $.post("/mgt/func/delete.php?"+Math.random(), {
    sheet:sheet,
    where:where,
    equal:equal
    },function(data){tips('Item deleted.');});
    window.location = "/event/"

}


function fancybox()
{
	$('.fancybox').fancybox({
		'hideOnContentClick': false,
		'zoomSpeedIn': 300,
		'zoomSpeedOut': 300,
		'frameWidth' : 800,
		'frameHeight': 500,
		'padding':0,
		'overlayShow': true,
		'enableEscapeButton': true,
		'callbackOnClose': function(){nav();}
	});
}



var editor;

function create_editor()
	{
	var html = $('#maskeditor').html();
	// Create a new editor inside the <div id="editor">
	//$('#maskeditor').hide();
		if ( editor )
		return;
	editor = CKEDITOR.appendTo( 'editor' );
	editor.setData( html );
}

function destory_editor()
{
	if ( !editor )
	{return;}
	else{
	editor.destroy();
	editor = null;
	}
}


function icon_dropdown(id)
{
	$('.icon_dropdown').hide();
	$('#icon_dropdown_'+id).slideDown('fast');

}