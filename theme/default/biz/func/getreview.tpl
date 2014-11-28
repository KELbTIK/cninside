<!--loop-->
<ul class="list-group">
    {foreach from=$var_list item=i}
        <li class="list-group-item">
            <div class="row">
                <div class="pic col-md-2 col-sm-3 col-xs-12">
                    <div class="pull-left review-img"><img src="/images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>
                    <div id="pv">
                        <i class="fa fa-male"></i>
                        {$i.friendsnum}
                        <br />
                        <i class="fa fa-star"></i>
                        {$i.reviewsnum}
                    </div>
                    <div class="clearfix"></div>
                    <h4>
                        <a href="/my/?id={$i.userid}" target="_blank">{$i.username}</a>
                        {if $i.fb_user_id}<img src="/theme/{$get_theme}/images/fb_16.gif" border="0"/>{/if}
                        <br />
                        {$i.location}
                    </h4>
                </div>
                <div class="t col-md-10 col-sm-9 col-xs-12">
                    <div>
                        {if $i.mrating}
                            <table>
                                <tr>
                                    <td>{l t='Over All'}</td>
                                    <td><img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /></td>
                                </tr>
                                {foreach from=$i.mrating item=j}
                                    <tr>
                                        <td>{$j.title}</td>
                                        <td><img src="/theme/{$get_theme}/images/star/stars_{$j.rating}.gif" width="74" height="15" /></td>
                                    </tr>
                                {/foreach}
                            </table>
                            <br />
                            {else}
                            <img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" />
                        {/if}
                    </div>
                    <div>
                        {if $i.edit_btn}
                            <a href="/mgt/func/select.php?sheet=business_reviews&where=review_id&equal={$i.reviewid}&field=review_id,review_desc,review_date,user_id,business_id,rating,cat_id,city_id&text=ID,Review content,Review date (YYYYMMDDHHIISS),Submitter,Business ID,Conmment Rating,Category ID,City ID" class="fancybox fancybox.iframe ctlbtn">
                                <i class="fa fa-pencil-square-o"></i>
                            </a>
                            <a href="javascript:del_bizreview('{$i.reviewid}')" class="ctlbtn">
                                <i class="fa fa-times"></i>
                            </a>
                        {/if}
                        {$i.date}
                    </div>
                    <h4>{$i.msg}</h4>
                    {if $i.owner_reply}
                        <div id="owner_reply_div">
                            <h3>{l t='Owner Reply'}:<span>{$i.owner_reply_date}</span></h3>
                        {$i.owner_reply}
                        </div>
                    {/if}
                    <div class="text-right">
                        {if $var_me.user_id==$var_owner.user_id}
                            <textarea id="ownerreplytext_{$i.reviewid}" class="hidden">{$i.owner_reply}</textarea>
                            <input type="button" id="ownerreplybtn_{$i.reviewid}" class="hidden" value="Reply" onclick="submitreply('{$i.bizid}','{$i.reviewid}')" />
                            {if $i.owner_reply}
                                <a id="ownerreplylink_{$i.reviewid}" href="javascript:showreply('{$i.reviewid}')"><i class="fa fa-pencil-square-o"></i> {l t='Edit Reply'}</a> &nbsp;
                            {else}
                                <a id="ownerreplylink_{$i.reviewid}" href="javascript:showreply('{$i.reviewid}')"><img src="/theme/{$get_theme}/images/alarm_clock.gif" border="0" /> {l t='Owner Reply'}</a> &nbsp;
                            {/if}
                        {/if}
                        <a href="/flag.php?topicid={$i.bizid}&replyid={$i.reviewid}&zone=2" class="fancybox fancybox.iframe"><i class="fa fa-flag"></i> {l t='Flag as inappropriate'}</a>
                    </div>
                    <!--Vote-->
                    <span class="vote{$i.reviewid}">
                        &raquo; {l t='Was the review'}:
                        <a href="javascript:vote({$i.reviewid},'useful')">{l t='Useful'}</a>
                        ({$i.useful}) |
                        <a href="javascript:vote({$i.reviewid},'funny')">{l t='Funny'}</a>
                        ({$i.funny}) |
                        <a href="javascript:vote({$i.reviewid},'lame')">{l t='Lame'}</a>
                        ({$i.lame})
                    </span>
                </div>
                <div class="clearfix"></div>
            </div>
        </li>
    {/foreach}
</ul>
<!--/loop-->
{if $var_lists.found==''}
    <div class="clearfix"></div>
    <div class="panel panel-default">
        <div class="panel-body text-center">
            {l t='No review found'}.
        </div>
    </div>
{else}
    <div class="col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
{/if}
<div class="clearfix"></div>
