{include file="header.tpl"}
{literal}
<style type="text/css">
<!--

-->
 </style>
{/literal}

 <!--Main Start-->

 <div id="main">

    <div class="content container">
        <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div id="slider">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            {l t='Popular Events'}
                            <em class="eventTitleComment">{l t='Events which have highest interested rate.'}</em>
                        </div>
                        <div class="panel-body">
                            <div class="col-xs-12">
                                <ul class="navigation">
                                    {l t='See Events For:'}
                                    <li style="border:0;"><a href="javascript:;">{l t='Today'}</a></li>
                                    <li><a href="javascript:;">{l t='Tomorrow'}</a></li>
                                    <li><a href="javascript:;">{l t='This Weekend'}</a></li>
                                    <li><a href="javascript:;">{l t='This Week'}</a></li>
                                    <li><a href="javascript:;">{l t='Next Week'}</a></li>
                                    <li><a href="javascript:;">{l t='This Month'}</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">
                                    <!--loop-->
                                {foreach from=$var_today item=i}
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-4">
                                            <div class="photoBox">
                                                <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-xs-8">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                                <div class="clearfix"></div>
                            </li>
                            <li class="list-group-item">
                                <!--loop-->
                                {foreach from=$var_tomorrow item=i}
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-4">
                                            <div class="photoBox">
                                                <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-xs-8">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                                <div class="clearfix"></div>
                            </li>
                            <li class="list-group-item">
                                <!--loop-->
                                {foreach from=$var_thisweekend item=i}
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-4">
                                            <div class="photoBox">
                                                <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-xs-8">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                                <div class="clearfix"></div>
                            </li>
                            <li class="list-group-item">
                                <!--loop-->
                                {foreach from=$var_thisweek item=i}
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-4">
                                            <div class="photoBox">
                                                <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-xs-8">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                            <div class="clearfix"></div>
                            </li>
                            <li class="list-group-item">
                                <!--loop-->
                                {foreach from=$var_nextweek item=i}
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-4">
                                            <div class="photoBox">
                                                <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-xs-8">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                                <div class="clearfix"></div>
                            </li>
                            <li class="list-group-item">
                                <!--loop-->
                                {foreach from=$var_thismonth item=i}
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-4">
                                            <div class="photoBox">
                                                <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-xs-8">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                                <div class="pull-right">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                                <div class="clearfix"></div>
                            </li>
                        </ul>

                    </div>




                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Popular Events This Week'} <em class="eventTitleComment">{l t='Events which have the highest review rate this week.'}</em></h3>
                    </div>
                    <div class="panel-body">
                        {foreach from=$var_hotthisweek item=i}
                            <div>
                                <div class="col-md-3 col-sm-4 col-xs-4">
                                    <div class="photoBox">
                                        <img class="img-responsive" src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                    </div>
                                </div>
                                <div class="col-md-9 col-sm-8 col-xs-8">
                                    <h3><a href="detail.php?id={$i.id}">{$i.name} </a></h3>
                                    {$i.date}<br />{$i.catname}<br />{$i.where}<br />
                                    <h4>{$i.whatwhy}</h4>
                                    <div class="pull-left"><em>{$i.reviewsnum} {l t='reviews'}</em></div>
                                    <div class="pull-right"><em>{l t='Submitted by:'} <a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a></em></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        {/foreach}
                        <!--loop-->
                        <br/>
                        <script src="../theme/{$get_theme}/js/coda-slider.js" type="text/javascript" ></script>
                        <div class="col-xs-12">
                            <div class="pull-left"><a href="new.php" class="btn btn-block btn-primary">{l t='Add Event'}</a></div>
                            <div class="pull-right" style="padding-top: 20px;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12" >
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <a href="new.php" class="btn btn-primary">{l t='Add Event'}</a>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Recently Added Events'}</h3>
                    </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_newevent item=i}
                            <li class="list-group-item">
                                <div class="pic"><div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div></div>
                                <div class="t"><h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>{$i.date}<br />{$i.whatwhy}</div>
                                <div class="clearfix"></div>
                            </li>
                        {/foreach}
                        <li class="list-group-item">
                            <div class="pull-right">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                            <div class="clearfix"></div>
                        </li>
                    </ul>

                </div>
                <div class="text-center hidden-xs">

                    <p align="center">
                        {$ads->getAdCode(8)}
                    </p>

                </div>
            </div>
        </div>
    </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}