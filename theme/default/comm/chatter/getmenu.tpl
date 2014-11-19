<ul class="nav nav-pills nav-stacked">
    <li class="active"><a id="itemid" onclick="sele_item(this,0);"><strong>{l t='All Categories'}</strong></a></li>

    <!--loop-->
    {foreach from=$var_item item=i}
    <li id="itemid" class="item">
        <a id="itemid" onclick="sele_item(this,{$i.catid});">
            <strong>{$i.catname}</strong>
            <div>
                <i class="fa fa-comment-o"></i>
                {$i.lasttime}
            </div>
        </a>

    </li>
    {/foreach}
    <!--/loop-->
</ul>