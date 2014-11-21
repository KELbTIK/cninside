{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/changemail.js"></script>


<!--Main Start-->

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {l t='Manage Email Address'}
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
                                <label class="col-sm-4 control-label">{l t='New Email Address'}</label>
                                <div class="col-sm-8">
                                    <div id="err1" class="alert alert-danger">{l t='Email Format Error!'}</div>

                                    <input name="changeto" class="form-control" type="text" id="changeto" size="40" onclick="clearw()" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Re-type New Email Address'}</label>
                                <div class="col-sm-8">
                                    <div id="err2" class="alert alert-danger">{l t='Two times are not the same!'}</div>
                                    <input name="again" class="form-control" type="text" id="again" size="40" onclick="clearw()"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <input class="btn button-blue" type="button" name="button" id="button" value=" {l t='Change'} " onclick="verify()" />
                                </div>
                            </div>
                            <script type="text/javascript" language="javascript">
                                document.getElementById('err1').style.display='none';
                                document.getElementById('err2').style.display='none';
                            </script>
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