{include file="header.tpl"}
<script type="text/javascript" src="/theme/{$get_theme}/js/ajax.js"></script>
<script type="text/javascript" src="/theme/{$get_theme}/js/login.js"></script>
{literal}
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
d.getElementById('ets4').style.display='';
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

    <div class="content container">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Add Event'}</h3>
                    </div>
                    <div class="panel-body">
                        <form action="?f=submit" method="post" name="postform" onSubmit="return veri()" id="postform" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">{l t='Event Name'}</label>
                                <div class="col-sm-9">
                                    <input name="event_name" class="form-control" type="text" id="event_name" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">{l t='When'}</label>
                                <div class="col-sm-9">
                                        <h5 id="eth"><a href="javascript:;" onClick="showendtime()"><div class="form-group"><div class="container-fluid"><span class="btn btn-primary">{l t='Add End Time'} &raquo;</span></div></div></a></h5>
                                        <div id="ets1" style="display:none"><label class="control-label">{l t='From'}:</label></div>
                                        <div class="form-group">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select name="monthF" class="form-control">{$var_add.monthoption}</select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select name="dayF" class="form-control">{$var_add.dayoption}</select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select name="yearF" class="form-control"> {$var_add.yearoption} </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select id="hourF" name="hourF" class="form-control">{$var_add.houroption}</select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select id="minuteF" name="minuteF" class="form-control">
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
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select id="ampmF" name="ampmF" class="form-control">
                                                    {$var_add.ampmoption}
                                                </select>
                                            </div>
                                        </div>
                                        <div id="ets4" style="display:none">`<label class="control-lable">{l t='To'}:</label></div>
                                        <div id="ets2" style="display:none" class="form-group">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select name="monthT" class="form-control">{$var_add.monthoption}</select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select name="dayT" class="form-control">{$var_add.dayoption}</select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select name="yearT" class="form-control">{$var_add.yearoption}</select>
                                            </div>
                                        </div>
                                        <div id="ets3" style="display:none" class="form-group">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select id="hourT" name="hourT" class="form-control">
                                                    {$var_add.houroption}
                                                </select>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select id="minuteT" name="minuteT" class="form-control">
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
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                <select id="ampmT" name="ampmT" class="form-control">
                                                    {$var_add.ampmoption}
                                                </select>
                                            </div>



                                        </div>
                                </div>
                            </div>

                                <!--
                                <tr bgcolor="#ffffdd">
                                <td height="72"><div align="right"><strong>{l t='Where'}</strong></div></td>
                                <td width="1%">&nbsp;</td>
                                <td colspan="4"><textarea name="where" id="where" style="width:350px; height:40px;"></textarea>
                                <em>{l t='(Address & Venue)'}</em>
                                </td>
                                </tr>
                                -->
                            <div class="form-group" id="related_tr">
                                <label class="col-sm-3 control-label">{l t='Related Business'}<br /><em>({l t='Optional'})</em></label>
                                <div class="col-sm-9">
                                    <input type="text" value="{l t='Type to choose a business'}" autocomplete="off" class="form-control" id="relatedbiz" />
                                    <div id="relatedbiz_div" class="relatedbiz_div"></div>
                                    <input type="hidden" name="related_biz_id" id="related_biz_id" />
                                    <em id='related_status'>{l t='It automatically get the event location by typing related business'}.</em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">{l t='Where'}</label>
                                <div class="col-sm-9">
                                    <textarea name="where" id="where" class="form-control" rows="5" onblur="if(this.value) $('#label_where').show();$('#keyword_where').text(this.value);$('#chk_where').attr('checked', 'checked'); updateQuery()"></textarea>
                                    <em>{l t='(Address & Venue)'}</em>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">{l t='How'}</label>
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Event Site URL'}:</label>
                                        <div class="col-sm-8">
                                            <input name="site_url" type="text" id="site_url" class="form-control" value="http://"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Tickets URL'}:</label>
                                        <div class="col-sm-8">
                                            <input name="ticket_url" type="text" id="ticket_url" class="form-control" value="http://"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">{l t='Price'}:</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-sm-2 text-right hidden-xs"> <label class="control-label">{l t='$'}</label></div>
                                                <div class="col-sm-2 visible-xs"> <label class="control-label">{l t='$'}</label></div>
                                                <div class="col-sm-4">
                                                    <input type="text" name="priceFrom" id="textfield3" onKeyDown="myKeyDown()" class="form-control"/>
                                                </div>
                                                <div class="col-sm-2 text-center hidden-xs">
                                                    <label class="control-label">{l t='to '}</label>
                                                </div>
                                                <div class="col-sm-2 text-left visible-xs">
                                                    <label class="control-label">{l t='to '}</label>
                                                </div>
                                                <div class="col-sm-4">
                                                    <input type="text" name="priceTo" id="textfield4" onKeyDown="myKeyDown()" class="form-control"/>
                                                </div>
                                                <div class="col-sm-2  text-right hidden-xs">
                                                    <label class="control-label">{l t='or'}</label>
                                                </div>
                                                <div class="col-sm-2 visible-xs">
                                                    <label class="control-label">{l t='or'}</label>
                                                </div>
                                                <div class="col-sm-10">
                                                    <div class="checkbox notifications">
                                                        <label>
                                                            <input type="checkbox" name="free" id="free"  onclick="changebox(this)" /> {l t='Free'}
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 text-right">{l t='Category'}</label>
                                <div class="col-sm-9">
                                    <ul class="cat list-unstyled">
                                        {$var_add.catli}
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 text-right">{l t='Photo'}</label>
                                <div class="col-sm-9">
                                    <input type="file" name="file" id="file" />
                                    {l t='(Type: JPEG GIF)'}
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">{l t='City'}</label>
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <select id="country" class="form-control" name="country" onChange="getCountry_event(this,'state');" tabindex="4">
                                                <option value="">{l t='Select Country'}</option>
                                                {$var_country}
                                            </select>
                                        </div>
                                        <div class="form-group visible-xs"></div>
                                        <div class="col-sm-4">
                                            <select id="state" class="form-control" name="state" onChange="getCat(this,'location'); $('#label_state').show(); $('#keyword_state').text(this.options[this.selectedIndex].text); updateQuery()" tabindex="4">
                                                <option value="">{l t='Select State'}</option>
                                            </select>
                                        </div>
                                        <div class="form-group visible-xs"></div>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="location" id="location" onchange="if(this.value) $('#label_city').show();$('#keyword_city').text(document.getElementById('location').options[document.getElementById('location').selectedIndex].text);$('#chk_city').attr('checked', 'checked'); updateQuery()"  tabindex="5">
                                                <option value="">{l t='Select City'}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">{l t='What/Why'}</label>
                                <div class="col-sm-9">
                                    <textarea name="whatwhy" class="form-control" rows="5" id="whatwhy"></textarea>
                                </div>
                            </div>
                            {if $smarty.const._GOOGLE_MAP_ENABLED_}
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">{l t='Map'}</label>
                                    <div class="col-sm-9">
                                        <div id="map_canvas" style="height: 260px; overflow:hidden; border:1px #ccc solid"><p class="text-center">{l t='Please wait'}...</p></div>
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
                                        {l t='Or search a place:'} <input type="text" id="search_add" name="search_add" class="form-control" onKeyDown="if (event.keyCode==13) showLocation() " />
                                        <br />
                                        <input type="button" class="btn btn-primary" value="{l t='Convert Address to Map'}" onclick="showLocation()" />
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
                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-offset-3 col-sm-9 text-center">
                                    <input type="submit" name="btn" class="btn btn-primary" id="btn" value="   {l t='Submit'}  " />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-3 hidden-xs" >
                <div class="text-center">

                    <p align="center">
                        {$ads->getAdCode(5)}
                    </p>

                </div>
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