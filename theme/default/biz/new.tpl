{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css?100510" />
 
 <script src="/theme/{$get_theme}/js/ajax.js?100510" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/link.js?100510" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/biz_new.js?100514" type="text/javascript"></script>
<script src="/theme/{$get_theme}/js/star.js?100510" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css?100510" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.core.css?100510" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.theme.css?100510" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/css/timecntr/jquery-ui-1.7.1.custom.css?100510" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css?100510" media="screen" />
	<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.js?100510"></script>
    <script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/jquery.effects.core.js?100510"></script>
    
    <script>
    var t_CannotGeo="{l t='Sorry, we were unable to geocode that address'}";
    
    </script>
    
 <!--Main Start-->  
 
 <div id="main">
        <div class="content" id="replyTitle">
        <form action="#" onsubmit="return false" method="post" name="frm" id="frm" enctype="multipart/form-data">
				<div class="left">
                       <div class="con box" style="height:auto; padding:5px;">
                       <span class="coner c1"></span>
                        <span class="coner c2"></span>
                        <span class="coner c3"></span>
                        <span class="coner c4"></span>
            		    <h2>{l t='Add a Business'}</h2>
                             <table width="95%" border="0">
                               <tr>
                                 <th>&nbsp;</th>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <th width="30%">{l t='Business Name'} <span style="color:red;">*</span></th>
                               <td width="70%"><label>
                                   <input size="50" name="biz_name" id="biz_name" value="{$smarty.post.biz_name}" onblur="bizname2permalink(this.value); if(this.value) $('#label_bizname').show();$('#keyword_bizname').text(this.value);  " tabindex="1"/>
                                 </label></td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>
                            <h6><span id="err1" style="color:red; display:none">{l t='Business Name is necessary'}</span></h6></td>
                               </tr>
                               
                               <tr>
                                 <th>{l t='Categories'} <span style="color:red;">*</span></th>
                                 <td><select id="dhtmlgoodies_country" name="dhtmlgoodies_country" onChange="getCatPrice(this,'dhtmlgoodies_city');getCatHours(this,'dhtmlgoodies_city');getCatloc(this,'dhtmlgoodies_city');" tabindex="6">
                                  <option value="">{l t='Select Category'}</option>
                                        {$var_cat}
                                </select>&nbsp;&nbsp;
                                <select id="dhtmlgoodies_city" name="dhtmlgoodies_city" onFocus="this.style.backgroundColor='#fff'" tabindex="7"  onclick="restore();check_cat_dup()">
                                  <option value="">{l t='Select Subcategory'}</option>
                                </select></td>
                               </tr>
                               <tr id="cat2" style="display:none;">
                                 <th><h5><a href="javascript:;" onClick="document.getElementById('cat3').style.display='';this.style.display='none';"><span style="color:#F30; text-decoration:underline">{l t='Insert the third category'}&raquo;</span></a></h5><td><select id="dhtmlgoodies_country2" name="dhtmlgoodies_country2" onChange="getCat(this,'dhtmlgoodies_city2');">
                                                                    <option value="">{l t='Select Category'}</option>{$var_cat}</select>&nbsp;&nbsp;
                                <select id="dhtmlgoodies_city2" name="dhtmlgoodies_city2" onFocus="this.style.backgroundColor='#fff'" onclick="restore();check_cat_dup()">
                                  <option value="">{l t='Select Subcategory'}</option>
                                </select></td>
                               </tr>
                               <tr id="cat3" style="display:none;">
                                 <th>&nbsp;</th>
                                 <td><select id="dhtmlgoodies_country3" name="dhtmlgoodies_country3" onChange="getCat(this,'dhtmlgoodies_city3');" >
                                 <option value="">{l t='Select Category'}</option>{$var_cat}</select>&nbsp;&nbsp;
                                <select id="dhtmlgoodies_city3" name="dhtmlgoodies_city3" onFocus="this.style.backgroundColor='#fff'"  onclick="restore();check_cat_dup()">
                                  <option value="">{l t='Select Subcategory'}</option>
                                </select></td>
                               </tr>
                               <tr>
                                 <th>
                                 <h5><a href="javascript:;" onClick="$('#cat2').show();$(this).hide();"><span style="color:#F30; text-decoration:underline">{l t='Insert the second category'}&raquo;</span></a></h5>
                                 <td>
                                 <h6>
                                 <span id="err3" style="color:red;display:none">{l t='Please Select a Subcategory'}</span>
                                 <span id="err4" style="color:red;display:none">{l t='Please do not select the same category'}</span>
                                 <span id="err5" style="color:red;display:none">{l t='Please do not select category without subcategory'}</span>
                                 <a href="../contact" target="_blank">{l t='Can\'t find the category you want? Tell us'}</a> </h6>
                                 </td>
                               </tr>
                               <tr>
                                 <th width="30%">{l t='Permalink'} <span style="color:red;">*</span></th>
                               <td width="70%"><label>
                                   http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{if $smarty.const._BIZ_PERMALINK_=='2' || $smarty.const._BIZ_PERMALINK_=='4'}cat/{/if}{if $smarty.const._BIZ_PERMALINK_=='3' || $smarty.const._BIZ_PERMALINK_=='4'}subcat/{/if}
                                 <input name="permalink" id="biz_permalink" value="{$smarty.post.biz_permalink}"  onclick="$('#biz_permalink_tips').hide();$('#biz_permalink_img').hide()"  onblur="validate_permalink(this.value)" disabled="disabled"/>
                                 <img src="/theme/{$smarty.const._THEME_}/images/b_success.png" border="0" style="display:none;vertical-align:bottom;" id="biz_permalink_img" /></label></td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>
                                 <span id="biz_permalink_tips" {if $codefail==4}style=" display:block"{/if}>{l t='This permalink name had been taken'}<br />{l t='because a same business name found in our site'}.<br />{l t='You may add a number or street name to it'}.<br />{l t='e.g. McDonald\'s2 or McDonald\'s(WallStreet)'}</span>
                           </td>
                               </tr>
                               <tr>
                                 <th>{l t='Photo'}</th>
                                 <td><input type="file" name="file" id="file" />
(Type: JPEG GIF)</td>
                               </tr>
                               
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;<div id="location_info3"></div></td>
                               </tr>
                               <tr id="location_address1" style="display:none;">
                                 <th>{l t='Address'} 1 <span style="color:red;">*</span></td>
                                 <td><input size="50" name="biz_add1" id="biz_add1" value="{$smarty.post.biz_add1}"   onclick="this.style.backgroundColor='#fff'" onblur="if(this.value) $('#label_add1').show();$('#keyword_add1').text(this.value);$('#chk_add1').attr('checked', 'checked'); updateQuery()
" tabindex="2"/></td>
                               </tr>
                               <tr id="location_address11" style="display:none;">
                                 <td height="5">&nbsp;</td>
                                 <td><h6><span id="err2" style="color:red; display:none">Address 1 is necessary</span></h6></td>
                               </tr>
                               <tr id="location_address2" style="display:none;">
                                 <th>{l t='Address'} 2 </th>
                                 <td><input size="50" name="biz_add2" id="biz_add2"  value="{$smarty.post.biz_add2}" onblur="if(this.value) $('#label_add2').show();$('#keyword_add2').text(this.value); updateQuery()" tabindex="3" /></td>
                               </tr>
                               <tr id="location_address22" style="display:none;">
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>


                               
                               <tr id="location_city" style="display:none;">
                                 <th>{l t='City'}</th>
                                 <td>
                                 
                                 <select id="country" name="country" onChange="getCountry(this,'state');" tabindex="4">
                                  <option value="">{l t='Select Country'}</option>
                                        {$var_country}
                                </select> - 
                                 <select id="state" name="state" onChange="getState(this,'biz_city'); $('#label_state').show(); $('#keyword_state').text(this.options[this.selectedIndex].text); updateQuery()" tabindex="4">
                                  <option value="">{l t='Select State'}</option>
								
								</select> - <select name="biz_city" id="biz_city" onchange="$('#label_city').show(); $('#keyword_city').text(this.options[this.selectedIndex].text);  updateQuery()"  tabindex="5">
                                  <option value="">{l t='Select City'}</option>
                                </select>
                               
                                 </td>
                               </tr>
                                
                               <tr id="location_city2" style="display:none;">
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               
                               <tr id="location_zip" style="display:none;">
                                 <th>{l t='Zip Code'}</th>
                                 <td><input type="text" name="zip"  value="{$smarty.post.zip}" id="zip" tabindex="8" /></td>
                               </tr>
                               <tr id="location_zip2" style="display:none;">
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <th>{l t='Phone'}</th>
                                 <td><input type="text" name="phone" value="{$smarty.post.phone}" id="phone" tabindex="9" /></td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <th>{l t='Web Address'} </th>
                                 <td><input size="50" name="web" id="web" value="{$smarty.post.web}" onclick="if(this.value=='') this.value='http://'" tabindex="10" /></td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <th>{l t='Video URL'}</th>
                                 <td><input size="50" name="video_url" id="video_url"  value="{$smarty.post.video_url}" onclick="if(this.value=='') this.value='http://'" tabindex="11" /></td>
                               </tr>
                               <tr>
                                 <td height="10">&nbsp;</td>
                                 <td valign="top"><em>{l t='Can be a YouTube Page URL or a video swf url'}<br />{l t='e.g. http://www.youtube.com/watch?v=****'}</em></td>
                               </tr>
                               <tr>
                                 <th valign="top">{l t='Business Description'} </th>
                                 <td><textarea name="description" style="height:150px; width:330px;" id="description" tabindex="12">{$smarty.post.description}</textarea></td>
                               </tr>
                               
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr id="hours" style="display:none;">
                               <th>{l t='Open Hours'}<input type="hidden" name="openhours" id="openhours" value="0" /></th>
                               <td>
                               <table width="90%" border="0" cellpadding="0" cellspacing="0"><tr>
                               <td width="20%">
                               <label><input type="radio" checked="checked" name="openhoursradio" onchange="$('.hourstables').hide();$('#openhours').val('0')" /> {l t='NA'}</label></td>
                               <td width="40%"><label><input type="radio" name="openhoursradio" onchange="$('.hourstables').hide();$('#regularhourstable').show();$('#openhours').val('1')" /> {l t='Regular hours'}</label></td>
                               <td width="40%"><label><input type="radio" name="openhoursradio" onchange="$('.hourstables').hide();$('#customhourstable').show();$('#openhours').val('2')" /> {l t='Custom hours'}</label></td></tr></table>
                              
                               </td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td> 
                                 <table width="100%" bgcolor="#FFFFDD" id="regularhourstable" class="hourstables" style="display:none">
                               <tr>
                                 <th width="20%">{l t='Hours'}</th>
                                 <td><input type="text" id="fromhour" name="fromhour" value="{if $var_biz.from_hour}{$var_biz.from_hour}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour" name="tohour" value="{if $var_biz.to_hour}{$var_biz.to_hour}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <th>{l t='Weeks'}</th>
                                 <td>
                                 <table width="100%" border="0" cellpadding="0" cellspacing="0"><tr>
                        <td style="border:0">
                        <label><input type="checkbox" name="week1" value="1" checked="checked" tabindex="16" /> {l t='Monday'}</label></td>
                        <td style="border:0">
                        <label><input type="checkbox" name="week2" value="2" checked="checked" tabindex="17"  /> {l t='Tuesday'}</label></td>
                        <td style="border:0">
                        <label><input type="checkbox" name="week3" value="3" checked="checked" tabindex="18"  /> {l t='Wednesday'}</label></td>
                        <td style="border:0">
                        <label><input type="checkbox" name="week4" value="4"  checked="checked" tabindex="19" /> {l t='Thursday'}</label></td></tr>
                        <tr>
                        <td style="border:0">
                        <label><input type="checkbox" name="week5" value="5"  checked="checked" tabindex="20" /> {l t='Friday'}</label></td>
                        <td style="border:0">
                        <label><input type="checkbox" name="week6" value="6" checked="checked" tabindex="21" /> {l t='Saturday'}</label></td>
                        <td style="border:0">
                        <label><input type="checkbox" name="week7" value="7" checked="checked" tabindex="22"/> {l t='Sunday'}</label></td>
                        <td style="border:0">&nbsp;</td>
                        </tr></table>
                                 </td>
                               </tr>
                               
                               </table>
                               
                               <table width="80%" bgcolor="#FFFFDD" id="customhourstable" class="hourstables" style="display:none">
                               <tr>
                                 <td><label><input type="checkbox" name="wk1" value="1" checked="checked" tabindex="16" /> {l t='Monday'}</label>&nbsp; <input type="text" id="fromhour1" name="fromhour1" value="{if $var_biz.from_hour1}{$var_biz.from_hour1}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour1" name="tohour1" value="{if $var_biz.to_hour1}{$var_biz.to_hour1}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <tr>
                                 <td><label><input type="checkbox" name="wk2" value="2" checked="checked" tabindex="17"  /> {l t='Tuesday'}</label>&nbsp; <input type="text" id="fromhour2" name="fromhour2" value="{if $var_biz.from_hour2}{$var_biz.from_hour2}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour2" name="tohour2" value="{if $var_biz.to_hour2}{$var_biz.to_hour2}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <tr>
                                 <td><label><input type="checkbox" name="wk3" value="3" checked="checked" tabindex="18"  /> {l t='Wednesday'}</label>&nbsp; <input type="text" id="fromhour3" name="fromhour3" value="{if $var_biz.from_hour3}{$var_biz.from_hour3}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour3" name="tohour3" value="{if $var_biz.to_hour3}{$var_biz.to_hour3}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <tr>
                                 <td><label><input type="checkbox" name="wk4" value="4"  checked="checked" tabindex="19" /> {l t='Thursday'}</label>&nbsp;  <input type="text" id="fromhour4" name="fromhour4" value="{if $var_biz.from_hour4}{$var_biz.from_hour4}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour4" name="tohour4" value="{if $var_biz.to_hour4}{$var_biz.to_hour4}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <tr>
                                 <td><label><input type="checkbox" name="wk5" value="5"  checked="checked" tabindex="20" /> {l t='Friday'}</label>&nbsp;  <input type="text" id="fromhour5" name="fromhour5" value="{if $var_biz.from_hour5}{$var_biz.from_hour5}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour5" name="tohour5" value="{if $var_biz.to_hour5}{$var_biz.to_hour5}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <tr>
                                 <td><label><input type="checkbox" name="wk6" value="6" checked="checked" tabindex="21" /> {l t='Saturday'}</label>&nbsp; <input type="text" id="fromhour6" name="fromhour6" value="{if $var_biz.from_hour6}{$var_biz.from_hour6}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour6" name="tohour6" value="{if $var_biz.to_hour6}{$var_biz.to_hour6}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               <tr>
                                 <td><label><input type="checkbox" name="wk7" value="7" checked="checked" tabindex="22"/> {l t='Sunday'}</label>&nbsp; <input type="text" id="fromhour7" name="fromhour7" value="{if $var_biz.from_hour7}{$var_biz.from_hour7}{else}8:00 AM{/if}" style="width:70px;" tabindex="13" />
                         - 
                         <input type="text" id="tohour7" name="tohour7" value="{if $var_biz.to_hour7}{$var_biz.to_hour7}{else}6:00 PM{/if}" style="width:70px;" tabindex="14" /></td>
                               </tr>
                               
                                 </table>
                               
                               &nbsp;</td>
                               </tr>
                               <tr id="price_range" style="display:none;">
                                 <th>{l t='Price Range'}</th>
                                 <td><table width="90%" border="0" cellpadding="0" cellspacing="0"><tr>
                         <td style="border:0"><label><input type="radio" name="pricerange" value="0" checked="checked" tabindex="23" />&nbsp; &nbsp;{l t='NA'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="1" />&nbsp; &nbsp;{l t='$'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="2" />&nbsp; &nbsp;{l t='$$'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="3" />&nbsp; &nbsp;{l t='$$$'}</label></td>
                        <td style="border:0"><label><input type="radio" name="pricerange" value="4" />&nbsp; &nbsp;{l t='$$$$'}</label></td>
                        </tr></table></td>
                               </tr>
                               <tr id="price_range2" style="display:none;">
                                 <td height="5">&nbsp;</td>
                                 <td><em><h5>
                                 {l t='Price range is the approximate cost per person for a meal including one drink, tax, and tip.'}<br>
                                 {l t='We\'re going for averages here, folks.'}<br>
                                 {l t='$ = Cheap, Under $10'}<br>
                                 {l t='$$ = Moderate, $11 - $30'}<br>
                                 {l t='$$$ = Spendy, $31 - $60'}<br>
                                 {l t='$$$$ = Splurge, Above $60'}
                                 </h5></em></td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <th>{l t='Claim'}</th>
                                 {literal}
                                 <td>
                                       <label><input type="checkbox" name="claimchk" value="1" onclick="if(this.checked==true){ $('.claimtr').show();$('#review_box').hide();}else{ $('.claimtr').hide();$('.claim').val('');$('#review_box').show();}" tabindex="24" /> {/literal}{l t='Yes, I want to claim this business.'}</label>
                                 </td>
                               </tr>
                               <tr class="claimtr" style="display:none;">
                                 <th> </th>
                                 <td>
                                 <table bgcolor="#FFFFDD" width="100%">
                                     <tr>
                                     
                      <th>{l t='Your name'}</th>
                      <td><input name="claimname" type="text" class="claim" id="claimname" style="width:250px;" /></td>
                    </tr>
                    <tr>
                      <th>{l t='Your phone number'}</th>
                      <td><input name="claimphone" type="text" class="claim" id="claimphone" style="width:250px;"  /></td>
                    </tr>
                    <tr>
	                	<th>{l t='Your email'}</th>
                        <td><input name="claimemail" type="text" class="claim" id="claimemail" style="width:250px;"  /></td>
                    </tr>
                    <tr>
                      <th>{l t='About you'}</th>
                      <td><label><input type="radio" name="claimisowner" value="O" /> {l t='I\'m the owner'} </label><label><input type="radio" name="claimisowner" value="E" /> {l t='I\'m an employee'} </label><label><input type="radio" name="claimisowner" value="R" /> {l t='I\'m a representative'}</label></td>
                    </tr>
                    <th>{l t='Claim testimony'}</th>
                                     <td>
                                    	<textarea id="claiminfo" class="claim" name="claiminfo" style="width:250px; height:100px;"></textarea>
                      <tr>
                    </table>
                                 </td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                               {if $smarty.const._GOOGLE_MAP_ENABLED_}
                               <tr>
                                 <th valign="top">{l t='Map'} </th>
                                 <td><div id="map_canvas" style="width: 333px; height: 338px; overflow:hidden; border:1px #ccc solid"><center>{l t='Please wait'}...</center></div>
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
                                 {l t='Or search a place:'} <input type="text" id="search_add" name="search_add" style="width:200px;" onKeyDown="if (event.keyCode==13) showLocation() " />
                                 <br />
                                 <input type="button" value="{l t='Convert Address to Map'}" onclick="showLocation()" style="width:200px; height:30px;" />
                                 <br />
                                 <br />
{l t='Note: Please adjust the map position and zoom, at the same time, please drag the pink marker to the accurate position of this business.'}<br>
{l t='The zoom, map position and marker position will be recorded and display on the business detail page.'}
  <input name="x" type="hidden" id="x" />
  <input type="hidden" name="y" id="y" />
  <input type="hidden" name="zoom" id="zoom" />
      <input name="mapx" type="hidden" id="mapx" />
      <input type="hidden" name="mapy" id="mapy" /></td>
                               </tr>
                               <tr>
                                 <td height="5">&nbsp;</td>
                                 <td>&nbsp;</td>
                               </tr>
                            {/if}
                          
                          {if $smarty.const._CAPTCHA_BIZ_ENABLE_}
                          <tr>
                            <th>{l t='Word Verification'} <span style="color:red;">*</span></td>
                            <td height="20">{l t='Type the code shown below'}:</td>
                            </tr>
                            <tr>
                            <td>&nbsp;</td>
                            <td>
<img id="siimage" style=" float:left; padding-right: 5px; border: 0" src="/inc/captcha/securimage_show.php?sid={$smarty.now}" />
<div id="captcha" style=" float: left;">
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
<div style="clear: both; height:10px;"></div>
<input type="text" name="code" style="width:200px;"/>
                            
                            </td>
                          </tr>
                          <tr>
                            <td height="10">&nbsp;</td>
                            <td height="10">
                            
                            {if $codefail==1}
							<span style="color:red; font-weight:bold; background-color:#FFC;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{l t='You inputed wrong words! Please re-type it'} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						    {/if}</td>
                          </tr>
           {/if}
                             </table>
                  </div>
                  <div id="clear"></div>
                        <div class="con box change" id="review_box" style="height:auto; margin-top:10px;padding:5px; ">
                        <span class="coner c1"></span>
                        <span class="coner c2"></span>
                        <span class="coner c3"></span>
                        <span class="coner c4"></span>
            		    <h2 style="color:#000000">{l t='Write the First Review?'}</h2>
                       <table width="95%" border="0" align="right">
  <tr>
    <td height="5">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="30" width="30%"><strong>{l t='Rating'}</strong><input type="hidden" name="rating" id="rating" value="">
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
						replaceStars();restore();
						</script></td>
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
  <tr>
    <td  height="5"> </td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="5" valign="top"><strong>{l t='Your Review'}</strong></td>
    <td colspan="2" rowspan="2" valign="top"><textarea name="biz_review" cols="45" rows="7"></textarea></td>
  </tr>
  <tr>
    <td height="5"><h5><em>{l t='Your review helps others learn about great businesses; be personal, be irreverent, be you. It\'s that tone that makes here so much fun!'} <br />
<br />{l t='Reminder, your opinions are your own. Please, review responsibly.'}</em></h5></td>
    </tr>

</table>

                       </div>
                       <table width="95%" border="0" align="right">  
                         <tr>
    <td height="70">&nbsp;</td>
    <td colspan="2"><input type="button" name="button" onClick="restore();verify();" id="button" value="    {l t='Submit'} &gt;&gt;    " /></td>
  </tr>
                       </table>
   	      </div>
                </form>
                <div class="right" >
                  <div class="con box" style=" padding-left:10px; text-align:center">
	                   <span class="coner c1"></span>
                        <span class="coner c2"></span>
                        <span class="coner c3"></span>
                        <span class="coner c4"></span>
                     <!-- START 160x600 Code -->
<p align="center">
{$ads->getAdCode(5)}
</p>
<!-- END Code -->
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