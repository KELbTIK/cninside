{if $var_list}
<!--loop-->
{foreach from=$var_list item=i}


<div class="offer_item">

    <h2><a href="/{$smarty.const._BIZ_DIR_}/{$i.permalink}">{$i.business_name}</a></h2>
    
    
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
    	<img src="/theme/{$smarty.const._THEME_}/images/star/stars_{$i.ratingmod}.gif" /><em>{l t='based on'} {$i.reviews_num} {l t='reviews'}</em>
        <br />
        {l t='Category'}: {$i.cat_name} 
        {if $i.subcat_name}
        / {$i.subcat_name} 
        {/if}
        <br />
        {if $i.city_name}
        {$i.city_name}
        {/if}
    </div>
    <div class="clearfix"></div>
    
    

</div>
{/foreach}
<!--/loop--> 
{/if}

{if !$var_lists.found}
    <div class="clearfix"></div>
    <div class="text-center">{l t='No result found'}.</div>
{else}
    <div class="row">
        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
        <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
    </div>
{/if}
