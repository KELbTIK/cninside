<!--loop-->
    {foreach from=$var_list item=i}
                                <div class="con" style="width:100%; overflow:hidden; clear:both">
                                		<div class="pic">
                                   		  <div style="float:left; margin-right:5px;"><img src="/images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>
                                                <div style="float:left" id="pv"><img src="/theme/{$get_theme}/images/ico_map1.gif" width="14" height="10" title="{l t='Friends Number'}" alt="{l t='Friends Number'}" />{$i.friendsnum}<br /><br /><img src="/theme/{$get_theme}/images/ico_map2.gif" width="11" height="11" title="{l t='Reviews Number'}" alt="{l t='Reviews Number'}" /> {$i.reviewsnum}</div>
                                                <h4 id="clear">
                                                <a href="/my/?id={$i.userid}" target="_blank">{$i.username}</a>
                                                {if $i.fb_user_id}<img src="/theme/{$get_theme}/images/fb_16.gif" border="0" style="vertical-align:text-bottom" />{/if}
                                                <br />
                                                {$i.location}
                                                </h4>
                                		</div>	
                                        <div class="t">
                                        			<div style="float:left">
                                                    
                                        {if $i.mrating} 
                                        <table><tr><td>{l t='Over All'}</td><td><img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /></td></tr>
                                                    {foreach from=$i.mrating item=j}
                                                     
                                                    <tr><td>{$j.title}</td><td><img src="/theme/{$get_theme}/images/star/stars_{$j.rating}.gif" width="74" height="15" /></td></tr>  
                                                    {/foreach}
                                                    </table><br />
                                                    {else}
                                                    <img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" />
                                        {/if}
                                                    </div>
                               			  			<div style="float:right">
                                                    {if $i.edit_btn}
                                                      <a href="/mgt/func/select.php?sheet=business_reviews&where=review_id&equal={$i.reviewid}&field=review_id,review_desc,review_date,user_id,business_id,rating,cat_id,city_id&text=ID,Review content,Review date (YYYYMMDDHHIISS),Submitter,Business ID,Conmment Rating,Category ID,City ID" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="{l t='Edit'}" title="{l t='Edit'}" border="0" align="top" /></a>
<a href="javascript:del_bizreview('{$i.reviewid}')" class="ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_del.png" alt="{l t='Delete'}" title="{l t='Delete'}" border="0" align="top" /></a>
                                                      
                                                      {/if}
                                                    
                                                    
                                                    {$i.date}</div>
                                                    <h4 id="clear" style="padding-top:10px; min-height:35px;">{$i.msg}</h4>
                                                     {if $i.owner_reply}
                                                    <div id="owner_reply_div">
                                                    <h3>{l t='Owner Reply'}:<span>{$i.owner_reply_date}</span></h3>
                                                    {$i.owner_reply}</div>
                                                    {/if}
                                                     <div style="text-align:right;">
                                                     {if $var_me.user_id==$var_owner.user_id}
                                                     <textarea id="ownerreplytext_{$i.reviewid}" style="height:40px; width:330px; float:left; display:none">{$i.owner_reply}</textarea>
                                                     <input type="button" id="ownerreplybtn_{$i.reviewid}" value="Reply" style=" width:80px; vertical-align:top; height:30px; float:left;display:none" onclick="submitreply('{$i.bizid}','{$i.reviewid}')" /><div style="clear:both"></div>
                                                     		{if $i.owner_reply}
                                                     <a id="ownerreplylink_{$i.reviewid}" href="javascript:showreply('{$i.reviewid}')"><img src="/theme/{$get_theme}/images/pencil.png" border="0" /> {l t='Edit Reply'}</a> &nbsp;
                                                            {else}
                                                     <a id="ownerreplylink_{$i.reviewid}" href="javascript:showreply('{$i.reviewid}')"><img src="/theme/{$get_theme}/images/alarm_clock.gif" border="0" /> {l t='Owner Reply'}</a> &nbsp;
                                                     		{/if}
                                                     {/if}
                                                      <a href="/flag.php?topicid={$i.bizid}&replyid={$i.reviewid}&zone=2" class="iframe"><img src="/theme/{$get_theme}/images/flagicon.gif" border="0" /> {l t='Flag as inappropriate'}</a> </div>
                                                      <!--Vote-->
                                                      <span style="float:left; display:block;" class="vote{$i.reviewid}">&raquo; {l t='Was the review'}: <a href="javascript:vote({$i.reviewid},'useful')">{l t='Useful'}</a>({$i.useful}) | <a href="javascript:vote({$i.reviewid},'funny')">{l t='Funny'}</a>({$i.funny}) | <a href="javascript:vote({$i.reviewid},'lame')">{l t='Lame'}</a>({$i.lame})</span>
                                                      
                                  </div>
                         		 </div>
                                 <div id="clear"></div>
         {/foreach}
                    <!--/loop-->
{if $var_lists.found==''}
		 <div class='con' style='width:100%;border:0'><br/><br/><br><br><center>{l t='No review found'}.</center><br><br><br></div>
{else}
       
             {$var_lists.pager}

         {/if}
                    			<div id="clear"></div>