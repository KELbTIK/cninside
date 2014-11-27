{include file="header.tpl"}
<script type="text/javascript">
//program global values
var googleMapEnabled='{$smarty.const._GOOGLE_MAP_ENABLED_}';
var cat_map_enabled='{$var_biz.map_enabled}';
var weatherWidgetEnabled='{$smarty.const._WEATHER_WIDGET_ENABLED_}';
var temp='{$var_me.email}';
var biz_id='{$var_biz.id}';
var biz_zip='{$var_biz.zip}';
var zoom={$var_biz.zoom};
var mapy='{$var_biz.mapy}';
var mapx='{$var_biz.mapx}';
var y='{$var_biz.y}';
var x='{$var_biz.x}';
var currentOfferId='{$var_biz.offer_id}';
</script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/star.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/link.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/biz_detail.js"></script>
{if $admin_type}
 <script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/biz.js"></script>
 <script type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/biz_m.js"></script>
{/if}
<script>
//Language Variable
var t_defaultsearchtext="{l t='Search Reviews'}";
var t_loginfirst="{l t='Please login to review!'}";
var t_owner="{l t='You are not allowed to review your own business'}";
{if $smarty.const._NEW_BIZ_REVIEW_APPROVAL_NEED_}
	var t_reviewsubmitted="{l t='Review submitted.<br />It will be displayed after approval'}";
{else}
	var t_reviewsubmitted="{l t='Review submitted.'}";
{/if}
</script>
 <!--Main Start-->
<div id="main">
    <div class="content container">
    {*<a class="fancybox" rel="group" href="http://4.bp.blogspot.com/_be29zjTcK5I/TS8sVSU-GCI/AAAAAAAAJ5Y/p3n_q42BqrI/s1600/Scarlett_Johansson_41.jpg"><img src="http://4.bp.blogspot.com/_be29zjTcK5I/TS8sVSU-GCI/AAAAAAAAJ5Y/p3n_q42BqrI/s1600/Scarlett_Johansson_41.jpg" alt="" /></a>*}
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Business detail for'} {$var_biz.bizname}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="info col-md-8 col-sm-8 col-xs-12">
                                <div class="first pull-left">
                                    <div class="title">
                                        <div class="hreview-aggregate">
                                            <span class="item">
                                                <span class="fn">{$var_biz.bizname}</span>
                                                {$var_biz.starbiz}
                                                <br>
                                                <img src="/theme/{$get_theme}/images/star/stars_{$var_biz.ratingmod}.gif" width="74" height="15" style="vertical-align:sub" class="photo" />
                                            </span>
                                            {l t='Rating'}:
                                            <span class="rating">{$var_biz.rating}</span>
                                            <br>
                                            {l t='based on'} <a href="#reviews" id="reviewBtn"><span class="votes">{$var_biz.reviewnum}</span> {l t='reviews'}</a>
                                            <br />
                                            {l t='%s clicks on this business' r=$var_biz.click}<br /><br />
                                        </div>
                                        <dt>{l t='Share Listing'}:</dt>
                                        <!-- AddThis Button BEGIN -->
                                        <div class="addthis_toolbox addthis_default_style">
                                            <a class="addthis_button_facebook"></a>
                                            <a class="addthis_button_twitter"></a>
                                            <a class="addthis_button_myspace"></a>
                                            <a class="addthis_button_stumbleupon"></a>
                                            <a class="addthis_button_bebo"></a>
                                            <a class="addthis_button_digg"></a>
                                            <a class="addthis_button_mixx"></a>
                                            <a class="addthis_button_delicious"></a>
                                        </div>

                                        <!-- AddThis Button END -->
                                        <br />
                                        <dt>{l t='Categories'}:<br>
                                            <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.catpermalink}/">{$var_biz.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.catpermalink}/{$var_biz.subcatpermalink}/">{$var_biz.subcatname}</a><br />
                                            {if $var_biz.catid2 != '0'}
                                                <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat2permalink}/">{$var_biz.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat2permalink}/{$var_biz.subcat2permalink}/">{$var_biz.subcatname2}</a><br />
                                            {/if}
                                            {if $var_biz.catid3 != '0'}
                                                <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat3permalink}/">{$var_biz.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat3permalink}/{$var_biz.subcat3permalink}/">{$var_biz.subcatname3}</a><br />
                                            {/if}
                                        </dt>
                                        <br>
                                        <address>
                                            {$var_biz.add1}  <br />{$var_biz.add2}
                                            {if $var_biz.location}
                                                {$var_biz.location}, {$var_biz.province}
                                            {/if}
                                            {if $var_biz.zip}
                                                , {$var_biz.zip}
                                            {/if}

                                            {if $var_biz.country && $var_biz.country != $var_biz.province}
                                                , {$var_biz.country}
                                            {/if}
                                        </address>
                                        <span id="bizPhone">{$var_biz.phone}</span>
                                        <div id="bizUrl"><a href="{$var_biz.web}" target="_blank" rel="external nofollow">{$var_biz.web}</a> </div><br>
                                    </div>
                                </div><!-- End .content .detail .info .first -->
                                <div class="other pull-right">
                                    <div class="photoBox">
                                        <a href="/{$smarty.const._BIZ_DIR_}/photo.php?id={$var_biz.id}">
                                            <img class="img-responsive" src="/images/business/{$var_biz.picurl}_195x180" border="0" />
                                        </a>
                                        <br />
                                        <a href="/{$smarty.const._BIZ_DIR_}/photo.php?id={$var_biz.id}">
                                            {l t='Browse more'} ({$var_ps} {l t='pics'})...
                                        </a>
                                        <br />
                                        <a href="/{$smarty.const._BIZ_DIR_}/photo.php?id={$var_biz.id}&f=addphoto">
                                            {l t='Add a photo'}...
                                        </a>
                                        <br />
                                    </div>
                                </div><!-- End .content .detail .info .other -->
                                <div class="detaildata">
                                    <table width="97%" border="0" align="center">
                                        {if $var_biz.weeks} {* Regular Hours *}
                                            <tr height="20">
                                                {if $var_biz.from_hour}
                                                    <td align="left"><b>{l t='Business Hours'}:</b> {$var_biz.from_hour} - {$var_biz.to_hour}</td>
                                                {/if}
                                                {if $var_biz.weeks}
                                                    <td align="left"><b>{l t='Weeks'}:</b> {$var_biz.weeks}</td>
                                                {/if}
                                            </tr>
                                        {elseif $var_biz.wk} {* Regular Hours *}
                                            <tr height="20">
                                                <td colspan="2">
                                                    <h5>
                                                    <b>{l t='Business Hours'}:</b>
                                                    {if $var_biz.wk1}
                                                    <br />{$var_biz.wk1}
                                                    {/if}
                                                    {if $var_biz.wk2}
                                                    <br />{$var_biz.wk2}
                                                    {/if}
                                                    {if $var_biz.wk3}
                                                    <br />{$var_biz.wk3}
                                                    {/if}
                                                    {if $var_biz.wk4}
                                                    <br />{$var_biz.wk4}
                                                    {/if}
                                                    {if $var_biz.wk5}
                                                    <br />{$var_biz.wk5}
                                                    {/if}
                                                    {if $var_biz.wk6}
                                                    <br />{$var_biz.wk6}
                                                    {/if}
                                                    {if $var_biz.wk7}
                                                    <br />{$var_biz.wk7}
                                                    {/if}
                                                    </h5>
                                                </td>
                                            </tr>
                                        {/if} {* end business hours *}
                                        {if $var_biz.price_range}
                                        <tr height="25">
                                            <td align="left">
                                                <b>{l t='Price Range'}:</b> <a href="javascript:void(0)" onmouseover="$('#range_tip').fadeIn('fast')" onmouseout="$('#range_tip').fadeOut('fast')" id="range_tip_a">{if $var_biz.price_range==1}{l t='$'}{elseif $var_biz.price_range==2}{l t='$$'}{elseif $var_biz.price_range==3}{l t='$$$'}{elseif $var_biz.price_range==4}{l t='$$$$'}{/if}</a>
                                                <div id="range_tip" class="blue change">{l t='Price range is the approximate cost per person for a meal including one drink, tax, and tip.'}<br><br>{l t='We\'re going for averages here, folks.'}<br><br>{l t='$ = Cheap, Under $10'}<br>{l t='$$ = Moderate, $11 - $30'}<br>{l t='$$$ = Spendy, $31 - $60'}<br>{l t='$$$$ = Splurge, Above $60'}</div>
                                            </td>
                                            <td align="left">&nbsp;</td>
                                        </tr>
                                        {/if}
                                    </table>
                                    {if $var_bitems}
                                        <div class="info-left">
                                            <!--loop-->
                                            {assign var=k value=1}
                                            {foreach from=$var_bitems item=i}
                                                {if (($k+1)%2==0)}
                                                    <p class="info-left-p info-left-p1">
                                                        <b>{l t=$i.title}</b>:
                                                        {if $i.checkbox eq 0}
                                                            {l t=$i.value}
                                                        {else}
                                                            {foreach from=$i.value key=k2 item=j}
                                                                {if ($k2+1) eq $i.checkbox  }
                                                                    {l t=$j}
                                                                {else}
                                                                    {l t=$j},
                                                                {/if}
                                                            {/foreach}
                                                        {/if}
                                                    </p>
                                                {else}
                                                    <p class="info-left-p info-left-p2"><b>{l t=$i.title}</b>:
                                                        {if $i.checkbox eq 0}
                                                            {l t=$i.value}
                                                        {else}
                                                            {foreach from=$i.value key=k2 item=j}
                                                                {if ($k2+1) eq $i.checkbox  }
                                                                    {l t=$j}
                                                                {else}
                                                                    {l t=$j},
                                                                {/if}
                                                            {/foreach}
                                                        {/if}
                                                    </p>
                                                {/if}
                                                {if $k++}{/if}
                                            {/foreach}
                                            <!--/loop-->
                                        </div>
                                    {/if}
                                </div><!-- End .content .detail .info .data -->

                                <!--Special Offer Start-->
                                {if $var_biz.edit_btn} {* if isOwner, offer is modify-able *}
                                    <div class="special_offer alert alert-warning pull-left" id="special_offer_edit">
                                        {* if hasOffer, edit *}
                                        <div class="preview_offer text-right" onclick="$('.edit_offer_div').slideDown(); $(this).slideUp();" style="display:{if !$var_biz.offer_id}none{/if}">
                                            <i class="fa fa-pencil-square-o"></i>
                                            {if $var_biz.title} <b>{$var_biz.title}</b>  <br> {/if}
                                            {$var_biz.offer_description}

                                            {if $var_biz.offer_url}
                                                <br /><a href="{$var_biz.offer_url}" target="_blank">{$var_biz.offer_url}</a>
                                            {/if}
                                            {if $var_biz.offer_phone}
                                                <br />{l t='Tel'}: {$var_biz.offer_phone}
                                            {/if}
                                            <br /><em>{$var_biz.offer_submit_time}</em>
                                        </div>


                                        <!--Edit zone-->
                                        <div class="edit_offer_div">
                                            <div class="form-group">
                                                <label>{l t='Title'}:</label>
                                                <input value="{$var_biz.title}" id="offer_update_title" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>{l t='Description'}:</label>
                                                <textarea id="offer_update_desc" class="form-control">{$var_biz.offer_descriptionNoTag}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>{l t='URL'}:</label>
                                                <input value="{$var_biz.offer_url}" id="offer_update_url" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>{l t='Phone'}:</label>
                                                <input value="{$var_biz.offer_phone}" id="offer_update_phone" class="form-control"/>
                                            </div>
                                            <span class="offer_button edit_post_offer btn btn-default" onclick="offerUpdate(currentOfferId,'{$var_biz.id}')">
                                                <i class="fa fa-pencil-square-o"></i>
                                                {l t='Edit Special Offer'}
                                            </span>
                                        </div>
                                        <span class="offer_button delete_offer btn btn-danger" onclick="offerDelete(currentOfferId,'{$var_biz.id}')" style="display:{if !$var_biz.offer_id}none{/if}">
                                            <i class="fa fa-times"></i>
                                            {l t='Delete This Special Offer'}
                                        </span>

                                        <span class="offer_button create_offer btn btn-default"
                                              onclick="$('.create_offer').hide();
                                               $('.create_offer_div').slideDown();
                                               $('.preview_offer').slideUp();
                                               $('.delete_offer').hide();
                                               $('.edit_offer_div').slideUp();
                                                ">
                                            <i class="fa fa-plus-square"></i>
                                            {l t='Create New Special Offer'}
                                        </span>

                                        <!--Create zone-->
                                        <div class="create_offer_div">
                                            <div class="form-group">
                                                <label>{l t='Title'}:</label>
                                                <input value="" id="offer_insert_title" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>{l t='Description'}:</strong>({l t='Required'})</label>
                                                <textarea id="offer_insert_desc" class="form-control"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>{l t='URL'}:</label>
                                                <input value="http://" id="offer_insert_url"  class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label>{l t='Phone'}:</label>
                                                <input value="" id="offer_insert_phone" class="form-control"/>
                                            </div>
                                            <em>{l t='The previous special offer will be archived.'}</em>
                                            <br/>
                                            <span class="offer_button create_post_offer btn btn-default"  onclick="offerInsert('{$var_biz.id}')">
                                                <i class="fa fa-check"></i>
                                                {l t='Create Special Offer'}
                                            </span>
                                        </div>

                                    </div>
                                    <div class="clearfix"></div>
                                    {else} {* notOwner, offer is read-only*}

                                    {if $var_biz.offer_id} {* if hasOffer *}
                                        <div class="special_offer" id="special_offer">
                                            <span class="preview_offer">
                                                <h3>{l t='Special Offer'}</h3>
                                                {if $var_biz.title} <b>{$var_biz.title}</b>  <br> {/if}
                                                {$var_biz.offer_description}
                                                {if $var_biz.offer_url}
                                                    <br /><a href="{$var_biz.offer_url}" target="_blank">{$var_biz.offer_url}</a>
                                                {/if}
                                                {if $var_biz.offer_phone}
                                                    <br />{l t='Tel'}: {$var_biz.offer_phone}
                                                {/if}
                                                <br /><em>{$var_biz.offer_submit_time}</em>
                                            </span>
                                        </div>
                                    {/if}
                                {/if}
                                <!--Special Offer End-->

                                {if $var_biz.description}
                                <div id="biz_description">
                                <b>{l t='Business Description'}:</b>
                                <div id="biz_description_brief">{$var_biz.descriptionbrief}</div>
                                <div id="biz_description_text">{$var_biz.description}</div>
                                <div id="biz_description_more" onclick="$('#biz_description_brief').hide(); $('#biz_description_text').show(); $('#biz_description_hide').show()">{l t='Read full business description'} &raquo;</div>
                                <div id="biz_description_hide" onclick="$('#biz_description_brief').show(); $('#biz_description_text').hide(); $('#biz_description_hide').hide()">&laquo; {l t='Hide full business description'}</div>
                                </div><!-- End .content .detail .info .description -->
                                {/if}
                                <div class="weather">
                                    <div class="day">
                                        <h3 id="current_title"></h3>
                                        <div class="img">
                                            <img id="current_img" />
                                        </div>
                                        <div class="tx">
                                            <h1 id="current_text" class="tx"></h1>
                                            <div id="clear"></div>
                                            <span id="current_stat"></span>
                                        </div>
                                    </div>
                                    <div class="day">
                                        <h3  id="tomorrow_title"></h3>
                                        <div class="img">
                                            <img id="tomorrow_img" />
                                        </div>
                                        <div class="tx">
                                            <h3 id="tomorrow_text" class="tx"></h3>
                                            <div id="clear"></div>
                                            <span id="tomorrow_stat"></span>
                                        </div>
                                    </div>
                                    <div class="day">
                                        <h3 id="after_title"></h3>
                                        <div class="img">
                                            <img id="after_img" />
                                        </div>
                                        <div class="tx">
                                            <h3 id="after_text"></h3>
                                            <span id="after_stat"></span>
                                        </div>
                                    </div>
                                </div><!-- End .content .detail .info .weather -->
                                <div class="btns row">
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                        <a href="/my/func.php?f=addbookmark&id={$var_biz.id}" class="btn button-blue btn-block">{l t='Bookmark Listing'}</a>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                        <a href="#reply" id="replyBtn" class="btn button-blue btn-block">{l t='Write a Review'}</a>
                                    </div>
                                    {if $var_biz.video_btn}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="#testube" id="videobox" class="fancybox fancybox.iframe btn button-blue btn-block">{l t='View Video'}</a>
                                        </div>
                                    {/if}
                                    {if $var_biz.applystarbiz_btn}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            {if $smarty.const._PAYPAL_ENABLE_}
                                                <a href="/{$smarty.const._BIZ_DIR_}/apply_starbiz.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue btn-block">{l t='Apply StarBiz'}</a>
                                            {else}
                                                <a href="/{$smarty.const._BIZ_DIR_}/apply_starbiz.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue btn-block">{l t='Apply StarBiz'}</a>
                                            {/if}
                                        </div>
                                    {/if}
                                    {if $var_biz.claim_btn}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="/{$smarty.const._BIZ_DIR_}/claim.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue btn-block">{l t='Claim Listing'}</a>
                                        </div>
                                    {/if}
                                    {if $var_biz.logintoclaim_btn}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="/my/login.php" class="btn button-blue btn-block">{l t='Claim Listing'}</a>
                                        </div>
                                    {/if}
                                    {if $admin_type}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="/mgt/body/business_edit.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue btn-block">{l t='Edit Details'}</a>
                                        </div>
                                    {/if}
                                    {if $var_biz.edit_btn AND $admin_type==''}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="/{$smarty.const._BIZ_DIR_}/edit.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue btn-block">{l t='Edit Details'}</a>
                                        </div>
                                    {/if}
                                    {if $var_biz.edit_btn}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="/offer/manage.php?id={$var_biz.id}" class="btn button-blue btn-block">{l t='Manage Deals'}</a>
                                        </div>
                                    {/if}

                                    {if $admin_type}
                                        <div class="col-md-4 col-sm-4 col-xs-12 form-group">
                                            <a href="javascript:del_business_detail('{$var_biz.id}')" class="btn button-blue btn-block">{l t='DELETE Listing'}</a>
                                        </div>
                                    {/if}
                                </div><!-- End .content .detail .info .btns -->
                            </div><!-- End .content .detail .info -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                {if $smarty.const._GOOGLE_MAP_ENABLED_ && $var_biz.map_enabled}
                                    <div class="map well">
                                        <div id="map_canvas" style="height: 340px;">{l t='Loading Map'}...</div>
                                        <br />
                                        <a href="/{$smarty.const._BIZ_DIR_}/directions.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue" id="map_direction_btn" style="display:none">{l t='Get Directions'}</a>
                                        <div class="clearfix"></div>
                                    </div><!-- End .content .detail .map -->
                                {else}
                                    {$ads->getAdCode(1)}
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End .content .detail -->
            <div class="clearfix"></div>
            <div class="info" >
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="form-group" id="reviewTitle">
                        <div id="reviewTitle">
                            <a name="flag"></a>
                            <h2><a name="reviews"></a>{l t="%s Reviews for %s" r=$var_biz.reviewnum  g=$var_biz.bizname}</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <span>{l t='Sort by'}: </span>
                                    <div class="btn-group btn-group-sm">
                                        <button id="itemid" type="button" class="btn btn-default active"  onClick="sele_item(this,'time')">{l t='Time'}</button>
                                        <button id="itemid" type="button" class="btn btn-default" onClick="sele_item(this,'rating')">{l t='Rating'}</button>
                                        <button id="itemid" type="button" class="btn btn-default" onClick="sele_item(this,'vote')">{l t='Vote'}</button>
                                    </div>
                                    <input name="sortby" type="hidden" id="sortby" value="time" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <form  action="javascript:get({$var_biz.id},1)" method="post">
                                    <div class="input-group">
                                        <input  onFocus="this.select()"  class="form-control"  onClick="if (this.value==t_defaultsearchtext) this.value=''" value="{l t='Search Reviews'}" id="searchreviewtext" />
                                        <span class="input-group-btn"><button class="btn btn-primary" type="submit">&nbsp;<i class="fa fa-search"></i>&nbsp;</button></span>
                                        {*<input type="image"  id="imageField" name="imageField"  src="/theme/{$get_theme}/images/search_icon.gif" />*}
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="sr">
                        {$html_review}
                    </div>
                    <div id="tips"></div>
                    <form action="javascript:void(0)" method="post" name="reviewform" id="reviewform" class="form-horizontal">
                        <div id="replyTitle" >
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><a name="reply"></a>{l t='Write a Review for %s' r=$var_biz.bizname}</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="">
                                        {if $has_ratingitems == 0}
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <strong>{l t='Rating'}</strong><input type="hidden" name="rating" id="rating" value="">
                                                    <input type="hidden" name="tmp_rating" id="tmp_rating" value="">
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div id="starRating"  class="pull-left">
                                                        <input type="radio" name="rating" value="1" > 1
                                                        <input type="radio" name="rating" value="2" > 2
                                                        <input type="radio" name="rating" value="3" > 3
                                                        <input type="radio" name="rating" value="4" > 4
                                                        <input type="radio" name="rating" value="5" > 5
                                                    </div>
                                                    <script type="text/javascript">
                                                        replaceStars();
                                                    </script>
                                                    <div class="pull-right">
                                                        <span id="rate1" class="rateScore">{l t='Rate 1: Poor'}</span>
                                                        <span id="rate2" class="rateScore">{l t='Rate 2: Average'}</span>
                                                        <span id="rate3" class="rateScore">{l t='Rate 3: Good'}</span>
                                                        <span id="rate4" class="rateScore">{l t='Rate 4: Very Good'}</span>
                                                        <span id="rate5" class="rateScore">{l t='Rate 5: Excellent'}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        {else}
                                            {foreach from=$var_ratingitems item=i}
                                                <div class="form-group">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <strong>{$i.title}</strong>
                                                        <input type="hidden" name="rating{$i.item_id}" id="rating{$i.item_id}" value="">
                                                        <input type="hidden" name="tmp_rating{$i.item_id}" id="tmp_rating{$i.item_id}" value="">
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="starRating{$i.item_id}" class="pull-left">
                                                            <input type="radio" name="rating{$i.item_id}" value="1" > 1
                                                            <input type="radio" name="rating{$i.item_id}" value="2" > 2
                                                            <input type="radio" name="rating{$i.item_id}" value="3" > 3
                                                            <input type="radio" name="rating{$i.item_id}" value="4" > 4
                                                            <input type="radio" name="rating{$i.item_id}" value="5" > 5
                                                        </div>
                                                        <script type="text/javascript">
                                                            replaceStarsnew('{$i.item_id}');
                                                        </script>
                                                        <div class="pull-right">
                                                            <span id="{$i.item_id}rate1" class="rateScore">{l t='Rate 1: Poor'}</span>
                                                            <span id="{$i.item_id}rate2" class="rateScore">{l t='Rate 2: Average'}</span>
                                                            <span id="{$i.item_id}rate3" class="rateScore">{l t='Rate 3: Good'}</span>
                                                            <span id="{$i.item_id}rate4" class="rateScore">{l t='Rate 4: Very Good'}</span>
                                                            <span id="{$i.item_id}rate5" class="rateScore">{l t='Rate 5: Excellent'}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        {/if}
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <strong>{l t='Your Review'}</strong>
                                                <h5>
                                                    <em>{l t='Your review helps others learn about great businesses; be personal, be irreverent, be you. It\'s that tone that makes here so much fun!'} <br />
                                                        <br />{l t='Reminder, your opinions are your own. Please, review responsibly.'}</em>
                                                </h5>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="review" name="review" class="form-control"  {if $var_me.user_id && $var_me.user_id == $var_biz.user_id } onfocus="owner(this)" {else} onfocus="check_login(this)" {/if} rows="7"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">

                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            {if $has_ratingitems == 0}
                                                <input class="btn button-blue" type="button" name="button"  id="button" value="  {l t='Submit'}" onclick="get(biz_id,1,'review')" />
                                            {else}
                                                <input class="btn button-blue" type="button" name="button"  id="button" value="  {l t='Submit'}" onclick="get(biz_id,1,'reviewrating')" />
                                            {/if}
                                            <a href="#top" id="topBtn" class="pull-right">{l t='Top'} <i class="fa fa-long-arrow-up"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div id="testube" style="display: none; overflow:hidden">
                    <object width="853" height="505" style="display:none">
                        <param name="movie" value="{$var_biz.video_url}">
                        <param name="allowFullScreen" value="true">
                        <param name="allowscriptaccess" value="always">
                        <embed src="{$var_biz.video_url}" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="853" height="505"></embed>
                    </object>
                </div>

                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="hidden-xs">
                        {$ads->getAdCode(6)}
                    </div>
                    <div class="clearfix"></div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Recent Reviews'}</h3>
                        </div>
                        <ul class="list-group">
                            {foreach from=$var_newreview item=i}
                                <li class="item list-group-item">
                                    <div class="pic pull-left review-img"><div class="photoBox"><a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}"><img src="/images/business/{$i.picurl}_40x40" width="40" height="40" /></a></div></div>
                                    <div class="t">
                                        <h3>
                                            {if $admin_type}
                                                <a href="/mgt/func/select.php?sheet=business_reviews&where=review_id&equal={$i.reviewid}&field=review_id,review_desc,review_date,user_id,business_id,rating,cat_id,city_id&text=ID,Review content,Review date (YYYYMMDDHHIISS),Submitter,Business ID,Conmment Rating,Category ID,City ID" class="fancybox fancybox.iframe ctlbtn">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </a>
                                                <a href="javascript:del_bizreview('{$i.reviewid}')" class="ctlbtn">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            {/if}
                                            <a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}">{$i.bizname}</a>
                                            {$i.starbiz}
                                        </h3>
                                        <h3>{$i.reviewdate}</h3>
                                        <div class="clearfix"></div>
                                        {$i.reviewbrief}
                                    </div>
                                </li>
                            {/foreach}
                            <li class="item list-group-item"><h3><a href="/{$smarty.const._BIZ_DIR_}/search.php">{l t='More Recent Reviews'} &raquo;</a></h3></li>
                        </ul>
                        <!--/loop-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <!--Main End-->
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4b594c017ff94751"></script>
{if $smarty.const._GOOGLE_MAP_ENABLED_ && $var_biz.map_enabled}
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
{/if}
{include file="footer.tpl"}