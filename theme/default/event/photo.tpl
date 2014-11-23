{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
#main {height:auto;}
-->
 </style>
 <script type="text/javascript" language="javascript">

function getHTTPObject() {
    var xmlhttp;
    if(window.XMLHttpRequest){xmlhttp = new XMLHttpRequest();}
    else
    if (window.ActiveXObject){
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        if (!xmlhttp){xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");}
    }
    return xmlhttp;
}

function get(url) {
	if(!url) url='';
  var http = getHTTPObject();
  var div_name='photo';
   http.abort();
  http.open("GET", url, true);
  http.onreadystatechange=function() {
  if(http.readyState < 4)
	 document.getElementById(div_name).innerHTML = "<img src=../theme/{$get_theme}/images/ajax-loader6.gif> <br /> <br />Please wait...";

if (http.readyState == 4)
    if(http.status==200)
      document.getElementById(div_name).innerHTML = '<img src="'+url+'"  />';
}
http.send(null);
}
</script>
{/literal}
 <!--Main Start-->

<div id="main">
    <div class="container">
        <br/>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Photos for %s' r=$var_biz.bizname}</h3>
            </div>
            <div class="panel-body">
                <div id="photo">
                    <img class="img-responsive center-block" src="../images/event/{$var_biz.picurl}" />
                </div>
                <br/>
                <h3 class="pull-right"><a href="new_photo.php?id={$var_biz.bizid}">{l t='Upload photo for %s' r=$var_biz.bizname}...</a></h3>
                <!--loop-->
                {foreach from=$var_pic item=i}
                    <div class="photoBox" style="padding:10px;"><a href="javascript:get('../images/event/{$i.picurl}')"><img src="../images/event/{$i.picurl}_100x100" border="0" /></a>
                    </div>
                {/foreach}
                <!--/loop-->
            </div>
        </div>
    </div>
 	</div>
<!--Main End-->
{include file="footer.tpl"}