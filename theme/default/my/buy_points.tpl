{include file="header.tpl"}

<div id="container">
 <!--Main Start-->

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {l t='Buy Credit Points for'} {$var_user.fullname}
                            <div class="pull-right">
                                <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                            </div>
                        </h3>
                    </div>
                    <div class="panel-body">
                        {if $smarty.const._PAYPAL_ENABLE_ && $paypal_pricing}
                            {if $smarty.const._PAYPAL_TESTMODE_}
                                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" class="form form-horizontal">
                            {else}
                                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" class="form form-horizontal">
                            {/if}
                                    <input type="hidden" name="cmd" value="_xclick">
                                    <input type="hidden" name="business" value="{$smarty.const._PAYPAL_EMAIL_}">
                                    <input type="hidden" name="notify_url" value="http://{$smarty.const._DOMAIN_}/paypal-ipn-point.php" />
                                    <input type="hidden" name="item_name" value="{l t='Credit Points'}">
                                    <input type="hidden" name="item_number" value="{$var_user.user_id}">
                                    <input type="hidden" name="no_shipping" value="1">
                                    <input type="hidden" name="no_note" value="1">
                                    <input type="hidden" name="currency_code" value="USD">
                                    <input type="hidden" name="lc" value="US">
                                    <input type="hidden" name="bn" value="PP-BuyNowBF">
                                    <input type="hidden" name="return" value="{$var_user.link}" />

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Member'}</label>
                                        <div class="col-sm-8">
                                            <label class="control-label">{$var_user.fullname} ({$var_user.email})</label>
                                        </div>
                                    </div>
                                    {if $paypal_pricing}
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Amount'}</label>
                                        <div class="col-sm-8 register">
                                            {$paypal_pricing}
                                        </div>
                                    </div>
                                    {/if}
                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-8">
                                            <input type="submit" name="button" id="button" class="trialBbtn btn btn-primary" value="{l t='Pay Now'}" />
                                        </div>
                                    </div>
                                </form>
                            {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}