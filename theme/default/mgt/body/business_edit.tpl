<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
 <script src="/theme/{$get_theme}/js/ajax.js" type="text/javascript"></script>
<script src="/theme/{$get_theme}/mgt/body/js/biz.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />

    <link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css" media="screen" />

	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.core.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/ui.theme.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/example/css/timecntr/jquery-ui-1.7.1.custom.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.css" media="screen" />
    <link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/theme/{$get_theme}/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="JavaScript" src="/theme/{$get_theme}/js/pt/src/jquery.ptTimeSelect.js"></script>
</head>

{literal}
<style type="text/css">
th{ background:#f0f7fe}
</style>

<script>
var currentPermalink;


function validate_permalink(permalink)
{
	$('#biz_permalink').attr('disabled','disabled');
	$.post("/biz/biz_validate_ajax.php?"+Math.random(), {
			f:'ajax_validatepermalink',
			permalink:permalink
			},function(data){
					$('#biz_permalink').val(data.permalink);
					$('#biz_permalink').removeAttr('disabled');
					if(data.duplicate==1 && permalink!=currentPermalink) $('#biz_permalink_tips').slideDown();
					else{
						$('#biz_permalink_img').show();
						$('#biz_permalink_tips').slideUp()
						}
			},"json");
}
</script>

{/literal}
<body>
<div id="container">
 <!--Main Start-->
 <div class="panel panel-info">
     <div class="panel-heading">
         <div class="panel-title text-center">
             {l t='Еdit business '}{$var_biz.bizname}
         </div>
     </div>
     {if $msg}
         <div class="panel-body">
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <h3 class="text-center">{$msg}</h3>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p class="text-center">[ <a href="#" onclick="parent.$.fn.fancybox.close(); return false">OK</a> ]</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
        </div>
     {else}
         <form action="business_edit.php?id={$smarty.get.id}" method="post" class="form-horizontal list-group">
             <ul class="list-group" style="margin-bottom: 0">
                 <li class="list-group-item">
                     <label class="col-sm-3 control-label">{l t='Business name'}</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="bizname" value="{$var_biz.bizname}" >
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Permalink'}</label>
                     <div class="col-sm-8">
                         <span id="permalinkdiv">http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/{$var_biz.permalink} &nbsp;&nbsp; <a href="javascript:void(0)" onclick="$('#permalinkdiv').hide();$('#editpermalinkdiv').show(); currentPermalink='{$var_biz.permalink|escape:"quotes"}'">{l t='Click to Edit'}</a></span>
                         <label id="editpermalinkdiv" style="display:none;">
                             http://{$smarty.const._DOMAIN_}/{$smarty.const._BIZ_DIR_}/
                             <input class="form-control" name="permalink" id="biz_permalink"  onclick="$('#biz_permalink_tips').hide();$('#biz_permalink_img').hide()"  onblur="validate_permalink(this.value)"  value="{$var_biz.permalink}" />
                             <img class="img-responsive" src="/theme/{$smarty.const._THEME_}/images/b_success.png" border="0" style="display:none" id="biz_permalink_img" />
                         </label>
                         <div class="alert alert-danger" id="biz_permalink_tips" style=" display:none;">
                             <span>{l t='This permalink name had been taken'}<br />{l t='because a same business name found in our site'}.<br />{l t='You may add a number or street name to it'}.<br />{l t='e.g. McDonald\'s2 or McDonald\'s(WallStreet)'}</span>
                         </div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Submitter'}</label>
                     <div class="col-sm-8">
                         {$var_submitter.name} ({$var_submitter.email})
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Owner'}</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="hidden" value="{$var_owner.user_id}" id="ownerid" name="ownerid" />
                         <div id="ownertd">{$var_owner.name} ({$var_owner.email}) &nbsp; &nbsp; <a href="javascript:void(0)" onclick="$('#ownerid').val('0');$('#ownertd').html('NA') ">{l t='Assign to nobody'}</a></div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Category'} 1</label>
                     <div class="col-sm-8">
                         <div id="cattd1">{$var_biz.catname} / {$var_biz.subcatname} &nbsp; &nbsp; <a href="javascript:void(0);" onclick="$('#cattd1').hide();$('#catchange1').show();">{l t='Change'}</a></div>
                         <div id="catchange1" style="display:none">
                             <select class="form-control" id="dhtmlgoodies_country" name="dhtmlgoodies_country" onChange="getCatloc(this,'dhtmlgoodies_city');getCatHours(this,'dhtmlgoodies_city');getCatPrice(this,'dhtmlgoodies_city');">
                                 <option value="{$var_biz.catid}">=={$var_biz.catname}==</option>
                                 {$var_cat}
                             </select>&nbsp;&nbsp;
                             <select class="form-control" id="dhtmlgoodies_city" name="dhtmlgoodies_city">
                                 <option value="{$var_biz.subcatid}">=={$var_biz.subcatname}==</option>
                             </select>
                         </div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Category'} 2</label>
                     <div class="col-sm-8">
                         <div id="cattd2">
                             {if $var_biz.catid2==0}
                                 NA
                             {else}
                                 {$var_biz.catname2} / {$var_biz.subcatname2}
                             {/if}
                             &nbsp; &nbsp;<a href="javascript:void(0);" onclick="$('#cattd2').hide();$('#catchange2').show();">{l t='Change'}</a>
                         </div>
                         <div id="catchange2" style="display:none">
                             <select class="form-control" id="dhtmlgoodies_country2" name="dhtmlgoodies_country2" onChange="getCat(this,'dhtmlgoodies_city2')">
                                 <option value="{$var_biz.catid2}">=={$var_biz.catname2}==</option>
                                 <option value="0">==Delete to be NA==</option>
                                 {$var_cat}
                             </select>&nbsp;&nbsp;
                             <select class="form-control" id="dhtmlgoodies_city2" name="dhtmlgoodies_city2">
                                 <option value="{$var_biz.subcatid2}">=={$var_biz.subcatname2}==</option>
                             </select>
                         </div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Category'} 3</label>
                     <div class="col-sm-8">
                         <div id="cattd3">
                             {if $var_biz.catid3==0}
                                 NA
                             {else}
                                 {$var_biz.catname3} / {$var_biz.subcatname3}
                             {/if}
                             &nbsp; &nbsp;<a href="javascript:void(0);" onclick="$('#cattd3').hide();$('#catchange3').show();">{l t='Change'}</a>
                         </div>
                         <div id="catchange3" style=" display:none">
                             <select class="form-control" id="dhtmlgoodies_country3" name="dhtmlgoodies_country3" onChange="getCat(this,'dhtmlgoodies_city3')">
                                 <option value="{$var_biz.catid3}">=={$var_biz.catname3}==</option>
                                 <option value="0">==Delete to be NA==</option>
                                 {$var_cat}
                             </select>&nbsp;&nbsp;
                             <select class="form-control" id="dhtmlgoodies_city3" name="dhtmlgoodies_city3">
                                 <option value="{$var_biz.subcatid3}">=={$var_biz.subcatname3}==</option>
                             </select>
                         </div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item" id="location_address1" {if !$location_required}style="display:none;"{/if}>
                     <label class="col-sm-3 control-label">{l t='Address'} 1</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="add1" value="{$var_biz.add1}"/>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item" id="location_address2" {if !$location_required}style="display:none;"{/if}>
                     <label class="col-sm-3 control-label">{l t='Address'} 2</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="add2" value="{$var_biz.add2}" />
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item" id="location_city" {if !$location_required}style="display:none;"{/if}>
                     <label class="col-sm-3 text-right">{l t='State'} / {l t='City'}</label>
                     <div class="col-sm-8">
                         <div id="locationtd">
                             {if $var_biz.c_name} {$var_biz.c_name} / {/if} {if $var_biz.province && $var_biz.c_name != $var_biz.province}{$var_biz.province} / {/if} {$var_biz.city} &nbsp; &nbsp;<a href="javascript:void(0);" onclick="$('#locationtd').hide();$('#locationchange').show();">{l t='Change'}</a>
                         </div>
                         <div id="locationchange" style=" display:none">

                             <select class="form-control" id="country" name="country" onChange="getCountry2(this,'state')">
                                 <option value="{$var_biz.c_id}">=={$var_biz.c_name}==</option>
                                 {$var_country}
                             </select>&nbsp;&nbsp;
                             <select class="form-control" id="state" name="state" onChange="getState2(this,'biz_city')">
                                 <option value="{$var_biz.provinceid}">=={$var_biz.province}==</option>
                             </select>&nbsp;&nbsp;
                             <select class="form-control" name="biz_city" id="biz_city">
                                 <option value="{$var_biz.cityid}">=={$var_biz.city}==</option>
                             </select>
                         </div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item" id="location_zip" {if !$location_required}style="display:none;"{/if}>
                     <label class="col-sm-3 control-label">{l t='Zip Code'}</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="zip" value="{$var_biz.zip}" />
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 control-label">{l t='Phone'}</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="phone" value="{$var_biz.phone}"/>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 control-label">{l t='Website'}</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="web" value="{$var_biz.web}" />
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 control-label">{l t='Video URL'}</label>
                     <div class="col-sm-8">
                         <input class="form-control" type="text" name="video" value="{$var_biz.video_url}" />
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item" id="hours"  {if !$has_hours}style="display:none;"{/if}>
                     <label class="col-sm-3 control-label">{l t='Business Hours'}</label>
                     <div class="col-sm-8">
                         <input type="hidden" name="openhours" id="openhours" value="{$var_biz.openhours}" />
                         <div>
                             <label class="radio-inline">
                                 <input type="radio" {if $var_biz.regular_hours!='1' && $var_biz.custom_hours!='1' }checked="checked"{/if} name="openhoursradio" onchange="$('.hourstables').hide();$('#openhours').val('0')" /> {l t='NA'}
                             </label>
                             <label class="radio-inline"><input type="radio" name="openhoursradio" {if $var_biz.regular_hours=='1'}checked="checked"{/if} onchange="$('.hourstables').hide();$('#regularhourstable').show();$('#openhours').val('1')" /> {l t='Regular hours'}</label>
                             <label class="radio-inline"><input type="radio" name="openhoursradio" {if $var_biz.custom_hours=='1' }checked="checked"{/if} onchange="$('.hourstables').hide();$('#customhourstable').show();$('#openhours').val('2')" /> {l t='Custom hours'}</label>
                         </div>
                         <div class="hourstables" onclick="table"  id="regularhourstable" style="{if $var_biz.regular_hours!='1'}display:none{/if}">
                             <br/>
                             <div class="row">
                                 <div class=" col-sm-4 col-xs-5">
                                     <input class="form-control" type="text" id="fromhour" name="fromhour" value="{$var_biz.from_hour}">
                                 </div>
                                 <div class="col-sm-1 col-xs-1 clear-padding text-center">-</div>
                                 <div class="col-sm-4 col-xs-5">
                                     <input class="form-control" type="text" id="tohour" name="tohour" value="{$var_biz.to_hour}">
                                 </div>
                             </div>
                             <div class="clearfix"></div>
                             <br/>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week1" value="1" {if $var_biz.week1}checked="checked"{/if}>
                                 {l t='Monday'}
                             </label>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week2" value="2" {if $var_biz.week2}checked="checked"{/if}>
                                 {l t='Tuesday'}
                             </label>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week3" value="3" {if $var_biz.week3}checked="checked"{/if}>
                                 {l t='Wednesday'}
                             </label>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week4" value="4" {if $var_biz.week4}checked="checked"{/if}>
                                 {l t='Thursday'}
                             </label>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week5" value="5" {if $var_biz.week5}checked="checked"{/if}>
                                 {l t='Friday'}
                             </label>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week6" value="6" {if $var_biz.week6}checked="checked"{/if} />
                                 {l t='Saturday'}
                             </label>
                             <label class="checkbox-inline">
                                 <input type="checkbox" name="week7" value="7" {if $var_biz.week7}checked="checked"{/if} />
                                 {l t='Sunday'}
                             </label>
                         </div>
                         <div class="hourstables" id="customhourstable" style="{if $var_biz.custom_hours!='1'}display:none{/if}">
                             <br/>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk1" value="1" {if $var_biz.wk1}checked="checked"{/if} tabindex="16" />
                                         {l t='Monday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour1" name="fromhour1" value="{if $var_biz.from_hour1}{$var_biz.from_hour1}{else}8:00 AM{/if}" tabindex="13" />
                                 </div>
                                 <div class="col-sm-1 col-xs-1 clear-padding text-center">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour1" name="tohour1" value="{if $var_biz.to_hour1}{$var_biz.to_hour1}{else}6:00 PM{/if}" tabindex="14" />
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk2" value="2" {if $var_biz.wk2}checked="checked"{/if} tabindex="17" />
                                         {l t='Tuesday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour2" name="fromhour2" value="{if $var_biz.from_hour2}{$var_biz.from_hour2}{else}8:00 AM{/if}" tabindex="13" />
                                 </div>
                                 <div class="col-sm-1 col-xs-1 clear-padding text-center">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour2" name="tohour2" value="{if $var_biz.to_hour2}{$var_biz.to_hour2}{else}6:00 PM{/if}" tabindex="14" />
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk3" value="3" {if $var_biz.wk3}checked="checked"{/if} tabindex="18">
                                         {l t='Wednesday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour3" name="fromhour3" value="{if $var_biz.from_hour3}{$var_biz.from_hour3}{else}8:00 AM{/if}" tabindex="13" />
                                 </div>
                                 <div class="col-sm-1 col-xs-1 clear-padding text-center">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour3" name="tohour3" value="{if $var_biz.to_hour3}{$var_biz.to_hour3}{else}6:00 PM{/if}" tabindex="14" />
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk4" value="4"  {if $var_biz.wk4}checked="checked"{/if} tabindex="19" />
                                         {l t='Thursday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour4" name="fromhour4" value="{if $var_biz.from_hour4}{$var_biz.from_hour4}{else}8:00 AM{/if}" tabindex="13" />
                                 </div>
                                 <div class="col-sm-1 col-xs-1 clear-padding text-center">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour4" name="tohour4" value="{if $var_biz.to_hour4}{$var_biz.to_hour4}{else}6:00 PM{/if}" tabindex="14" />
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk5" value="5" {if $var_biz.wk5}checked="checked"{/if} tabindex="20" />
                                         {l t='Friday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour5" name="fromhour5" value="{if $var_biz.from_hour5}{$var_biz.from_hour5}{else}8:00 AM{/if}" tabindex="13" />
                                 </div>
                                 <div class="col-sm-1 col-xs-1 clear-padding text-center">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour5" name="tohour5" value="{if $var_biz.to_hour5}{$var_biz.to_hour5}{else}6:00 PM{/if}" tabindex="14" />
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk6" value="6" {if $var_biz.wk6}checked="checked"{/if} tabindex="21" />
                                         {l t='Saturday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour6" name="fromhour6" value="{if $var_biz.from_hour6}{$var_biz.from_hour6}{else}8:00 AM{/if}" tabindex="13"/>
                                 </div>
                                 <div class="col-sm-1 col-xs-1 text-center clear-padding">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour6" name="tohour6" value="{if $var_biz.to_hour6}{$var_biz.to_hour6}{else}6:00 PM{/if}" tabindex="14"/>
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                             <div class="form-group">
                                 <div class="checkbox col-sm-3 col-xs-3">
                                     <label>
                                         <input type="checkbox" name="wk7" value="7" {if $var_biz.wk7}checked="checked"{/if} tabindex="22"/>
                                         {l t='Sunday'}
                                     </label>
                                 </div>
                                 <div class=" col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="fromhour7" name="fromhour7" value="{if $var_biz.from_hour7}{$var_biz.from_hour7}{else}8:00 AM{/if}" tabindex="13" />
                                 </div>
                                 <div class="col-sm-1 col-xs-1 text-center clear-padding">-</div>
                                 <div class="col-sm-4 col-xs-4">
                                     <input class="form-control" type="text" id="tohour7" name="tohour7" value="{if $var_biz.to_hour7}{$var_biz.to_hour7}{else}6:00 PM{/if}" tabindex="14" />
                                 </div>
                                 <div class="clearfix"></div>
                             </div>
                         </div>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item" id="price_range" {if !$price_range} style="display:none;"{/if}>
                     <label class="col-sm-3 control-label">{l t='Price Range'}</label>
                     <div class="col-sm-8">
                         <label class="radio-inline"><input type="radio" name="pricerange" value="0" {if $var_biz.price_range==0}checked="checked"{/if}/>{l t='NA'}</label>
                         <label class="radio-inline"><input type="radio" name="pricerange" value="1" {if $var_biz.price_range==1}checked="checked"{/if}/>{l t='$'}</label>
                         <label class="radio-inline"><input type="radio" name="pricerange" value="2" {if $var_biz.price_range==2}checked="checked"{/if}/>{l t='$$'}</label>
                         <label class="radio-inline"><input type="radio" name="pricerange" value="3" {if $var_biz.price_range==3}checked="checked"{/if}/>{l t='$$$'}</label>
                         <label class="radio-inline"><input type="radio" name="pricerange" value="4" {if $var_biz.price_range==4}checked="checked"{/if}/>{l t='$$$$'}</label>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 {if $var_cat_has_items}
                     <li class="list-group-item">
                         <label class="col-sm-3 control-label">{l t='Additional Info'}</label>
                         <div class="col-sm-8">

                             <!--loop-->
                             {assign var=k value=1}
                             {foreach from=$var_bitems item=i}

                                 {if (($k+1)%2==0)}
                                     <p><b>{l t=$i.title}</b>:
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
                                     <p><b>{l t=$i.title}</b>:
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


                             <a href="business_category_item_set.php?id={$var_biz.id}" onclick="if(confirm('You are going to Additional Info Editing Page without saving changes.\n\rSure to continue and abort changes?')==0) return false ;">{l t='Edit'}</a>
                         </div>
                         <div class="clearfix"></div>
                     </li>
                 {/if}
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Description'}</label>
                     <div class="col-sm-8">
                         <textarea class="form-control" name="description" rows="5">{$var_biz.description}</textarea>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Business Cover Image'}</label>
                     <div class="col-sm-8">
                         <img class="img-responsive" src="/images/business/{$var_biz.picurl}_100x100"/>
                         <a href="business_cover.php?id={$var_biz.id}" onclick="if(confirm('You are going to Business Images Management Page without saving changes.\n\rSure to continue and abort changes?')==0) return false ;">{l t='Change Cover Image / Manage Images'}</a>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <label class="col-sm-3 text-right">{l t='Map Position'}</label>
                     <div class="col-sm-8">
                         <a href="../func/map.php?sheet=business&where=business_id&equal={$var_biz.id}" onclick="if(confirm('You are going to Map Position Editing Page without saving changes.\n\rSure to continue and abort changes?')==0) return false ;">{l t='Adjust Map Position'}</a>
                     </div>
                     <div class="clearfix"></div>
                 </li>
                 <li class="list-group-item">
                     <div class="col-sm-offset-3 col-sm-8">
                         <input class="btn btn-primary" type="button" value="  {l t='Submit Changes'}  " onclick="this.disabled=true; form.submit()" />
                     </div>
                     <div class="clearfix"></div>
                 </li>
             </ul>
         </form>
     {/if}
     <!-- End .content .detail -->
 </div>



 <!--Main End-->
 </div>
 <script>
 $('#fromhour').ptTimeSelect();
 $('#tohour').ptTimeSelect();
 </script>
 </body>
 </html>