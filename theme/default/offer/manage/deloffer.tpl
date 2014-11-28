<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />

    <link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css" media="screen" />

	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.core.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.theme.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/css/timecntr/jquery-ui-1.7.1.custom.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css" media="screen" />
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.js"></script>
	<script src="/theme/{$get_theme}/js/ajax.js?100510" type="text/javascript"></script>
	<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/biz_new.js"></script>
</head>

<body>
<div id="container" class="content container">
    <div class="row">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Edit deal'}</h3>
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
                    <p class="text-center">[ <a href="javascript:parent.jQuery.fancybox.close();">OK</a> ]</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                {else}
                    <br /><br /><br /><br />
                    <div class="text-center">
                        {l t='Are you sure to delete this offer?'}
                        <br /><br />
                        <a href="deloffer.php?id={$smarty.get.id}&action=delete">{l t='Yes, delete it.'}</a>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="javascript:parent.jQuery.fancybox.close();">No</a>
                        <br /><br /><br /><br />
                    </div>
                {/if}
            </div>
        </div>
    </div>
 <!--Main End-->
 </div>
 </body>
 </html>