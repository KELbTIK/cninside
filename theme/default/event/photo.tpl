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
 <h1 style="padding:10px 20px; border-bottom:1px #ccc solid; margin:5px 10px;">{l t='Photos for %s' r=$var_biz.bizname}</h1><table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="100%" height="400" align="center">
 	<div id="photo"><img src="../images/event/{$var_biz.picurl}" /></div></td>
  </tr>
</table>
<h3 style="text-align:right;"><a href="new_photo.php?id={$var_biz.bizid}">{l t='Upload photo for %s' r=$var_biz.bizname}...</a>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
<!--loop-->
 {foreach from=$var_pic item=i}
    <div class="photoBox" style="padding:10px;"><a href="javascript:get('../images/event/{$i.picurl}')"><img src="../images/event/{$i.picurl}_100x100" border="0" /></a>
    </div>
{/foreach}
<!--/loop-->
 	</div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}