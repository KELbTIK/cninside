<div id="itemid" class="itemS"  onclick="sele_item(this,0);"><strong>{l t='All Categories'}</strong></div>
<!--loop-->
{foreach from=$var_item item=i}
<div id="itemid" class="item"  onclick="sele_item(this,{$i.catid});"><strong>{$i.catname}</strong></div>
{/foreach}
<!--/loop-->