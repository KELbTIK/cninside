<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />

    <link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css" media="screen" />

	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.core.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.theme.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/css/timecntr/jquery-ui-1.7.1.custom.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css" media="screen" />
	<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.js"></script>
	<script src="/theme/{$get_theme}/js/ajax.js?100510" type="text/javascript"></script>
	<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/biz_new.js"></script>
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
        <h1>{l t='Edit deal'}</h1>
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
        <br /><br /><br /><br />
        <center>{l t='Are you sure to delete this offer?'}
        <br /><br /><a href="deloffer.php?id={$smarty.get.id}&action=delete">{l t='Yes, delete it.'}</a>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="#" onclick="parent.$.fn.fancybox.close(); return false">No</a>
        <br /><br /><br /><br /> </center> {/if}
        </div><!-- End .content .detail -->

 <!--Main End-->
 </div>
 </body>
 </html>