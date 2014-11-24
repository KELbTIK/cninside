{include file="header.tpl"}

<!--Main Start-->
<div id="main">
    <div id="wrap" class="content container">
        <div class="row">
            <!-- MeePlace {$smarty.const._VERSION_} -->
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form id="form1" name="form1" method="post" action="?f=login" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Admin Email'}</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" name="adminuser" id="adminuser" value="{$smarty.post.adminuser}" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Password'}</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="password" name="password" id="password"  value="{$smarty.post.password}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Secure Code'}</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-xs-8">
                                            <input class="form-control" type="input" name="r" id="r" />
                                        </div>
                                        <div class="col-xs-4">
                                            <img class="img-responsive" src="auth_img.php" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <div class="alert alert-danger" style="display:{if $loginfail!=1}none{/if}">Invalid Username or Password!</div>
                                    <div class="alert alert-danger" style="display:{if $loginfail!=2}none{/if}">Invalid Secure Code!</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <a href="resetpsw.php" style="font-size: 11px;">Forgot admin password?</a> &nbsp;
                                    <input type="submit" name="button" class="btn button-blue" id="button" value="    {l t='Log in'}    " />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}