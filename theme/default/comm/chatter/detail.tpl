             <div style="margin-top:12px; position:relative;">          
             <h2><a href="javascript:;" onclick="get(determinCatOrSub(),WCurPage,0);"><span style="color:#900">&lt;&lt; {l t='Back to List'}</span></a></h2>
               <h1>{$var_topic.name}</h1>
               <div style="float:left">
                 <h3>{l t='Category'}: {$var_topic.catname}</h3>
               </div>
               <div style="float:right">
                 <h3><a href="#bottom">{l t='Page Bottom'} &dArr;</a></h3>
               </div>
               <div class="con" style="width:98%">
                                		<div class="pic">
                                   		  <div style="float:left" id="pv"><img src="../theme/{$get_theme}/images/ico_map1.gif" width="14" height="10" title="{l t='Friends Number'}" alt="{l t='Friends Number'}" />{$var_author.friendsnum}<br />
                                          <img src="../theme/{$get_theme}/images/ico_map2.gif" width="11" height="11" title="{l t='Reviews Number'}" alt="{l t='Reviews Number'}" /> {$var_author.reviewsnum}</div>
                                          <div class="photoBox" style="float:right; margin-right:5px;"><img src="../images/photos/{$var_author.picurl}_40x40" width="40" height="40" /></div>
                                		</div>	
                                        <div class="t">
                                        			<div style="float:left"><a href="../my/?id={$var_author.id}">{$var_author.name}</a> {l t='says'}:</div>
                               			  			<div style="float:right">{$var_topic.date}</div>
                                                    <h4 id="clear" style="padding-top:10px; width:90%">{$var_topic.message}</h4>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="15%"><em>{l t='Direct Link'}: </em></td>
    <td width="57%"><input name="link" id="link"  style="width:300px; border:1px #ccc
 solid; font-size:11px; line-height:13px;" value="{$var_topic.directlink}"/></td>
    <td width="28%"><input  type="button" onclick="javascript:copyToClipboard('link');" style=" font-size:11px;line-height:12px;" value="{l t='Copy'}" /></td>
  </tr>
</table>

                                          <a href="/flag.php?topicid={$var_topic.id}&replyid=0&zone=0" class="iframe"><img src="../theme/{$get_theme}/images/btn/flag_button.gif" width="65" height="21" border="0"  style="float:right;"/></a></div>
       		   </div>
        
<!--loop-->
{foreach from=$var_reply item=i}
               <div class="con" style="width:98%">
           		 <div class="picR">
                                   		  <div style="float:left" id="pv"><img src="../theme/{$get_theme}/images/ico_map1.gif" width="14" height="10"  title="{l t='Friends Number'}" alt="{l t='Friends Number'}" /> {$i.friendsnum}<br />
                                          <img src="../theme/{$get_theme}/images/ico_map2.gif" width="11" height="11"  title="{l t='Reviews Number'}" alt="{l t='Reviews Number'}" /> {$i.reviewsnum}</div>
                   <div class="photoBox" style="float:right; margin-right:5px;"><img src="../images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>

           		 </div>	
                                        <div class="tR">
                                        			<div style="float:left"><a href="../my/?id={$i.userid}">{$i.username}</a> {l t='says'}:</div>
                               			  			<div style="float:right">{$i.date}</div>
                                                    <h4 id="clear" style="padding-top:10px;">{$i.message}</h4>
                                    <a href="/flag.php?topicid={$var_topic.id}&replyid={$i.id}&zone=0" class="iframe"><img src="../theme/{$get_theme}/images/btn/flag_button.gif" alt="" width="65" height="21" border="0"  style="float:right;"/></a>                 					</div>
       		                            </div>
{/foreach}
<!--/loop-->

</div>
               <div id="replyTitle" style="float:left; margin-top:20px;"><a name="bottom"></a> </div>

{$var_lists.pager}

<form action="javascript:get({$var_topic.id},1,3);" name="reply" method="post">
        <div class="con" style="width:98%; border:0; border-top:1px #ccc solid;">
          <table width="98%" border="0" align="right">

  <tr>
    <td width="17%" align="center" valign="top"> <h2>{l t='Reply'}</h2></td>
    <td width="44%"><textarea name="review" style="width:370px; height:40px; font-size:14px; font-family:'Trebuchet MS', Arial, Helvetica, sans-serif"></textarea></td>
    <td width="22%" align="center" valign="bottom"><input type="submit" name="button2"  id="button2" value="  {l t='Submit'} »  " style="height:30px;"/></td>
    <td width="17%" align="right" valign="bottom"><h3><a href="#top">{l t='Page Top'} &uArr;</a></h3></td>
  </tr>
    <tr>
    <td height="30" colspan="4" valign="top"><h2><a href="javascript:;" onclick="get(determinCatOrSub(),WCurPage,0);"><span style="color:#900">&lt;&lt; {l t='Back to List'}</span></a></h2></td>
    </tr>
</table>
  </div>
</form>