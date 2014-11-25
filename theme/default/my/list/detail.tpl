{include file="header.tpl"}
<script>
var id={$var.id};
</script>
{literal}

<script type="text/javascript">
function get(nothing,page)
{
    location='?page='+page+'&id='+id;
}
</script>
{/literal}

 <!--Main Start-->

 <div id="main">
    <div class="container">
        <div class="row">
            <br/>
            <div class="col-md-9 col-sm-8 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='List Detail'}</h3>
                    </div>
                    <div class="panel-body">
                        <h1>{$var.list_name}</h1> {$var.list_desc}
                        <h3>{l t='Author'}: <a href="../?id={$var.user_create}" target="_blank">{$var.user_create_name}</a></h3>
                        <h3>{l t='Established'}: {$var.date_create_formated}</h3>

                        <ul class="list-group">
                            <!--loop-->
                            {foreach from=$var_list item=i}
                                <li class="list-group-item">
                                    <div>
                                        <div class="pull-left">
                                            <h2><a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}" target="_blank">{$i.name}</a></h2>
                                        </div>
                                        <div class="pull-right">
                                            <h5>
                                                <em>{l t='Business Rating'}:</em>
                                                <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span> &nbsp;
                                                <img src="../../theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" />
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div>
                                        {l t='Category'}: {$i.catname} / {$i.subcatname}<br />
                                        {l t='City'}: {$i.location}
                                    </div>
                                </li>
                            {/foreach}
                        </ul>

                        <div class="row">
                            <!--/loop-->
                            <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
                            {if !$var_lists.found}
                                <div class="col-xs-12">
                                    <div class="clearfix"></div>
                                    <div class="text-center"><{l t='No result found'}.</div>
                                </div>
                            {else}
                                <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-8 hidden-xs text-center">
                    {$ads->getAdCode(3)}
            </div>
        </div>
    </div>
 </div>
 <!--Main End-->
  {include file="footer.tpl"}
