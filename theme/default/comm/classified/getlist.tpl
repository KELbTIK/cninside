<div><table cellpadding="0" cellspacing="0" border="0" width="98%" class="listing1">
	  <tr class="header">
      						<th colspan="2">{l t='Author'}</th>
						<th>{l t='Topic'}</th>
						<th class="aligncent">{l t='Category'}</th>
						<th class="aligncent">{l t='Replies'}</th>
						<th class="aligncent">{l t='Latest Reply'}</th>
					</tr>
<!--loop-->
{foreach from=$var_list item=i}
					<tr valign="middle"><td width="64" style="padding:10px 0px 10px 5px;"><div class="clearStyles photoBox" ><a href="../my/?id={$i.userid}"><img src="../images/photos/{$i.picurl}_40x40" alt="user photo" border="0" style="height:40px;width:40px;" /></a></div></td>
						<td width="104" class="nonwrapping" style="padding:0px 0px 0px 5px;">
							<a href="../my/?id={$i.userid}">{$i.username}</a></td>
						<td width="504" class="narrowTitle">
							<a href="javascript:;" onclick="get({$i.topicid},1,2)">{$i.topicname}</a></td>
						
					  <td width="76" class="nonwrapping aligncent"><a href="javascript:;" onclick="sele_item('',{$i.subcatidlink});">{$i.subcatname}</a></td>
						<td width="41" class="nonwrapping aligncent">{$i.replynum}</td>
						<td width="113" class="nonwrapping aligncent">{$i.replytime}</td>
					</tr>
{/foreach}
<!--/loop-->
				</table>
</div>


                
        {if !$var_lists.found}
        <br id="clear"/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
        {else}
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
		    {$var_lists.pager}
        {/if}
