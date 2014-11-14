{include file="header.tpl"}

<link rel="stylesheet" href="/theme/{$get_theme}/js/fancy/jquery.fancybox.css" media="screen" type="text/css" />
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
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.fancybox-1.2.1.pack.js"></script>
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

    <div class="content">
        <div class="detail blue">
         <span class="coner c1b"></span>
        <span class="coner c2b"></span>
        <span class="coner c3b"></span>
        <span class="coner c4b"></span>
        <h1>{l t='Business detail for'} {$var_biz.bizname}</h1>
          <div class="info">
          <div class="first">
              <div class="title">
               <div class="hreview-aggregate">
              <span class="item">
              <span class="fn">{$var_biz.bizname}</span>{$var_biz.starbiz}
                  <br><img src="/theme/{$get_theme}/images/star/stars_{$var_biz.ratingmod}.gif" width="74" height="15" style="vertical-align:sub" class="photo" />
                  </span>
                  {l t='Rating'}: <span class="rating">{$var_biz.rating}  
                   </span>
                   
                   <br>
                  {l t='based on'} <a href="#reviews" id="reviewBtn"><span class="votes">{$var_biz.reviewnum}</span> {l t='reviews'}</a><br />
                   {l t='%s clicks on this business' r=$var_biz.click}<br /><br />
                   
                   </div>
                
                   
<dt>{l t='Share Listing'}:<br>
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
                  <br /><dt>{l t='Categories'}:<br>
                  
                  <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.catpermalink}/">{$var_biz.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.catpermalink}/{$var_biz.subcatpermalink}/">{$var_biz.subcatname}</a><br />
                        {if $var_biz.catid2 != '0'}
                        <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat2permalink}/">{$var_biz.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat2permalink}/{$var_biz.subcat2permalink}/">{$var_biz.subcatname2}</a><br />
                        {/if}
                        {if $var_biz.catid3 != '0'}
                        <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat3permalink}/">{$var_biz.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_biz.cat3permalink}/{$var_biz.subcat3permalink}/">{$var_biz.subcatname3}</a><br />
                        {/if}
                  </dt>
                  <br>
                <address>{$var_biz.add1}  <br />{$var_biz.add2} 
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
      <div class="other" align="center" style="overflow:hidden;">
        <div class="photoBox" style="overflow:hidden; width:199px; max-height:240px; text-align:center;">
          
          <a href="/{$smarty.const._BIZ_DIR_}/photo.php?id={$var_biz.id}" style="display:inline-block">
          	<img src="/images/business/{$var_biz.picurl}_195x180" border="0" />
          </a><br />
          <a href="/{$smarty.const._BIZ_DIR_}/photo.php?id={$var_biz.id}">
          	{l t='Browse more'} ({$var_ps} {l t='pics'})...
          </a><br />
          
          <a href="/{$smarty.const._BIZ_DIR_}/photo.php?id={$var_biz.id}&f=addphoto">
          	{l t='Add a photo'}...
          </a><br />
          

        </div>
      </div><!-- End .content .detail .info .other -->
      <div id="clear"></div>
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
                    <td align="left"><b>{l t='Price Range'}:</b> <a href="javascript:void(0)" onmouseover="$('#range_tip').fadeIn('fast')" onmouseout="$('#range_tip').fadeOut('fast')" id="range_tip_a">{if $var_biz.price_range==1}{l t='$'}{elseif $var_biz.price_range==2}{l t='$$'}{elseif $var_biz.price_range==3}{l t='$$$'}{elseif $var_biz.price_range==4}{l t='$$$$'}{/if}</a>
                    <div id="range_tip" class="blue change">{l t='Price range is the approximate cost per person for a meal including one drink, tax, and tip.'}<br><br>{l t='We\'re going for averages here, folks.'}<br><br>{l t='$ = Cheap, Under $10'}<br>{l t='$$ = Moderate, $11 - $30'}<br>{l t='$$$ = Spendy, $31 - $60'}<br>{l t='$$$$ = Splurge, Above $60'}</div>
                    </td>
                    <td align="left">&nbsp;</td>
                    </tr>
                    {/if}
                     </table> 
                    {if $var_bitems}
                    <div id="clear"></div>
                    <div class="info-left">
                    <!--loop-->
                    {assign var=k value=1} 
                    {foreach from=$var_bitems item=i}
                    
                    {if (($k+1)%2==0)}
                    <p class="info-left-p info-left-p1"><b>{l t=$i.title}</b>: 
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
                    
                    
                    </td></p>
                    {/if} 
                    {if $k++}{/if}
                    {/foreach}
                    <!--/loop-->
                    </div>
                    {/if}
                     
                
                 
            </div><!-- End .content .detail .info .data -->
    		<div id="clear"></div>
            
            
            <!--Special Offer Start-->
            {if $var_biz.edit_btn} {* if isOwner, offer is modify-able *}
            <div class="special_offer" id="special_offer_edit">
                 {* if hasOffer, edit *}
                <span class="preview_offer" onclick="$('.edit_offer_div').slideDown(); $(this).slideUp();" style="display:{if !$var_biz.offer_id}none{/if}">
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
                
                
                <!--Edit zone-->
                <div class="edit_offer_div">
                	<label>
                    <strong>{l t='Title'}:</strong><br />
                    <input value="{$var_biz.title}" id="offer_update_title" /></label>
                    <label>{l t='Description'}:<br />
                    <textarea id="offer_update_desc">{$var_biz.offer_descriptionNoTag}</textarea></label>
                    <label>
                    {l t='URL'}:<br />
                    <input value="{$var_biz.offer_url}" id="offer_update_url" />
                    </label>
                    <label>
                    {l t='Phone'}:<br />
                    <input value="{$var_biz.offer_phone}" id="offer_update_phone" />
                    </label>
                    <span class="offer_button edit_post_offer" onclick="offerUpdate(currentOfferId,'{$var_biz.id}')">{l t='Edit Special Offer'}</span>
                </div>
                <span class="offer_button delete_offer" onclick="offerDelete(currentOfferId,'{$var_biz.id}')" style="display:{if !$var_biz.offer_id}none{/if}">{l t='Delete This Special Offer'}</span>
               
                <span class="offer_button create_offer" onclick="$('.create_offer').hide();$('.create_offer_div').slideDown();$('.preview_offer').slideUp();$('.delete_offer').hide(); $('.edit_offer_div').slideUp();">{l t='Create New Special Offer'}</span>
                
                <!--Create zone-->
                <div class="create_offer_div">
                	
                    <label> <strong>{l t='Title'}:</strong><br />
                    <input value="" id="offer_insert_title" /></label>
                    <label><strong>{l t='Description'}:</strong>({l t='Required'})<br />
                    <textarea id="offer_insert_desc"></textarea></label>
                    <label>
                    {l t='URL'}:<br />
                    <input value="http://" id="offer_insert_url" />
                    </label>
                    <label>
                    {l t='Phone'}:<br />
                    <input value="" id="offer_insert_phone" />
                    </label>
                <em>{l t='The previous special offer will be archived.'}</em>
                <span class="offer_button create_post_offer"  onclick="offerInsert('{$var_biz.id}')">{l t='Create Special Offer'}</span>
                </div>
            	
            </div>
            
            
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
      <div id="clear"></div>
      
            

<div class="btns">
                  <table width="100%" border="0">
                    <tr>
                    <td height="42" align="center"><a href="/my/func.php?f=addbookmark&id={$var_biz.id}" class="Bbtn">{l t='Bookmark Listing'}</a></td>
                    <td align="center"><a href="#reply" id="replyBtn" class="Bbtn">{l t='Write a Review'}</a></td>
                    {if $var_biz.video_btn}
                    <td align="center"><a href="#testube" id="videobox" class="iframe Bbtn">{l t='View Video'}</a></td>
                    {/if}
                    {if $var_biz.applystarbiz_btn}
                    {if $smarty.const._PAYPAL_ENABLE_}
                    <td align="center"><a href="/{$smarty.const._BIZ_DIR_}/apply_starbiz.php?id={$var_biz.id}" class="Bbtn">{l t='Apply StarBiz'}</a></td>
                    {else}
                    <td align="center"><a href="/{$smarty.const._BIZ_DIR_}/apply_starbiz.php?id={$var_biz.id}" class="iframe Bbtn">{l t='Apply StarBiz'}</a></td> 
                    {/if}
                    {/if}
                    {if $var_biz.claim_btn}
                    
                    <td align="center"><a href="/{$smarty.const._BIZ_DIR_}/claim.php?id={$var_biz.id}" class="iframe Bbtn">{l t='Claim Listing'}</a></td>
                    {/if}
                    {if $var_biz.logintoclaim_btn}
                    <td align="center"><a href="/my/login.php" class="Bbtn">{l t='Claim Listing'}</a></td>
                    {/if}
                   
                   {if $admin_type}

                         <td align="center"><a href="/mgt/body/business_edit.php?id={$var_biz.id}" class="iframe Bbtn">{l t='Edit Details'}</a></td> 

                    {/if}
                    
                    {if $var_biz.edit_btn AND $admin_type==''}
                    <td align="center"><a href="/{$smarty.const._BIZ_DIR_}/edit.php?id={$var_biz.id}" class="iframe Bbtn">{l t='Edit Details'}</a></td>
                    {/if}
                    {if $var_biz.edit_btn}
                    <td align="center"><a href="/offer/manage.php?id={$var_biz.id}" class="Bbtn">{l t='Manage Deals'}</a></td>
                    {/if}
                    
                    {if $admin_type}
                    <td align="center"><a href="javascript:del_business_detail('{$var_biz.id}')" class="Bbtn">{l t='DELETE Listing'}</a></td>
                    {/if}
                    </tr>
                  </table>
            </div><!-- End .content .detail .info .btns -->
    </div><!-- End .content .detail .info -->
    {if $smarty.const._GOOGLE_MAP_ENABLED_ && $var_biz.map_enabled}
    <div class="map box" style="padding:0; margin:0; text-align:center; margin-bottom:38px">
    <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
      <div id="map_canvas" style="width: 335px; height: 340px; overflow:hidden;"><br /><br /><br /><br /><br /><center>{l t='Loading Map'}...</center></div>
      
      <br />
      <a href="/{$smarty.const._BIZ_DIR_}/directions.php?id={$var_biz.id}" class="iframe Bbtn" id="map_direction_btn" style="display:none">{l t='Get Directions'}</a>
    </div><!-- End .content .detail .map -->
    {else}
    {$ads->getAdCode(1)}
    {/if}
        </div><!-- End .content .detail -->
        <div id="clear"></div>
    <div class="info" >
      <div class="left">
              <div class="con"  style="float:left; width:100%; position:relative;" id="reviewTitle">
                  <div id="reviewTitle" style="float:left;"><a name="flag"></a>
                  <h2><a name="reviews"></a>{l t="%s Reviews for %s" r=$var_biz.reviewnum  g=$var_biz.bizname}</h2>
                   </div>
                  
                    <div id="clear"></div>
                     <div style=" float:right;">
                   <form  action="javascript:get({$var_biz.id},1)" method="post">
                     <table width="100" border="0">
                     <tr>
                       <td><input style=" font-size:12px; color:#666;border:1px #ccc solid;" onFocus="this.select()"   onClick="if (this.value==t_defaultsearchtext) this.value=''" value="{l t='Search Reviews'}" id="searchreviewtext" /></td>
                       <td><input type="image" name="imageField" id="imageField" src="/theme/{$get_theme}/images/search_icon.gif" /></td>
                     </tr>
                     </table>
                     </form>
                   </div>
                    
                    <div>
                  
                      <div style="float:left;"><h5>
                      <span style="float:left; padding:3px;">{l t='Sort by'}: </span>
                      <span id="itemid" class="SitemS" onClick="sele_item(this,'time')">{l t='Time'}</span>
                      <span id="itemid" class="Sitem" onClick="sele_item(this,'rating')">{l t='Rating'}</span>
                      <span id="itemid" class="Sitem" onClick="sele_item(this,'vote')" style="display:none;">{l t='Vote'}</span>
                        <input name="sortby" type="hidden" id="sortby" value="time" /></h5>
                      
                     </div>
                    </div>
              </div>
                <div id="sr">
                {$html_review}
                </div>
                <div id="tips"></div>
                <form action="javascript:void(0)" method="post" name="reviewform" id="reviewform">
                <div id="replyTitle" class="con box change" style="width:98%; ">
                <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<h2><a name="reply"></a>{l t='Write a Review for %s' r=$var_biz.bizname}</h2>
<table width="100%" border="0" align="right">
{if $has_ratingitems == 0}
<tr>
  <td height="30"><strong>{l t='Rating'}</strong><input type="hidden" name="rating" id="rating" value="">
      <input type="hidden" name="tmp_rating" id="tmp_rating" value=""></td>
  <td width="30%">
    <div id="starRating">
      <input type="radio" name="rating" value="1" > 1
      <input type="radio" name="rating" value="2" > 2
      <input type="radio" name="rating" value="3" > 3
      <input type="radio" name="rating" value="4" > 4
      <input type="radio" name="rating" value="5" > 5  
         </div>
       <script type="text/javascript">
      replaceStars();
      </script>      </td>
      <td width="40%" >
    <div style="width:200px;  overflow:hidden">
    <span id="rate1" class="rateScore">{l t='Rate 1: Poor'}</span>
    <span id="rate2" class="rateScore">{l t='Rate 2: Average'}</span>
    <span id="rate3" class="rateScore">{l t='Rate 3: Good'}</span>
    <span id="rate4" class="rateScore">{l t='Rate 4: Very Good'}</span>
    <span id="rate5" class="rateScore">{l t='Rate 5: Excellent'}</span>
    </div>
    </td>
  </tr>
{else}
{foreach from=$var_ratingitems item=i}
  <tr>
  <td height="30"><strong>{$i.title}</strong><input type="hidden" name="rating{$i.item_id}" id="rating{$i.item_id}" value="">
      <input type="hidden" name="tmp_rating{$i.item_id}" id="tmp_rating{$i.item_id}" value=""></td>
  <td width="30%">
    <div id="starRating{$i.item_id}">
      <input type="radio" name="rating{$i.item_id}" value="1" > 1
      <input type="radio" name="rating{$i.item_id}" value="2" > 2
      <input type="radio" name="rating{$i.item_id}" value="3" > 3
      <input type="radio" name="rating{$i.item_id}" value="4" > 4
      <input type="radio" name="rating{$i.item_id}" value="5" > 5  
         </div>
       <script type="text/javascript">
      replaceStarsnew('{$i.item_id}');
      </script>      </td>
      <td width="40%" >
    <div style="width:200px;  overflow:hidden">
    <span id="{$i.item_id}rate1" class="rateScore">{l t='Rate 1: Poor'}</span>
    <span id="{$i.item_id}rate2" class="rateScore">{l t='Rate 2: Average'}</span>
    <span id="{$i.item_id}rate3" class="rateScore">{l t='Rate 3: Good'}</span>
    <span id="{$i.item_id}rate4" class="rateScore">{l t='Rate 4: Very Good'}</span>
    <span id="{$i.item_id}rate5" class="rateScore">{l t='Rate 5: Excellent'}</span>
    </div>
    </td>
  </tr>
  {/foreach}
  
  {/if}  
  
  <tr>
  <td width="36%" height="5"> </td>
  <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <td height="5" valign="top"><strong>{l t='Your Review'}</strong></td>
  <td colspan="2" rowspan="2" valign="top"><textarea id="review" name="review"  {if $var_me.user_id && $var_me.user_id == $var_biz.user_id } onfocus="owner(this)" {else} onfocus="check_login(this)" {/if} style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif; font-size:14px; width:330px; height:140px;"></textarea></td>
  </tr>                                                                                            
  <tr>
  <td height="5"><h5><em>{l t='Your review helps others learn about great businesses; be personal, be irreverent, be you. It\'s that tone that makes here so much fun!'} <br />
<br />{l t='Reminder, your opinions are your own. Please, review responsibly.'}</em></h5></td>
  </tr>
  <tr>
  <td height="70">&nbsp;</td>
  <td width="43%">
  {if $has_ratingitems == 0}
  <input type="button" name="button"  id="button" value="  {l t='Submit'} &gt;&gt;  " onclick="get(biz_id,1,'review')" />
  {else}
  <input type="button" name="button"  id="button" value="  {l t='Submit'} &gt;&gt;  " onclick="get(biz_id,1,'reviewrating')" />
  {/if}
  
  </td>
  <td width="21%"><a href="#top" id="topBtn">{l t='Top'} &uArr;</a></td>
  </tr>
</table>
              </div>
        </form>
           </div>

<div id="testube" style="display: none; overflow:hidden">
	<object width="853" height="505" style="display:none"><param name="movie" value="{$var_biz.video_url}"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="{$var_biz.video_url}" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="853" height="505"></embed></object>
</div>

      <div class="right">
              <div class="con box">
              <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
{$ads->getAdCode(6)}
          </div>
                <div id="clear"></div>
                <div class="con box">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                  <h2>{l t='Recent Reviews'}</h2>
                    <div id="clear"></div>  

<!--loop-->
 {foreach from=$var_newreview item=i}
                    <div class="item" id="clear">
                      <div class="pic"><div class="photoBox"><a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}"><img src="/images/business/{$i.picurl}_40x40" width="40" height="40" /></a></div></div>
                        <div class="t"><h3>
                        {if $admin_type}
                        <a href="/mgt/func/select.php?sheet=business_reviews&where=review_id&equal={$i.reviewid}&field=review_id,review_desc,review_date,user_id,business_id,rating,cat_id,city_id&text=ID,Review content,Review date (YYYYMMDDHHIISS),Submitter,Business ID,Conmment Rating,Category ID,City ID" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="{l t='Edit'}" title="{l t='Edit'}" border="0" align="top" /></a>
<a href="javascript:del_bizreview('{$i.reviewid}')" class="ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_del.png" alt="{l t='Delete'}" title="{l t='Delete'}" border="0" align="top" /></a>
                                                      
                        {/if}
                        <a href="/{$smarty.const._BIZ_DIR_}/{$i.bizurl}">{$i.bizname}</a>{$i.starbiz}</h3>
<h3>{$i.reviewdate}</h3>{$i.reviewbrief}
                        </div>
                    </div>
{/foreach}
<!--/loop-->
<div class="item" id="clear"><h3><a href="/{$smarty.const._BIZ_DIR_}/search.php">{l t='More Recent Reviews'} &raquo;</a></h3></div>
                </div>
<div id="clear"></div>
                </div>
                <div id="clear"></div>
      </div>
    </div>
 </div>
 <!--Main End-->
 <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4b594c017ff94751"></script>
 {if $smarty.const._GOOGLE_MAP_ENABLED_ && $var_biz.map_enabled}
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
 {/if}
 {include file="footer.tpl"}