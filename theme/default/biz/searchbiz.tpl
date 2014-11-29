{include file="header.tpl"}

{literal}

<script type="text/javascript">
$(document).ready(function() {
    // Hide the "view" div.
    if($.cookie("search_filter")== "no")
    {$('div.view').hide();}
    // Watch for clicks on the "slide" link.

    $('h2.slide').click(function() {
    // When clicked, toggle the "view" div.
        $('div.view').slideToggle(400);
        if($.cookie("search_filter")== "no")
            {$(this).addClass("active");
             $.cookie("search_filter", "yes");
            }
        else
            {$(this).removeClass("active");
            $.cookie("search_filter", "no");
            }
        return false;
    });
});

</script>


{/literal}
 <!--Main Start-->  
 
<div id="main">
    <div class="content container biz">
        <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Search Again'}</h3>
                    </div>
                    <div class="panel-body">
                        <form action="/biz/searchbiz.php" name="form1" method="get">
                            <div class="col-md-5 col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label>{l t='Keyword'}</label>
                                        <input type="text" name="srm" id="srm" value="{$var_keyword}" size="50" class="form-control"/>
                                    <em>{l t='e.g. McDonald\'s.'}</em>
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label>{l t='Near'}</label>
                                        <input type="text" name="city"  id="searchcity" value="{$var_cityname}" autocomplete="off" class="cityname form-control"  />
                                    <em>{l t='(City name)'}</em>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-12">
                                <label class="hidden-xs">&nbsp;</label>
                                <div id="searchcity_div2" class="searchbarlist"></div>
                                <input type="hidden" name="page" id="page" value="1" />
                                <input type="hidden" name="sort_by" id="_sort_by" value="1" />
                                <input class="btn btn-primary btn-block" type="submit" value="{l t='Search'}" />
                            </div>

                        </form>
                    </div>
                </div>
                <!--loop-->
                <ul class="list-group">
                    {foreach from=$var_list item=i}
                        <li class="list-group-item">
                            <div>
                                <div class="photoBox pull-left">
                                    <a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}"><img src="/images/business/{$i.picurl}_80x80" /></a>
                                </div>
                            </div>
                            <div>
                                <div>
                                    <h3>
                                        <a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}">{$i.bizname}</a>
                                        {$i.starbiz}
                                    </h3>
                                </div>
                                <div class="pull-right">
                                    <h5>
                                        <em>{l t='Rating'}:</em>
                                        <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span>
                                        &nbsp; <img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" />
                                    </h5>
                                </div>
                                <div class="pull-right clear-right"><h5>{l t='Click'}: {$i.click} &nbsp;  {l t='Reviews'}: {$i.reviewnum}</h5></div>
                                <div>
                                    {l t='Category'}: <a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/">{$i.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/{$i.subcatpermalink}/">{$i.subcatname}</a><br />
                                    {if $i.catid2 != '0'}
                                        <span style="color:#FFF">{l t='Category'}: </span><a href="/{$smarty.const._CAT_DIR_}/{$i.cat2permalink}/">{$i.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.cat2permalink}/{$i.subcat2permalink}/">{$i.subcatname2}</a><br />
                                    {/if}
                                    {if $i.catid3 != '0'}
                                        <span style="color:#FFF">{l t='Category'}: </span><a href="/{$smarty.const._CAT_DIR_}/{$i.cat3permalink}/">{$i.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.cat3permalink}/{$i.subcat3permalink}/">{$i.subcatname3}</a><br />
                                    {/if}
                                    <address>{$i.add1}  <br />{$i.add2}<br />
                                        {$i.location}, {$i.state} {$i.zip}
                                    </address>
                                </div>
                                {if $i.type==2 && $i.extra}
                                    <div>
                                        <img src="/images/photos/p_{$i.submitter_photo}_16x16" />
                                        {$i.extra}
                                    </div>
                                {/if}
                                {if $i.type==1 && $i.extra}
                                    <div>
                                        {$i.extra}
                                    </div>
                                {/if}
                            </div>
                        </li>
                    {/foreach}
                </ul>
                <!--/loop-->
                {if $var_lists.found==''}
                    <br/><br/><br><br>{l t='No result found'}.<br><br><br>
                {else}
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="page_number">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
                        </div>
                        <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
                    </div>
                {/if}
                <div class="clearfix"></div>
                <div class="alert alert-warning" role="alert">
                    <h2 class="pull-left">{l t='The business you\'re looking for isn\'t here?'}</h2>
                    <div class="pull-right"><a href="/{$smarty.const._BIZ_DIR_}/new.php" class="btn btn-primary">{l t='Add Business'}</a></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                {if $categories}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                {if $categories}
                                    {l t='Categories'}

                                {/if}
                            </h3>
                        </div>
                        <div class="panel-body">
                            {$categories}
                            {$sort_by_section}
                            {if $reset} {$reset}{/if}


                            {if $features}
                                <h2 class="slide" style="cursor: pointer;">{l t='Features'}</h2>
                                {$features}
                            {/if}
                        </div>
                    </div>
                {/if}
                <div>
                    <!-- START 160x600 Code -->
                    <p align="center">
                    {$ads->getAdCode(5)}
                    </p>
                    <!-- END Code -->
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}