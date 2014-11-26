<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/menu.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/citychoice.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.localscroll-1.2.5.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.serialScroll-1.2.1.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/mgt/body/js/common.js" type="text/javascript"></script>

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
        <h1>Cover/Image Management for {$var_biz.bizname} <span style="float:right"><a href="business_edit.php?id={$var_biz.id}">&laquo; Back</a></span></h1>
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
                <table width="100%" cellspacing="0" border="0" cellpadding="0">
                <!--loop-->
                    {foreach from=$var_pic item=i}
                    <tr>
                	  <th width="23%">
                      {if $var_biz.picurl!=$i.url}
                      <a href="?id={$smarty.get.id}" onclick="update('business','photo_url','{$i.url}','business_id','{$smarty.get.id}')" class="ctlbtn"><img src="/theme/{$smarty.const._THEME_}/mgt/body/images/s_theme.png" alt="Cover" title="Cover" border="0" align="top" />Set as cover</a>
                      {else}
                      Current Biz Cover
                      {/if}
                      <a href="?id={$smarty.get.id}" onclick="del('business_photo','id','{$i.id}')" class="ctlbtn"><i class="fa fa-times"></i> Delete image</a>
                      </th>
                	  <td width="35%"><img src="/images/business/b_{$i.url}_195x180" /></td>
                      <td><b>Upload Date:</b><br />&nbsp; &nbsp; &nbsp; &nbsp; {$i.date}<br /><br />
                      			<b>Uploader Name/ID:</b><br />&nbsp; &nbsp; &nbsp; &nbsp;  {$i.user_name}  ({$i.user_id})<br /><br />
                                <b>Uploader Login Email:</b><br />&nbsp; &nbsp; &nbsp; &nbsp;  {$i.user_email}
                      </td>
              	    </tr>
                   {/foreach}
              <!--/loop-->
               	</table>
          {/if}
        </div><!-- End .content .detail -->
 <!--Main End-->
 </div>
 </body>
 </html>