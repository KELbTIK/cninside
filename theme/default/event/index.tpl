{include file="header.tpl"}
{literal}
<style type="text/css">
<!--

-->
 </style>
{/literal}

 <!--Main Start-->

 <div id="main">

    <div class="content">
        <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div id="slider" class="con box change" style=" padding:5px;">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                    <h2>{l t='Popular Events'}
                    <em class="eventTitleComment">{l t='Events which have highest interested rate.'}</em></h2>
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
                    <div class="scroll">
                        <div class="scrollContainer">
                            <div class="col-xs-12">
                                <div class="panel">
                                <!--loop-->
                                {foreach from=$var_today item=i}
                                    <div class="item">
                                        <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox">
                                                <img src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                            </div>
                                        </div>
                                        <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
                                            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                            <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                        </div>
                                    </div>
                                {/foreach}
                                <!--loop-->
                                </div>
                                <div class="panel">
                                    <!--loop-->
                                    {foreach from=$var_tomorrow item=i}
                                        <div class="item">
                                            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox">
                                                    <img src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                                </div>
                                            </div>
                                            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
                                                <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                                <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <!--loop-->
                                </div>
                                <div class="panel">
                                    <!--loop-->
                                    {foreach from=$var_thisweekend item=i}
                                        <div class="item">
                                            <div style="float:left; padding-top:8px; width:33%;"><div class="photoBox">
                                                    <img src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                                </div>
                                            </div>
                                            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
                                                <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                                <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <!--loop-->

                                </div>
                                <div class="panel">
                                    <!--loop-->
                                    {foreach from=$var_thisweek item=i}
                                        <div class="item">
                                            <div style="float:left; padding-top:8px; width:33%;">
                                                <div class="photoBox"><img src="../images/event/{$i.picurl}_100x100" width="100" height="100" /></div>
                                            </div>
                                            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
                                                <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                                <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <!--loop-->
                                </div>
                                <div class="panel">
                                    <!--loop-->
                                    {foreach from=$var_nextweek item=i}
                                        <div class="item">
                                            <div style="float:left; padding-top:8px; width:33%;">
                                                <div class="photoBox">
                                                    <img src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                                </div>
                                            </div>
                                            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
                                                <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                                <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <!--loop-->
                                </div>
                                <div class="panel">
                                    <!--loop-->
                                    {foreach from=$var_thismonth item=i}
                                        <div class="item">
                                            <div style="float:left; padding-top:8px; width:33%;">
                                                <div class="photoBox">
                                                    <img src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                                </div>
                                            </div>
                                            <div style="float:left; padding-left:5px; width:63%; padding-right:5px;">
                                                <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
                                                <h4>{$i.date}<br />{$i.whatwhy}<br /> <em>{$i.reviewsnum} {l t='reviews'}</em></h4>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <!--loop-->

                                    <div style="float:right;clear:both; padding-top: 10px;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="con box" style=" padding:5px; margin-bottom: 20px">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                    <h2>{l t='Popular Events This Week'}
                    <em class="eventTitleComment">{l t='Events which have the highest review rate this week.'}</em></h2>
                    <!--loop-->
                    {foreach from=$var_hotthisweek item=i}
                        <div class="incon">
                            <div style="padding-top:8px; float:left; width:21%;">
                                <div class="photoBox">
                                    <img src="../images/event/{$i.picurl}_100x100" width="100" height="100" />
                                </div>
                            </div>
                            <div style="float:left; width:78%;">
                            <h3><a href="detail.php?id={$i.id}">{$i.name} </a></h3>
                            {$i.date}<br />{$i.catname}<br />{$i.where}<br />
                                <h4>{$i.whatwhy}</h4>
                                <div style="float:left;"><em>{$i.reviewsnum} {l t='reviews'}</em></div>
                                <div style="float:right"><em>{l t='Submitted by:'} <a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a></em></div>
                            </div>
                        </div>
                    {/foreach}
                    <!--loop-->

                    {*<script src="../theme/{$get_theme}/js/coda-slider.js" type="text/javascript" ></script>*}
                    <div class="incon">
                        <div style="float:left; padding-top:3px;"><a href="new.php" class="btn btn-block button-blue">{l t='Add Event'}</a></div>
                        <div style="float:right; padding-top:20px;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12" >
                <div class="con box" style="height:auto; padding-top:10px;text-align:center; margin-bottom:10px;">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                    <a href="new.php" class="btn button-blue">{l t='Add Event'}</a>
                </div>
                <div class="con box" style=" padding:5px;">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                    <h2>{l t='Recently Added Events'}</h2>
                    <!--loop-->
                    {foreach from=$var_newevent item=i}
                        <div id="clear"></div>
                        <div class="item">
                            <div class="pic"><div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div></div>
                            <div class="t"><h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>{$i.date}<br />{$i.whatwhy}</div>
                        </div>
                    {/foreach}
                    <div class="incon">
                        <div style="float:right; padding-top:10px;">&raquo; <a href="search.php">{l t='See More Events'}...</a></div>
                    </div>
                </div>
                <div class="con" style="text-align:center; border:0;">

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