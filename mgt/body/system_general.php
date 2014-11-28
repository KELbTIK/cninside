<?php
@session_start();
if(!$_SESSION["admin"])
{
@header("Location: ../login.php");
exit;
}

include_once(dirname(__FILE__)."/../../inc/func/get_sth_admin.php");

?>
<TABLE cellSpacing=1 cellPadding=4 width="100%"  border=0>
  <TBODY>
  <TR class="td_title">
    <TD  colSpan=3>Basic Settings</TD></TR>
  <TR bgColor=#ffffff>
    <TD width="21%" align="center" class="td_th">Website Title</TD>
    <TD colspan="2"><input type="text" id="name" style=" width:400px" value="<?=get_sitename()?>" /></TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Homepage Title (Tagline)</TD>
    <TD colspan="2"><input type="text" id="homepagetitle" style=" width:400px" value="<?=get_homepage_title()?>" /></TD>
  </TR>
  <TR bgColor=#ffffff>
  	<TD align="center" class="td_th">Site Logo</TD>
  	<TD colspan="2">
  		<div id="currentlogo">
  			<img src="<?=_LOGO_URL_?>" /> [ <a href="javascript:void(0)" onclick="$('#uploadlogo').show(); $('#currentlogo').hide()">Change</a> ]
  		</div>
  		<div id="uploadlogo" style="display:none">
  			Filename: /images/<input id="_LOGO_URL_" value="<?=_LOGO_URL_ORIGINAL_?>" style=" width:100px" /> <a href="/mgt/new_photo.php?url=_LOGO_URL_&folder=images&max_width=310&max_height=76" class="fancybox fancybox.iframe" id="uploadbtn">[ Upload ]</a>
        		<span id="uploaded" style="display:none; color:green"> Image uploaded, please click "Apply Settings" on the bottom</span>
  			<br /><em>Leave blank to restore default. Max-width: 310px, Max-height: 76px</em>
  		</div>
  		</TD>
  </TR>
  <tr bgcolor=#fff style="height:30px">
  <td align="center" class="td_th">
  Search Type
  </td>
  <td colspan="2">
  	<label><input type="checkbox" id="_MULTI_SEARCH_ENABLE_" <?=_MULTI_SEARCH_ENABLE_==1?"checked=\"checked\"":""?> onclick="multi_search_onchange()" /> Enable Multi-table search feature.</label><br /><em>If checked, search includes business titles, business descriptions, category names, subcategory names, category keywords, and business reviews. If unchecked, search includes business title and business description.</em>
  </td>
  </tr>
  <TR bgColor=#ffffff  style=" height:30px;">
    <TD align="center" class="td_th">Date Format</TD>
    <TD colspan="2">
            <label style="margin-right:30px; display:inline-block;"><input type="radio" name="df" onchange="$('#dateformat').val('F j, Y')" <?php if(_DATE_FORMAT_=='F j, Y') echo 'checked="checked"';?> /> <?=date("F j, Y")?></label>
            <label style="margin-right:30px; display:inline-block;"><input type="radio" name="df" onchange="$('#dateformat').val('Y/m/d')" <?php if(_DATE_FORMAT_=='Y/m/d') echo 'checked="checked"';?> /> <?=date("Y/m/d")?></label>
            <label style="margin-right:30px; display:inline-block;"><input type="radio" name="df" onchange="$('#dateformat').val('d/m/Y')" <?php if(_DATE_FORMAT_=='d/m/Y') echo 'checked="checked"';?>/> <?=date("d/m/Y")?></label>
            <label style=" display:inline-block;">
            <input type="radio" name="df" <?php if(_DATE_FORMAT_!='F j, Y' && _DATE_FORMAT_!= 'Y/m/d' && _DATE_FORMAT_!='d/m/Y') echo 'checked="checked"';?> /> Custom: <input type="text" name="dateformat" id="dateformat" style="width:60px; font-family:Verdana, Geneva, sans-serif" value="<?=_DATE_FORMAT_?>" /></label>
</TD>
  </TR>
   <TR bgColor=#ffffff  style=" height:30px;">
    <TD align="center" class="td_th">Short Date Format</TD>
    <TD colspan="2">
            <label style="margin-right:30px; display:inline-block;"><input type="radio" name="sdf" onchange="$('#shortdateformat').val('F j')" <?php if(_SHORTDATE_FORMAT_=='F j') echo 'checked="checked"';?> /> <?=date("F j")?></label>
            <label style="margin-right:30px; display:inline-block;"><input type="radio" name="sdf" onchange="$('#shortdateformat').val('m/d')" <?php if(_SHORTDATE_FORMAT_=='m/d') echo 'checked="checked"';?> /> <?=date("m/d")?></label>
            <label style="margin-right:30px; display:inline-block;"><input type="radio" name="sdf" onchange="$('#shortdateformat').val('d/m')" <?php if(_SHORTDATE_FORMAT_=='d/m') echo 'checked="checked"';?>/> <?=date("d/m")?></label>
            <label style=" display:inline-block;">
            <input type="radio" name="sdf" <?php if(_SHORTDATE_FORMAT_!='F j' && _SHORTDATE_FORMAT_!= 'm/d' && _SHORTDATE_FORMAT_!='d/m') echo 'checked="checked"';?> /> Custom: <input type="text" name="shortdateformat" id="shortdateformat" style="width:60px; font-family:Verdana, Geneva, sans-serif" value="<?=_SHORTDATE_FORMAT_?>" /></label>
</TD>
  </TR>
  <TR bgColor=#ffffff  style=" height:30px;">
    <TD align="center" class="td_th">Time Format</TD>
    <TD colspan="2">
            <label style="margin-right:25px; display:inline-block;"><input type="radio" name="tf" onchange="$('#timeformat').val('g:i a')" <?php if(_TIME_FORMAT_=='g:i a') echo 'checked="checked"';?> /> <?=date("g:i a")?></label>
            <label style="margin-right:25px; display:inline-block;"><input type="radio" name="tf" onchange="$('#timeformat').val('g:i A')" <?php if(_TIME_FORMAT_=='g:i A') echo 'checked="checked"';?> /> <?=date("g:i A")?></label>
            <label style="margin-right:25px; display:inline-block;"><input type="radio" name="tf" onchange="$('#timeformat').val('H:i')" <?php if(_TIME_FORMAT_=='H:i') echo 'checked="checked"';?>/> <?=date("H:i")?></label>
            <label style="margin-right:10px; display:inline-block;">
            <input type="radio" name="tf" <?php if(_TIME_FORMAT_!='g:i A' && _TIME_FORMAT_!= 'g:i a' && _TIME_FORMAT_!='H:i') echo 'checked="checked"';?> /> Custom: <input type="text" name="timeformat" id="timeformat" style="width:60px; font-family:Verdana, Geneva, sans-serif" value="<?=_TIME_FORMAT_?>" /></label>
  			<a href="http://php.net/manual/en/function.date.php" target="_blank">Format Documentation</a></TD>
  </TR>
  <TR bgColor=#ffffff  style=" height:30px;">
    <TD align="center" class="td_th">Time Zone</TD>
    <TD colspan="2"><select id="timezone" name="timezone">
  <?php
$timezone_list=array();
$timezone_list['Africa']=array("Africa/Abidjan","Africa/Accra","Africa/Addis_Ababa","Africa/Algiers","Africa/Asmara","Africa/Asmera","Africa/Bamako","Africa/Bangui","Africa/Banjul","Africa/Bissau","Africa/Blantyre","Africa/Brazzaville","Africa/Bujumbura","Africa/Cairo","Africa/Casablanca","Africa/Ceuta","Africa/Conakry","Africa/Dakar","Africa/Dar_es_Salaam","Africa/Djibouti","Africa/Douala","Africa/El_Aaiun","Africa/Freetown","Africa/Gaborone","Africa/Harare","Africa/Johannesburg","Africa/Kampala","Africa/Khartoum","Africa/Kigali","Africa/Kinshasa","Africa/Lagos","Africa/Libreville","Africa/Lome","Africa/Luanda","Africa/Lubumbashi","Africa/Lusaka","Africa/Malabo","Africa/Maputo","Africa/Maseru","Africa/Mbabane","Africa/Mogadishu","Africa/Monrovia","Africa/Nairobi","Africa/Ndjamena","Africa/Niamey","Africa/Nouakchott","Africa/Ouagadougou","Africa/Porto-Novo","Africa/Sao_Tome","Africa/Timbuktu","Africa/Tripoli","Africa/Tunis","Africa/Windhoek");

$timezone_list['America']=array("America/Adak","America/Anchorage","America/Anguilla","America/Antigua","America/Araguaina","America/Argentina/Buenos_Aires","America/Argentina/Catamarca","America/Argentina/ComodRivadavia","America/Argentina/Cordoba","America/Argentina/Jujuy","America/Argentina/La_Rioja","America/Argentina/Mendoza","America/Argentina/Rio_Gallegos","America/Argentina/Salta","America/Argentina/San_Juan","America/Argentina/San_Luis","America/Argentina/Tucuman","America/Argentina/Ushuaia","America/Aruba","America/Asuncion","America/Atikokan","America/Atka","America/Bahia","America/Barbados","America/Belem","America/Belize","America/Blanc-Sablon","America/Boa_Vista","America/Bogota","America/Boise","America/Buenos_Aires","America/Cambridge_Bay","America/Campo_Grande","America/Cancun","America/Caracas","America/Catamarca","America/Cayenne","America/Cayman","America/Chicago","America/Chihuahua","America/Coral_Harbour","America/Cordoba","America/Costa_Rica","America/Cuiaba","America/Curacao","America/Danmarkshavn","America/Dawson","America/Dawson_Creek","America/Denver","America/Detroit","America/Dominica","America/Edmonton","America/Eirunepe","America/El_Salvador","America/Ensenada","America/Fortaleza","America/Fort_Wayne","America/Glace_Bay","America/Godthab","America/Goose_Bay","America/Grand_Turk","America/Grenada","America/Guadeloupe","America/Guatemala","America/Guayaquil","America/Guyana","America/Halifax","America/Havana","America/Hermosillo","America/Indiana/Indianapolis","America/Indiana/Knox","America/Indiana/Marengo","America/Indiana/Petersburg","America/Indiana/Tell_City","America/Indiana/Vevay","America/Indiana/Vincennes","America/Indiana/Winamac","America/Indianapolis","America/Inuvik","America/Iqaluit","America/Jamaica","America/Jujuy","America/Juneau","America/Kentucky/Louisville","America/Kentucky/Monticello","America/Knox_IN","America/La_Paz","America/Lima","America/Los_Angeles","America/Louisville","America/Maceio","America/Managua","America/Manaus","America/Marigot","America/Martinique","America/Mazatlan","America/Mendoza","America/Menominee","America/Merida","America/Mexico_City","America/Miquelon","America/Moncton","America/Monterrey","America/Montevideo","America/Montreal","America/Montserrat","America/Nassau","America/New_York","America/Nipigon","America/Nome","America/Noronha","America/North_Dakota/Center","America/North_Dakota/New_Salem","America/Panama","America/Pangnirtung","America/Paramaribo","America/Phoenix","America/Port-au-Prince","America/Porto_Acre","America/Port_of_Spain","America/Porto_Velho","America/Puerto_Rico","America/Rainy_River","America/Rankin_Inlet","America/Recife","America/Regina","America/Resolute","America/Rio_Branco","America/Rosario","America/Santarem","America/Santiago","America/Santo_Domingo","America/Sao_Paulo","America/Scoresbysund","America/Shiprock","America/St_Barthelemy","America/St_Johns","America/St_Kitts","America/St_Lucia","America/St_Thomas","America/St_Vincent","America/Swift_Current","America/Tegucigalpa","America/Thule","America/Thunder_Bay","America/Tijuana","America/Toronto","America/Tortola","America/Vancouver","America/Virgin","America/Whitehorse","America/Winnipeg","America/Yakutat","America/Yellowknife");

$timezone_list['Antarctica']=array("Antarctica/Casey","Antarctica/Davis","Antarctica/DumontDUrville","Antarctica/Mawson","Antarctica/McMurdo","Antarctica/Palmer","Antarctica/Rothera","Antarctica/South_Pole","Antarctica/Syowa","Antarctica/Vostok");

$timezone_list['Asia']=array("Asia/Aden","Asia/Almaty","Asia/Amman","Asia/Anadyr","Asia/Aqtau","Asia/Aqtobe","Asia/Ashgabat","Asia/Ashkhabad","Asia/Baghdad","Asia/Bahrain","Asia/Baku","Asia/Bangkok","Asia/Beirut","Asia/Bishkek","Asia/Brunei","Asia/Calcutta","Asia/Choibalsan","Asia/Chongqing","Asia/Chungking","Asia/Colombo","Asia/Dacca","Asia/Damascus","Asia/Dhaka","Asia/Dili","Asia/Dubai","Asia/Dushanbe","Asia/Gaza","Asia/Harbin","Asia/Ho_Chi_Minh","Asia/Hong_Kong","Asia/Hovd","Asia/Irkutsk","Asia/Istanbul","Asia/Jakarta","Asia/Jayapura","Asia/Jerusalem","Asia/Kabul","Asia/Kamchatka","Asia/Karachi","Asia/Kashgar","Asia/Kathmandu","Asia/Katmandu","Asia/Kolkata","Asia/Krasnoyarsk","Asia/Kuala_Lumpur","Asia/Kuching","Asia/Kuwait","Asia/Macao","Asia/Macau","Asia/Magadan","Asia/Makassar","Asia/Manila","Asia/Muscat","Asia/Nicosia","Asia/Novosibirsk","Asia/Omsk","Asia/Oral","Asia/Phnom_Penh","Asia/Pontianak","Asia/Pyongyang","Asia/Qatar","Asia/Qyzylorda","Asia/Rangoon","Asia/Riyadh","Asia/Saigon","Asia/Sakhalin","Asia/Samarkand","Asia/Seoul","Asia/Shanghai","Asia/Singapore","Asia/Taipei","Asia/Tashkent","Asia/Tbilisi","Asia/Tehran","Asia/Tel_Aviv","Asia/Thimbu","Asia/Thimphu","Asia/Tokyo","Asia/Ujung_Pandang","Asia/Ulaanbaatar","Asia/Ulan_Bator","Asia/Urumqi","Asia/Vientiane","Asia/Vladivostok","Asia/Yakutsk","Asia/Yekaterinburg","Asia/Yerevan");

$timezone_list['Arctic']=array("Arctic/Longyearbyen");

$timezone_list['Atlantic']=array("Atlantic/Azores","Atlantic/Bermuda","Atlantic/Canary","Atlantic/Cape_Verde","Atlantic/Faeroe","Atlantic/Faroe","Atlantic/Jan_Mayen","Atlantic/Madeira","Atlantic/Reykjavik","Atlantic/South_Georgia","Atlantic/Stanley","Atlantic/St_Helena");

$timezone_list['Australia']=array("Australia/ACT","Australia/Adelaide","Australia/Brisbane","Australia/Broken_Hill","Australia/Canberra","Australia/Currie","Australia/Darwin","Australia/Eucla","Australia/Hobart","Australia/LHI","Australia/Lindeman","Australia/Lord_Howe","Australia/Melbourne","Australia/North","Australia/NSW","Australia/Perth","Australia/Queensland","Australia/South","Australia/Sydney","Australia/Tasmania","Australia/Victoria","Australia/West","Australia/Yancowinna");


$timezone_list['Europe']=array("Europe/Amsterdam","Europe/Andorra","Europe/Athens","Europe/Belfast","Europe/Belgrade","Europe/Berlin","Europe/Bratislava","Europe/Brussels","Europe/Bucharest","Europe/Budapest","Europe/Chisinau","Europe/Copenhagen","Europe/Dublin","Europe/Gibraltar","Europe/Guernsey","Europe/Helsinki","Europe/Isle_of_Man","Europe/Istanbul","Europe/Jersey","Europe/Kaliningrad","Europe/Kiev","Europe/Lisbon","Europe/Ljubljana","Europe/London","Europe/Luxembourg","Europe/Madrid","Europe/Malta","Europe/Mariehamn","Europe/Minsk","Europe/Monaco","Europe/Moscow","Europe/Nicosia","Europe/Oslo","Europe/Paris","Europe/Podgorica","Europe/Prague","Europe/Riga","Europe/Rome","Europe/Samara","Europe/San_Marino","Europe/Sarajevo","Europe/Simferopol","Europe/Skopje","Europe/Sofia","Europe/Stockholm","Europe/Tallinn","Europe/Tirane","Europe/Tiraspol","Europe/Uzhgorod","Europe/Vaduz","Europe/Vatican","Europe/Vienna","Europe/Vilnius","Europe/Volgograd","Europe/Warsaw","Europe/Zagreb","Europe/Zaporozhye","Europe/Zurich");

$timezone_list['Indian']=array("Indian/Antananarivo","Indian/Chagos","Indian/Christmas","Indian/Cocos","Indian/Comoro","Indian/Kerguelen","Indian/Mahe","Indian/Maldives","Indian/Mauritius","Indian/Mayotte","Indian/Reunion");

$timezone_list['Pacific']=array("Pacific/Apia","Pacific/Auckland","Pacific/Chatham","Pacific/Easter","Pacific/Efate","Pacific/Enderbury","Pacific/Fakaofo","Pacific/Fiji","Pacific/Funafuti","Pacific/Galapagos","Pacific/Gambier","Pacific/Guadalcanal","Pacific/Guam","Pacific/Honolulu","Pacific/Johnston","Pacific/Kiritimati","Pacific/Kosrae","Pacific/Kwajalein","Pacific/Majuro","Pacific/Marquesas","Pacific/Midway","Pacific/Nauru","Pacific/Niue","Pacific/Norfolk","Pacific/Noumea","Pacific/Pago_Pago","Pacific/Palau","Pacific/Pitcairn","Pacific/Ponape","Pacific/Port_Moresby","Pacific/Rarotonga","Pacific/Saipan","Pacific/Samoa","Pacific/Tahiti","Pacific/Tarawa","Pacific/Tongatapu","Pacific/Truk","Pacific/Wake","Pacific/Wallis","Pacific/Yap");

$timezone_list['Etc']=array("Etc/GMT+12","Etc/GMT+11","Etc/GMT+10","Etc/GMT+9","Etc/GMT+8","Etc/GMT+7","Etc/GMT+6","Etc/GMT+5","Etc/GMT+4","Etc/GMT+3","Etc/GMT+2","Etc/GMT+1","Etc/UTC","Etc/GMT-1","Etc/GMT-2","Etc/GMT-3","Etc/GMT-4","Etc/GMT-5","Etc/GMT-6","Etc/GMT-7","Etc/GMT-8","Etc/GMT-9","Etc/GMT-10","Etc/GMT-11","Etc/GMT-12","Etc/GMT-13","Etc/GMT-14");

foreach ($timezone_list as $key => $value)
{
	echo "<optgroup label='$key'>\n";
	foreach($value as $key => $value)
	{
		    $selected="";
		    if(date_default_timezone_get()==$value || (date_default_timezone_get()=='UTC'&&$value=='Etc/UTC')) $selected=" selected='selected'";
		    echo "<option value='$value'$selected>$value</option>\n";
	}
	echo "</optgroup>\n";
}
?>
  </select><span id="currenttimezone"> Current Time Zone: <span style="color:#C00"><?=date_default_timezone_get()?></span> [ <a href="javascript:void(0)" onclick="$('#timezone').show(); $('#currenttimezone').hide()">Change</a> ].</span></TD>
  </TR>
  <TR bgColor=#ffffff  style=" height:30px;">
    <TD align="center" class="td_th">Time Preview</TD>
    <TD colspan="2"> <?=date(_DATE_FORMAT_)?>&nbsp; &nbsp; &nbsp; <?=date(_TIME_FORMAT_)?></TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Business CAPTCHA Needed</TD>
    <TD width="52%"><label><input type="checkbox" id="captchabizenable" <?=_CAPTCHA_BIZ_ENABLE_==1?"checked=\"checked\"":""?> />
Enable Word Verification when submitting new business.</label></TD>
    <TD width="27%" rowspan="2"><a href="#" onclick="sele_item(this,'body/system_captcha.php'); return false;" class="ctlbtn">CAPTCHA Style Settings &raquo;</a></TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Register CAPTCHA Needed</TD>
    <TD><label><input type="checkbox" id="captcharegenable" <?=_CAPTCHA_REG_ENABLE_==1?"checked=\"checked\"":""?> />
      Enable Word Verification when user signing up.</label></TD>
    </TR>

  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Business Approval Needed</TD>
    <TD colspan="2"><label><input type="checkbox" id="newbizapprovalneed" <?=_NEW_BIZ_APPROVAL_NEED_==1?"checked=\"checked\"":""?> />
    Yes, new businesses need to be approved by admin before which can be shown.</label></TD>
  </TR>

  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Review Approval Needed</TD>
    <TD colspan="2"><label><input type="checkbox" id="newbizreviewapprovalneed" <?=_NEW_BIZ_REVIEW_APPROVAL_NEED_==1?"checked=\"checked\"":""?> />
    Yes, new business reviews need to be approved by admin before which can be shown.</label></TD>
  </TR>

  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Events Approval Needed</TD>
    <TD colspan="2"><label><input type="checkbox" id="neweventapprovalneed" <?=_NEW_EVENT_APPROVAL_NEED_==1?"checked=\"checked\"":""?> />
    Yes, new events need to be approved by admin before which can be shown.</label></TD>
  </TR>

  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Weather Widgets</TD>
    <TD colspan="2"><label><input type="checkbox" id="_WEATHER_WIDGET_ENABLED_" <?=_WEATHER_WIDGET_ENABLED_==1?"checked=\"checked\"":""?> />
    Enable Weather Widget in business detail page when business has zipcode.</label></TD>
  </TR>

    <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Google Analytics</TD>
    <TD colspan="2">
    <table width="100%" cellSpacing="0" border="0" style=" background:#fff">
        	<tr>
            	<td colspan="2" ><label><input type="checkbox" id="trackerenabled" <?=_TRACKER_GOOGLE_ANALYTICS_UA_?"checked=\"checked\"":""?> onclick="if(this.checked==true){ $('#tracker_googleanalyticsua').removeAttr('disabled');$('#tracker_googleanalyticsua').focus();}else{ $('#tracker_googleanalyticsua').attr('disabled','disabled');$('#tracker_googleanalyticsua').val('');}"/>
Enable Google Analytics script in footer.</label></td>
            </tr>
        	<tr>
        	  <td width="7%">&nbsp;</td>
        	  <td width="93%">Google Analytics UA:
        	    <input type="text" id="tracker_googleanalyticsua" value="<?=_TRACKER_GOOGLE_ANALYTICS_UA_?>" <?php if(!_TRACKER_GOOGLE_ANALYTICS_UA_){?>disabled="disabled"<?php }?> /> <em>e.g.  UA-8521236-1</em></td>
   	      </tr>
      </table></TD>
  </TR>
  <TR class="td_title">
    <TD  colSpan=3>Developer Settings</TD></TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Debug Mode (Advanced)</TD>
    <TD colspan="2"><label><input type="checkbox" id="debug" <?=_DEBUG_==1?"checked=\"checked\"":""?> />
Enable debug mode. Show Smarty debug window and PHP errors.</label></TD>
  </TR>
  <TR class="td_title">
    <TD  colSpan=3>SEO Settings</TD></TR>


  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Parent Folders</TD>
    <TD colspan="2">
    <?php
    if(!is_writeable(_ABSPATH_."/.htaccess")):
	?>
    Disabled. <em>Please make the file /.htaccess writeable to enable.</em><input type="hidden" id="_BIZ_DIR_" value="<?=_BIZ_DIR_?>" />
    <input type="hidden" id="_CAT_DIR_" value="<?=_CAT_DIR_?>" />
	<?php
	elseif(!fopen(_ABSPATH_."/.htaccess","r")):
	?>
	Disabled. <em>Please enable function <strong>allow_url_fopen()</strong> to enable.</em><input type="hidden" id="_BIZ_DIR_" value="<?=_BIZ_DIR_?>" />
    <input type="hidden" id="_CAT_DIR_" value="<?=_CAT_DIR_?>" />
	<?php
    else:
	?>
   Business: http://<?=_DOMAIN_?>/ <input type="text" id="_BIZ_DIR_" style=" width:100px" value="<?=_BIZ_DIR_?>" />
   /business-permalink/<br />
   Category: http://<?=_DOMAIN_?>/ <input type="text" id="_CAT_DIR_" style=" width:100px" value="<?=_CAT_DIR_?>" /> /catname/<br />
<em>Note:  Please do not use a system folder as business parent folder. The system folders are: <strong>ad, biz, comm, compile, contact, event, images, inc, invite, languages, mgt, my, theme.</strong></em>

<?php
endif;
?>
</TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" width="21%" class="td_th">Business Permalink<input type="hidden" id="bizpermalink" value="<?=_BIZ_PERMALINK_?>" /></TD>
    <TD colspan="2">
    	<table width="100%" cellSpacing="0" border="0" style=" background:#fff">
        	<tr>
            	<td colspan="2"><label><input name="bizpermalink" type="radio" onclick="$('#bizpermalink').val('1')" <?php if(_BIZ_PERMALINK_=='1'){?>checked="checked"<?php }?>/>Business permalink</label></td>
            </tr>
            <tr>
              <td width="5%">&nbsp;</td>
              <td width="95%"><span style="background:#ddd; font-size:10px;">http://<?=_DOMAIN_?>/<?=_BIZ_DIR_?>/<span style="color:#C00">business-permalink</span></span></td>
            </tr>
            <tr>
            	<td colspan="2"><label><input name="bizpermalink" type="radio" onclick="$('#bizpermalink').val('2')" <?php if(_BIZ_PERMALINK_=='2'){?>checked="checked"<?php }?>/>Category and business permalink</label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><span style="background:#ddd; font-size:10px;">http://<?=_DOMAIN_?>/<?=_BIZ_DIR_?>/<span style="color:#C00">catname/business-permalink</span></span></td>
            </tr>
            <tr>
            	<td colspan="2"><label><input name="bizpermalink" type="radio"  onclick="$('#bizpermalink').val('3')" <?php if(_BIZ_PERMALINK_=='3'){?>checked="checked"<?php }?>/>
            	Subcategory and business permalink</label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><span style="background:#ddd; font-size:10px;">http://<?=_DOMAIN_?>/<?=_BIZ_DIR_?>/<span style="color:#C00">subcatname/business-permalink</span></span></td>
            </tr>
            <tr>
            	<td colspan="2"><label><input name="bizpermalink" type="radio"  onclick="$('#bizpermalink').val('4')" <?php if(_BIZ_PERMALINK_=='4'){?>checked="checked"<?php }?>/>
            	Category, subcategory and business permalink</label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><span style="background:#ddd; font-size:10px;">http://<?=_DOMAIN_?>/<?=_BIZ_DIR_?>/<span style="color:#C00">catname/subcatname/business-permalink</span></span></td>
            </tr>
            <tr>
            	<td colspan="2"><label><input name="bizpermalink" type="radio"  onclick="$('#bizpermalink').val('5')" <?php if(_BIZ_PERMALINK_=='5'){?>checked="checked"<?php }?>/>
            	City, category, subcategory and business permalink</label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><span style="background:#ddd; font-size:10px;">http://<?=_DOMAIN_?>/<?=_BIZ_DIR_?>/<span style="color:#C00">cityname/catname/subcatname/business-permalink</span></span></td>
            </tr>
        </table>
    </TD>
  </TR>

    <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Page Title</TD>
    <TD colspan="2"><input type="text" id="page_title_cat" style=" width:550px" value="<?=_PAGE_TITLE_CAT_?>" /></TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Description</TD>
    <TD colspan="2"><input type="text" id="description" style=" width:550px" value="<?=_DESCRIPTION_?>" /></TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Keywords</TD>
    <TD colspan="2"><input type="text" id="keywords" style=" width:550px" value="<?=_KEYWORDS_?>" /></TD>
  </TR>
  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">Variables</TD>
    <TD colspan="2">
    <table width="100%" cellSpacing="0" border="0" style=" background:#fff">
        	<tr>
            	<td width="40%" align="center" style="color:#090; font-weight:bold">%BIZNAME% </td>
                <td>Business Name</td>
            </tr>
        	<tr>
        	  <td align="center" style="color:#090; font-weight:bold">%BIZDESC%</td>
        	  <td> Owner's Description for Business</td>
   	      </tr>
          <tr>
        	  <td align="center" style="color:#090; font-weight:bold">%CATEGORY%</td>
        	  <td> Business Category Name</td>
   	      </tr>
          <tr>
        	  <td align="center" style="color:#090; font-weight:bold">%SUBCATEGORY%</td>
        	  <td>Business Subcategory Name</td>
   	      </tr>
          <tr>
        	  <td align="center" style="color:#090; font-weight:bold">%CITY%</td>
        	  <td>Business City</td>
   	      </tr>
          <tr>
        	  <td align="center" style="color:#090; font-weight:bold">%ZIP%</td>
        	  <td>Business Zip Code</td>
   	      </tr>
          <tr>
        	  <td align="center" style="color:#090; font-weight:bold">%PHONE%</td>
        	  <td> Business Phone Number</td>
   	      </tr>
           <tr>
        	  <td colspan="2" align="center"><em>Variables will place in description and keywords meta tags only when it is available.</em></td>
       	  </tr>
            </table></TD>
    </TR>

  <TR bgColor=#ffffff>
    <TD align="center" class="td_th">&nbsp;</TD>
    <TD colspan="2"><input value=" Apply Settings " type="button" onclick="this.disabled=true; this.value='Saving Changes...'; save_basic()"  id="savebutton" /></TD>
  </TR>

</TBODY></TABLE></TD></TR></TABLE>
