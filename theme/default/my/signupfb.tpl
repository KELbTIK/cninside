{include file="header.tpl"}

<!--Main Start-->  

<div id="main">
    <div class="content container">
        <div class="col-sm-8 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{l t='Complete Profile'}</h3>
                </div>
                <div class="panel-body">
                    <form action="?" method="post" class="form-horizontal">
                        <div class="alert alert-warning">
                            {l t='Welcome'} {$smarty.session.display_name}. {l t='Please complete your profile.'}
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">{l t='Email Address'}:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="email" id="email" value="{$smarty.post.email}" />
                                {if $loginfail==1}<br/> <div class="alert alert-danger">{l t='Email is required'}</div>{/if}
                                {if $loginfail==2}<br/> <div class="alert alert-danger">{l t='Please enter valid email address'}</div>{/if}
                                {if $loginfail==3}<br/> <div class="alert alert-danger">{l t='Email already in use'}</div>{/if}
                            </div>
                        </div>
                        {*<div class="form-group">*}
                            {*<label class="col-sm-4 control-label">>{l t='Nickname'}</label>*}
                            {*<div class="col-sm-8">*}
                                {*<input type="text" class="form-control" name="nickname" id="nickname" value="{$smarty.post.nickname}"  />*}
                                {*{if $loginfail==4} <div class="alert alert-danger">{l t='Nickname already in use'}</div>{/if}*}
                            {*</div>*}
                        {*</div>*}
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <input type="submit" name="button" id="button" class="btn button-blue" value="   {l t='Next'} &gt;&gt;   " onclick="this.disabled=true; form.submit()" />
                            </div>
                        </div>
                    </form>
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
<!--Main End-->
{include file="footer.tpl"}
