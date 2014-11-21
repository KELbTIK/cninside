{include file="header.tpl"}

<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.fancybox-1.2.1.pack.js"></script>

<link rel="stylesheet" href="/theme/{$get_theme}/js/fancy/jquery.fancybox.css" media="screen" type="text/css" />
<script>
//===========common
var ajax_menu_div_name="sr_menu";
var ajax_list_div_name="sr";
var zone_name="offer";
var temp='{$var_me.email}';
var t_keyword="{l t='Keywords'}";
var t_narrowbycategory="{l t='Narrow By Category'}";
var t_categories="{l t='Categories'}";
var t_zonename="{l t='Special Offers'}";
var t_plslogin="{l t='Please Login!'}";
var t_addcopied="{l t='Address Copied! You can paste it out by press Ctrl+v'}";

var ajax_menu_url='"offer/getmenu.php?cat="+cat';
var ajax_list_url='"offer/getlist.php?cat="+cat+"&page="+pg+"&st="+searchtext+"&bizid="+bizid';
var ajax_sublist_url=ajax_list_url;
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
var searchtext=$('#searchtextOffer').val();
var bizid=document.getElementById('bizid').value;
if(searchtext)
{
document.getElementById('MenuTitle').innerHTML="<div class=\"alert alert-danger\">"+t_keyword+": <span style=\"color:#22A\">"+searchtext+"</span></div><h2>"+t_narrowbycategory+":</h2>";
}else{
document.getElementById('MenuTitle').innerHTML="<h2><label>"+t_zonename+" "+t_categories+"</label></h2>";
document.getElementById('MenuTitle').style.backgroundColor='#FFF';
}
var div_name=ajax_list_div_name;

WCurCat=cat;
WCurSubcat=-1;
WCurPage=pg;
$.post( eval(ajax_list_url)+"&"+Math.random(), {
},function(data){
document.getElementById(div_name).innerHTML =data;
});
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


}
</script>
<script type="text/javascript" language="javascript">
function sele_item(a,catid){
    for(var i=0;i<document.getElementsByTagName("a").length;i++){
        if(document.getElementsByTagName("a")[i].id=="itemid"){
            document.getElementsByTagName("a")[i].parentNode.className='item';
        }
    }

    a.parentNode.className='active';
    get(catid,1,0);
}


</script> 
<script type="text/javascript" language="javascript">
function determinCatOrSub(){
    if(WCurCat<0) return WCurSubcat;
    else return WCurCat;
}
//specify whether contents should be auto copied to clipboard (memory)
//Applies only to IE 4+
//0=no, 1=yes
var copytoclip=1;
function copyToClipboard(theField){
    var tempval=document.getElementById(theField);
    if (navigator.appVersion.match(/\bMSIE\b/)){
        tempval.select();
        if (copytoclip==1){
            therange=tempval.createTextRange();
            document.execCommand('Copy');
            alert(t_addcopied);
        }
    return;
    }
    else{
        alert("Your browse cannot support this function, Please press Ctrl+C to copy to clipboard.");
        tempval.select();
    }
}



</script>


<script>
function fancybox(){
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

                        <input name="searchtext" class="form-control" type="text" id="searchtextOffer" size="40" value=""/>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-info" id="button" onclick="get(0,1,0);get(0,0,1);">
                                &nbsp;<span class="glyphicon glyphicon-search"  ></span>&nbsp;
                            </button>
                            <input type="hidden" name="bizid" id="bizid" />

                            <button type="button" class="btn btn-danger" onclick="document.getElementById('searchtextOffer').value='';get(0,1,0);get(0,0,1);">
                                &nbsp;<span class="glyphicon glyphicon-remove"></span>&nbsp;
                            </button>
                        </div>
                    </div>
                </form>
                <div style="float:right; margin-right:10px; margin-top:10px;"><script>document.write(new_button)</script></div>
                <div style="padding-top:10px;" >
                    <div id="MenuTitle">
                        {l t=$zone_name} {l t='Categories'}
                    </div>
                    <div id="sr_menu">Loading...</div>
                    <div class="hidden-xs" style="color:white;"><p>.</p>
                        <p align="center">
                             {$ads->getAdCode(7)}
                        </p>
                </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-8 col-xs-12" style="margin-bottom:10px;">
                <div class="panel panel-default">
                    <div class="panel-body" id="sr">
                        Loading...
                    </div>
                </div>
                <script type="text/javascript" language="javascript">
                    {php}
                        if(!empty($_GET[aid])){
                            echo "get(".$_GET[aid].",1,2);";
                        }
                        else{
                            echo "get(0,1,0);";
                        }
                    {/php}
                </script>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--Main End-->
{include file="footer.tpl"}