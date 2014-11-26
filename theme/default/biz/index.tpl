
{include file="header.tpl"}
<!--Main Start-->
<div id="main">
    <br/>
    <div class="container">
        <div class="col-md-6 col-xs-12">
            <div class="items">
                <!--loop-->
                {foreach from=$var_bestof item=i}
                    <div class="per">
                        <h2><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" >{$i.catname}</a></h2>
                        {$i.reviewnum} {l t='reviews'}
                        <div class="photoBox" style=" overflow:hidden; width:150px; height:100px;"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" >
                                <img src="/images/business/{$i.picurl}_150x95" /></a></div>
                        <ol>
                            {$i.bizli}
                        </ol>
                        <p align="right" style="padding-right:5px;"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" class="Bbtn">{l t='More'}</a></p>
                    </div>
                {/foreach}
                <!--/loop-->
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">{l t='Browse by Category'}</h3>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <li><a href="search.php">{l t='All Categories'}</a></li>
                            {$var_category_li}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xs-12 text-center">
            {$ads->getAdCode(4)}
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}


