{include file="header.tpl"}

<!--Main Start-->  

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Reset Admin Password'}</h3>
                    </div>
                    <div class="panel-body">
                        {if $var_notice!=''}
                            {$var_notice}
                        {else}
                            <form action="?f=submit" method="post" class="form-horizontal">
                                <h5>{l t='To reset your password, please fill the blanks below:'}</h5>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Admin Login Email(Username)'}:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="email" id="email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">{l t='Secure Code'}:</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-xs-8"><input name="r" id="r" class="form-control" type="text" size="4" /></div>
                                            <div class="col-xs-4"><img class="img-responsive" src="./auth_img.php" /></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-8">
                                        <input type="submit" name="button" id="button" class="btn button-blue" value="   {l t='Send'} " onclick="this.disabled=true; form.submit()" />
                                    </div>
                                </div>
                            </form>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="col-sm-4 hidden-xs" >
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
