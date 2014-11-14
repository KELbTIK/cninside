// Basic Settings
function save_basic()
{
var name=$('#name').val();
var homepagetitle=$('#homepagetitle').val();
var timezone=$('#timezone').val();
var _BIZ_DIR_=$('#_BIZ_DIR_').val();
var _CAT_DIR_=$('#_CAT_DIR_').val();
var _LOGO_URL_=$('#_LOGO_URL_').val();
var _MULTI_SEARCH_ENABLE_=$('#_MULTI_SEARCH_ENABLE_').attr('checked');
var _WEATHER_WIDGET_ENABLED_=$('#_WEATHER_WIDGET_ENABLED_').attr('checked');
var captchabizenable=$('#captchabizenable').attr('checked');
var captcharegenable=$('#captcharegenable').attr('checked');
var newbizapprovalneed=$('#newbizapprovalneed').attr('checked');
var newbizreviewapprovalneed=$('#newbizreviewapprovalneed').attr('checked');
var neweventapprovalneed=$('#neweventapprovalneed').attr('checked');
var bizpermalink=$('#bizpermalink').val();
var page_title_cat=$('#page_title_cat').val(); 
var description=$('#description').val();
var keywords=$('#keywords').val();
var tracker_googleanalyticsua=$('#tracker_googleanalyticsua').val();
var debug=$('#debug').attr('checked');
var dateformat=$('#dateformat').val();
var shortdateformat=$('#shortdateformat').val();
var timeformat=$('#timeformat').val();

if( _BIZ_DIR_=='ad' || _BIZ_DIR_=='comm' || _BIZ_DIR_=='compile' || _BIZ_DIR_=='contact' || _BIZ_DIR_=='event' || _BIZ_DIR_=='images' || _BIZ_DIR_=='inc' || _BIZ_DIR_=='invite' || _BIZ_DIR_=='languages' ||  _BIZ_DIR_=='mgt' || _BIZ_DIR_=='my' || _BIZ_DIR_=='theme'  )
{
	alert('Please do not use a system folder as business parent folder.');	
	$('#savebutton').attr('disabled',false);
	return false;
}

if( _CAT_DIR_=='ad' || _CAT_DIR_=='comm' || _CAT_DIR_=='compile' || _CAT_DIR_=='contact' || _CAT_DIR_=='event' || _CAT_DIR_=='images' || _CAT_DIR_=='inc' || _CAT_DIR_=='invite' || _CAT_DIR_=='languages' ||  _CAT_DIR_=='mgt' || _CAT_DIR_=='my' || _CAT_DIR_=='theme'  )
{
	alert('Please do not use a system folder as category parent folder.');	
	$('#savebutton').attr('disabled',false);
	return false;
}

$.post("/mgt/body/system_general_submit.php?"+Math.random(), {
name:name,
homepagetitle:homepagetitle,
timezone:timezone,
_BIZ_DIR_:_BIZ_DIR_,
_CAT_DIR_:_CAT_DIR_,
_LOGO_URL_:_LOGO_URL_,
_MULTI_SEARCH_ENABLE_:_MULTI_SEARCH_ENABLE_,
_WEATHER_WIDGET_ENABLED_:_WEATHER_WIDGET_ENABLED_,
captchabizenable:captchabizenable,
captcharegenable:captcharegenable,
newbizapprovalneed:newbizapprovalneed,
newbizreviewapprovalneed:newbizreviewapprovalneed,
neweventapprovalneed:neweventapprovalneed,
bizpermalink:bizpermalink,
page_title_cat:page_title_cat,
description:description,
keywords:keywords,
tracker_googleanalyticsua:tracker_googleanalyticsua,
debug:debug,
dateformat:dateformat,
shortdateformat:shortdateformat,
timeformat:timeformat
},function(data){tips('Basic Settings Saved.');nav()});
//setTimeout("nav()",5000)
}

// theme Settings
function save_theme()
{
//var theme=$('#theme').val();
var theme = $('input[name=theme]:checked').val()
//var theme=document.getElementsByName('theme').val();
$.post("/mgt/body/system_theme_submit.php?"+Math.random(), {
theme:theme
},function(data){tips('Settings Saved.');nav()});

}

// menu   links

function add_link()
{
var title=$('#title').val();
var link_url=$('#link_url').val();
var sort=$('#sort').val(); 
var active=$('#active').val();


if(title=='')
{
    alert("Please input the title for this link");
    return false;
}

if(link_url=='')
{
    alert("Please input the url for this link");
    return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'links',
field:'title,url,sort,active',
value:title+','+link_url+','+sort+','+active
},function(data){tips('Link Added');nav()});

}

function add_sublink()
{
var sub_parent=$('#sub_parent').val();
var title=$('#sub_title').val();
var link_url=$('#sub_link_url').val();
var sort=$('#sub_sort').val(); 
var active=$('#sub_active').val();


if(title=='')
{
    alert("Please input the title for this link");
    return false;
}

if(link_url=='')
{
    alert("Please input the url for this link");
    return false;
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'links_sub',
field:'title,url,sort,active,main_link_id',
value:title+','+link_url+','+sort+','+active+','+sub_parent
},function(data){tips('Link Added');nav()});

}

function add_social()
{
var s_url=$('#s_url').val();
var social_image=$('#social_image').val();

if(s_url=='')
{
    alert("Please input url");
    return false;
}

if(social_image=='')
{
    var a=confirm("You have not uploaded the icon.\n\rClick OK to use a Meeplace default ICON\n\ror Cancel to upload an ICON");
if(a==0) return ;
else social_image='mp_16.png';
}

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'social',
field:'url,image',
value:s_url+','+social_image
},function(data){tips('New social link added.');nav()});
}


//CAPTCHA preview

function captcha_preview()
{
document.getElementById('siimage').src ='/inc/captcha/securimage_preview.php?'+(('width='+$('#width').val()+'&height='+$('#height').val()+'&perturbation='+$('#perturbation').val()+'&bgcolor='+$('#bgcolor').val()+'&textcolor1='+$('#textcolor1').val()+'&textcolor2='+$('#textcolor2').val()+'&textcolor3='+$('#textcolor3').val()+'&texttransparency='+$('#texttransparency').val()+'&linenum='+$('#linenum').val()+'&linecolor='+$('#linecolor').val()+'&signature='+$('#signature').val()+'&signaturecolor='+$('#signaturecolor').val()+'&wordlist='+$('#wordlist').attr('checked')+'&bgimage='+$('#bgimage').val()+'&'+Math.random()).replace(/#/g,"!^!")).replace(/\//g,"^!^");
}


//CAPTCHA save setting
function save_captcha()
{
var width=$('#width').val();
var height=$('#height').val();
var perturbation=$('#perturbation').val();
var bgcolor=$('#bgcolor').val();
var textcolor1=$('#textcolor1').val();
var textcolor2=$('#textcolor2').val();
var textcolor3=$('#textcolor3').val();
var texttransparency=$('#texttransparency').val();
var linenum=$('#linenum').val();
var linecolor=$('#linecolor').val();
var signature=$('#signature').val();
var signaturecolor=$('#signaturecolor').val();
var bgimage=$('#bgimage').val();
var wordlist=$('#wordlist').attr('checked');


$.post("/mgt/body/system_captcha_submit.php?"+Math.random(), {
width:width,
height:height,
perturbation:perturbation,
bgcolor:bgcolor,
textcolor1:textcolor1,
textcolor2:textcolor2,
textcolor3:textcolor3,
texttransparency:texttransparency,
linenum:linenum,
linecolor:linecolor,
signature:signature,
signaturecolor:signaturecolor,
bgimage:bgimage,
wordlist:wordlist
},function(data){tips('CAPTCHA Settings Saved.');sele_item(this,'body/system_general.php');});
//setTimeout("nav()",5000)
}


// FB Settings
function save_fb()
{
var _FB_ENABLE_=$('#_FB_ENABLE_').attr('checked');
var _FB_APIKEY_=$('#_FB_APIKEY_').val();
var _FB_SECRET_=$('#_FB_SECRET_').val();
var _FB_ID_=$('#_FB_ID_').val();

$.post("/mgt/body/system_fb_submit.php?"+Math.random(), {
_FB_ENABLE_:_FB_ENABLE_,
_FB_APIKEY_:_FB_APIKEY_,
_FB_ID_:_FB_ID_,
_FB_SECRET_:_FB_SECRET_
},function(data){tips('Facebook Settings Saved.');nav()});
//setTimeout("nav()",5000)
}

// Paypal Settings
function save_paypal()
{
var _PAYPAL_ENABLE_=$('#_PAYPAL_ENABLE_').attr('checked');
var _PAYPAL_TESTMODE_=$('#_PAYPAL_TESTMODE_').attr('checked'); 
var _PAYPAL_EMAIL_=$('#_PAYPAL_EMAIL_').val();

$.post("/mgt/body/system_paypal_submit.php?"+Math.random(), {
_PAYPAL_ENABLE_:_PAYPAL_ENABLE_,
_PAYPAL_TESTMODE_:_PAYPAL_TESTMODE_,
_PAYPAL_EMAIL_:_PAYPAL_EMAIL_
},function(data){tips('Paypal Settings Saved.');nav()});

}

// Add New Language
function save_newlanguage()
{
var new_lan =$('#new_lan').val();
var new_lan2 =$('#new_lan2').val();
$.post("/mgt/body/system_new_language_submit.php?"+Math.random(), {
new_lan:new_lan,
new_lan2:new_lan2
},function(data){tips('New Language File Added');nav()});

}

// StarBiz Settings
function save_starbiz_reminder()
{
var _STARBIZ_REMINDER_=$('#_STARBIZ_REMINDER_').val();

$.post("/mgt/body/system_starbiz_reminder_submit.php?"+Math.random(), {
_STARBIZ_REMINDER_:_STARBIZ_REMINDER_
},function(data){tips('Settings Saved.');nav()});

}

// Classified Expired Days Settings
function save_class_expired_days()
{
var _CLASS_EXPIRED_DAYS_=$('#_CLASS_EXPIRED_DAYS_').val();

$.post("/mgt/body/system_classified_submit.php?"+Math.random(), {
_CLASS_EXPIRED_DAYS_:_CLASS_EXPIRED_DAYS_
},function(data){tips('Settings Saved.');nav()});

}

// Language Settings
function save_language()
{
var _MULTILANGUAGE_ENABLE_=$('#_MULTILANGUAGE_ENABLE_').val();
var _MULTILANGUAGE_HIDE_MENU_=$('#_MULTILANGUAGE_HIDE_MENU_').attr('checked');
var _MULTILANGUAGE_DEFAULT_=$('#_MULTILANGUAGE_DEFAULT_').val();
var _MULTILANGUAGE_FIXED_=$('#_MULTILANGUAGE_FIXED_').val();


$.post("/mgt/body/system_language_submit.php?"+Math.random(), {
_MULTILANGUAGE_ENABLE_:_MULTILANGUAGE_ENABLE_,
_MULTILANGUAGE_HIDE_MENU_:_MULTILANGUAGE_HIDE_MENU_,
_MULTILANGUAGE_DEFAULT_:_MULTILANGUAGE_DEFAULT_,
_MULTILANGUAGE_FIXED_:_MULTILANGUAGE_FIXED_
},function(data){tips('Language Settings Saved.');nav()});
//setTimeout("nav()",5000)
}

function multi_search_onchange()
{
	var check_status=$('#_MULTI_SEARCH_ENABLE_').attr('checked');
	if(check_status==true)
	{	var a=confirm("Multi-table search feature is designed for small scale review site.\nMulti-table search will increase server workload if your site has tons of reviews or businesses.\nHowever, you can customize your meeplace with Sphinx server etc. to improve the speed.\n\nSure to enable multi-table search feature?");
		if(a==0)
		{
			$('#_MULTI_SEARCH_ENABLE_').removeAttr('checked');
		}
	}
}
