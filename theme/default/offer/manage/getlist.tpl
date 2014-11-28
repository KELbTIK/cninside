{if $var_list}

<h2><a href="/{$smarty.const._BIZ_DIR_}/{$var_biz.permalink}">{$var_biz.business_name}</a></h2>
    <ul class="list-group">
        <!--loop-->
        {foreach from=$var_list item=i}
            <li class="list-group-item">
                <div class="special_offer">
                    <span class="preview_offer">
                        {$i.offer_description}
                        {if $i.offer_url}
                        <br /><a href="{$i.offer_url}" target="_blank">{$i.offer_url}</a>
                        {/if}
                        {if $i.offer_phone}
                        <br />{l t='Tel'}: {$i.offer_phone}
                        {/if}
                        <br /><em>{$i.offer_submit_time}</em>
                    </span>
                </div>
                <div class="business_info">
                    <img class="img-responsive" src="/theme/{$smarty.const._THEME_}/images/star/stars_{$i.ratingmod}.gif" /><em>{l t='based on'} {$i.reviews_num} {l t='reviews'}</em>

                    {l t='Category'}: {$i.cat_name}
                    {if $i.subcat_name}
                    / {$i.subcat_name}
                    {/if}

                    <br />
                    {if $i.city_name}
                    {$i.city_name}
                    {/if}
                    <br />
                    <a href="manage/editoffer.php?id={$i.offer_id}" class="fancybox fancybox.iframe"><i class="fa fa-pencil-square-o"></i> Edit</a>
                    <a href="manage/deloffer.php?id={$i.offer_id}" class="fancybox fancybox.iframe"><i class="fa fa-times"></i> Delete</a>
                </div>
                <div class="clearfix"></div>
            </li>
        {/foreach}
        <!--/loop-->
    </ul>
{/if}
                
{if !$var_lists.found}
    <div class="clearfix"></div>
    <div class="text-center">{l t='No result found'}.</div>
{else}
    <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
    <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
{/if}
