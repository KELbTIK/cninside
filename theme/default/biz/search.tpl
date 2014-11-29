{include file="header.tpl"}
{if $admin_type}
 <script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/biz_m.js"></script>
{/if}

<script type="text/javascript">
var page="{$smarty.get.page}";
var cityname="{$smarty.get.cityname}";
var catname="{$smarty.get.catname}";
var subcatname="{$smarty.get.subcatname}";
var searchtext="{$var_search.searchtext}";
</script>

{literal}
<script type="text/javascript">
function get(nothing,p)
{
	page=p;
	nav();
}
function nav()
{
	var urlPage='';
	var urlSearchtext='';
	var urlCatname='';
	var urlSubatname='';
	var urlCityname='';

	if(page)  urlPage="page="+page;
	else  urlPage="page=1";
	if(searchtext)  urlSearchtext="&searchtext="+searchtext;
	if(catname)  urlCatname="&catname="+catname;
	if(subcatname)  urlSubatname="&subcatname="+subcatname;
	if(cityname)  urlCityname="&cityname="+cityname;

	location='/search?'+urlPage+urlSearchtext+urlCatname+urlSubatname+urlCityname;

}

</script>
{/literal}

 <!--Main Start-->

<div id="main">
    <div class="content container biz">
        <div class="row">
            <div class="col-md-3 col-sm-4 col-xs-12">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header collapse-category-header">
                            <div class="panel-title navbar-brand">
                                <b>
                                    {if $var_search.searchtext}
                                        {l t='Narrow by Category'}
                                    {else}
                                        {l t='Browse by Category'}
                                    {/if}
                                </b>
                            </div>
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#category-menu">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse collapse-category" id="category-menu">
                            {*<div class="panel-body">*}
                                <ul class="nav navbar-nav">
                                    <li><a href="/search?cityname={$smarty.get.cityname}&searchtext={$var_search.searchtext}">{l t='All Categories'}</a></li>
                                    {$var_cat.catlist}
                                </ul>
                            {*</div>*}
                        </div>
                    </div><!-- /.container-fluid -->
                </nav>
                {*<div class="panel panel-default">*}
                    {*<div class="panel-heading">*}
                        {*<h3 class="panel-title">*}
                            {*{if $var_search.searchtext}*}
                                {*{l t='Narrow by Category'}*}
                            {*{else}*}
                                {*{l t='Browse by Category'}*}
                            {*{/if}*}
                        {*</h3>*}
                    {*</div>*}
                    {*<div class="panel-body">*}
                        {*<ul class="list-unstyled">*}
                            {*<li><a href="/search?cityname={$smarty.get.cityname}&searchtext={$var_search.searchtext}">{l t='All Categories'}</a></li>*}
                            {*{$var_cat.catlist}*}
                        {*</ul>*}
                    {*</div>*}
                {*</div>*}
                <div class="text-center  hidden-xs">
                    <!-- START 160x600 Code -->
                    <p align="center">
                        {$ads->getAdCode(5)}
                    </p>
                    <!-- END Code -->
                </div>
            </div>

            <div class="col-md-9 col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Search Again'}</h3>
                    </div>
                    <div class="panel-body">
                        <form action="/biz/searchbiz.php" name="form1" method="get">
                            <div class="col-md-5 col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label>{l t='Keyword'}</label>
                                    <input type="text" name="srm" id="srm" value="" size="50" class="form-control"/>
                                    <em>{l t='e.g. McDonald\'s.'}</em>
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-4 col-xs-12">
                                <div class="form-group">
                                    <label>{l t='Near'}</label>
                                    <input type="text" name="city" id="searchcity" value="" autocomplete="off" class="cityname form-control"  />
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

                <h3>
                    <span style="color:#900;">{l t='Current Category'}: </span>
                    <span style="color:#009">
                        {if $var_cat.catid !=0}
                            <a href="/{$smarty.const._CAT_DIR_}/{$var_cat.catpermalink}/">{$var_cat.catname}</a>
                        {else}
                            {l t='All Categories'}
                        {/if}
                        {if $var_cat.subcatid} / {$var_cat.subcatname}{/if}
                    </span>
                </h3>
                {if $var_cat.catid!=0 && $var_cat.subcatid==''}
                    {l t='Narrow by Subcatgory'}:<br />
                    <div>
                        <ul class="subcatlist">
                            {$var_cat.subcatlist}
                        </ul>
                    </div>
                {/if}
                <!--loop-->
                <div class="clearfix"></div>
                <ul class="list-group">
                    {foreach from=$var_list item=i}
                        <li class="list-group-item">
                            <div class="photoBox pull-left">
                                <a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}"><img src="/images/business/{$i.picurl}_80x80" /></a>
                            </div>
                            <div>
                                <div>
                                    <h3>
                                        <a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}">{$i.bizname}</a>
                                        {$i.starbiz}
                                    </h3>
                                </div>
                                <div class="pull-right">
                                    <h5><em>{l t='Rating'}:</em>
                                        <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span>
                                        &nbsp; <img src="/theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" />
                                    </h5>
                                </div>
                                <div class="pull-right clear-right"><h5>{l t='Click'}: {$i.click} &nbsp;  {l t='Reviews'}: {$i.reviewnum}</h5></div>
                                <div>
                                    <div>
                                        {l t='Category'}: <a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/">{$i.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/{$i.subcatpermalink}/">{$i.subcatname}</a><br />
                                        {if $i.catid2 != '0'}
                                            <span style="color:#FFF">{l t='Category'}: </span><a href="/{$smarty.const._CAT_DIR_}/{$i.cat2permalink}/">{$i.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.cat2permalink}/{$i.subcat2permalink}/">{$i.subcatname2}</a><br />
                                        {/if}
                                        {if $i.catid3 != '0'}
                                            <span style="color:#FFF">{l t='Category'}: </span><a href="/{$smarty.const._CAT_DIR_}/{$i.cat3permalink}/">{$i.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$i.cat3permalink}/{$i.subcat3permalink}/">{$i.subcatname3}</a><br />
                                        {/if}
                                        <address>
                                            {$i.add1}  <br />{$i.add2}<br />
                                            {$i.location},  {$i.state} {$i.zip}  {if $admin_type}<a href="javascript:del_business('{$i.id}')"><i class="fa fa-times"></i></a>{/if}
                                        </address>
                                    </div>
                                    {if $i.type==2 && $i.extra}
                                        <div>
                                            <img src="/images/photos/p_{$i.submitter_photo}_16x16" />
                                            {$i.extra}
                                        </div>
                                    {/if}
                                    {if $i.type==1 && $i.extra}
                                        <div>{$i.extra}</div>
                                    {/if}
                                </div>
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

        </div>
    </div>
</div>
 <!--Main End-->
{include file="footer.tpl"}