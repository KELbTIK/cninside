{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/event_search.css" />
{literal}
<script type="text/javascript" language="javascript">
function openCat()
{
document.getElementById('sele_cat_text').style.display='none';
$('#sele_cat').slideDown();
}
</script>
<script type="text/javascript">
function set(field,Pvalue)
{
if(field=='cat')
{
	$('#cat').val(Pvalue);
}
if(field=='time')
{
	$('#time').val(Pvalue);
}
if(field=='fsort')
{
	$('#fsort').val(Pvalue);
}
$('#page').val(1);
nav();
}
///////////////////////////////
function get(nothing,page)
{
$('#page').val(page);
nav();
}

///////////////////////////////
function nav()
{
var searchtext=$('#searchtext').val();
var cat=$('#cat').val();
var fsort=$('#fsort').val();
var city=$('#city').val();
var page=$('#page').val();
var time=$('#time').val();
location='?searchtext='+searchtext+'&cat='+cat+'&city='+city+'&page='+page+'&time='+time+'&fsort='+fsort;
}

</script>

{/literal}


<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-sm-4 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Events Search'}</h3>
                    </div>
                    <div class="panel-body">
                        <form>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="table">
                                <tbody>
                                <tr>
                                    <td width="190">
                                        {l t='Keywords'}
                                        <input type="hidden" name="cat" id="cat" value="{$var_search.catid}" />
                                        <input name="page" type="hidden" id="page" value="{$var_search.page}" />
                                        <input name="time" type="hidden" id="time" value="{$var_search.time}" />
                                        <input name="fsort" type="hidden" id="fsort" value="{$var_search.fsort}" />
                                        <input name="cat" type="hidden" id="cat" value="{$var_search.cat}" />
                                    </td>
                                    <td width="165">{l t='Near'}</td>
                                    <td>{l t='Category'}</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            <input size="25" class="form-control" name="searchtext" id="searchtext" value="{$var_search.searchtext}" />
                                        </label>
                                    </td>
                                    <td>
                                        <select class="form-control" id="city" name="city">
                                            <option value="0" selected="selected">{l t='ALL'}</option>
                                            {$get_getcitylist}
                                        </select>
                                    </td>


                                    <td width="308">
                                        <span id="sele_cat_text">
                                            <strong>
                                                <span style="color:#900">{$var_search.catname}</span>
                                            </strong>
                                            <a href="javascript:;" class="btn button-blue" onclick="openCat()">{l t='Change'} &dArr;</a>
                                        </span>
                                    </td>
                                    <td width="97" align="center">
                                        <em>
                                            <input type="submit" class="btn button-blue" onclick="nav()" value="{l t='Search'}" name="Submit" />
                                        </em>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20">
                                        <em>{l t='(e.g. Music Festival)'}</em>
                                    </td>
                                    <td height="20" colspan="3">&nbsp;</td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                        <div id="sele_cat">
                            <ul class="list-group">
                                {l t='Category'}:<br />
                                <li onclick="this.className='SitemS';set('cat','0')" class="list-group-item Sitem">{l t='ALL'}</li>
                                {$var_search.catlistli}
                            </ul>
                        </div>
                    </div>
                    <script type="text/javascript" language="javascript">
                        document.getElementById('sele_cat').style.display='none';
                    </script>
                    <ul class="list-group">
                        <li class="list-group-item">{l t='Narrow by Time:'} </li>
                        <li class="list-group-item {if $var_search.time=='all'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','all')">{l t='ALL'}</li>
                        <li class="list-group-item {if $var_search.time=='today'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','today')">{l t='Today'}</li>
                        <li class="list-group-item {if $var_search.time=='tomorrow'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','tomorrow')">{l t='Tomorrow'}</li>
                        <li class="list-group-item {if $var_search.time=='thisweekend'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','thisweekend')">{l t='This Weekend'}</li>
                        <li class="list-group-item {if $var_search.time=='thisweek'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','thisweek')">{l t='This Week'}</li>
                        <li class="list-group-item {if $var_search.time=='nextweek'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','nextweek')">{l t='Next Week'}</li>
                        <li class="list-group-item {if $var_search.time=='thismonth'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','thismonth')">{l t='This Month'}</li>
                    </ul>
                    <div class="clearfix"></div>
                    <ul class="list-group">
                        <li class="list-group-item">{l t='Sort by:'}  </li>
                        <li class="list-group-item {if $var_search.fsort=='date'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','date')">{l t=' Date '}</li>
                        <li class="list-group-item {if $var_search.fsort=='mostpopular'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','mostpopular')">{l t='Most Popular'}</li>
                        <li class="list-group-item {if $var_search.fsort=='recentlyadded'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','recentlyadded')">{l t='Recently Added'}</li>
                        <li class="list-group-item {if $var_search.fsort=='free'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','free')">{l t='Free'}</li>
                    </ul>
                    <div>
                        <ul class="list-group">
                            <!--loop-->
                            {foreach from=$var_list item=i}
                                <li class="list-group-item">
                                    <div class="pull-left review-img">
                                        <div class="photoBox text-center">
                                            <img class="img-responsive" src="../images/event/{$i.picurl}_80x80" />
                                        </div>
                                    </div>
                                    <div>
                                        <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                        {$i.date}<br />{$i.catname}<br />{$i.where}<br />
                                        <h4>{$i.whatwhy}</h4>
                                        <div style="float:left;"><em>{$i.reviewnum} {l t='reviews'}</em></div><div style="float:right"><em>{l t='Submitted by:'}<a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a></em></div>
                                    </div>
                                </li>
                            {/foreach}
                            <!--/loop-->
                        </ul>
                        {if $var_lists.found==''}
                            <div class="clearfix"></div>
                            <div class="text-center">{l t='No result found'}.</div>
                        {else}
                            <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
                        {/if}
                        <div><a href="new.php" class="btn button-blue">{l t='Add Event'}</a></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 col-xs-12" >
                <div class="panel panel-default">
                    <div class="panel-body">
                        <a href="new.php" class="btn button-blue">{l t='Add Event'}</a>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Recently Added Events'}</h3>
                    </div>
                    <ul class="list-group">
                        {foreach from=$var_new item=i}

                            <li class="list-group-item">
                                <div class="pic"><div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div></div>
                                <div class="t"><h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>Begin: {$i.date} <br />{$i.whatwhy}</div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                </div>
                <div class="text-center hidden-xs">
                    <p align="center">
                        {$ads->getAdCode(9)}
                    </p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}