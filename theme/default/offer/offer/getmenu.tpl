<ul class="nav nav-pills nav-stacked">
    <li class="active"><a id="itemid"  onclick="sele_item(this,0);">{l t='All Categories'}</a></li>
    <!--loop-->
    {foreach from=$var_item item=i}
        <li class="item"><a id="itemid"  onclick="sele_item(this,{$i.catid});">{$i.catname}</a></li>
    {/foreach}
    <!--/loop-->
</ul>