 {include file="header.tpl"}

<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.fancybox-1.2.1.pack.js"></script>
 
<link rel="stylesheet" href="/theme/{$get_theme}/js/fancy/jquery.fancybox.css" media="screen" type="text/css" />
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
<style type="text/css">
<!--
#main .content { margin:0 10px;}
#main .content .left { float:left; width:20%; }
#main .content .left .item{ float:left; width:95%; clear:both; padding:5px; border-bottom:1px #ccc dashed; font-family:Arial, Helvetica, sans-serif; cursor:pointer;}
#main .content .left .itemS { background-color:#CFEBFF; float:left; width:95%; clear:both; padding:5px; border-bottom:1px #ccc dashed; font-family:Arial, Helvetica, sans-serif;cursor:pointer;}
#main .content .left .item strong{ color:#006;}
#main .content .left .itemS strong{ color:#600;}
#main .content .right {float:left; width:78%; padding-left:10px; border:1px #ccc solid;}
#main .content .right ul{margin:10px 0 0 5px; padding:0px;list-style:none; }
#main .content .right ul li{ margin:5px auto;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid; float:left; width:100%;}


#main .content  .right .con .pic { float:left; width:14%; padding-top:3px; padding-left:10px; text-align:left; display:inline;}
#main .content  .right .con .t { float:left; width:83%; padding-left:10px; display:inline;}
#main .content  .right .con .picR { float:left; margin-left:5%; width:14%; padding-top:3px; padding-left:10px; text-align:left; display:inline;}
#main .content  .right .con .tR { float:left; width:77%; padding-left:10px; display:inline;}



#main .left td{font-size:11px;}
#pv{ color:#000; font-size:11px; overflow:hidden;}



.nonwrapping { font-size:11px; font-family:Arial, Helvetica, sans-serif;}
.aligncent{ text-align:center;}
.narrowTitle{font-family:Arial, Helvetica, sans-serif;}
#main .left td{font-size:11px;}






.offer_item{
width:96%;
border-bottom:1px #ccc solid;
padding:20px 10px;	
}

.business_info { float:left}

.offer_item h2{ margin-bottom:10px; margin-top:0;}

.offer_item em{ text-align:right; display:block;}

.special_offer {
float:left;
-moz-border-radius:10px;
-webkit-border-radius:10px; 
border:1px solid #CCCCCC;
padding:10px;
width:260px;
margin-right:20px;
display:block;
}


-->
 </style>

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
		<div class="content">
        	<div>
        	  <div style="float:left">
            </div>
            <div style="float:right; margin-right:10px; margin-top:10px;"><script>document.write(new_button)</script></div>
          </div>
          <div id="clear" style=" margin-bottom:10px; margin-top:10px;"></div>
              <div class="left" style="padding-top:10px;" >
                                <div style="border-bottom:1px dashed #ccc;" id="MenuTitle">
                </div>
                <div style="color:white;">
                
                
                <p align="center">
{$ads->getAdCode(7)}
</p>

                
                </div>

          </div>

             <div class="right" style="margin-bottom:10px; position:relative">
             <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
             <div id="sr">Loading...</div><script type="text/javascript" language="javascript">
{php}
if(!empty($_GET[aid])){
echo "get(".$_GET[aid].",1,2);";
}else{
echo "get(0,1,0);";
}
{/php}
</script>     </div>
          
		</div>               
 </div>
 <!--Main End-->
 {include file="footer.tpl"}