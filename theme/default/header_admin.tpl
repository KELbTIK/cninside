<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/jquery.localscroll-1.2.5.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.serialScroll-1.2.1.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/jquery.cookies.1.4.js" type="text/javascript" ></script>
<script src="/theme/{$get_theme}/js/common.js" type="text/javascript" ></script>
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
<div id="container" class="content container">
<h1>{l t='Admin Area'}</h1>
<a href="/index.php">{l t='Go to Front End Area'}</a>

  