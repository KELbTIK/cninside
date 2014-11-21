{include file="header.tpl"}
<script>
var t_plsfill='{l t='Please fill in Subject or Message!'}';
var t_plsfillmsg='{l t='Please fill in Message!'}';
var t_suredel='{l t='Sure to delete?'}';
</script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/6532.css" />
<script type="text/javascript" language="javascript" src="/theme/{$get_theme}/js/msg.js"></script>


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
                     <div class="con box" style=" width:96%; padding:5px; margin:10px;">
                         <table width="100%" border="0" align="center">
                             <tr>
                                 <td width="10%" align="right" valign="top">
                                     <h3>&nbsp;                      </h3>
                                     <h3>{l t='Sender'}:</h3>
                                     <h3>{l t='To'}:</h3></td>
                                 <td width="12%" valign="top"><h4>&nbsp;</h4>
                                     <h4>
                                         {$var_read.sender}
                                     </h4>
                                     <h4>
                                         {$var_read.to}
                                     </h4></td>
                                 <td width="1%" valign="top">&nbsp;</td>
                                 <td width="59%" valign="top"><h3>&nbsp;
                                     </h3>
                                     <h3>{l t='Subject'}:

                                     </h3>{$var_read.subject}
                                     <h3>{l t='Contents'}:</h3>
                                     {$var_read.msg}
                                     <br />
                                     <br />
                                     <br />
                                 </td>
                                 <td width="18%" align="center" valign="top"><br />
                                     <br />
                                     {$var_read.msgdate}</td>
                             </tr>
                         </table>
                     </div>
                     {if $var_read.senderid!=0}
                         <form action="?f=send" method="post" name="reply" >
                             <div class="con box" style="display:{$var_readstat}; width:96%; padding:5px; margin:10px;">

                                 <table width="100%" border="0" align="center">
                                     <tr>
                                         <td width="7%" height="52" align="right" valign="top">
                                             <h3>&nbsp;</h3></td>
                                         <td width="4%" valign="top">&nbsp;</td>
                                         <td width="14%" valign="top"><h3>{l t='Reply'}:
                                                 <input type="hidden" name="id" id="id" value="{$var_read.replytoid}" />
                                                 <input type="hidden" name="subject" id="subject" value="Re:{$var_read.subject}" />
                                             </h3></td>
                                         <td width="57%" valign="top"><h3>
                                                 <textarea name="message" id="message" style="width:460px; height:50px;"></textarea>
                                             </h3>                             </td>
                                         <td width="18%" align="center" valign="bottom"><input type="button" name="button" id="button" value="     {l t='Send'} &gt;&gt;     " onclick="veri();" /></td>
                                     </tr>
                                 </table>
                             </div>
                         </form>
                     {/if}
                 {/if}
                 <!--/is_read-->
                 <!--is_inbox || sent-->
                 {if $is.inbox||$is.sent}
                     <div class="row">

                         <form id="form1" name="form1" method="post" action="?f={$var_f}&a=del" onsubmit="return confirmdel()">
                             <!--loop-->
                             {foreach from=$var_list item=i}
                                 <div class="con">
                                     <table width="100%" border="0" align="center">
                                         <tr>
                                             <td width="7%" height="63" align="right" valign="top">
                                                 <h3><a href="?f={$var_f}&a=del&id={$i.msgid}" onclick="return confirmdel()">{l t='Delete'}</a></h3></td>
                                             <td width="2%" valign="top">&nbsp;</td>
                                             <td width="14%" valign="top">
                                                 <h4><a href="./?id={$i.showuserid}">{$i.showuser}</a></h4></td>
                                             <td width="1%" valign="top">&nbsp;</td>
                                             <td width="58%" valign="top"><h3><a href="?f=read&id={$i.msgid}">
                        <span style="{if $i.checked=='0' && $is.inbox}color:red{/if}">
                        {$i.msgsubject}
                        </span>
                                                     </a></h3>
                         <span style="color:#999">
                         {$i.msgbrief}
                         </span>
                                             </td>
                                             <td width="18%" align="center" valign="top">{$i.msgdate}</td>
                                         </tr>
                                     </table>
                                 </div>
                             {/foreach}
                             <!--/loop-->

                             {if $var_lists.found==''}
                                 <div class="text-center">
                                     <br/><br/><br><br>{l t='No message found'}.<br><br><br><br/>
                                 </div>
                             {else}
                                 <div>
                                     {$var_lists.pager}
                                 </div>
                             {/if}
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
                                         <input type="button" name="button2" id="button2" class="btn button-blue col-md-4 col-sm-6 col-xs-12" onclick="submitsend()" value="{l t='Send'}   " />
                                     </div>
                                 </div>
                             </form>
                         </div>

                         <div class="right col-md-6 col-sm-5 col-xs-5">
                             <div class="row col-md-7 col-sm-12 pull-right">
                                 <div id="friends" class="panel panel-primary ">
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
                     <div class="content" style="  clear:both;  padding:10px; margin-right:10px;  "><br /><br /><br />
                         <h1>{l t='You message have been sent successfully!'}</h1>
                         <br /><p style="margin-left:250px;">{l t='Go to'}:
                         <ul style="margin-left:260px;">
                             <li><a href="?f=new">{l t='Compose another'}</a></li>
                             <li><a href="?f=inbox">{l t='Inbox'}</a></li>
                             <li><a href="?f=sent">{l t='Sent'}</a></li></ul>
                         <ul style="margin-left:260px;">
                             <li><a href="./">{l t='My Profile'}</a></li>
                             <li><a href="../">{l t='Homepage'}</a></li>
                         </ul>
                         </p>
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