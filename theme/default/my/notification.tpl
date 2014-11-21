{include file="header.tpl"}


 <!--Main Start-->

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {l t='Manage Email Notifications'}
                            <div class="pull-right">
                                <h5>[ <a href="account.php">&laquo; {l t='Back to Account'}</a> ]</h5>
                            </div>
                            <div class="clearfix"></div>
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="?f=change" method="post" name="form1" class="form-horizontal notifications">
                            <h3>{l t='General'}</h3>
                            <div class="checkbox">
                                <label for="c1">
                                    <input name="f1" type="checkbox" id="c1" {if $var_noti.1==1}checked="checked"{/if} />
                                    {l t='Send me an email when major features are released so that I know what is new.'}
                                </label>
                            </div>
                            <h3>{l t='Communications'}</h3>
                            <div class="checkbox">
                                <label for="c2">
                                    <input type="checkbox" name="f2" id="c2" {if $var_noti.2==1}checked="checked"{/if} />
                                    {l t='Send me notification emails when I have received a new private message.'}
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="c3">
                                    <input type="checkbox" name="f3" id="c3"  {if $var_noti.3==1}checked="checked"{/if} />
                                    {l t='Send me notification emails when members compliment me for a recommendation.'}
                                </label>
                            </div>
                            <div class="checkbox">
                                <label for="c4">
                                    <input type="checkbox" name="f4" id="c4" {if $var_noti.4==1}checked="checked"{/if} />
                                    {l t='Send me notification email when someone give me a comment.'}
                                </label>
                            </div>
                            <br/>
                            <input type="submit" class="btn button-blue" name="button" id="button" value="    {l t='Update'}    " onclick="verify()" />
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