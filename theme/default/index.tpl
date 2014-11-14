{include file="header.tpl"}
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.fancybox-1.2.1.pack.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/frontend.js"></script> 
 <!--Main Start-->
<div id="main">
    <div class="content container-fluid">
        <div class="row">
            <div class="con_left col-md-8 col-sm-8 col-xs-12">
            <div class="hot_business">
            <span class="coner c1"></span>
            <span class="coner c2"></span>
            <span class="coner c3"></span>
            <span class="coner c4"></span>
                   <h1>{l t='Hot Listings'}<em>{l t='Hottest in one month, based on bookmarks'}</em></h1>
                   {if $var_hotbusiness}
                        <div class="best">
                                          <div class="pic" ><div class="photoBox" style=" overflow:hidden; width:104px; height:104px;"><a href="{$smarty.const._BIZ_DIR_}/{$var_hotbusiness.bizurl}"><img src="images/business/{$var_hotbusiness.picurl}_100x100" border="0"  /></a></div></div>
                                                <div class="t">
                                                  <h2><a href="{$smarty.const._BIZ_DIR_}/{$var_hotbusiness.bizurl}" style="color:#000000">{$var_hotbusiness.bizname}</a>{$var_hotbusiness.starbiz}<br />
                                                  <img src="theme/{$get_theme}/images/star/stars_{$var_hotbusiness.ratingmod}.gif" width="74" height="15" /></h2>
                                                  <h5><strong>{l t='Category'}: </strong><br />
            <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.catpermalink}/">{$var_hotbusiness.catname}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.catpermalink}/{$var_hotbusiness.subcatpermalink}/">{$var_hotbusiness.subcatname}</a><br />

            {if $var_hotbusiness.catid2 != '0'}
            <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat2permalink}/">{$var_hotbusiness.catname2}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat2permalink}/{$var_hotbusiness.subcat2permalink}/">{$var_hotbusiness.subcatname2}</a><br />
            {/if}

            {if $var_hotbusiness.catid3 != '0'}
            <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat3permalink}/">{$var_hotbusiness.catname3}</a> / <a href="/{$smarty.const._CAT_DIR_}/{$var_hotbusiness.cat3permalink}/{$var_hotbusiness.subcat3permalink}/">{$var_hotbusiness.subcatname3}</a><br />
            {/if}

            {$var_hotbusiness.add1} {$var_hotbusiness.add2}
            <br />
            {$var_hotbusiness.phone}</h5></div>
                                  </div>
                                <div class="more">
                                        <h3>{l t='More Hot Local Picks'}</h3>
                                        <ol>
                                            {$var_hotbusiness.otherhotbusiness_li}
                                      </ol>
                          </div>
                          {/if}
                        </div>
                        <div class="category">
                            <div class="row">
                                <div class="col-md-7 col-sm-7 col-xs-12">
                                    <div class="items">
                                        <span class="coner c1"></span>
                                        <span class="coner c2"></span>
                                        <span class="coner c3"></span>
                                        <span class="coner c4"></span>

                                        <p>BEST OF</p>
                                        <!--loop-->
                                        {foreach from=$var_bestof item=i}
                                        <div class="per">
                                            <h2><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" >{$i.catname}</a></h2>
                                            {$i.reviewnum} {l t='reviews'}
                                            <div class="photoBox" style=" width:150px; height:100px;"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" ><img src="/images/business/{$i.picurl}_150x95" /></a></div>
                                            <ol>
                                            {$i.bizli}
                                            </ol>
                                            <p align="right" style="padding-right:5px;"><a href="/{$smarty.const._CAT_DIR_}/{$i.catpermalink}/" class="Bbtn">{l t='More'}</a></p>
                                         </div>
                                         {/foreach}
                                         <!--/loop-->
                                    </div>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-12">
                                    <div class="lists">
                                        <span class="coner c1"></span>
                                        <span class="coner c2"></span>
                                        <span class="coner c3"></span>
                                        <span class="coner c4"></span>
                                        <h2>{l t='Browse by Category'}</h2>
                                        <ul>
                                            {$var_category_li}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
            <div class="top_events">
              <div class="title">
                      <div class="t pull-left"><h2>{l t='Top Events'}</h2></div>
                      <div class="pull-right"><a href="event/search.php" class="btn btn-block button-blue">{l t='Browse all events'}</a></div>
              </div>
              <div id="clear"></div>
            <!--loop-->
            {foreach from=$var_topevents item=i}
            <div class="items">
                <div class="pic"><a href="event/detail.php?id={$i.id}"><img src="images/event/e_{$i.picurl}_40x40" width="40" height="40" border="0" /></a></div>
                <div class="t">
                    <h3><a href="event/detail.php?id={$i.id}">{$i.name}</a></h3>
                    {$i.time}
                </div>
            </div>
            {/foreach}
            <!--/loop-->
            </div>
            <div class="pop_events">
              <div class="title">
                      <div class="t"><h2>{l t='Popular Events This Week'}</h2></div>
              </div>
              <div id="clear"></div>
               <!--loop-->
               {foreach from=$var_popevents item=i}
               <div class="items">
                    <div class="pic"><a href="event/detail.php?id={$i.id}"><img src="images/event/e_{$i.picurl}_40x40" width="40" height="40" border="0" /></a></div>
                    <div class="t">
                        <h3><a href="event/detail.php?id={$i.id}">{$i.name}</a></h3>
                        {$i.time}
                    </div>
               </div>
               {/foreach}
                <!--/loop-->
            </div>
            <div class="new_reviews">
                <div class="title">
                    <div class="t pull-left"><h2>{l t='Recent Reviews'}</h2></div>
                    <div class="pull-right"><a href="{$smarty.const._BIZ_DIR_}/search.php" class="btn btn-block button-blue">{l t='More'}</a></div>
                </div>
                <div id="clear"></div>
                <!--loop-->
                {foreach from=$var_newreviews item=i}
                <div class="items">
                    <div class="pic"><a href="{$smarty.const._BIZ_DIR_}/{$i.url}"><img src="images/business/{$i.picurl}_40x40" width="40" height="40" border="0" /></a></div>
                    <div class="t">
                            <h3>
                            {if $i.edit_btn}
                            <a href="/mgt/func/select.php?sheet=business_reviews&where=review_id&equal={$i.reviewid}&field=review_id,review_desc,review_date,user_id,business_id,rating,cat_id,city_id&text=ID,Review content,Review date (YYYYMMDDHHIISS),Submitter,Business ID,Conmment Rating,Category ID,City ID" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="{l t='Edit'}" title="{l t='Edit'}" border="0" align="top" /></a>
            <a href="javascript:del_bizreview('{$i.reviewid}')" class="ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_del.png" alt="{l t='Delete'}" title="{l t='Delete'}" border="0" align="top" /></a>

                             {/if}
                            <a href="{$smarty.const._BIZ_DIR_}/{$i.url}">{$i.name}</a>{$i.starbiz}
                            </h3>
                            <h4><img src="theme/{$get_theme}/images/icons/time.gif" width="12" height="13" />{$i.reviewdate}<br />{$i.reviewdesc}</h4>

                    </div>
                </div>
                {/foreach}
                <!--/loop-->
            </div>
            </div>
        <!--/left-->
        <!--right-->
            <div class="con_right col-md-4 col-sm-4 col-xs-12">
            {if !empty($var_social)}
                <div class="social" id="clear">
                    <div class="items">
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
                <div class="random_rat">
            <span class="coner c1"></span>
                <span class="coner c2"></span>
                <span class="coner c3"></span>
                <span class="coner c4"></span>
                        <h2>{l t='Latest Reviewer'}</h2>

                      <div id="clear"></div>
                      <!--loop-->
                      {foreach from=$var_lastreviewer item=i}
                      <div class="items">
                          <div class="pic"><div class="photoBox" style=" overflow:hidden; width:64px; height:64px;"><a href="my/?id={$i.uid}"><img src="images/photos/p_{$i.picurl}_60x60" /></a></div></div>
                          <div class="t">
                              <div class="info">
                                  <h3><a href="my/?id={$i.uid}">{$i.name}</a>
                                  {if $i.fb_user_id}<img src="/theme/{$get_theme}/images/fb_16.gif" border="0" style="vertical-align:text-bottom" />{/if}
                                  </h3>
                                  {if $i.location}
                                  {$i.location}<br />
                                  {/if}
                                  <strong>{l t='Member Since'}:</strong><br />{$i.regdate}
                                  <p><a href="my/?id={$i.uid}" class="Bbtn">{l t='View Profile'}</a></p>
                              </div>
                          </div>
                      </div>
                      <div id="clear"></div>
                      {/foreach}
                      <!--/loop-->
                      <div class="text-center">
                        <a href="/my/membersearch.php?rank=reviews_num" class="btn  button-blue">{l t='See Top Reviewers'}</a> &nbsp; &nbsp;
                        <a href="/my/membersearch.php" class="btn  button-blue">{l t='See New Users'}</a>
                      </div>
            </div>

              <div class="reviews">
            <span class="coner c1"></span>
                <span class="coner c2"></span>
                <span class="coner c3"></span>
                <span class="coner c4"></span>
                      <div class="title">
                                <h2>{l t='Hot Business'}</h2>
                </div>
                      <div id="clear"></div>
                      <div class="exp"><em>{l t='Rank by reviews in past 7 days'}!</em></div>
                      <div class="pull-right"><a href="{$smarty.const._BIZ_DIR_}/search.php" class="btn btn-block button-blue">{l t='More'}</a></div>
                      <div id="clear"></div>
                      <!--no loop-->
                      {if $var_hotbiz.bizname}
                      <div class="items">
                              <div class="pic"><div class="photoBox" style=" overflow:hidden; width:84px; height:84px;"><a href="{$smarty.const._BIZ_DIR_}/{$var_hotbiz.bizurl}"><img src="images/business/{$var_hotbiz.picurl}_80x80" /></a></div>
                              </div>
                               <div class="t">
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
            <div class="ads">
                <span class="coner c1"></span>
                <span class="coner c2"></span>
                <span class="coner c3"></span>
                <span class="coner c4"></span>
                {$ads->getAdCode(1)}
                </div>


                <div class="new_offer" id="clear">
                <span class="coner c1"></span>
                <span class="coner c2"></span>
                <span class="coner c3"></span>
                <span class="coner c4"></span>
                      <h2>{l t='New Special Offers'}</h2>
                      {if $var_newoffers}
                    <!--loop-->
                    {foreach from=$var_newoffers item=i}
                        <div class="special_offer">
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
                        </div>
                        <div id="clear"></div>
                    {/foreach}
                    <!--/loop-->
                    <div class="btn">
                    <a href="/offer/" class="Bbtn" style="">{l t='Browse more special offers'}</a></div>
                    {/if}
                </div>
              <div class="new_lists" id="clear">
                <span class="coner c1"></span>
                <span class="coner c2"></span>
                <span class="coner c3"></span>
                <span class="coner c4"></span>
                      <h2>{l t='New Lists'}</h2>
                      <!--loop-->
                      {foreach from=$var_newlists item=i}
                       <div class="items">
                            <div class="pic"><a href="/my/list/detail.php?id={$i.id}"><img border=0 src="/images/photos/p_{$i.picurl}_40x40" width=40 height=40 /></a></div>
                            <div class="t">
                                  <h3><a href="/my/list/detail.php?id={$i.id}">{$i.name}</a></h3>
                                  {$i.desc}
                            </div>
                      </div>
                      {/foreach}
                      <!--/loop-->
              </div>

            <div class="new_chatters">
                <span class="coner c1"></span>
                <span class="coner c2"></span>
                <span class="coner c3"></span>
                <span class="coner c4"></span>
                     <h2>{l t='New Chatters'}</h2>
                      <!--loop-->
                      {foreach from=$var_newchatters item=i}
                      <div id="clear"></div>
                      <div class="items">
                              <div class="pic"><img src="images/photos/p_{$i.picurl}_20x20" width="20" height="20" title="{$i.uname}" /></div>
                              <div class="t"><h3><a href="comm/?f=Chatter&aid={$i.tid}">{$i.tname}</a></h3></div>
                              <div class="info"><img src="theme/{$get_theme}/images/icons/time.gif" width="12" height="13" />{$i.replytime}</div>
                      </div>
                      {/foreach}
                      <!--/loop-->

                      <div class="text-center"><a href="comm/?f=Chatter" class="btn button-blue">{l t='More'}</a></div>
            </div>
            </div>
        </div>
    </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}