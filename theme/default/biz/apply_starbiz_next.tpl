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
    body,td,th {
        font-family: Arial, Helvetica, sans-serif; font-size: 12px;	color: #000000;
    }



    .box  h2 {
        border-bottom:1px solid #CCCCCC;
        display:block;
        font-size:18px;
        font-weight:normal;
        padding:0 0 10px 10px;
    }

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

<body class="container">
        {if $smarty.const._PAYPAL_ENABLE_ && $paypal_pricing}
            <div id="header">
                <h1><a href="/" id="headerlogolink"></a><br /><br /></h1>
            </div>
        {/if}
        <div class="panel panel-info">
            <div class="panel-heading text-center">
                <h3 class="panel-title">{l t='Apply StarBiz'} {$var_biz.bizname}</h3>
            </div>
            <div id="container">
                <!--Main Start-->
                {if $smarty.const._PAYPAL_ENABLE_ && $method == 'paypal'}
                    {if $smarty.const._PAYPAL_TESTMODE_}
                    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" class="form">
                        {else}
                        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" class="form">
                    {/if}
                            <input type="hidden" name="amount" value="{$amount}">
                            <input type="hidden" name="cmd" value="_xclick">
                            <input type="hidden" name="business" value="{$smarty.const._PAYPAL_EMAIL_}">
                            <input type="hidden" name="notify_url" value="http://{$smarty.const._DOMAIN_}/paypal-ipn.php" />
                            <input type="hidden" name="item_name" value="{l t='StarBiz Payment'}">
                            <input type="hidden" name="item_number" value="{$var_biz.id}">
                            <input type="hidden" name="no_shipping" value="1">
                            <input type="hidden" name="no_note" value="1">
                            <input type="hidden" name="currency_code" value="USD">
                            <input type="hidden" name="lc" value="US">
                            <input type="hidden" name="bn" value="PP-BuyNowBF">

                            <input type="hidden" name="return" value="http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{$var_biz.bizurl}" />

                            <table class="table table_margin_bottom" width="99%" cellspacing="0" border="0" cellpadding="0">
                                <tr>
                                    <td colspan="2" align="center"><img class="img-responsive" src="/theme/{$smarty.const._THEME_}/images/apply_starbiz.png" /></td>
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
                                    <td>{$amount}</td>
                                </tr>

                                <tr>
                                    <th>{l t='Payment'}</th>
                                    <td>{l t='Paypal'}</td>
                                </tr>


                                <tr>
                                    <th>&nbsp;</th>
                                    <td><input class="btn btn-primary" type="button" value="  {l t='Apply StarBiz'}  " onclick="this.disabled=true; form.submit()" /></td>
                                </tr>
                            </table>

                        </form>

                        {else}
                        {if $msg}
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <h3 class="text-center"> {l t='Sorry, you do not have enough points. You currently have'} {$credit} {l t='credit points'}. </h3>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p class="text-center"><input action="action" class="btn btn-primary" type="button" onclick="history.go(-1);" value=" {l t='Back'}" /></p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>

                        {else}

                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <h3 class="text-center">{l t='We have received your payment to upgrade your business listing to StarBiz.'} {$amount} {l t='credit points have been deducted from your credit points'}. </h3>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p class="text-center"><input action="action" class="btn btn-primary" type="button" onclick="history.go(-1);" value=" {l t='Back'}" /></p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                        {/if}
                        {/if}
                        <!-- End .content .detail -->
                <!--Main End-->
            </div>
        </div>
</body>
</html>





