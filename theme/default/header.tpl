<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/theme/{$get_theme}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/theme/{$get_theme}/css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/theme/{$get_theme}/js/fancy/jquery.fancybox.css" media="screen" type="text/css" />
<script src="/theme/{$get_theme}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.localscroll-1.2.5.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.serialScroll-1.2.1.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.cookies.1.4.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/common.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
var t_AllCities="{l t='All Cities'}";
</script>

<link href="/theme/{$get_theme}/css/common.css" rel="stylesheet" type="text/css" />
{if $smarty.const._LOGO_URL_ORIGINAL_}
{literal}
<style type="text/css">
<!--
#header h1{
{/literal}
background-image:url({$smarty.const._LOGO_URL_});
{literal}
}
-->
</style>
{/literal}
{/if}
<meta name="description" content="{$page_description}" />
<meta name="keywords" content="{$page_keywords}" />
<title> {if $page_title_cat} {$page_title_cat} {else} {$page_title}{/if}</title>
{literal}

 {/literal} 
</head>

<body>

{if $global_msg}
<div style="background:#ffe; text-align:center; font-size:12px; padding:5px; border-bottom:1px #ccc solid">{$global_msg}</div>
{/if}

<div id="container" class="container">

<div id="searchcity_div" class="searchbarlist"></div>

<!--Heaer Start-->
<div id="header" class="header">
    <h1 class="pull-left col-md-6 col-sm-4 col-xs-12"><a href="/" id="headerlogolink">{$page_title}</a></h1>

    {if !($smarty.const._MULTILANGUAGE_HIDE_MENU_ == 1  || $smarty.const._MULTILANGUAGE_ENABLE_==2 ) }
        <ul class="language_selector" onmouseover="show_language_bar()" onmouseout="hide_language_bar()">
            <li>{$current_language}</li>
            {foreach from=$var_language item=i}
            <li> <img src="/languages/flags/{$i.image}" border="0" /><a href="/languages/set_lang.php?lang={$i.lang}">{$i.name}</a></li>
            {/foreach}
        </ul>
    {/if}
    <div class="pull-right pull-right col-md-6 col-sm-8 col-xs-12 header-menu">
        <!-- Nav tabs -->
        <div class="col-md-2 col-sm-2 col-xs-4 pull-right">
            <ul class="nav nav-pills nav-stacked" role="tablist">
                <li role="presentation" class="active"><a href="#sign_in" class="text-center" role="tab" data-toggle="tab"><i class="fa fa-sign-in"></i></a></li>
                <li role="presentation"><a href="#search" class="text-center" role="tab" data-toggle="tab"><i class="fa fa-search"></i></a></li>
            </ul>

        </div>

        <!-- Tab panes -->
        <div class="col-md-10 col-sm-10 col-xs-8">
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="sign_in">
                    {if !$info.logged}
                        <div class="logtext">
                            <div class="row">
                                <form action="/my/login.php?f=login&referer={$referer}" method="post" name="header_login">
                                    <div>
                                        <div class="col-md-1 visible-md">&nbsp;</div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="form-group">
                                                <input class="form-control" id="header_email" type="text" name="email" value="Email" onfocus="if(this.value=='Email') this.value=''" />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="form-group">
                                                <input class="form-control" id="header_password" type="password"  name="password" value="1234" onfocus="if(this.value=='1234') this.value=''" onKeyDown="if (event.keyCode==13) header_login.submit()" />
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-4 col-xs-12">
                                            <div class="form-group">
                                                <a  id="login_btn" class="btn btn-block button-grey" onclick="header_login.submit()" href="javascript:void(0)">{l t='Sign in'}</a>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-1 visible-md"></div>
                                        <div class="col-md-11 col-sm-12 col-xs-12">
                                            <ol class="breadcrumb">
                                                <li>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="remember" id="remember"/> {l t='Remember me'}
                                                        </label>
                                                    </div>
                                                </li>
                                                <li><a href="/my/login.php">{l t='Create new account'}</a></li>
                                                <li><a href="/my/resetpsw.php">{l t='Lost password'}?</a></li>
                                                {if $smarty.const._FB_ENABLE_}
                                                    <a href="/my/loginfb.php"><img src="/theme/{$get_theme}/images/fb_connect_small.gif" alt="Connect with Facebook" style="vertical-align:middle; margin-right:5px;" border="0" /></a>
                                                {/if}
                                            </ol>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    {else}
                        <div class="logtext">{$info.logas}<br />{if $is_admin}<a href="/mgt/">{l t='Admin Area'}</a> | {/if}<a href="/my/membersearch.php">{l t='Member Search'}</a> {$info.logtext}</div>
                    {/if}
                </div>
                <div role="tabpanel" class="tab-pane" id="search">
                    <div class="search">
                        <div class="row">
                            <div class="form-group">
                                <form action="/biz/searchbiz.php" method="get" name="header_search">
                                    <input class="form-control" name="page" type="hidden" id="page" value="1" />
                                    <input class="form-control" type="hidden" name="sort_by" id="_sort_by" value="1" />
                                    <div class="col-md-1 visible-md"></div>
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <label>
                                            {if $smarty.const._MULTI_SEARCH_ENABLE_}
                                                {l t='Search'}
                                            {else}
                                                {l t='Search Business'}
                                            {/if}
                                        </label>
                                        <div class="form-group">
                                            <input class="form-control" name="srm" type="text" id="srm" />
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <label>
                                            {l t='City'}
                                        </label>
                                        <div class="form-group">
                                            <input name="city" class="form-control" type="text" id="Hsearchcity" autocomplete="off" placeholder="{l t='All Cities'}" class="commentColor cityname" />
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-12 col-sm-4">
                                        <label class="hidden-xs">&nbsp;</label>
                                        <div class="form-group">
                                            <a class="btn btn-block button-blue" onclick="header_search.submit()" href="javascript:void(0)">{l t='Search'}</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>


 
 </div>
<div class="col-xs-12">
    <nav class="main-menu navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="row">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    {$menu}
                </div><!-- /.navbar-collapse -->
            </div>
        </div><!-- /.container-fluid -->
    </nav>

</div>
<div class="clearfix"></div>
