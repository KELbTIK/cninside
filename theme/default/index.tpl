{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/frontend.js"></script>
 <!--Main Start-->
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="con_left col-md-8 col-sm-8 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left">
                            {l t='Hot Listings'} &nbsp;
                        </h3>
                        <div  class="business-heading"><em>{l t='Hottest in one month, based on bookmarks'}</em></div>
                    </div>
                    <div class="panel-body">
                        {if $var_hotbusiness}
                            <div class="row">
                                <div class="best col-sm-8">
                                    <div class="pic col-sm-3" >
                                        <div class="photoBox">
                                            <a href="{$smarty.const._BIZ_DIR_}/{$var_hotbusiness.bizurl}">
                                                <img class="img-responsive img-thumbnail" src="images/business/{$var_hotbusiness.picurl}_100x100" border="0"  />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="t col-sm-9">
                                        <h2>
                                            <a href="{$smarty.const._BIZ_DIR_}/{$var_hotbusiness.bizurl}" style="color:#000000">{$var_hotbusiness.bizname}</a>
                                            {$var_hotbusiness.starbiz}<br />
                                            <img src="theme/{$get_theme}/images/star/stars_{$var_hotbusiness.ratingmod}.gif" width="74" height="15" />
                                        </h2>
                                        <h5>
                                            <strong>{l t='Category'}: </strong><br />
                                            <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.catpermalink}/">{$var_hotbusiness.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.catpermalink}/{$var_hotbusiness.subcatpermalink}/">{$var_hotbusiness.subcatname}</a><br />

                                            {if $var_hotbusiness.catid2 != '0'}
                                                <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat2permalink}/">{$var_hotbusiness.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat2permalink}/{$var_hotbusiness.subcat2permalink}/">{$var_hotbusiness.subcatname2}</a><br />
                                            {/if}

                                            {if $var_hotbusiness.catid3 != '0'}
                                                <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat3permalink}/">{$var_hotbusiness.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat3permalink}/{$var_hotbusiness.subcat3permalink}/">{$var_hotbusiness.subcatname3}</a><br />
                                            {/if}

                                            {$var_hotbusiness.add1} {$var_hotbusiness.add2}
                                            <br />
                                            {$var_hotbusiness.phone}
                                        </h5>
                                    </div>
                                </div>
                                <div class="more col-sm-4">
                                    <h3>{l t='More Hot Local Picks'}</h3>
                                    <ol>
                                        {$var_hotbusiness.otherhotbusiness_li}
                                    </ol>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
                <div class="category">
                    <div class="row">
                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="">
                                <div class="alert alert-grey"><h1><b>{l t='BEST OF'}</b></h1></div>
                                    <!--loop-->
                                    <div class="row">
                                    {foreach from=$var_bestof item=i}
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h2><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" >{$i.catname}</a></h2>
                                                </div>
                                                <div class="panel-body text-center">
                                                    <div>{$i.reviewnum} {l t='reviews'}</div>
                                                    <div class="photoBox"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" ><img class="img-responsive center-block img-thumbnail" src="/images/business/{$i.picurl}_150x95" /></a></div>
                                                    <ol class="best-list">
                                                        {$i.bizli}
                                                    </ol>
                                                    <div class="pull-right"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" class="btn btn-primary">{l t='More'}</a></div>
                                                </div>
                                            </div>
                                        </div>
                                     {/foreach}
                                     <!--/loop-->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">{l t='Browse by Category'}</h3>
                                </div>
                                <div class="panel-body">
                                    <ul class="list-unstyled">
                                        {$var_category_li}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default top_events">
                    <!-- Default panel contents -->
                    <div class="panel-heading">
                        <h2 class="pull-left">{l t='Top Events'}</h2>
                        <div class="pull-right"><a href="event/search.php" class="btn btn-block btn-primary">{l t='Browse all events'}</a></div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_topevents item=i}
                            <li class="list-group-item">
                                <div class="pic"><a href="event/detail.php?id={$i.id}"><img src="images/event/e_{$i.picurl}_40x40" width="40" height="40" border="0" /></a></div>
                                <div class="t">
                                    <h3><a href="event/detail.php?id={$i.id}">{$i.name}</a></h3>
                                    {$i.time}
                                </div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default pop_events">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h2>{l t='Popular Events This Week'}</h2></div>
                    <!-- List group -->
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_popevents item=i}
                            <li class="list-group-item">
                                <div class="pic"><a href="event/detail.php?id={$i.id}"><img src="images/event/e_{$i.picurl}_40x40" width="40" height="40" border="0" /></a></div>
                                <div class="t">
                                    <h3><a href="event/detail.php?id={$i.id}">{$i.name}</a></h3>
                                    {$i.time}
                                </div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default new_reviews">
                    <!-- Default panel contents -->
                    <div class="panel-heading">
                        <h2 class="pull-left">{l t='Recent Reviews'}</h2>
                        <div class="pull-right"><a href="{$smarty.const._BIZ_DIR_}/search.php" class="btn btn-block btn-primary">{l t='More'}</a></div>
                        <div class="clearfix"></div>
                    </div>

                    <!--loop-->
                    <ul class="list-group">
                    {foreach from=$var_newreviews item=i}
                        <li class="list-group-item">
                            <div class="pic pull-left"><a href="{$smarty.const._BIZ_DIR_}/{$i.url}"><img src="images/business/{$i.picurl}_40x40" width="40" height="40" border="0" /></a></div>
                            <div class="t">
                                <h3>
                                    {if $i.edit_btn}
                                        <a href="/mgt/func/select.php?sheet=business_reviews&where=review_id&equal={$i.reviewid}&field=review_id,review_desc,review_date,user_id,business_id,rating,cat_id,city_id&text=ID,Review content,Review date (YYYYMMDDHHIISS),Submitter,Business ID,Conmment Rating,Category ID,City ID" class="fancybox fancybox.iframe ctlbtn"><i class="fa fa-pencil-square-o"></i></a>
                                        <a href="javascript:del_bizreview('{$i.reviewid}')" class="ctlbtn"><i class="fa fa-times"></i></a>

                                    {/if}
                                    <a href="{$smarty.const._BIZ_DIR_}/{$i.url}">{$i.name}</a>{$i.starbiz}
                                </h3>
                                <h4><i class="fa fa-times-circle-o"></i>
                                    {$i.reviewdate}<br /><p></p>
                                    {$i.reviewdesc}
                                </h4>

                            </div>
                        </li>
                    {/foreach}
                    </ul>
                    <!--/loop-->
                </div>
            </div>

            <div class="con_right col-md-4 col-sm-4 col-xs-12">
                {if !empty($var_social)}
                    <div class="social">
                        <div class="">
                            <div class="get_social">
                            {l t='Get Social'}

                             {foreach from=$var_social item=i}


                                 <a href="{$i.url}">
                                     <i class="fa fa-{$i.image}"></i>
                                     {*<img src="/theme/{$get_theme}/images/social/{$i.image}" alt="{$i.image} icon" width="25" height="25" border="0" />*}
                                 </a>
                             {/foreach}
                             </div>
                        </div>
                    </div>
                {/if}
                <div class="clearfix"></div>
                <div class="panel panel-default random_rat">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Latest Reviewer'}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <!--loop-->
                            {foreach from=$var_lastreviewer item=i}
                                <div class="">
                                    <div class="pic col-md-4 col-sm-4 col-xs-4">
                                        <div class="photoBox">
                                            <a href="my/?id={$i.uid}">
                                                <img class="img-responsive" src="images/photos/p_{$i.picurl}_100x100" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="t col-md-8 col-sm-8 col-xs-8">
                                        <div class="info">
                                            <h3><a href="my/?id={$i.uid}">{$i.name}</a>
                                                {if $i.fb_user_id}<img src="/theme/{$get_theme}/images/fb_16.gif" border="0" style="vertical-align:text-bottom" />{/if}
                                            </h3>
                                            {if $i.location}
                                                {$i.location}<br />
                                            {/if}
                                            <strong>{l t='Member Since'}:</strong><br />{$i.regdate}
                                            <p><a href="my/?id={$i.uid}" class="btn btn-primary">{l t='View Profile'}</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            {/foreach}
                            <!--/loop-->
                            <div class="text-center">
                                <a href="/my/membersearch.php?rank=reviews_num" class="btn  btn-primary">{l t='See Top Reviewers'}</a> &nbsp; &nbsp;
                                <a href="/my/membersearch.php" class="btn  btn-primary">{l t='See New Users'}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default reviews">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Hot Business'}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="exp col-md-8 col-sm-7 col-xs-8"><em>{l t='Rank by reviews in past 7 days'}!</em></div>
                            <div class="pull-right col-md-4 col-sm-5 col-xs-4"><a href="{$smarty.const._BIZ_DIR_}/search.php" class="btn btn-block btn-primary">{l t='More'}</a></div>
                            <div class="clearfix"></div>
                            <!--no loop-->
                            {if $var_hotbiz.bizname}
                                <div class="">
                                    <div class="pic col-md-4 col-sm-4 col-xs-4">
                                        <div class="photoBox">
                                            <a href="{$smarty.const._BIZ_DIR_}/{$var_hotbiz.bizurl}">
                                                <img class="img-responsive" src="/images/business/{$var_hotbiz.picurl}_100x100" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="t col-md-8 col-sm-8 col-xs-8">
                                        <h3><a href="{$smarty.const._BIZ_DIR_}/{$var_hotbiz.bizurl}">{$var_hotbiz.bizname}</a>{$var_hotbiz.starbiz}</h3>
                                        {$var_hotbiz.location} , {$var_hotbiz.zip}  <br />  {$var_hotbiz.phone}
                                        <h5><strong>{l t='Category'}: </strong><br />
                                            <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbiz.catpermalink}/">{$var_hotbiz.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbiz.catpermalink}/{$var_hotbiz.subcatpermalink}/">{$var_hotbiz.subcatname}</a><br />
                                            {if $var_hotbiz.catid2 != '0'}
                                                <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbiz.cat2permalink}/">{$var_hotbiz.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbiz.cat2permalink}/{$var_hotbiz.subcat2permalink}/">{$var_hotbiz.subcatname2}</a><br />
                                            {/if}
                                            {if $var_hotbiz.catid3 != '0'}
                                                <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbiz.cat3permalink}/">{$var_hotbiz.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbiz.cat3permalink}/{$var_hotbiz.subcat3permalink}/">{$var_hotbiz.subcatname3}</a><br />
                                            {/if}
                                        </h5>
                                        <h5>
                                            {l t='%s reviews and %s clicks' r=$var_hotbiz.reviewnum g=$var_hotbiz.click}<br />
                                            {l t='%s reviews in recent %s days' r=$var_hotbiz.reviewnumrecent g='7'}
                                        </h5>
                                    </div>
                                </div>
                            {/if}
                            <!--/no loop-->
                        </div>
                    </div>
                </div>
                <div class="ads hidden-xs">{$ads->getAdCode(1)}</div>
                <div class="panel panel-default new_offer">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='New Special Offers'}</h3>
                    </div>
                    <!-- List group -->
                    <ul class="list-group">
                        {if $var_newoffers}
                            <!--loop-->
                            {foreach from=$var_newoffers item=i}
                                <li class="special_offer list-group-item">
                                    <h3><a href="/{$smarty.const._BIZ_DIR_}/{$i.permalink}">{$i.business_name}</a><span><img src="/theme/{$smarty.const._THEME_}/images/star/stars_{$i.ratingmod}.gif" /></span></h3>
                                            <span class="preview_offer">
                                                {$i.offer_description}
                                                {if $i.offer_url}
                                                    <br /><a href="{$i.offer_url}" target="_blank">{$i.offer_url}</a>
                                                {/if}
                                                {if $i.offer_phone}
                                                    <br />{l t='Tel'}: {$i.offer_phone}
                                                {/if}
                                                <br /><em>{$i.offer_submit_time}</em>
                                            </span>
                                </li>
                            {/foreach}
                            <!--/loop-->
                            <li class="list-group-item">
                                <a href="/offer/" class="btn btn-primary" style="">{l t='Browse more special offers'}</a>
                            </li>
                        {/if}
                    </ul>
                </div>
                <div class="panel panel-default new_lists">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='New Lists'}</h3>
                    </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_newlists item=i}
                            <li class="list-group-item">
                                <div class="pic"><a href="/my/list/detail.php?id={$i.id}"><img border=0 src="/images/photos/p_{$i.picurl}_40x40" width=40 height=40 /></a></div>
                                <div class="t">
                                    <h3><a href="/my/list/detail.php?id={$i.id}">{$i.name}</a></h3>
                                    {$i.desc}
                                </div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                </div>
                <div class="panel panel-default new_chatters">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='New Chatters'}</h3>
                    </div>
                    <!-- List group -->
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_newchatters item=i}
                            <li class="list-group-item">
                                <div class="pic"><img src="images/photos/p_{$i.picurl}_20x20" width="20" height="20" title="{$i.uname}" /></div>
                                <div class="t"><h3><a href="comm/?f=Chatter&aid={$i.tid}">{$i.tname}</a></h3></div>
                                <div class="info"><i class="fa fa-times-circle-o"></i></i> {$i.replytime}</div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                        <li class="list-group-item text-center"><a href="comm/?f=Chatter" class="btn btn-primary">{l t='More'}</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}