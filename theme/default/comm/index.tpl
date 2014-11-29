{include file="header.tpl"}
<script>
//===========common
ajax_menu_div_name="sr_menu";
ajax_list_div_name="sr";
zone_name="{$zone_name}"
temp='{$var_me.email}';
t_keyword="{l t='Keywords'}";
t_narrowbycategory="{l t='Narrow By Category'}";
t_categories="{l t='Categories'}";
t_zonename="{l t=$zone_name}";
t_plslogin="{l t='Please Login!'}";
t_addcopied="{l t='Address Copied! You can paste it out by press Ctrl+v'}";
</script>

<script type="text/javascript">

{if $zone_name=="Chatter"}
ajax_menu_url='"chatter/getmenu.php?cat="+cat';
ajax_list_url='"chatter/getlist.php?cat="+cat+"&page="+pg+"&st="+searchtext';
ajax_sublist_url=ajax_list_url;
ajax_article_url='"chatter/detail.php?id="+artid+"&page="+pg';
ajax_comment_url='"chatter/detail.php?id="+artid+"&page=1&comment="+comment';
new_button="<a href='chatter/new.php' class='btn button-blue pull-right col-md-3 col-sm-6 col-xs-12'>{l t='Start Conversation'}</a>";

{elseif $zone_name=="Classified"}
ajax_menu_url='"classified/getmenu.php?cat="+cat';
ajax_list_url='"classified/getlist.php?cat="+cat+"&page="+pg+"&st="+searchtext';
ajax_sublist_url='"classified/getlist.php?subcat="+cat+"&page="+pg+"&st="+searchtext';
ajax_article_url='"classified/detail.php?id="+artid+"&page="+pg';
ajax_comment_url='"classified/detail.php?id="+artid+"&page=1&comment="+comment';
new_button="<a href='classified/new.php' class='btn button-blue pull-right col-md-3 col-sm-6 col-xs-12'>{l t='Post a classified'}</a>";

{/if}
</script>

{literal}
<script type="text/javascript" language="javascript">
var WCurPage=1;
var WCurCat=0;
var WCurSubcat=0;

</script>
<script type="text/javascript" language="javascript">


function get(wr,page,who) {  // cat , page , 0    OR   cat , subcat , 1

  if(who==0){ // list $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  var cat=wr;
  var pg=page;
  var searchtext=document.getElementById('searchcomm').value;
			if(searchtext)
			{
				document.getElementById('MenuTitle').innerHTML="<div class=\"alert alert-danger\">"+t_keyword+": <span style=\"color:#22A\">"+searchtext+"</span></div><h2>"+t_narrowbycategory+":</h2>";
			}else{
				document.getElementById('MenuTitle').innerHTML="<h2><label>"+t_zonename+" "+t_categories+"</label></h2>";
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
				 });
	}
  }
  else if(who==1){ // menu $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  var cat=wr;
  var subcat=page;
  var div_name=ajax_menu_div_name;
	$.post( eval(ajax_menu_url)+"&"+Math.random(), {
		},function(data){
				document.getElementById(div_name).innerHTML =data;
				 });
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
	for(var i=0;i<document.getElementsByTagName("a").length;i++){
		if(document.getElementsByTagName("a")[i].id=="itemid"){
            document.getElementsByTagName("a")[i].parentNode.className='item';
		}
	}
    if (a.parentNode != undefined){
        a.parentNode.className='active';
    }
	get(catid,1,0);
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
         'padding': 0
         });
         $(".fancypic").fancybox({
         'overlayShow'    : true,
         'zoomSpeedIn'    : 600,
         'zoomSpeedOut'    : 500,
         'easingIn'    : 'easeOutBack',
         'easingOut'    : 'easeInBack',
         'padding': 0
         });
    }

    get(0,0,1);
</script>

{/literal}
 <!--Main Start-->
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-12">
                <form action="javascript:;" method="post"><a name="top"></a>
                    <h2><label for="searchtextOffer">{l t='Search'}</label></h2>
                    <div class="input-group">

                        <input name="searchcomm" class="form-control" type="text" id="searchcomm" size="40" value=""/>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-info" id="button" onclick="get(0,1,0);get(0,0,1);">
                                &nbsp;<span class="glyphicon glyphicon-search"  ></span>&nbsp;
                            </button>
                            <button type="button" class="btn btn-danger" onclick="document.getElementById('searchcomm').value='';get(0,1,0);get(0,0,1);">
                                &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;
                            </button>
                        </div>
                    </div>
                </form>
                <div style="padding-top:10px;" >
                    <div id="MenuTitle">
                        {l t=$zone_name} {l t='Categories'}
                    </div>
                    <div id="sr_menu">Loading...</div>
                    <div style="color:white;" class="hidden-xs"><p>.</p>
                        <p align="center">
                            {$ads->getAdCode(7)}
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-8 col-xs-12 text-right pull-right" style="margin-top:10px;"><script>document.write(new_button)</script></div>
            <div class="col-md-9 col-sm-8 col-xs-12" style="margin-top:10px;">
                <div class="panel panel-default">
                    <div class="panel-body" id="sr">
                        Loading...
                    </div>
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
</div>
 <!--Main End-->
 {include file="footer.tpl"}