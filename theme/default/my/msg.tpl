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
        <div id="tabsB" style=" padding:0; margin:0;">
        <ul>
                <!-- CSS Tabs -->
                  <li id="{if $is.new}current{/if}"><a href="?f=new"><span>{l t='Compose'}</span></a></li>
                  <li id="{if $is.inbox}current{/if}"><a href="?f=inbox"><span>{l t='Inbox'} ({$var_num.notcheck})</span></a></li>
                  <li id="{if $is_sent}current{/if}"><a href="?f=sent"><span>{l t='Sent'}</span></a></li>
                  <li id="{if $is_read}current{/if}" style="display:{$var_readstat}"><a><span>{l t='Read Message'}</span></a></li>
        </ul>
        </div>
<div id="clear"></div>        
    
    
{if $is.read}
     <div class="con box" style=" width:96%; padding:5px; margin:10px;">
                  <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
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
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
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
     <div class="content box" style="  clear:both;  padding:5px; margin:10px; width:96%; ">
             <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
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
		 <br/><br/><br><br><center>{l t='No message found'}.</center><br><br><br>
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
        <div class="content" style="  clear:both;  padding:10px; margin-right:10px;  ">
        	<div class="left">
            <form name="formsend" action="?f=send"  method="post">
                  <table width="96%" border="0" align="right">
                    <tr>
                      <td width="22%" height="40" valign="top"><h2>{l t='To'} </h2></td>
                <td width="78%" valign="top"><label>
                {if $var_l_choose_friend}
                        <input name="to" type="text" onfocus="this.blur()" id="to" value="{l t='Please Choose a Friend from List'}" style="border:1px #ccc solid;" size="40" />
                {else}
                <input name="to" type="text" onfocus="this.blur()" id="to" value="{$var_new.touser}" style="border:1px #ccc solid;" size="40" /> 
                {/if}
                        <input name="id" type="hidden" id="id" value="{$var_new.touserid}" />
                        <span id="caution" style="color:red; font-weight:bold; background-color:#FFFFCC">{l t='Please Choose!'} =></span>
                            <script type="text/javascript" language="javascript">
							document.getElementById('caution').style.display='none';
							</script>
                      </label></td>
                    </tr>
                    <tr>
                      <td height="40" valign="top"><h2>{l t='Subject'} </h2></td>
                      <td valign="top"><label>
                        <input name="subject" type="text" id="subject" style="border:1px #ccc solid;" size="40" />
                      </label></td>
                    </tr>
                    <tr>
                      <td valign="top"><h2>{l t='Contents'} </h2></td>
                      <td valign="top"><label>
                        <textarea name="message" id="message" cols="45" style="border:1px #ccc solid;" rows="7"></textarea>
                      </label></td>
                    </tr>
                    <tr>
                      <td height="72" valign="top">&nbsp;</td>
                      <td valign="top"><label>
                        <input type="button" name="button2" id="button2" onclick="submitsend()" value="{l t='Send'} &gt;&gt;    " />
                      </label></td>
                    </tr>
              </table>
              </form>
            </div>
            <div class="right">
			  <div style="padding:5px; width:250px; background-position:0 -100px;" id="friends" class="change box">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
              <h2>{l t='Friends'}</h2>
              
                    <ul>
                    {$var_new.friendli}
	                </ul>
			  </div>
            </div>
        </div>
{/if}
<!--/is_new-->
<!--is_msg-->   
{if $is.msg}
			   <div class="content" style="  clear:both;  padding:10px; margin-right:10px;  "><br /><br /><br />
               <center><h1>{l t='You message have been sent successfully!'}</h1></center>
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
 <!--Main End-->
 {include file="footer.tpl"}