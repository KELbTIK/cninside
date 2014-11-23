{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css?100510" />

<script src="/theme/{$get_theme}/js/ajax.js?100510" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/link.js?100510" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/biz_new.js?100514" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/star.js?100510" type="text/javascript"></script>
{*<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css?100510" media="screen" />*}
{*<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.core.css?100510" media="screen" />*}
{*<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.theme.css?100510" media="screen" />*}
{*<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/css/timecntr/jquery-ui-1.7.1.custom.css?100510" media="screen" />*}
{*<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css?100510" media="screen" />*}
<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.js?100510"></script>
<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/jquery.effects.core.js?100510"></script>

<script>
var t_CannotGeo="{l t='Sorry, we were unable to geocode that address'}";

</script>

 <!--Main Start-->

<div id="main">
    <div class="content container" id="replyTitle">
        <div class="row">
            <form action="#" onsubmit="return false" method="post" name="frm" id="frm" enctype="multipart/form-data" class="form-horizontal">
                <div class="col-sm-9 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Add a Business'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Business Name'} <span style="color:red;">*</span></label>
                                <div class="col-sm-8">
                                    <input size="50" name="biz_name" class="form-control" id="biz_name" value="{$smarty.post.biz_name}" onblur="bizname2permalink(this.value); if(this.value) $('#label_bizname').show();$('#keyword_bizname').text(this.value);  " tabindex="1"/>
                                    <div id="err1" style="display:none">
                                        <br/>
                                        <div class="alert alert-danger" >{l t='Business Name is necessary'}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">
                                    {l t='Categories'}
                                    <span style="color:red;">*</span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <select class="form-control" id="dhtmlgoodies_country" name="dhtmlgoodies_country" onChange="getCatPrice(this,'dhtmlgoodies_city');getCatHours(this,'dhtmlgoodies_city');getCatloc(this,'dhtmlgoodies_city');" tabindex="6">
                                                <option value="">{l t='Select Category'}</option>
                                                {$var_cat}
                                            </select>
                                        </div>
                                        <div class="form-group visible-xs"></div>
                                        <div class="col-sm-6">
                                            <select class="form-control" id="dhtmlgoodies_city" name="dhtmlgoodies_city" onFocus="this.style.backgroundColor='#fff'" tabindex="7"  onclick="restore();check_cat_dup()">
                                                <option value="">{l t='Select Subcategory'}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="cat2" style="display:none;">
                                <label class="col-sm-4 control-label">
                                    <h5>
                                        <a href="javascript:;" onClick="document.getElementById('cat3').style.display='';this.style.display='none';">
                                            <span style="color:#F30; text-decoration:underline">{l t='Insert the third category'}&raquo;</span>
                                        </a>
                                    </h5>
                                </label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <select class="form-control" id="dhtmlgoodies_country2" name="dhtmlgoodies_country2" onChange="getCat(this,'dhtmlgoodies_city2');">
                                                <option value="">{l t='Select Category'}</option>
                                                {$var_cat}
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <select class="form-control" id="dhtmlgoodies_city2" name="dhtmlgoodies_city2" onFocus="this.style.backgroundColor='#fff'" onclick="restore();check_cat_dup()">
                                                <option value="">{l t='Select Subcategory'}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="cat3" style="display:none;">
                                <label class="col-sm-4 control-label">&nbsp;</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <select class="form-control" id="dhtmlgoodies_country3" name="dhtmlgoodies_country3" onChange="getCat(this,'dhtmlgoodies_city3');" >
                                                <option value="">{l t='Select Category'}</option>
                                                {$var_cat}
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <select class="form-control" id="dhtmlgoodies_city3" name="dhtmlgoodies_city3" onFocus="this.style.backgroundColor='#fff'"  onclick="restore();check_cat_dup()">
                                                <option value="">{l t='Select Subcategory'}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <div class="alert alert-danger" id="err3" style="display:none">{l t='Please Select a Subcategory'}</div>
                                    <div class="alert alert-danger" id="err4" style="display:none">{l t='Please do not select the same category'}</div>
                                    <div class="alert alert-danger" id="err5" style="display:none">{l t='Please do not select category without subcategory'}</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 text-right">
                                    <h6><a href="javascript:;" onClick="$('#cat2').show();$(this).hide();"><span style="color:#F30; text-decoration:underline">{l t='Insert the second category'}&raquo;</span></a></h6>
                                </div>
                                <div class="col-sm-8">
                                    <h6><a href="../contact" target="_blank">{l t='Can\'t find the category you want? Tell us'}</a></h6>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Permalink'} <span style="color:red;">*</span></label>
                                <div class="col-sm-8">
                                    <label class="control-label col-sm-5 col-xs-12">
                                        http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{if $smarty.const._BIZ_PERMALINK_=='2' || $smarty.const._BIZ_PERMALINK_=='4'}cat/{/if}{if $smarty.const._BIZ_PERMALINK_=='3' || $smarty.const._BIZ_PERMALINK_=='4'}subcat/{/if}
                                    </label>
                                    <div class="col-sm-5 col-xs-10">
                                        <input name="permalink" id="biz_permalink" class="form-control" value="{$smarty.post.biz_permalink}"  onclick="$('#biz_permalink_tips').hide();$('#biz_permalink_img').hide()"  onblur="validate_permalink(this.value)" disabled="disabled"/>
                                    </div>
                                    <div class="col-sm-2 col-xs-2" style="display: none" id="biz_permalink_img">
                                        <label class="control-label"><i class="fa fa-check"></i></label>
                                    </div>
                                    <div id="biz_permalink_tips" {if $codefail==4}style=" display:block"{/if}>
                                        <br/>
                                        <div class="alert alert-warning">{l t='This permalink name had been taken'} {l t='because a same business name found in our site'}. {l t='You may add a number or street name to it'}. {l t='e.g. McDonald\'s2 or McDonald\'s(WallStreet)'}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Photo'}</label>
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        <input type="file" name="file" id="file" />
                                    </label>
                                    <div><em>(Type: JPEG GIF)</em></div>
                                </div>
                            </div>
                            <div class="form-group" id="location_address1" style="display:none;">
                                <label class="col-sm-4 control-label">{l t='Address'} 1 <span style="color:red;">*</span></label>
                                <div class="col-sm-8">
                                    <input size="50" class="form-control" name="biz_add1" id="biz_add1" value="{$smarty.post.biz_add1}"   onclick="this.style.backgroundColor='#fff'" onblur="if(this.value) $('#label_add1').show();$('#keyword_add1').text(this.value);$('#chk_add1').attr('checked', 'checked'); updateQuery() " tabindex="2"/>
                                    <div id="location_address11" style="display:none;">
                                        <br/>
                                        <div class="alert alert-danger" id="err2" style="display:none">Address 1 is necessary</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="location_address2" style="display:none;">
                                <label class="col-sm-4 control-label">{l t='Address'} 2</label>
                                <div class="col-sm-8">
                                    <input class="form-control" size="50" name="biz_add2" id="biz_add2"  value="{$smarty.post.biz_add2}" onblur="if(this.value) $('#label_add2').show();$('#keyword_add2').text(this.value); updateQuery()" tabindex="3" />
                                </div>
                            </div>
                            <div class="form-group" id="location_city" style="display:none;">
                                <label class="col-sm-4 control-label">{l t='City'}</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <select class="form-control" id="country" name="country" onChange="getCountry(this,'state');" tabindex="4">
                                                <option value="">{l t='Select Country'}</option>
                                                {$var_country}
                                            </select>
                                        </div>
                                        <div class="form-group visible-xs"></div>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="state" name="state" onChange="getState(this,'biz_city'); $('#label_state').show(); $('#keyword_state').text(this.options[this.selectedIndex].text); updateQuery()" tabindex="4">
                                                <option value="">{l t='Select State'}</option>
                                            </select>
                                        </div>
                                        <div class="form-group visible-xs"></div>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="biz_city" id="biz_city" onchange="$('#label_city').show(); $('#keyword_city').text(this.options[this.selectedIndex].text);  updateQuery()"  tabindex="5">
                                                <option value="">{l t='Select City'}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="location_zip" style="display:none;">
                                <label  class="col-sm-4 control-label">{l t='Zip Code'}</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" name="zip"  value="{$smarty.post.zip}" id="zip" tabindex="8" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">{l t='Phone'}</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" name="phone" value="{$smarty.post.phone}" id="phone" tabindex="9" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">{l t='Web Address'}</label>
                                <div class="col-sm-8">
                                    <input size="50" name="web" class="form-control" id="web" value="{$smarty.post.web}" onclick="if(this.value=='') this.value='http://'" tabindex="10" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">{l t='Video URL'}</label>
                                <div class="col-sm-8">
                                    <input size="50" name="video_url" id="video_url" class="form-control"  value="{$smarty.post.video_url}" onclick="if(this.value=='') this.value='http://'" tabindex="11" />
                                    <div>
                                        <em>{l t='Can be a YouTube Page URL or a video swf url'}<br />{l t='e.g. http://www.youtube.com/watch?v=****'}</em>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">{l t='Business Description'}</label>
                                <div class="col-sm-8">
                                    <textarea name="description" class="form-control" rows="5" id="description" tabindex="12">{$smarty.post.description}</textarea></td>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">{l t='Claim'}</label>
                                <div class="col-sm-8">
                                    <div class="checkbox notifications">
                                        <label>
                                            {literal}
                                                <input type="checkbox" name="claimchk" value="1" onclick="if(this.checked==true){ $('.claimtr').show();$('#review_box').hide();}else{ $('.claimtr').hide();$('.claim').val('');$('#review_box').show();}" tabindex="24" />
                                            {/literal}
                                                {l t='Yes, I want to claim this business.'}
                                        </label>
                                    </div>
                                    <div class="claimtr" style="display:none;">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">{l t='Your name'}</label>
                                            <div class="col-sm-8">
                                                <input name="claimname" type="text" class="claim form-control" id="claimname"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">{l t='Your phone number'}</label>
                                            <div class="col-sm-8">
                                                <input name="claimphone" type="text" class="claim form-control" id="claimphone" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">{l t='Your email'}</label>
                                            <div class="col-sm-8">
                                                <input name="claimemail" type="text" class="claim form-control" id="claimemail" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">{l t='About you'}</label>
                                            <div class="col-sm-8 register">
                                                <div class="radio">
                                                    <label><input type="radio" name="claimisowner" value="O" /> {l t='I\'m the owner'} </label>
                                                </div>
                                                <div class="radio">
                                                    <label><input type="radio" name="claimisowner" value="E" /> {l t='I\'m an employee'} </label>
                                                </div>
                                                <div class="radio">
                                                    <label><input type="radio" name="claimisowner" value="R" /> {l t='I\'m a representative'}</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">{l t='Claim testimony'}</label>
                                            <div class="col-sm-8">
                                                <textarea id="claiminfo" rows="4" class="claim form-control" name="claiminfo"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="hours" style="display:none;">
                                <label  class="col-sm-4 control-label">{l t='Open Hours'}</label>
                                <div class="col-sm-8 register">
                                    <input type="hidden" name="openhours" id="openhours" value="0" />
                                    <label class="radio-inline"><input type="radio" checked="checked" name="openhoursradio" onchange="$('.hourstables').hide();$('#openhours').val('0')" /> {l t='NA'}</label>
                                    <label class="radio-inline"><input type="radio" name="openhoursradio" onchange="$('.hourstables').hide();$('#regularhourstable').show();$('#openhours').val('1')" /> {l t='Regular hours'}</label>
                                    <label class="radio-inline"><input type="radio" name="openhoursradio" onchange="$('.hourstables').hide();$('#customhourstable').show();$('#openhours').val('2')" /> {l t='Custom hours'}</label>
                                </div>
                            </div>
                            <div class="form-group hourstables" id="regularhourstable" style="display:none;">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">{l t='Hours'}</label>
                                        <div class="col-sm-9">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <input class="form-control" type="text" id="fromhour" name="fromhour" value="{if $var_biz.from_hour}{$var_biz.from_hour}{else}8:00 AM{/if}" tabindex="13" />
                                                </div>
                                                <div class="col-sm-6">
                                                    <input class="form-control" type="text" id="tohour" name="tohour" value="{if $var_biz.to_hour}{$var_biz.to_hour}{else}6:00 PM{/if}" tabindex="14" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">{l t='Weeks'}</label>
                                        <div class="col-sm-9">
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week1" value="1" checked="checked" tabindex="16" /> {l t='Monday'}</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week2" value="2" checked="checked" tabindex="17"  /> {l t='Tuesday'}</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week3" value="3" checked="checked" tabindex="18"  /> {l t='Wednesday'}</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week4" value="4"  checked="checked" tabindex="19" /> {l t='Thursday'}</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week5" value="5"  checked="checked" tabindex="20" /> {l t='Friday'}</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week6" value="6" checked="checked" tabindex="21" /> {l t='Saturday'}</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="week7" value="7" checked="checked" tabindex="22"/> {l t='Sunday'}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group hourstables" id="customhourstable" style="display:none">
                                <div class="col-sm-offset-4 col-sm-8">

                                        <div class="form-group">
                                            <div class="col-sm-5"><label class="control-label"><input type="checkbox" name="wk1" value="1" checked="checked" tabindex="16" /> {l t='Monday'}</label></div>
                                            <div class="col-sm-3"><input type="text" class="form-control" id="fromhour1" name="fromhour1" value="{if $var_biz.from_hour1}{$var_biz.from_hour1}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour1" name="tohour1" value="{if $var_biz.to_hour1}{$var_biz.to_hour1}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-5"> <label class="control-label"><input type="checkbox" name="wk2" value="2" checked="checked" tabindex="17"  /> {l t='Tuesday'}</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="fromhour2" name="fromhour2" value="{if $var_biz.from_hour2}{$var_biz.from_hour2}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour2" name="tohour2" value="{if $var_biz.to_hour2}{$var_biz.to_hour2}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-5"><label class="control-label"><input type="checkbox" name="wk3" value="3" checked="checked" tabindex="18"  /> {l t='Wednesday'}</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="fromhour3" name="fromhour3" value="{if $var_biz.from_hour3}{$var_biz.from_hour3}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour3" name="tohour3" value="{if $var_biz.to_hour3}{$var_biz.to_hour3}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-5"><label class="control-label"><input type="checkbox" name="wk4" value="4"  checked="checked" tabindex="19" /> {l t='Thursday'}</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="fromhour4" name="fromhour4" value="{if $var_biz.from_hour4}{$var_biz.from_hour4}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour4" name="tohour4" value="{if $var_biz.to_hour4}{$var_biz.to_hour4}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-5"><label class="control-label"><input type="checkbox" name="wk5" value="5"  checked="checked" tabindex="20" /> {l t='Friday'}</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="fromhour5" name="fromhour5" value="{if $var_biz.from_hour5}{$var_biz.from_hour5}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour5" name="tohour5" value="{if $var_biz.to_hour5}{$var_biz.to_hour5}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-5"><label class="control-label"><input type="checkbox" name="wk6" value="6" checked="checked" tabindex="21" /> {l t='Saturday'}</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="fromhour6" name="fromhour6" value="{if $var_biz.from_hour6}{$var_biz.from_hour6}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour6" name="tohour6" value="{if $var_biz.to_hour6}{$var_biz.to_hour6}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-5"><label class="control-label"><input type="checkbox" name="wk7" value="7" checked="checked" tabindex="22"/> {l t='Sunday'}</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="fromhour7" name="fromhour7" value="{if $var_biz.from_hour7}{$var_biz.from_hour7}{else}8:00 AM{/if}" tabindex="13" /></div>
                                            <div class="col-sm-1 padding-clear text-center"><label class="control-label">-</label></div>
                                            <div class="col-sm-3"><input class="form-control" type="text" id="tohour7" name="tohour7" value="{if $var_biz.to_hour7}{$var_biz.to_hour7}{else}6:00 PM{/if}" tabindex="14" /></div>
                                        </div>

                                </div>
                            </div>
                            <div class="form-group" id="price_range" style="display:none;">
                                <label  class="col-sm-4 control-label">{l t='Price Range'}</label>
                                <div class="col-sm-8 register">
                                    <label class="radio-inline"><input type="radio" name="pricerange" value="0" checked="checked" tabindex="23" />{l t='NA'}</label>
                                    <label class="radio-inline"><input type="radio" name="pricerange" value="1" />{l t='$'}</label>
                                    <label class="radio-inline"><input type="radio" name="pricerange" value="2" />{l t='$$'}</label>
                                    <label class="radio-inline"><input type="radio" name="pricerange" value="3" />{l t='$$$'}</label>
                                    <label class="radio-inline"><input type="radio" name="pricerange" value="4" />{l t='$$$$'}</label>
                                </div>
                            </div>
                            <div class="form-group" id="price_range2" style="display:none;">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <em>
                                        <h5>
                                            {l t='Price range is the approximate cost per person for a meal including one drink, tax, and tip.'}<br>
                                            {l t='We\'re going for averages here, folks.'}<br>
                                            {l t='$ = Cheap, Under $10'}<br>
                                            {l t='$$ = Moderate, $11 - $30'}<br>
                                            {l t='$$$ = Spendy, $31 - $60'}<br>
                                            {l t='$$$$ = Splurge, Above $60'}
                                        </h5>
                                    </em>
                                </div>
                            </div>
                            {if $smarty.const._GOOGLE_MAP_ENABLED_}
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">{l t='Map'}</label>
                                    <div class="col-sm-8">
                                        <div id="map_canvas" style="height: 338px; overflow:hidden; border:1px #ccc solid">
                                            <div class="text-center">{l t='Please wait'}...</div>
                                        </div>
                                        <br />
                                        <span id="address">{l t='Try to convert address to map via clicking the button below.'}</span>
                                        <br />
                                        <br />
                                        {l t='Check the keywords to search first:'}<br />
                                        <div id="label_bizname" style=" display:none"><label><input id="chk_bizname" type="checkbox" onclick="updateQuery()" /> <em>{l t='Business Name'}:</em> <span id="keyword_bizname"></span></label></div>
                                        <div  id="label_add1" style=" display:none"><label><input id="chk_add1" type="checkbox"  onclick="updateQuery()" /> <em>{l t='Address'} 1:</em> <span id="keyword_add1"></span></label></div>
                                        <div  id="label_add2" style=" display:none"><label><input id="chk_add2" type="checkbox" onclick="updateQuery()" /> <em>{l t='Address'} 2:</em> <span id="keyword_add2"></span></label></div>
                                        <div  id="label_city" style=" display:none"><label><input id="chk_city" type="checkbox"  onclick="updateQuery()"/> <em>{l t='City'}:</em> <span id="keyword_city"></span></label></div>
                                        <div  id="label_state" style=" display:none"><label><input id="chk_state" type="checkbox"  onclick="updateQuery()" /> <em>{l t='State'}:</em> <span id="keyword_state"></span></label></div>
                                        <br />
                                        <em>{l t='Tips: The result may be more accurate if Business Name and Business Address are not all checked.'}</em><br />
                                        <br />
                                        {l t='Or search a place:'} <input type="text" class="form-control" id="search_add" name="search_add" onKeyDown="if (event.keyCode==13) showLocation() " />
                                        <br />
                                        <input type="button" class="btn button-blue" value="{l t='Convert Address to Map'}" onclick="showLocation()" />
                                        <br />
                                        <br />
                                        {l t='Note: Please adjust the map position and zoom, at the same time, please drag the pink marker to the accurate position of this business.'}<br>
                                        {l t='The zoom, map position and marker position will be recorded and display on the business detail page.'}
                                        <input name="x" type="hidden" id="x" />
                                        <input type="hidden" name="y" id="y" />
                                        <input type="hidden" name="zoom" id="zoom" />
                                        <input name="mapx" type="hidden" id="mapx" />
                                        <input type="hidden" name="mapy" id="mapy" />
                                    </div>
                                </div>
                            {/if}

                            {if $smarty.const._CAPTCHA_BIZ_ENABLE_}
                            <div class="form-group">
                                <label class="col-sm-4 control-label">{l t='Word Verification'} <span style="color:red;">*</span></label>
                                <div class="col-sm-8">
                                    <label class="control-label">
                                        {l t='Type the code shown below'}:
                                    </label>
                                    <img id="siimage" class="img-responsive pull-left" src="/inc/captcha/securimage_show.php?sid={$smarty.now}" />
                                    <div id="captcha" class="pull-left">
                                        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="19" height="19" id="SecurImage_as3" align="middle">
                                            <param name="allowScriptAccess" value="sameDomain" />
                                            <param name="allowFullScreen" value="false" />
                                            <param name="movie" value="/inc/captcha/securimage_play.swf?audio=/inc/captcha/securimage_play.php&bgColor1=#777&bgColor2=#fff&iconColor=#000&roundedCorner=5" />
                                            <param name="quality" value="high" />
                                            <param name="bgcolor" value="#ffffff" />
                                            <embed src="/inc/captcha/securimage_play.swf?audio=/inc/captcha/securimage_play.php&bgColor1=#777&bgColor2=#fff&iconColor=#000&roundedCorner=5" quality="high" bgcolor="#ffffff" width="19" height="19" name="SecurImage_as3" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                        </object>
                                        <br />
                                        <a tabindex="-1" style="border-style: none" href="#" title="Refresh Image" onClick="document.getElementById('siimage').src = '/inc/captcha/securimage_show.php?sid=' + Math.random(); return false"><img src="/inc/captcha/images/refresh.gif" alt="Reload Image" border="0" onClick="this.blur()" align="bottom" /></a>
                                    </div>
                                    <input type="text" class="form-control" name="code"/>

                                    {if $codefail==1}
                                        <br/>
                                        <div class="alert alert-danger">{l t='You inputed wrong words! Please re-type it'}</div>
                                    {/if}
                                </div>
                            </div>
                            {/if}
                        </div>
                    </div>

                    <div>
                        <div id="location_info3"></div>
                        <div id="location_address22" style="display:none;"></div>
                        <div id="location_city2" style="display:none;"></div>
                        <div id="location_zip2" style="display:none;"></div>
                    </div>

                    <div class="panel panel-default" id="review_box">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Write the First Review?'}</h3>
                        </div>
                        <div class="panel-body">
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
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <strong>{l t='Your Review'}</strong>
                                    <h5>
                                        <em>{l t='Your review helps others learn about great businesses; be personal, be irreverent, be you. It\'s that tone that makes here so much fun!'} <br />
                                            <br />{l t='Reminder, your opinions are your own. Please, review responsibly.'}</em>
                                    </h5>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea class="form-control" name="biz_review" cols="45" rows="7"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="button" class="btn button-blue" name="button" onClick="restore();verify();" id="button" value="    {l t='Submit'} " />
                </div>
            </form>
            <div class="col-sm-3 hidden-xs" >
                <div class="text-center">
                    <!-- START 160x600 Code -->
                    <p align="center">
                        {$ads->getAdCode(5)}
                    </p>
                    <!-- END Code -->
                </div>
            </div>
        </div>
    </div>
</div>

{if $smarty.const._GOOGLE_MAP_ENABLED_}
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
{/if}

{literal}
<script> $(document).ready(function() {
									{/literal}
		  {if $smarty.const._GOOGLE_MAP_ENABLED_}
		  initialize({$smarty.const._MAP_Y_},{$smarty.const._MAP_X_},{$smarty.const._MAP_ZOOM_},{$smarty.const._MARKER_Y_},{$smarty.const._MARKER_X_}) ;
		  {/if}
								{literal}
		 $('#fromhour').ptTimeSelect();
		 $('#tohour').ptTimeSelect();
		 $('#fromhour1').ptTimeSelect();
		 $('#tohour1').ptTimeSelect();
		 $('#fromhour2').ptTimeSelect();
		 $('#tohour2').ptTimeSelect();
		 $('#fromhour3').ptTimeSelect();
		 $('#tohour3').ptTimeSelect();
		 $('#fromhour4').ptTimeSelect();
		 $('#tohour4').ptTimeSelect();
		 $('#fromhour5').ptTimeSelect();
		 $('#tohour5').ptTimeSelect();
		 $('#fromhour6').ptTimeSelect();
		 $('#tohour6').ptTimeSelect();
		 $('#fromhour7').ptTimeSelect();
		 $('#tohour7').ptTimeSelect();
											   });


if($('#biz_name').val())      bizname2permalink($('#biz_name').val());

</script>

{/literal}
 <!--Main End-->
 {include file="footer.tpl"}