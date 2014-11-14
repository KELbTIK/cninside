<ul class="nav nav-pills nav-stacked">
    {if $cat==0}
    <li class="active"><a id="itemid" onclick="sele_item(this,0);">{l t='All Categories'}</a></li>

    <!--loop-->
    {foreach from=$var_item item=i}
        <li class="item"><a id="itemid" onclick="sele_item(this,{$i.catid});get({$i.catid},0,1);">{$i.catname}</a></li>
    {/foreach}
    <!--/loop-->

    {else}
    <li class="item" ><a id="itemid"  onclick="sele_item(this,0);get(0,0,1);"><span style="color:#E00;">&laquo; {l t='Back'}</span></a></li>
    <li class="active"><a id="itemid"  onclick="sele_item(this,{$cat});">{l t='All Subcategories'}</a></li>

    <!--loop-->
    {foreach from=$var_item item=i}
        <li class="item"><a id="itemid" onclick="sele_item(this,{$i.subcatidlink});">{$i.subcatname}</a></li>
    {/foreach}
    <!--/loop-->
    {/if}
</ul>