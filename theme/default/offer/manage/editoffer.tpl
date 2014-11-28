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
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css" media="screen" />
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
                    {if $msg}
                        <div class="panel-body">
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
                        </div>
                    {else}
                        <form action="editoffer.php?id={$smarty.get.id}" method="post" class="form-horizontal list-group">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <label class="col-sm-3 control-label">{l t='Description'}</label>
                                    <div class="col-sm-9">
                                        <textarea name="description" class="form-control" rows="3">{$var_offer.offer_description}</textarea>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <label class="col-sm-3 control-label">{l t='URL'}</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="url" type="text" value="{$var_offer.offer_url}" />
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <label class="col-sm-3 control-label">{l t='Phone'}</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" name="phone" type="text" value="{$var_offer.offer_phone}" />
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <input type="button" class="btn btn-primary" value="  {l t='Submit Changes'}  " onclick="this.disabled=true; form.submit()" />
                                    </div>
                                </li>
                            </ul>
                        </form>
                    {/if}
            </div>
        </div>
    <!--Main End-->
    </div>
 </body>

 </html>