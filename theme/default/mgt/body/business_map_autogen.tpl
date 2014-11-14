<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/mgt/body/css/common.css" />
</head>
{literal}
<style type="text/css">
* { margin:0; padding:0; }
body,td,th {	font-family: Arial, Helvetica, sans-serif; font-size: 12px;	color: #000000;}
body {margin:0; padding:0; }


.box{ float:left; padding:0; border:1px #ccc solid; position:relative;}
.box  h2 {
border-bottom:1px solid #CCCCCC;
display:block;
font-size:18px;
font-weight:normal;
padding:0 0 10px 10px;
}

.change{ background:url(../images/box-bg.gif) repeat-x #EBEBEB; }


.coner{ position:absolute; height:5px; width:5px; display:block;}

 .c1{ background:url(../images/left-top-corner.gif) no-repeat; top:-1px; left:-1px;}
 .c2{ background:url(../images/right-top-corner.gif) no-repeat; top:-1px; right:-1px;}
 .c3{ background:url(../images/left-bot-corner.gif) no-repeat; bottom:-1px; _bottom:-12px;  left:-1px;}
 .c4{ background:url(../images/right-bot-corner.gif) no-repeat; bottom:-1px; _bottom:-12px;  right:-1px; _right:-2px;}
.blue { margin:0; width:99.6%; padding:0}
.blue h1{ margin:0 }
th{ background:#f0f7fe}
td, th{ border-top:1px  #BEE3FE solid; padding:5px;}
</style>
{/literal}
<body style="background:none;">
<div id="container">
 <!--Main Start-->  
  <div class="detail blue">
         <span class="coner c1b"></span>
        <span class="coner c2b"></span>
        <span class="coner c3b"></span>
        <span class="coner c4b"></span>
        <h1>Google Map Auto Generation</h1>
        {if $msg}
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><center><h3>{$msg}</h3></center></p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><center>[ <a href="#" onclick="parent.$.fn.fancybox.close(); return false">OK</a> ]</center></p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
        {else}
        <form action="business_map_autogen.php?bizids={$bizids}" method="post">
                <table width="100%" cellspacing="0" border="0" cellpadding="0">
                <!--loop-->
                    <tr>
                	  <th><div id="map_canvas" style="width: 333px; height: 338px; overflow:hidden; border:1px #ccc solid"><center>{l t='Please wait'}...</center></div></th>
               	    </tr>
                    <tr>
                    	<td>Business: {$var_biz.business_name}</td>
                    </tr>
                    <tr>
                    	<td>
                        <input type="text" name="search_add" id="search_add" style="width:330px" onkeyup="showLocation()" value="{$var_biz.business_add1},{$var_biz.business_add2},{$var_biz.city_name},{$var_biz.province_name}" />
                        </td>
                    </tr>
                    <tr>
                    		<td><span id="address">{l t='Try to convert address to map via editing the address above.'}</span></td>
                    </tr>
                    <tr>
                    	<td><input type="submit" value="Yes, confirm this position." /> or [ <a href="business_map_autogen.php?bizids={$bizids}">Skip this biz</a> ]</td>
                    </tr>
              <!--/loop-->
               	</table>
                <input type="hidden" name="business_id" id="business_id" value="{$var_biz.business_id}" />
                <input type="hidden" name="x" id="x" value="0" />
                <input type="hidden" name="y" id="y" value="0" />
                <input type="hidden" name="mapx" id="mapx" value="0" />
                <input type="hidden" name="mapy" id="mapy" value="0" />
                <input type="hidden" name="zoom" id="zoom" value="0" />
        </form>
        {/if}
        </div><!-- End .content .detail -->
 <!--Main End-->
 </div>
 
 
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
 <script src="/theme/{$get_theme}/js/biz_new.js?100514" type="text/javascript"></script>
{literal}
<script> $(document).ready(function() {
;
setTimeout("initialize(0,0,0,0,0);showLocation()",800);
});
</script>
{/literal}
 
 </body>
 </html>