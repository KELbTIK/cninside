{include file="header.tpl"}
{literal}
<style type="text/css">
<!--
.text_vision{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
-->
 </style>

{/literal}


<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Invite Your Friends'}</h3>
                    </div>
                    <div class="panel-body">
                        {if $msg==''}
                            <form action="?f=send" method="post" name="form1">

                                <div class="row">
                                    <div class="row col-md-6 col-sm-12 col-xs-12">

                                        <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                            <label class="text_vision" for="email_1">{l t='Email Address'}</label>
                                            <input type="email" class="form-control" name="email_1" placeholder="Enter email">
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                            <label class="text_vision" for="fname_1">{l t='Full Name'} <em>{l t='(optional)'}</em></label>
                                            <input type="text" class="form-control" name="fname_1" placeholder="Enter name">
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="email" class="form-control" name="email_2" placeholder="Enter email">
                                            <br/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="text" class="form-control" name="fname_2" placeholder="Enter name">
                                            <br/>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="email" class="form-control" name="email_3" placeholder="Enter email">
                                            <br/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="text" class="form-control" name="fname_3" placeholder="Enter name">
                                            <br/>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="email" class="form-control" name="email_4" placeholder="Enter email">
                                            <br/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="text" class="form-control" name="fname_4" placeholder="Enter name">
                                            <br/>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="email" class="form-control" name="email_5" placeholder="Enter email">
                                            <br/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input type="text" class="form-control" name="fname_5" placeholder="Enter name">
                                            <br/>
                                        </div>

                                        <div class="col-md-12 col-sm-12 col-xs-12" style="display:none;">
                                            <a href="#" >Or, paste a list of email   addresses</a>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12" align="justify" style="display:none;">
                                            You can also invite friends using your   Gmail, Hotmail, Yahoo or AOL address book.<a href="#"> Invite mail contacts</a>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-12">
                                                    <p>
                                                        {l t='Here is what we\'ll send to your friends to invite them - edit or remove the message below.'}
                                                    </p>
                                                    <p>
                                                        Hi [name],
                                                    </p>
                                                    <div class="row">
                                                        <label for="subject">
                                                            <textarea class="form-control" rows="8" name="subject" cols=70">{l t='Have you heard about %s? Check it out:' r=$smarty.const._SITENAME_}http://{$smarty.const._DOMAIN_} - {$var_me.name}
                                                            </textarea>
                                                        </label>
                                                        <div class="row">
                                                            <label class="col-md-4 col-sm-3 col-xs-4">
                                                                <br/>
                                                                <input type="submit" class="btn button-blue" value="{l t='Send Invite'}" onclick="this.disabled=true;form.submit();" />
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        {else}
                            <div class="con" align="center">
                                <h1>&nbsp;</h1>
                                <h1>&nbsp;</h1>
                                <h1>&nbsp;</h1>
                                <h1></h1>
                                <h1>{$msg}</h1>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </div>
                        {/if}
                    </div>
            </div>
        </div>

    </div>

</div>
</div>
 <!--Main End-->
  {include file="footer.tpl"}