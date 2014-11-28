<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
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
        <h1>Edit Words</h1>
        {if $msg}
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <h3 class="text-center">{$msg}</h3>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p class="text-center">[ <a href="javascript:parent.jQuery.fancybox.close();">OK</a> ]</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
        {else}
        <form action="system_language_editor_edit.php?langcode={$langcode}&words64={$words64}" method="post">
                <table width="100%" cellspacing="0" border="0" cellpadding="0">
                <!--loop-->
                    <tr>
                    	<th height="100">English</th>
                	  <td style="font-size:18px"> {$editingEnglishWords}</td>
               	    </tr>
                    <tr>
                    <th height="100">Translation</th>
                    	<td><input type="text" name="currentWords" id="currentWords" value="{$editingCurrentWords}" style=" width:97%" /></td>
                    </tr>
                    <tr>
                    	<th colspan="2" height="40">Notice: English text and your translation will be  all HTML source code</th>
                    </tr>
                    <tr>
                    	<td colspan="2" height="50" align="center"><input type="submit" value="Save" />&nbsp;</td>
                    </tr>
              <!--/loop-->
               	</table>
</form>
        {/if}
        </div><!-- End .content .detail -->
 <!--Main End-->
 </div>
 
 </body>
 </html>