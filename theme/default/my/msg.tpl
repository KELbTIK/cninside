{include file="header.tpl"}
<script>
    var t_plsfill='{l t='Please fill in Subject or Message!'}';
    var t_plsfillmsg='{l t='Please fill in Message!'}';
    var t_suredel='{l t='Sure to delete?'}';
</script>
<script type="text/javascript" src="/theme/{$get_theme}/js/msg.js"></script>


<!--Main Start-->
<div id="main">
    <div class="col-md-12"><br/></div>
    <div class="container">
        <div id="tabsB" >
            <ul class="nav nav-pills">
              <!-- CSS Tabs -->
              <li role="presentation" class="{if $is.new}active{/if}" id="{if $is.new}current{/if}"><a href="?f=new"><span>{l t='Compose'}</span></a></li>
              <li role="presentation" class="{if $is.inbox}active{/if}" id="{if $is.inbox}current{/if}"><a href="?f=inbox"><span>{l t='Inbox'} ({$var_num.notcheck})</span></a></li>
              <li role="presentation" class="{if $is.sent}active{/if}" id="{if $is.sent}current{/if}"><a href="?f=sent"><span>{l t='Sent'}</span></a></li>
              <li role="presentation" class="{if $is.read}active{/if}" id="{if $is.read}current{/if}" style="display:{$var_readstat}"><a><span>{l t='Read Message'}</span></a></li>
            </ul>
             <br/>
        </div>

         <div class="panel panel-default">
             <div class="panel-body">
                 <div>
                     {if $is.read}
                         <div class="form-horizontal">
                             <div class="form-group">
                                 <label class="col-sm-3 text-right">{l t='Sender'}:</label>
                                 <div class="col-sm-3">
                                     {$var_read.sender}
                                 </div>
                                 <label class="col-sm-3 text-right">{l t='To'}:</label>
                                 <div class="col-sm-3">
                                     {$var_read.to}
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label class="col-sm-3 text-right">{l t='Subject'}:</label>
                                 <div class="col-sm-3">
                                     {$var_read.subject}
                                 </div>
                                 <label class="col-sm-3 text-right">{l t='Date'}:</label>
                                 <div class="col-sm-3">
                                     {$var_read.msgdate}
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label class="col-sm-3 text-right">{l t='Contents'}:</label>
                                 <div class="col-sm-9">
                                     {$var_read.msg}
                                 </div>
                             </div>
                         </div>
                         {if $var_read.senderid!=0}
                             <div class="row">
                                 <form action="?f=send" method="post" name="reply" class="form-horizontal">
                                     <div style="display:{$var_readstat};" class="form-group">
                                         <label class="col-sm-3 text-right"> {l t='Reply'}:</label>
                                         <div class="col-sm-6">
                                            <input type="hidden" name="id" id="id" value="{$var_read.replytoid}" />
                                            <input type="hidden" name="subject" id="subject" value="Re:{$var_read.subject}" />
                                            <textarea name="message" id="message" class="form-control"></textarea>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="button" name="button" id="button" class="btn btn-primary" value="{l t='Send'}" onclick="veri();" />
                                        </div>
                                     </div>
                                 </form>
                             </div
                         {/if}
                     {/if}
                     <!--/is_read-->
                     <!--is_inbox || sent-->
                     {if $is.inbox||$is.sent}
                         <div class="row">
                            <form id="form1" name="form1" method="post" action="?f={$var_f}&a=del" onsubmit="return confirmdel()">
                                <!--loop-->
                                {foreach from=$var_list item=i}
                                    <div class="col-sm-3">
                                        <h3><a href="?f={$var_f}&a=del&id={$i.msgid}" onclick="return confirmdel()">{l t='Delete'}</a></h3>
                                    </div>
                                    <div class="col-sm-3">
                                        <h4><a href="./?id={$i.showuserid}">{$i.showuser}</a></h4>
                                    </div>
                                    <div class="col-sm-3">
                                        <h3>
                                            <a href="?f=read&id={$i.msgid}">
                                                <span style="{if $i.checked=='0' && $is.inbox}color:red{/if}">
                                                    {$i.msgsubject}
                                                </span>
                                            </a>
                                        </h3>
                                        <span style="color:#999">
                                            {$i.msgbrief}
                                        </span>
                                    </div>
                                    <div class="col-sm-3">{$i.msgdate}</div>
                                {/foreach}
                                <!--/loop-->
                                {if $var_lists.found==''}
                                    <div class="col-xs-12">
                                        <div class="clearfix"></div>
                                        <div class="text-center">{l t='No message found'}.</div>
                                    </div>
                                {else}
                                    <div class="col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
                                {/if}
                                <div class="clearfix"></div>
                            </form>
                         </div>
                     {/if}
                     <!--/is_inbox || sent-->
                     <!--is_new-->
                     {if $is.new}
                         <div class="row">
                             <div class="left col-md-6 col-sm-7 col-xs-7">
                                 <form class="form-horizontal" role="form" name="formsend" action="?f=send"  method="post">
                                     <div class="form-group">
                                         <label for="to" class="col-md-2 control-label">{l t='To'}</label>
                                         <div class="col-md-10">

                                                 {if $var_l_choose_friend}
                                                     <input class="form-control text_vision" name="to" type="text" onfocus="this.blur()" id="to" value="{l t='Please Choose a Friend from List'}">
                                                 {else}
                                                     <input name="to" type="text" onfocus="this.blur()" id="to" value="{$var_new.touser}" class="form-control" >
                                                 {/if}
                                                 <input name="id" type="hidden" id="id" value="{$var_new.touserid}" >
                                                 <div id="caution" class="alert alert-danger">{l t='Please Choose!'} =></div>

                                                 <script type="text/javascript" language="javascript">
                                                     document.getElementById('caution').style.display='none';
                                                 </script>

                                         </div>
                                     </div>


                                     <div class="form-group">
                                         <label for="subject" class="col-md-2 control-label">{l t='Subject'}</label>
                                         <div class="col-md-10">
                                             <input class="form-control" name="subject" type="text" id="subject" >
                                         </div>
                                     </div>

                                     <div class="form-group">
                                         <label for="message" class="col-md-2 control-label">{l t='Contents'}</label>
                                         <div class="col-md-10">
                                             <textarea name="message" id="message" class="form-control" rows="7" cols="45"></textarea>
                                             <br/>
                                             <input type="button" name="button2" id="button2" class="btn btn-primary col-md-4 col-sm-6 col-xs-12" onclick="submitsend()" value="{l t='Send'}   " />
                                         </div>
                                     </div>
                                 </form>
                             </div>

                             <div class="right col-md-6 col-sm-5 col-xs-5">
                                 <div class="row col-md-7 col-sm-12 pull-right">
                                     <div id="friends" class="panel panel-primary">
                                         <div class="panel-heading">
                                             <h3 class="panel-title">{l t='Friends'}</h3>
                                         </div>
                                         <div class="panel-body">
                                             <ul>
                                                 {$var_new.friendli}
                                             </ul>
                                         </div>
                                     </div>
                                 </div>


                             </div>
                         </div>
                     {/if}
                     <!--/is_new-->
                     <!--is_msg-->
                     {if $is.msg}
                         <div class="content"><br /><br /><br />
                             <h1>{l t='You message have been sent successfully!'}</h1>
                             <br />
                             <p>{l t='Go to'}:</p>
                             <ul>
                                 <li><a href="?f=new">{l t='Compose another'}</a></li>
                                 <li><a href="?f=inbox">{l t='Inbox'}</a></li>
                                 <li><a href="?f=sent">{l t='Sent'}</a></li></ul>
                             <ul>
                                 <li><a href="./">{l t='My Profile'}</a></li>
                                 <li><a href="../">{l t='Homepage'}</a></li>
                             </ul>
                             <br /><br />
                         </div>
                     {/if}
                     <!--is_msg-->
                 </div>
             </div>
         </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}