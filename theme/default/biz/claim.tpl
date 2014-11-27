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
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
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

.blue h1{ margin:0 }
th{ background:#f0f7fe}
td, th{ border-top:1px  #BEE3FE solid; padding:5px;}
</style>
{/literal}
<body>
<div class="container" >
    <!--Main Start-->
    <div class="row">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title text-center">{l t='Claim business'} {$var_biz.bizname}</h3>
            </div>
            <div id="container">
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
                <form action="claim.php?id={$smarty.get.id}" method="post">
                <table class="table table_margin_bottom"  width="98%" cellspacing="0" border="0" cellpadding="0">
                    <tr>
                        <th width="30%">{l t='Business name'}</th>
                        <td width="70%">{$var_biz.bizname}</td>
                    </tr>
                    <tr>
                        <th>{l t='Permalink'}</th>
                        <td>http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{$var_biz.bizurl}</td>
                    </tr>
                    <tr>
                        <th>{l t='Current owner'}</th>
                        <td>{$var_owner.name}</td>
                    </tr>
                    <tr>
                        <th>{l t='Your name'}</th>
                        <td><input class="form-control" name="name" type="text" id="name" style="width:100%;" value="{$var_me.fullname}" /></td>
                    </tr>
                    <tr>
                        <th>{l t='Your phone number'}</th>
                        <td><input class="form-control" name="phone" type="text" id="phone" style="width:100%;" value="{$var_biz.phone}" /></td>
                    </tr>
                    <tr>
                        <th>{l t='Your email'}</th>
                        <td><input class="form-control" name="email" type="text" id="email" style="width:100%;" value="{$var_me.email}" /></td>
                    </tr>
                    <tr>
                        <th>{l t='Are you the owner?'}</th>
                        <td><label><input type="checkbox" name="isowner"/>
                                {l t='I\'m the owner of this business.'}</label></td>
                    </tr>
                    <tr>
                        <th>{l t='Claim testimony'}</th>
                        <td><textarea class="form-control" name="information" id="information" style="width:100%; height:100px;"></textarea></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td><input class="btn btn-primary" type="button" value="  {l t='Submit Claiming Request'}  " onclick="this.disabled=true; form.submit()" /></td>
                    </tr>
                </table>
                </form>
                {/if}
            </div>
        </div>
    </div>

 <!--Main End-->
 </div>
 </body>
 </html>