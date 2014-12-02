<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/theme/{$get_theme}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/theme/{$get_theme}/css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/theme/{$get_theme}/js/fancy/jquery.fancybox.css" media="screen" type="text/css" />
<link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/my_gallery.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/jquery.galleria.classic.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/js/fancybox/jquery.fancybox.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/js/fancybox/helpers/jquery.fancybox-buttons.css" />

<script src="/theme/{$get_theme}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>

<script type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/frontend.js"></script>
<script src="/theme/{$get_theme}/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.localscroll-1.2.5.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.serialScroll-1.2.1.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.cookies.1.4.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/common.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.fancybox.pack.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/fancybox/helpers/jquery.fancybox-buttons.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
var t_AllCities="{l t='All Cities'}";
</script>
{literal}
    <script type="text/javascript">
        $(document).ready(function(){
            $('#tab-search').click(function(e){
                $(this).toggle();
                $('#close-search').show();
                e.preventDefault();
                $(this).parent().toggleClass('active');
                $('.tab-content .tab-pane').toggleClass('active');
            });

            $('#close-search').click(function(e){
                e.preventDefault();
                $(this).hide();
                $('.tab-content .tab-pane').toggleClass('active');
                $('#tab-search').show();
            })
        })
    </script>
{/literal}
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
</head>

<body>

{if $global_msg}
<div style="background:#ffe; text-align:center; font-size:12px; padding:5px; border-bottom:1px #ccc solid">{$global_msg}</div>
{/if}

<div id="container" class="container">
    <div class="row">


        <!--Heaer Start-->
        <div id="header" class="header">
            <h1 class="pull-left col-md-5 col-sm-4 col-xs-12 logo"><a href="/" id="headerlogolink">{$page_title}</a></h1>

            {if !($smarty.const._MULTILANGUAGE_HIDE_MENU_ == 1  || $smarty.const._MULTILANGUAGE_ENABLE_==2 ) }
                {*<ul class="language_selector" onmouseover="show_language_bar()" onmouseout="hide_language_bar()">*}
                    {*<li>{$current_language}</li>*}
                    {*{foreach from=$var_language item=i}*}
                    {*<li> <img src="/languages/flags/{$i.image}" border="0" /><a href="/languages/set_lang.php?lang={$i.lang}">{$i.name}</a></li>*}
                    {*{/foreach}*}
                {*</ul>*}
                <!-- Single button -->
                <div class="btn-group language_select">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        {$current_language} <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        {foreach from=$var_language item=i}
                            <li><a href="/languages/set_lang.php?lang={$i.lang}"><img src="/languages/flags/{$i.image}" border="0" /> {$i.name}</a></li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
            <div class="col-md-7 col-sm-8 col-xs-12 header-menu">
                <div class="row">
                    <!-- Nav tabs -->


                    <!-- Tab panes -->
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="tab-content">
                            <div class="tab-pane" id="search">
                                <div class="search">
                                    <div class="row">
                                        <div class="form-group">
                                            <form action="/biz/searchbiz.php" method="get" name="header_search">
                                                <input class="form-control" name="page" type="hidden" id="page" value="1" />
                                                <input class="form-control" type="hidden" name="sort_by" id="_sort_by" value="1" />
                                                <div class="col-md-1 col-sm-1"></div>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <div class="visible-xs"><br/></div>
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
                                                <div class="col-md-3 col-xs-12 col-sm-3">
                                                    <label>
                                                        {l t='City'}
                                                    </label>
                                                    <div class="form-group">
                                                        <input name="city" class="form-control" type="text" id="Hsearchcity" autocomplete="off" placeholder="{l t='All Cities'}" class="commentColor cityname" />
                                                    </div>
                                                    <div id="searchcity_div" class="searchbarlist"></div>
                                                </div>
                                                <div class="col-md-3 col-xs-9 col-sm-3">
                                                    <label class="hidden-xs">&nbsp;</label>
                                                    <div class="form-group">
                                                        <a class="btn btn-block btn-info" onclick="header_search.submit()" href="javascript:void(0)">{l t='Search'}</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-2 col-xs-3">
                                                    <label class="hidden-xs">&nbsp;</label>
                                                    <a href="#" class="btn btn-danger btn-block padding-clear" id="close-search">
                                                        &nbsp;<i class="fa fa-times"></i>&nbsp;
                                                    </a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="sign_in">
                            {if !$info.logged}
                                <div class="logtext">
                                    <div class="row">
                                        <form action="/my/login.php?f=login&referer={$referer}" method="post" name="header_login">
                                            <div class="hidden-xs">
                                                <div class="col-md-1 col-sm-1"></div>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <div class="form-group">
                                                        <input class="form-control" id="header_email" type="text" name="email" value="Email" onfocus="if(this.value=='Email') this.value=''" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <div class="form-group">
                                                        <input class="form-control" id="header_password" type="password"  name="password" value="1234" onfocus="if(this.value=='1234') this.value=''" onKeyDown="if (event.keyCode==13) header_login.submit()" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <div class="form-group">
                                                        <a id="login_btn" class="btn btn-block button-grey" onclick="header_login.submit()" href="javascript:void(0)">{l t='Sign in'}</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="visible-xs col-xs-9">
                                                {if !$info.logged}
                                                    <a href="/my/login.php#login-block" class="btn btn-primary btn-block" id="signin-btn">{l t='Sign in'}</a>
                                                    <br/>
                                                {else}
                                                    <div class="logtext">{$info.logas}<br />{if $is_admin}<a href="/mgt/">{l t='Admin Area'}</a> | {/if}<a href="/my/membersearch.php">{l t='Member Search'}</a> {$info.logtext}</div>
                                                {/if}
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-3">
                                                <a href="#search" class="text-center btn btn-block btn-info" id="tab-search">&nbsp;<i class="fa fa-search"></i>&nbsp;</a>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="form-group">
                                                <div class="col-md-1 col-sm-1"></div>
                                                <div class="col-md-11 col-sm-11 col-xs-12">
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
                                                    </ol>
                                                    {if $smarty.const._FB_ENABLE_}
                                                        <a href="/my/loginfb.php" class="btn btn-primary btn-xs"><i class="fa fa-facebook"></i> &nbsp;{l t='Connect with Facebook'}</a>
                                                    {/if}
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            {else}
                                <div class="row">
                                    <div class="col-md-1 col-sm-1"></div>
                                    <div class="logtext col-md-9 col-sm-9 col-xs-9">{$info.logas}<br />{if $is_admin}<a href="/mgt/">{l t='Admin Area'}</a> | {/if}<a href="/my/membersearch.php">{l t='Member Search'}</a> {$info.logtext}</div>
                                    <div class="col-md-2 col-sm-2 col-xs-3">
                                        <a href="#search" class="text-center btn btn-block btn-info" id="tab-search">&nbsp;<i class="fa fa-search"></i>&nbsp;</a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>

                </div>
            </div>


            <div class="clearfix"></div>
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
    </div>


</div>
