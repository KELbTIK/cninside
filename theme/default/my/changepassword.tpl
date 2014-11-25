{include file="header.tpl"}
<!--Main Start-->
<div id="main">
<div class="content container">
    <div class="row">
        <div class="col-md-9 col-sm-9 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        {l t='Change Password'}
                        <div class="pull-right">
                            <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                        </div>
                        <div class="clearfix"></div>
                    </h3>
                </div>
                <div class="panel-body">
                    <form action="?f=change" method="post" name="form1" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">{l t='Your Current Email Address (Login name)'}</label>
                            <div class="col-sm-8">
                                <label class="control-label">{$var_currentemail}</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">{l t='Current Password'}</label>
                            <div class="col-sm-8">
                                <input name="old_password" class="form-control" type="password" id="old_password" size="40" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">{l t='New Password'}</label>
                            <div class="col-sm-8">
                                <input name="password" class="form-control" type="password" id="password" size="40" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">{l t='Confirm New Password'}</label>
                            <div class="col-sm-8">
                                <input class="form-control" name="rpassword" type="password" id="rpassword" size="40" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <input class="btn button-blue" type="submit" name="button" id="button" value=" {l t='Change'} " />
                            </div>
                        </div>
                    </form>
                </div>
            </div>


        </div>

        <div class="col-md-3 col-sm-3 hidden-xs" >
            <div class="text-center">
                <p align="center">
                    {$ads->getAdCode(3)}
                </p>
            </div>
        </div>
    </div>
</div>
</div>
<!--Main End-->
{include file="footer.tpl"}