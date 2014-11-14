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

#header h1{
{/literal}
background-image:url({$smarty.const._LOGO_URL_});
background-repeat:no-repeat;
background-position: center top;
{literal}
}

</style>
{/literal}
<body style="background:none;">

{if $smarty.const._PAYPAL_ENABLE_ && $paypal_pricing}
            
<div id="header">
    <h1><a href="/" id="headerlogolink"></a><br /><br /></h1>
</div>
{/if}
<div id="container">
 <!--Main Start-->  
  <div class="detail blue">
         <span class="coner c1b"></span>
        <span class="coner c2b"></span>
        <span class="coner c3b"></span>
        <span class="coner c4b"></span>
        <center><h1>{l t='Apply StarBiz'} {$var_biz.bizname}</h1></center>
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
        
            {if $paypal_pricing}
                <form action="/{$smarty.const._BIZ_DIR_}/apply_starbiz_next.php" method="post" class="form">    
                <input type="hidden" name="id" value="{$var_biz.id}">
                
                <table width="99%" cellspacing="0" border="0" cellpadding="0">
                        <tr>
                          <td colspan="2" align="center"><img src="/theme/{$smarty.const._THEME_}/images/apply_starbiz.png" /></td>
                         </tr>
                        <tr>
                            <th width="30%">{l t='Business name'}</th>
                            <td width="70%">{$var_biz.bizname}</td>
                        </tr>
                        <tr>
                            <th>{l t='Permalink'}</th>

                            <td>http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{$var_biz.bizurl}</td>
                           
                        </tr>
                        <tr>
                            <th>{l t='Price'}</th>
                            <td>{$paypal_pricing}</td>
                        </tr>
                                                <tr>
                            <th>{l t='Payment'}</th>
                            <td>
                            {if $smarty.const._PAYPAL_ENABLE_}<input type="radio" name="method" value="paypal" /> {l t='Paypal'}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{/if}
                             
                             {if $var_owner.credit > 0}
                             <input type="radio" name="method" value="point" /> {l t='Credit Points'} ( {l t='Your Available Credit Points'}: {$var_owner.credit})
                             {else}
                                <input type="radio" name="method" value="point" /> {l t='Credit Points'} ( {l t='Your Available Credit Points'}: {$var_owner.credit}) -  <a href="/my/buy_points.php">{l t='Buy More'}</a>
                             {/if}
                            </td>
                        </tr>
                       
                        <tr>
                            <th>&nbsp;</th>
                            <td><input class="Bbtn" type="button" value="  {l t='Apply StarBiz'}  " onclick="this.disabled=true; form.submit()" /></td>
                        </tr>
                    </table>

                </form>
        
            {else}
                <form action="apply_starbiz_new.php?id={$smarty.get.id}" method="post">
                    <table width="99%" cellspacing="0" border="0" cellpadding="0">
                	    <tr>
                	      <td colspan="2" align="center"><img src="/theme/{$smarty.const._THEME_}/images/apply_starbiz.png" /></td>
               	      </tr>
                	    <tr>
	                	    <th width="30%">{l t='Business name'}</th>
                            <td width="70%">{$var_biz.bizname}</td>
                        </tr>
                	    <tr>
	                	    <th>{l t='Permalink'}</th>

                            <td>http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{$var_biz.bizurl}</td>

                        </tr>
                        <tr>
                          <th>{l t='Your name'}</th>
                          <td><input name="contact_name" type="text" id="contact_name" style="width:100%;" value="{$var_owner.fullname}" /></td>
                        </tr>
                        <tr>
	                	    <th>{l t='Your email'}</th>
                            <td><input name="contact_email" type="text" id="contact_email" style="width:100%;" value="{$var_owner.email}" /></td>
                        </tr>
                        
                        
                        <tr>
	                	    <th>&nbsp;</th>
                            <td><input class="Bbtn" type="button" value="  {l t='Apply StarBiz'}  " onclick="this.disabled=true; form.submit()" /></td>
                        </tr>
                    </table>
                    </form>

            {/if}
        {/if}
        </div><!-- End .content .detail -->

 <!--Main End-->
 </div>
 </body>
 </html>