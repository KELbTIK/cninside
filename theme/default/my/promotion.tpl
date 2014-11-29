{include file="header.tpl"}

<div id="container">
 <!--Main Start-->  
 
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left">{l t='Claim Credit Points for'} {$var_user.fullname}</h3>
                        <div class="pull-right">
                            <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <div>
                            {if $msg}
                                {$msg}
                            {else}
                                <form action="/my/promotion.php" method="post" class="form form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Member'}</label>
                                        <div class="col-sm-8">
                                            {$var_user.fullname} ({$var_user.email})
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Promotional Code'}</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="code" id="code" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-8">
                                            <input type="submit" name="button" id="button" class="trialBbtn btn btn-primary" value="{l t='Claim Now'}" />
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
</div>

</div>
{include file="footer.tpl"}