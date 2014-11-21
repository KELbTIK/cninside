 {include file="header.tpl"}

<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.fancybox-1.2.1.pack.js"></script>
 
<script>
//===========common
var biz_id="{$smarty.get.id}";
var ajax_menu_div_name="sr_menu";
var ajax_list_div_name="sr";
var zone_name="offer";
var temp='{$var_me.email}';
var t_keyword="{l t='Keywords'}";
var t_narrowbycategory="{l t='Narrow By Category'}";
var t_categories="";
var t_zonename="{l t='Manage Deals'}";
var t_plslogin="{l t='Please Login!'}";
var t_addcopied="{l t='Address Copied! You can paste it out by press Ctrl+v'}";

var ajax_menu_url='"manage/getmenu.php?cat="+cat';
var ajax_list_url='"manage/getlist.php?id="+biz_id+"&cat="+cat+"&page="+pg+"&st="+searchtext';
var ajax_sublist_url=ajax_list_url;
var ajax_article_url='"manage/detail.php?id="+artid+"&page="+pg';
var ajax_comment_url='"manage/detail.php?id="+artid+"&page=1&comment="+comment';
var new_button="";

var WCurPage=1;
var WCurCat=0;
var WCurSubcat=0;
</script>

{literal}
<script type="text/javascript" language="javascript">

 
function get(wr,page,who) {  // cat , page , 0    OR   cat , subcat , 1

  if(who==0){ // list $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  var cat=wr;
  var pg=page;
  //var searchtext=document.getElementById('searchtext').value;
  var searchtext='';
			if(searchtext)
			{
				document.getElementById('MenuTitle').innerHTML="<h4>"+t_keyword+": <span style=\"color:#22A\">"+searchtext+"</span></h4><h2>"+t_narrowbycategory+":</h2>";
				document.getElementById('MenuTitle').style.backgroundColor='#FDF';
			}else{
				document.getElementById('MenuTitle').innerHTML="<h2>"+t_zonename+" "+t_categories+"</h2>";
				document.getElementById('MenuTitle').style.backgroundColor='#FFF';
			}
  var div_name=ajax_list_div_name;

	if(cat>=10000){
		cat=cat-10000;
		WCurSubcat=cat;
		WCurCat=-1;
		WCurPage=pg;
		$.post( eval(ajax_sublist_url)+"&"+Math.random(), {
			},function(data){
					document.getElementById(div_name).innerHTML =data;
					
					 } );
	}
	else{
		WCurCat=cat;
		WCurSubcat=-1;
		WCurPage=pg;
		$.post( eval(ajax_list_url)+"&"+Math.random(), {
		},function(data){
				document.getElementById(div_name).innerHTML =data;
				fancybox();
				 });
	}
  }
  else if(who==2){// article detail $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  var artid=wr;
  var pg=page;
  var div_name=ajax_list_div_name;
   $.post( eval(ajax_article_url)+"&"+Math.random(), {
		},function(data){
				document.getElementById(div_name).innerHTML =data;
				 fancybox();
				 });
  }
  else if(who==3){// POST detail $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  var artid=wr;
  var pg=page;
  var comment=document.reply.review.value;
  comment=comment.replace(/\n/g,"[br]");
  var div_name=ajax_list_div_name;
  if(!temp) 
  {alert(t_plslogin);
  return;
  //location='../my/login.php';
  }
    $.post( eval(ajax_comment_url)+"&"+Math.random(), {
		},function(data){
				document.getElementById(div_name).innerHTML =data;
				 fancybox();
				 });
}
     

}
</script>
<script type="text/javascript" language="javascript">
function sele_item(a,catid){
	for(var i=0;i<document.getElementsByTagName("div").length;i++){
		if(document.getElementsByTagName("div")[i].id=="itemid"){
			document.getElementsByTagName("div")[i].className='item';
		}
	}
	a.className='itemS';
	get(catid,1,0);
}
function nav()
{
	get('0',WCurPage,'0');
}
</script> 
<script type="text/javascript" language="javascript">
function determinCatOrSub(){
if(WCurCat<0) return WCurSubcat;
else return WCurCat;}
//specify whether contents should be auto copied to clipboard (memory)
//Applies only to IE 4+
//0=no, 1=yes
var copytoclip=1;
function copyToClipboard(theField) {	
var tempval=document.getElementById(theField);
	if (navigator.appVersion.match(/\bMSIE\b/)){
		tempval.select();		
		if (copytoclip==1){
		therange=tempval.createTextRange();
		document.execCommand('Copy');
		alert(t_addcopied);
		}
		return;
	}else{
		alert("Your browse cannot support this function, Please press Ctrl+C to copy to clipboard.");
		tempval.select();		
	}
}



</script>
<script>
function fancybox()
{ 
	$(".iframe").fancybox({
	 'overlayShow'    : true,
	 'zoomSpeedIn'    : 600,
	 'frameWidth' : 600,
	 'frameHeight': 400,
	 'callbackOnShow' : function(){$('object').css('display','block')},
	 'callbackOnClose' : function(){$('object').css('display','none')},
	 'zoomSpeedOut'    : 500,
	 'easingIn'    : 'easeOutBack',
	 'easingOut'    : 'easeInBack',
	 'padding': 0,
	 'callbackOnClose': function(){nav();}
	 });
}

get(0,0,1);
</script>

{/literal}
 <!--Main Start-->  
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="pull-right"><script>document.write(new_button)</script></div>
            <div class="clearfix"></div>
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div id="MenuTitle"> </div>
                <div style="color:white;" class="hidden-xs">
                    <p align="center">
                    {$ads->getAdCode(7)}
                    </p>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div id="sr">Loading...</div>
                    <script type="text/javascript" language="javascript">
                {php}
                if(!empty($_GET[aid])){
                echo "get(".$_GET[aid].",1,2);";
                }else{
                echo "get(0,1,0);";
                }
                {/php}
                </script>
            </div>
        </div>
    </div>
</div>
 <!--Main End-->
{include file="footer.tpl"}