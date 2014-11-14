{if $cat==0}
<div id="itemid" class="itemS"  onclick="sele_item(this,0);"><strong>{l t='All Categories'}</strong></div>

<!--loop-->
{foreach from=$var_item item=i}
<div id="itemid" class="item"  onclick="sele_item(this,{$i.catid});get({$i.catid},0,1);"><strong>{$i.catname}</strong></div>
{/foreach}
<!--/loop-->

{else}
<div id="itemid" class="item"  onclick="sele_item(this,0);get(0,0,1);"><strong><span style="color:#E00;">&laquo; {l t='Back'}</span></strong></div>
<div id="itemid" class="itemS"  onclick="sele_item(this,{$cat});"><strong>{l t='All Subcategories'}</strong></div>

<!--loop-->
{foreach from=$var_item item=i}
<div id="itemid" class="item"  onclick="sele_item(this,{$i.subcatidlink});"><strong>{$i.subcatname}</strong></div>
{/foreach}
<!--/loop-->
{/if}