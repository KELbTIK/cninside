{include file="header.tpl"}
{literal}
 <script type="text/javascript" language="javascript">

function getHTTPObject() {
  var xmlhttp;
  if(window.XMLHttpRequest){xmlhttp = new XMLHttpRequest();}
  else if (window.ActiveXObject){xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
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
    <div class="content container">
        <div class="row">
            <h1>{l t='Photos for %s' r=$var_biz.bizname}</h1>
            <div id="photo"><img class="img-responsive" src="../images/event/{$var_biz.picurl}" /></div>

            <h3 class="text-right"><a href="new_photo.php?id={$var_biz.bizid}">{l t='Upload photo for %s' r=$var_biz.bizname}...</a></h3>
            <!--loop-->
            <ul class="list-group">
                {foreach from=$var_pic item=i}
                    <li class="list-group-item">
                        <div class="photoBox">
                            <a href="javascript:get('../images/event/{$i.picurl}')"><img class="img-responsive" src="../images/event/{$i.picurl}_100x100" border="0" /></a>
                        </div>
                    </li>
                {/foreach}
                <!--/loop-->
            </ul>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}