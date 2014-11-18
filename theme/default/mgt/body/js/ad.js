// AD Settings
function new_ad()
{
var ad_link_image=$('#ad_link_image').val();
var ad_link_url=$('#ad_link_url').val();
var ad_link_target=$('#ad_link_target').val();
var ad_html=$('#ad_html').val();

var ad_name=$('#ad_name').val();

var ad_date_start_month=$('#ad_date_start_month').val();
var ad_date_start_day=$('#ad_date_start_day').val();
var ad_date_start_year=$('#ad_date_start_year').val();
var ad_date_start_hour=$('#ad_date_start_hour').val();
var ad_date_start_minute=$('#ad_date_start_minute').val();
var ad_date_start_ampm=$('#ad_date_start_ampm').val();

var ad_date_end_month=$('#ad_date_end_month').val();
var ad_date_end_day=$('#ad_date_end_day').val();
var ad_date_end_year=$('#ad_date_end_year').val();
var ad_date_end_hour=$('#ad_date_end_hour').val();
var ad_date_end_minute=$('#ad_date_end_minute').val();
var ad_date_end_ampm=$('#ad_date_end_ampm').val();

var ad_total_views=$('#ad_total_views').val();
var ad_total_clicks=$('#ad_total_clicks').val();
var ad_position=$('#ad_position').val();
var ad_code;

if(ad_link_image=='' && ad_html=='')
{
	alert("Please upload banner media or input HTML");
	return false;
}
if(ad_html) ad_code=ad_html;
else ad_code='<a href='+ad_link_url+' target='+ad_link_target+'><img src=/images/ad/'+ad_link_image+' border=0></a>';

if(ad_name=='')
{
	alert("Please input campaign name");
	return false;
}

if(ad_total_views=='')
{
	ad_total_views='2147483647';
}
if(ad_total_clicks=='')
{
	ad_total_clicks='2147483647';
}



var ad_date_start=String(ad_date_start_year)+String(ad_date_start_month)+String(ad_date_start_day)+todecade(Number(ad_date_start_hour)+Number(ad_date_start_ampm))+String(ad_date_start_minute)+'00';

var ad_date_end=String(ad_date_end_year)+String(ad_date_end_month)+String(ad_date_end_day)+todecade(Number(ad_date_end_hour)+Number(ad_date_end_ampm))+String(ad_date_end_minute)+'00';

ad_name=ad_name.replace(/,/,"{{comma}}");
ad_code=ad_code.replace(/,/,"{{comma}}");

$.post("/mgt/func/add.php?"+Math.random(), {
sheet:'ad',
field:'ad_code,ad_name,ad_date_start,ad_date_end,ad_total_views,ad_total_clicks,ad_position',
value:ad_code+","+ad_name+","+ad_date_start+","+ad_date_end+","+ad_total_views+","+ad_total_clicks+","+ad_position
},function(data){tips('New campaign created.');nav()});
//setTimeout("nav()",5000)
}

function todecade(value)
{
	if(Number(value<10)) return '0'+String(value);
	else return String(value);
}

function ad_position_url(id)
{
	/*
	if(id==1) $('#positionurl').text('');
	if(id==2) $('#positionurl').text('my/login.php');
	if(id==3) $('#positionurl').html('my/   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   etc. (multi pages)');
	if(id==4) $('#positionurl').text('business/');
	if(id==5) $('#positionurl').text('business/search.php');
	if(id==6) $('#positionurl').text('business/detail.php?id=1');
	if(id==7) $('#positionurl').text('comm/?f=Chatter');
	if(id==8) $('#positionurl').text('event/');
	if(id==9) $('#positionurl').text('event/search.php');
	if(id==10) $('#positionurl').text('contact/');
	*/

	$('#smartycode').text(id);
}