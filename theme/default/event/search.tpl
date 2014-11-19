{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/event_search.css" />
{literal}
    <script type="text/javascript" language="javascript">
        function openCat(){
            document.getElementById('sele_cat_text').style.display='none';
            $('#sele_cat').slideDown();
        }
    </script>
    <script type="text/javascript">
        function set(field,Pvalue){
            if(field=='cat'){
                $('#cat').val(Pvalue);
            }
            if(field=='time'){
                $('#time').val(Pvalue);
            }
            if(field=='fsort'){
                $('#fsort').val(Pvalue);
            }
            $('#page').val(1);
            nav();
        }
        ///////////////////////////////
        function get(nothing,page) {
            $('#page').val(page);
            nav();
        }

        ///////////////////////////////
        function nav(){
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
            <div class="col-md-9">
                <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Events Search'}</h3>
                        </div>
                        <div class="row">
                            <div class="panel-body">
                                <form>
                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <label for="searchtext">{l t='Keywords'}</label>
                                        <input type="text" name="searchtext" class="form-control" placeholder="Text input" id="searchtext" value="{$var_search.searchtext}">
                                        <input type="hidden" name="cat" id="cat" value="{$var_search.catid}" />
                                        <input name="page" type="hidden" id="page" value="{$var_search.page}" />
                                        <input name="time" type="hidden" id="time" value="{$var_search.time}" />
                                        <input name="fsort" type="hidden" id="fsort" value="{$var_search.fsort}" />
                                        <input name="cat" type="hidden" id="cat" value="{$var_search.cat}" />
                                        <em>{l t='(e.g. Music Festival)'}</em>
                                    </div>

                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                        <label for="city">{l t='Near'}</label>
                                        <select class="form-control" id="city" name="city">
                                            <option value="0" selected="selected">{l t='ALL'}</option>
                                            {$get_getcitylist}
                                        </select>
                                        <br/>
                                    </div>

                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <label>{l t='Category'}:</label>
                                        <br/>
                                    <span id="sele_cat_text">
                                        <strong>
                                            <span style="color:#900">{$var_search.catname}
                                            </span>
                                        </strong>
                                        <a href="javascript:;" onclick="openCat()">{l t='Change'} &dArr;</a>
                                    </span>
                                        <div  class="alert alert-info" id="sele_cat">
                                            {l t='Category'}:<br>
                                            <ul class="list-unstyled list-inline clearfix">
                                                <li  onclick="this.className='SitemS';set('cat','0')" class="Sitem">{l t='ALL'}</li>
                                                <li>{$var_search.catlistli}</li>
                                            </ul>
                                        </div>
                                    </div>


                                    <div class="col-md-2 col-sm-2 col-xs-12 text-right">
                                        <input type="submit" class="btn button-blue" onclick="nav()" value="{l t='Search'}" name="Submit" /><br/>
                                    </div>

                                </form>


                            </div>
                        </div>
                    </div>

                <script type="text/javascript" language="javascript">
                    document.getElementById('sele_cat').style.display='none';
                </script>
                <div class="con nb" style="padding-bottom:0; border-bottom:0;">
                    <ol class="breadcrumb">
                        <li>{l t='Narrow by Time:'}</li>
                        <li class="{if $var_search.time=='all'}active{/if}"  onclick="this.className='active';set('time','all')">{l t='ALL'}</li>
                        <li class="{if $var_search.time=='today'}active{/if}" onclick="this.className='active';set('time','today')">{l t='Today'}</li>
                        <li class="{if $var_search.time=='tomorrow'}active{/if}" onclick="this.className='active';set('time','tomorrow')">{l t='Tomorrow'}</li>
                        <li class="{if $var_search.time=='thisweekend'}active{/if}" onclick="this.className='active';set('time','thisweekend')">{l t='This Weekend'}</li>
                        <li class="{if $var_search.time=='thisweek'}active{/if}" onclick="this.className='active';set('time','thisweek')">{l t='This Week'}</li>
                        <li class="{if $var_search.time=='nextweek'}active{/if}" onclick="this.className='active';set('time','nextweek')">{l t='Next Week'}</li>
                        <li class="{if $var_search.time=='thismonth'}active{/if}" onclick="this.className='active';set('time','thismonth')">{l t='This Month'}</li>
                    </ol>

                    <ol class="breadcrumb" id="clear">
                        <li>{l t='Sort by:'}</li>
                        <li class="{if $var_search.fsort=='date'}active{/if}" onclick="this.className='active';set('fsort','date')">{l t=' Date '}</li>
                        <li class="{if $var_search.fsort=='mostpopular'}active{/if}" onclick="this.className='active';set('fsort','mostpopular')">{l t='Most Popular'}</li>
                        <li class="{if $var_search.fsort=='recentlyadded'}active{/if}" onclick="this.className='active';set('fsort','recentlyadded')">{l t='Recently Added'}</li>
                        <li class="{if $var_search.fsort=='free'}active{/if}" onclick="this.className='active';set('fsort','free')">{l t='Free'}</li>
                    </ol>
                </div>
                <div class="clearfix"></div>
                <div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <!--loop-->
                            {foreach from=$var_list item=i}
                                <div class="incon">
                                    <div style="padding-top:8px; float:left; width:21%;">
                                        <div class="photoBox" style=" overflow:hidden; width:84px; height:84px; text-align:center;">
                                <span class="photoBox" style=" overflow:hidden; width:84px; height:84px; text-align:center;">
                                    <img src="../images/event/{$i.picurl}_80x80" />
                                </span>
                                        </div>
                                    </div>
                                    <div style="float:left; width:78%;">
                                        <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                        {$i.date}<br />{$i.catname}<br />{$i.where}<br />
                                        <h4>{$i.whatwhy}</h4>
                                        <div style="float:left;">
                                            <em>{$i.reviewnum} {l t='reviews'}</em>
                                        </div>
                                        <div style="float:right">
                                            <em>
                                                {l t='Submitted by:'}<a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a>
                                            </em>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                            <!--/loop-->
                            {if $var_lists.found==''}
                                <div class="text-center"><br/><br/><br/><br/><span ><strong >{l t='No result found'}</strong></span><br/><br/><br/><br/>
                                </div>
                            {else}
                                <div style=" float:left; padding-top:20px; padding-left:20px;">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
                                {$var_lists.pager}
                            {/if}
                        </div>
                    </div>
                    <div>
                        <br/>
                        <a href="new.php" class="btn button-blue hidden-xs hidden-sm ">{l t='Add Event'}</a>
                    </div>
                </div>
            </div>

            <div class="col-md-3" >
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                            <a href="new.php" class="btn button-blue">{l t='Add Event'}</a>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Recently Added Events'}</h3>
                        </div>
                        <div class="panel-body">
                            <!--loop-->
                            {foreach from=$var_new item=i}
                                <div class="item">
                                    <div class="pic">
                                        <div class="photoBox">
                                            <img src="../images/event/{$i.picurl}_40x40" width="40" height="40" />
                                        </div>
                                    </div>
                                    <div class="t">
                                        <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                        Begin: {$i.date} <br />{$i.whatwhy}
                                    </div>
                                </div>
                            {/foreach}
                            <!--/loop-->
                        </div>
                    </div>
                <div class="con" style="text-align:center; border:0;">
                    <p align="center">
                        {$ads->getAdCode(9)}
                    </p>
                </div>
                <div id="clear"></div>
            </div>
        </div>
    </div>
</div>
 <!--Main End-->
 {include file="footer.tpl"}