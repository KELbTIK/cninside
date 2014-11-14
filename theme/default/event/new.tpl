{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/ajax.js"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/login.js"></script>
{literal}
<style type="text/css">
<!--
#main .content { padding:5px; margin:0 10px;}
#main .content .left {float:left; width:77%; }
#main .content .right { float:left; width:20%; margin-left:10px;}
#main .content .con{  padding-top:10px; padding-bottom:10px;; border-bottom:#ccc 1px solid;}
#main .content .con ul.cat{list-style:none; padding:0; margin:0; margin-left:5px; margin-right:5px;}
#main .content .con ul.cat li {float:left; width:260px; height:20px;}
td{ border-bottom:1px #ccc dashed;}
td p{padding:3px; margin:0;}

/* Auto complete */
#relatedbiz_div ul li:hover {
background:none repeat scroll 0 0 #C6DCEE;
}
#relatedbiz_div {
background:none repeat scroll 0 0 #fff;
border:1px solid #C9E1F3;
display:none;
float:left;
position:absolute;
width:304px;
z-index:111;
opacity:0.97;
}

#relatedbiz_div ul {
float:left;
margin:0;
padding:0;
width:100%;
}
#relatedbiz_div ul li {
color:#666666;
float:left;
height:18px;
overflow:hidden;
padding-left:5%;
width:95%;
cursor:default;
display:block;
line-height:18px;
}
#relatedbiz_div p{
margin:4px 0;
padding-left:5px;
font-weight:bold;
}


-->
</style>
<script type="text/javascript" language="javascript">
function myKeyDown()
{
var    k=window.event.keyCode;   

if ((k==46)||(k==8)||(k==9)||(k==189)||(k==109)||(k==190)||(k==110)|| (k>=48 && k<=57)||(k>=96 && k<=105)||(k>=37 && k<=40)) 
{}
else if(k==13){
window.event.keyCode = 9;}
else{
window.event.returnValue = false;}
}
function changebox(a){
var d=document.postform;
if(a.checked)
{
d.priceFrom.value='';
d.priceFrom.disabled=true;
d.priceTo.value='';
d.priceTo.disabled=true;
}
else
{
d.priceFrom.disabled=false;
d.priceTo.disabled=false;
}
}
</script>
<script>
function veri()
{
if(!document.postform.event_name.value)
{
alert('Please input event name');
return false;	
}
document.postform.btn.disabled=true;
return true;
}
function showendtime()
{
var a=confirm('Add an End Time for this event?');
if(a!=0)
{
var d=document;
d.getElementById('eth').style.display='none';
d.getElementById('ets1').style.display='';
d.getElementById('ets2').style.display='';
d.getElementById('ets3').style.display='';
}
}
</script>
<script type="text/javascript">	

var geocoder;
var map;

var markersArray = [];

  function initialize(mapy,mapx,zoom,markery,markerx) {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(mapy, mapx);
    var myOptions = {
      zoom: zoom,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  }
</script>

<script>

function addAddressToMap(address) {
    //var address = document.getElementById("address").value;
    var address = address;
    geocoder.geocode( { 'address': address}, function(results, status) {
    
    deleteOverlays();
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        map.setZoom(15);
        var marker = new google.maps.Marker({
            map: map, 
            position: results[0].geometry.location
        });
        
        markersArray.push(marker);
        showOverlays();
        
        var mylatlng = String(marker.getPosition());
        mylatlng = mylatlng.replace("(","");
        mylatlng = mylatlng.replace(")","");
        var mylatlng_array = mylatlng.split(",");

        var maplatlng = String(map.getCenter());
        maplatlng = maplatlng.replace("(","");
        maplatlng = maplatlng.replace(")","");
        var maplatlng_array = maplatlng.split(",");

        $('#x').val(mylatlng_array[1]);
        $('#y').val(mylatlng_array[0]);
        $('#mapx').val(maplatlng_array[1]);
        $('#mapy').val(maplatlng_array[0]);
        $('#zoom').val(map.getZoom());

      } else {
        // alert("Geocode was not successful for the following reason: " + status);
      }
      

    });
    

  }


// Shows any overlays currently in the array
function showOverlays() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(map);
    }
  }
}

// Deletes all markers in the array by removing references to them
function deleteOverlays() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }
}


function updateQuery()
{
	var full_add;
	full_add='';
	if($('#chk_where').attr('checked')) full_add+=$('#where').val()+', ';
	if($('#chk_city').attr('checked')) full_add+=document.getElementById('location').options[document.getElementById('location').selectedIndex].text;
	$('#search_add').val(full_add);
	showLocation();
}

function showLocation()
{
      var address = $('#search_add').val();
     addAddressToMap(address);
}

function findLocation(address) {
      var address = $('#search_add').val();
      showLocation();
    }


</script>
{/literal}
<script>
var t_CannotGeo="{l t='Sorry, we were unable to geocode that address'}";
</script>

{literal}
<script> $(document).ready(function() {


	{/literal}

{if $smarty.const._GOOGLE_MAP_ENABLED_}
	initialize({$smarty.const._MAP_Y_},{$smarty.const._MAP_X_},{$smarty.const._MAP_ZOOM_},{$smarty.const._MARKER_Y_},{$smarty.const._MARKER_X_})
{/if}
	{literal}

	//Initial city query
	if($('#location').val())
	{
		$('#label_city').show();
		$('#keyword_city').text(document.getElementById('location').options[document.getElementById('location').selectedIndex].text);
		$('#chk_city').attr('checked', 'checked'); 
		updateQuery();
	}
  });
  			
  
</script>



{/literal}

<!--Main Start-->  

<div id="main">

<div class="content">
<div class="left">
<div class="con box" style=" padding:5px; ">
<h2>{l t='Add Event'}</h2>

<form action="?f=submit" method="post" name="postform" onSubmit="return veri()" id="postform" enctype="multipart/form-data">
<table width="96%" border="0" align="center" >
<tr>
<td width="21%" height="37"><div align="right"><strong>{l t='Event Name'} </strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><label>
<input name="event_name" type="text" style="width:400px;font-family:Verdana; font-size:12px; " id="event_name" />
</label></td>
</tr>
<tr>
	<td rowspan="2"><div align="right"><strong>{l t='When'}</strong></div></td>
	<td width="1%" height="36">&nbsp;</td>
	<td width="15%" rowspan="2" align="right"><h5 id="eth"><a href="javascript:;" onClick="showendtime()"><span style="color:#F30; text-decoration:underline">{l t='Add End Time'} &raquo;</span></a></h5><div id="ets1" style="display:none"><p>{l t='From'}:</p><p>{l t='To'}:</p></div></td>
	<td width="33%" rowspan="2">
		<select name="monthF">{$var_add.monthoption}</select>
		<select name="dayF">{$var_add.dayoption}</select>
		<select name="yearF"> {$var_add.yearoption} </select><br>
		<div id="ets2" style="display:none"><select name="monthT">{$var_add.monthoption}</select>
		<select name="dayT">{$var_add.dayoption}</select>
		<select name="yearT">{$var_add.yearoption}</select></div>
	</td>
	<td width="33%" rowspan="2">
		<select id="hourF" name="hourF">{$var_add.houroption}</select>
		<select id="minuteF" name="minuteF">
		<option value="00" selected="selected">00</option>
		<option value="05">05</option>
		<option value="15">15</option>
		<option value="20">20</option>
		<option value="25">25</option>
		<option value="30">30</option>
		<option value="35">35</option>
		<option value="40">40</option>
		<option value="45">45</option>
		<option value="50">50</option>
		<option value="55">55</option>
		</select>
		<select id="ampmF" name="ampmF">
		{$var_add.ampmoption}
		</select><br>
		<div id="ets3" style="display:none"><select id="hourT" name="hourT">
		{$var_add.houroption}
		</select>
		<select id="minuteT" name="minuteT">
		<option value="00" selected="selected">00</option>
		<option value="05">05</option>
		<option value="15">15</option>
		<option value="20">20</option>
		<option value="25">25</option>
		<option value="30">30</option>
		<option value="35">35</option>
		<option value="40">40</option>
		<option value="45">45</option>
		<option value="50">50</option>
		<option value="55">55</option>
		</select>
		<select id="ampmT" name="ampmT">
		{$var_add.ampmoption}
		</select></div>
	</td>
	<td rowspan="2"><!-- <label><input type="checkbox" />{l t='Repeat'}...</label> --></td>
</tr>
<tr>
<td width="1%" height="27">&nbsp;</td>
</tr>
<!-- 
<tr bgcolor="#ffffdd">
<td height="72"><div align="right"><strong>{l t='Where'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><textarea name="where" id="where" style="width:350px; height:40px;"></textarea>
<em>{l t='(Address & Venue)'}</em>
</td>
</tr>
 -->
<tr id="related_tr" style="visibility:collapse">
<td height="72"><div align="right"><strong>{l t='Related Business'}</strong><br /><em>({l t='Optional'})</em></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><input type="text" value="{l t='Type to choose a business'}" autocomplete="off"  style="width:300px; color:#999" id="relatedbiz" />
<div id="relatedbiz_div" class="relatedbiz_div"></div>
<input type="hidden" name="related_biz_id" id="related_biz_id" /><br><em id='related_status'>{l t='It automatically get the event location by typing related business'}.</em>
</td>
</tr>

<tr>
<td height="72"><div align="right"><strong>{l t='Where'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><textarea name="where" id="where" style="width:350px; height:40px;" onblur="if(this.value) $('#label_where').show();$('#keyword_where').text(this.value);$('#chk_where').attr('checked', 'checked'); updateQuery()"></textarea>
<em>{l t='(Address & Venue)'}</em>
</td>
</tr>
<tr>
<td height="98"><div align="right"><strong>{l t='How'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td align="right" style="font-family:Arial, Helvetica, sans-serif;"><p>{l t='Event Site URL'}:</p>
<p>{l t='Tickets URL'}:</p>
<p>{l t='Price'}:</p></td>
<td colspan="3" style="font-family:Arial, Helvetica, sans-serif;"><input name="site_url" type="text" id="site_url" style="width:300px;" value="http://"/>
<br />
<input name="ticket_url" type="text" id="ticket_url" style="width:300px;" value="http://"/>
<br />
{l t='$'}
<input type="text" name="priceFrom" id="textfield3" onKeyDown="myKeyDown()" style="width:100px;"/> 
{l t='to '} 
<input type="text" name="priceTo" id="textfield4" onKeyDown="myKeyDown()" style="width:100px;"/> 
{l t='or'} 
<label><input type="checkbox" name="free" id="free"  onclick="changebox(this)" />
{l t='Free'}</label></td>
</tr>
<tr>
<td><div align="right"><strong>{l t='Category'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4" valign="top">
<ul class="cat">
{$var_add.catli}
</ul></td>
</tr>
<tr>
<td height="50"><div align="right"><strong>{l t='Photo'}</strong></div></td>
<td>&nbsp;</td>
<td colspan="4"><input type="file" name="file" id="file" />
{l t='(Type: JPEG GIF)'}</td>
</tr>
<tr>
<td height="50"><div align="right"><strong>{l t='City'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4">

                 <select id="country" name="country" onChange="getCountry_event(this,'state');" tabindex="4">
                  <option value="">{l t='Select Country'}</option>
                        {$var_country}
                </select> - 
                 <select id="state" name="state" onChange="getCat(this,'location'); $('#label_state').show(); $('#keyword_state').text(this.options[this.selectedIndex].text); updateQuery()" tabindex="4">
                  <option value="">{l t='Select State'}</option>
                
                </select> - <select name="location" id="location" onchange="if(this.value) $('#label_city').show();$('#keyword_city').text(document.getElementById('location').options[document.getElementById('location').selectedIndex].text);$('#chk_city').attr('checked', 'checked'); updateQuery()"  tabindex="5">
                  <option value="">{l t='Select City'}</option>
                </select>
</td>
</tr>
<tr>
<td height="200"><div align="right"><strong>{l t='What/Why'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><label>
<textarea name="whatwhy" style="width:90%; height:180px; font-family:Verdana; font-size:12px; border:1px #ccc solid;" id="whatwhy"></textarea>
</label></td>
</tr>
 {if $smarty.const._GOOGLE_MAP_ENABLED_}
<tr> <td height="200"><div align="right"><strong>{l t='Map'}</strong></div></td>
<td width="1%">&nbsp;</td>
<td colspan="4"><div id="map_canvas" style="width: 220px; height: 260px; overflow:hidden; border:1px #ccc solid"><center>{l t='Please wait'}...</center></div>
<br />
                                 <span id="address">{l t='Try to convert address to map via clicking the button below.'}</span>
                                 <br />
                                 <br />
                                 {l t='Check the keywords to search first:'}<br />
                                 
                                 <div  id="label_where" style=" display:none"><label><input id="chk_where" type="checkbox" onclick="updateQuery()" /> <em>{l t='Address'}:</em> <span id="keyword_where"></span></label></div>
                                 <div  id="label_city" style=" display:none"><label><input id="chk_city" type="checkbox"  onclick="updateQuery()"/> <em>{l t='City'}:</em> <span id="keyword_city"></span></label></div>
                                 
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
<input type="hidden" name="mapy" id="mapy" />
</td></tr>
{/if}
<tr>
<td height="60">&nbsp;</td>
<td width="1%">&nbsp;</td>
<td colspan="4" align="center">
<input type="submit" name="btn" id="btn" value="   {l t='Submit'} &gt;&gt;   " />                                </td>
</tr>
</table>
</form>
</div>
</div>

<div class="right" >
<div class="con box" style="text-align:center; width:200px;">

<p align="center">
{$ads->getAdCode(5)}
</p>

</div> 
</div>
</div>
</div>
<!--Main End-->
{literal}
<script type="text/javascript">



	$('#related_tr').css('visibility','visible');										    	   
	$("#relatedbiz").keyup(function (){
		$.ajax({
		   type: "POST",
		   url: "/inc/func/search.ajax.php",
		   data: "type=biz&biz="+$(this).val(),
		   success: function(msg){
		     $("#relatedbiz_div").html(msg);
		     $("#relatedbiz_div").show();
		   }
		});
	});	
	
	$('#relatedbiz').click(function (){
		$("#relatedbiz").val('');
		$('#relatedbiz').css('color','#000')
		$("#relatedbiz").keyup();
	});
	
	$("#relatedbiz").blur(function (){
		setTimeout("$('#relatedbiz_div').hide();", 300);
	});
	

  function fillBiz(business_id,business_name,permalink)
  {
  	//fill biz
  	$('#relatedbiz').val(business_name);
  	$('#related_biz_id').val(business_id);
  	//fill location
  	$.post("/inc/api/biz/getOne.php?biz_id="+business_id+"&r="+Math.random(), {}, function(data){
  		$('#where').val(data.business_add1+" "+data.business_add2);
  		$('#site_url').val(data.business_web);
  		document.getElementById('location').value = data.city_id;  

  		$('#label_where').show();
  		$('#keyword_where').text($('#where').val());
  		$('#chk_where').attr('checked', 'checked');
  		$('#keyword_city').text(document.getElementById('location').options[document.getElementById('location').selectedIndex].text);
  		$('#chk_city').attr('checked', 'checked'); 
  		updateQuery();
  	},"json");
  }
</script>
{/literal}

{if $smarty.const._GOOGLE_MAP_ENABLED_}
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
{/if}

 {include file="footer.tpl"}