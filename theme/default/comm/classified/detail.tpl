 <div style="margin-top:12px; position:relative;">
             <h2><a href="javascript:;" onclick="get(determinCatOrSub(),WCurPage,0);"><span style="color:#900">&lt;&lt; Back to List</span></a></h2>
               <h1>{$var_topic.name}</h1>
               <div style="float:left">
                 <h3>Category: {$var_topic.catname} / {$var_topic.subcatname}</h3>
               </div>
               <div style="float:right">
                 <h3><a href="#bottom">{l t='Page Bottom'} &dArr;</a></h3>
               </div>
               <div class="con" style="width:98%">
                                		<div class="pic">
                                   		  <div style="float:left" id="pv"><img src="../theme/{$get_theme}/images/ico_map1.gif" width="14" height="10" title="Friends Number" alt="Friends Number" /> {$var_author.friendsnum}<br />
                                          <img src="../theme/{$get_theme}/images/ico_map2.gif" width="11" height="11" title="Reviews Number" alt="Reviews Number" /> {$var_author.reviewsnum}</div>
                                          <div class="photoBox" style="float:right; margin-right:5px;"><img src="../images/photos/{$var_author.picurl}_40x40" width="40" height="40" /></div>
    
    {if $var_topic.photo_url}
    <h3 id="clear" style="padding:10px 0;">{l t='Classfied Photo'}</h3>
    <a href="/images/upload/{$var_topic.photo_url}" class="fancypic"><img src="/images/upload/100x100_{$var_topic.photo_url}" /></a>
    <div id="bigpic" style="display:none;">
    <img src="/images/upload/{$var_topic.photo_url}" />
    </div>
    {/if}
    </div>	
                                        <div class="t">
                                        			<div style="float:left"><a href="../my/?id={$var_author.id}">{$var_author.name}</a> says:</div>
                               			  			<div style="float:right">
                                                    {if $var_topic.edit_btn}  <a href="/mgt/func/select.php?sheet=deals&where=id&equal={$var_topic.id}&field=id,title,cat_id,subcat_id,user_id,location,content,reply_num,topic_date,reply_time&text=ID,,Category ID,SubcategoryID,Submitter ID,City ID,,Reply Number,Topic Date (YYYYMMDDHHIISS),Last reply time (YYYYMMDDHHIISS)" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="Edit" title="Edit" border="0" align="top" /></a>
<a href="javascript:del('deals','id','{$var_topic.id}')" class="ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_del.png" alt="Delete" title="Delete" border="0" align="top" /></a>
{/if}
                                                    {$var_topic.date}</div>
                                                    <h4 id="clear" style="padding-top:10px;">{$var_topic.message}</h4>
                                                    <p style=" display:{$var_topic.options_avail}; padding-top:10px;"><em>Other Stuff: </em>
                                          				<dd style="display:{$var_topic.option1_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Telecommuting </dd>
                                                        <dd style="display:{$var_topic.option2_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Part-time </dd>
                                                        <dd style="display:{$var_topic.option3_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Contract  </dd>
                                                        <dd style="display:{$var_topic.option4_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Non-profit  </dd>
                                                        <dd style="display:{$var_topic.option5_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Organization  </dd>
                                                        <dd style="display:{$var_topic.option6_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Internship </dd>
                                                        <dd style="display:{$var_topic.option7_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Dogs </dd>
                                                       </p><p style="display:{$var_topic.permis_avail}"><em>Permissions </em>
                                                       <dd style="display:{$var_topic.permi1_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Direct contact by recruiters is ok </dd>
                                                       <dd style="display:{$var_topic.permi2_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Phone calls to you about this job are ok </dd>
                                                       <dd style="display:{$var_topic.permi3_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Ok for others to contact you about other services, products or commercial interests </dd>
                                                       <dd style="display:{$var_topic.permi4_avail};"><span style="color:#0C0; font-weight:bold">&radic;</span> Ok to highlight this job opening for persons with disabilities </dd>

<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="15%"><em>Direct Link: </em></td>
    <td width="57%"><input name="link" id="link"  style="width:300px; border:1px #ccc solid; font-size:11px; line-height:13px;" value="{$var_topic.directlink}"/></td>
    <td width="14%"><input  type="button" onclick="javascript:copyToClipboard('link');" style=" font-size:11px;line-height:12px;" value="Copy" /></td>
    <td width="14%"><a href="/flag.php?topicid={$var_topic.id}&replyid=0&zone=1" class="iframe"><img src="../theme/{$get_theme}/images/btn/flag_button.gif" width="65" height="21" border="0" /></a></td>
  </tr>
</table>
</p>                                        </div>
       		   </div>
<!--loop-->
{foreach from=$var_reply item=i}
   <div class="con" style="width:98%">
     <div class="picR">
          <div style="float:left" id="pv"><img src="../theme/{$get_theme}/images/ico_map1.gif" width="14" height="10"  title="Friends Number" alt="Friends Number" /> {$i.friendsnum}<br />
          <img src="../theme/{$get_theme}/images/ico_map2.gif" width="11" height="11"  title="Reviews Number" alt="Reviews Number" /> {$i.reviewsnum}</div>
       <div class="photoBox" style="float:right; margin-right:5px;"><img src="../images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>

     </div>	
          <div class="tR">
            <div style="float:left"><a href="../my/?id={$i.userid}">{$i.username}</a> says:</div>
            <div style="float:right">
            {if $i.edit_btn}
            <a href="/mgt/func/select.php?sheet=deals_reply&where=id&equal={$i.id}&field=id,content,user_id,topic_id,reply_date&text=ID,,Submitter ID,Topic ID,Reply date (YYYYMMDDHHIISS)" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="Edit" title="Edit" border="0" align="top" /></a>
<a href="javascript:del('deals_reply','id','{$i.id}')" class="ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_del.png" alt="{l t='Delete'}" title="{l t='Delete'}" border="0" align="top" /></a>
            {/if}
            {$i.date}</div>
            <h4 id="clear" style="padding-top:10px;">{$i.message}</h4> <a href="/flag.php?topicid={$var_topic.id}&replyid={$i.id}&zone=1" class="iframe"><img src="../theme/{$get_theme}/images/btn/flag_button.gif" alt="" width="65" height="21" border="0"  style="float:right;"/></a>     
      </div>
   </div>
{/foreach}
<!--/loop-->
             </div>
               <div id="replyTitle" style="float:left; margin-top:20px; position:relative;"><a name="bottom"></a>
               </div>

{$var_lists.pager}
					
<form action="javascript:get({$var_topic.id},1,3);" name="reply" method="post">
        <div class="con" style="width:98%; border:0; border-top:1px #ccc solid;">
          <table width="98%" border="0" align="right">

  <tr>
    <td width="17%" align="center" valign="top"> <h2>Reply</h2></td>
    <td width="44%"><textarea name="review" style="width:370px; height:70px;"></textarea></td>
    <td width="22%" align="center" valign="bottom"><input type="submit" name="button2"  id="button2" value="  Submit »  " style="height:30px;"/></td>
    <td width="17%" align="right" valign="bottom"><h3><a href="#top">Page Top &uArr;</a></h3></td>
  </tr>
    <tr>
    <td height="30" colspan="4" valign="top"><h2><a href="javascript:;" onclick="get(determinCatOrSub(),WCurPage,0);"><span style="color:#900">&lt;&lt; Back to List</span></a></h2></td>
    </tr>
</table>
  </div>
</form>