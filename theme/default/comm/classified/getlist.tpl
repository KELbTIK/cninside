<div>
    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-hover">
        <thead>
            <tr class="header">
                <th class="hidden-xs" colspan="2">{l t='Author'}</th>
                <th class="visible-xs">{l t='Author'}</th>
                <th>{l t='Topic'}</th>
                <th class="aligncent">{l t='Category'}</th>
                <th class="aligncent hidden-xs">{l t='Replies'}</th>
                <th class="aligncent">{l t='Latest Reply'}</th>
            </tr>
        </thead>
        <tbody>
           <!--loop-->
            {foreach from=$var_list item=i}
                <tr>
                    <td  class="hidden-xs">
                        <div class="clearStyles photoBox" >
                            <a href="../my/?id={$i.userid}">
                                <img src="../images/photos/{$i.picurl}_40x40" alt="user photo" border="0" style="height:40px;width:40px;" />
                            </a>
                        </div>
                    </td>
                    <td class="nonwrapping">
                        <a href="../my/?id={$i.userid}">{$i.username}</a>
                    </td>
                    <td class="narrowTitle text-center">

                        <a href="javascript:;" onclick="get({$i.topicid},1,2)">{$i.topicname}</a>
                    </td>
                    <td class="nonwrapping aligncent">
                        <div>
                            <a href="javascript:;" onclick="sele_item('',{$i.subcatidlink});">{$i.subcatname}</a>
                        </div>
                    </td>
                    <td class="nonwrapping aligncent hidden-xs">{$i.replynum}</td>
                    <td class="nonwrapping aligncent">{$i.replytime}</td>
                </tr>
            {/foreach}
            <!--/loop-->
        </tbody>
    </table>
</div>



{if !$var_lists.found}
    <div class="clearfix"></div>
    <div class="text-center">{l t='No result found'}.</div>
{else}
    <div class="row">
        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
        <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
    </div>
{/if}
