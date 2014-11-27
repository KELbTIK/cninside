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
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>

{literal}
    <style type="text/css">
        th{ background:#f0f7fe}
    </style>
{/literal}

<body>
<div id="container">
    <!--Main Start-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title text-center">
                {l t='Cover/Image Management for '}{$var_biz.bizname} <span style="float:right"><a href="business_edit.php?id={$var_biz.id}">&laquo; Back</a></span>
            </div>
        </div>
        <div class="detail">
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
                <table class="table table_margin_bottom" cellspacing="0" border="0" cellpadding="0">
                    <!--loop-->
                    {foreach from=$var_pic item=i}
                        <tr>
                            <th width="23%">
                                {if $var_biz.picurl!=$i.url}
                                    <a href="?id={$smarty.get.id}" onclick="update('business','photo_url','{$i.url}','business_id','{$smarty.get.id}')" class="ctlbtn"><i class="fa fa-magic"></i> Set as cover</a>
                                {else}
                                    Current Biz Cover
                                {/if}
                                <a href="?id={$smarty.get.id}" onclick="del('business_photo','id','{$i.id}')" class="ctlbtn"><i class="fa fa-times"></i> Delete image</a>
                            </th>
                            <td width="35%"><img class="img-responsive" src="/images/business/b_{$i.url}_195x180" /></td>
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
    </div>

 <!--Main End-->
 </div>
 </body>
 </html>