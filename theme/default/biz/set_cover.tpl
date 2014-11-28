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
    <link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
    <link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/mgt/body/css/common.css" />
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container" class="content container">
    <!--Main Start-->
    <div class="row">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Cover/Image Management for {$var_biz.bizname}</h3>
                <span class="pull-right"><a class="btn btn-danger" href="edit.php?id={$var_biz.id}"><i class="fa fa-reply"></i> Back</a></span>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">
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
                    <p class="text-center">[ <a href="#" onclick="parent.$.fn.fancybox.close(); return false">OK</a> ]</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                {else}
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_pic item=i}
                            <li class="list-group-item">
                                <div>
                                    {if $var_biz.picurl!=$i.url}
                                        <a href="?id={$smarty.get.id}&f=cover&v={$i.url}" class="ctlbtn btn btn-primary"><img src="/theme/{$smarty.const._THEME_}/mgt/body/images/s_theme.png" alt="Cover" title="Cover" border="0" align="top" />Set as cover</a>
                                    {else}
                                        {l t='Current Biz Cover'}
                                    {/if}
                                    <a href="?id={$smarty.get.id}&f=del&v={$i.id}" onclick="if(!confirm('CAUTION! Sure to delete this item?'))return false ;" class="ctlbtn">
                                        <i class="fa fa-times"></i> {l t='Delete image'}
                                    </a>
                                </div>
                                <div><img class="img-responsive" src="/images/business/b_{$i.url}_195x180" /></div>
                                <div>
                                    <b>{l t='Upload Date'}:</b><br />&nbsp; &nbsp; &nbsp; &nbsp; {$i.date}<br /><br />
                                    <b>{l t='Uploader Name/ID'}:</b><br />&nbsp; &nbsp; &nbsp; &nbsp;  {$i.user_name}<br />
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                {/if}
            </div>
        </div>
    </div>
    <!--Main End-->
</div>
</body>
</html>







































