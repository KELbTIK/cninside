//==================CATEGORY===============
var ajax = new Array();

function getCatloc(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = 'func/getcatloc.php?cat='+id;    
        ajax[index].onCompletion = function(){ createSubCat(sel,index,child) };    
        ajax[index].runAJAX();
    }
}
function getCatPrice(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = 'func/getcatprice.php?cat='+id;    
        ajax[index].onCompletion = function(){ createSubCat(sel,index,child) };    
        ajax[index].runAJAX();
    }
}

function getCatHours(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = 'func/getcathours.php?cat='+id;    
        ajax[index].onCompletion = function(){ createSubCat(sel,index,child) };    
        ajax[index].runAJAX();
    }
}

function createSubCat(sel,index,child)
{
    var obj = document.getElementById(child);
 
    eval(ajax[index].response);
    restore();check_cat_dup();

}

function getCat(sel,child)
{
	var countryCode = sel.options[sel.selectedIndex].value;
	var id=sel.value;
	document.getElementById(child).options.length = 0;
	if(countryCode.length>0){
		var index = ajax.length;
		ajax[index] = new sack();
		
		ajax[index].requestFile = 'func/getcat.php?cat='+id;	
		ajax[index].onCompletion = function(){ createCities(sel,index,child) };	
		ajax[index].runAJAX();
	}
	
}

function getState(sel,child)
{
	var countryCode = sel.options[sel.selectedIndex].value;
	var id=sel.value;
	document.getElementById(child).options.length = 0;
	if(countryCode.length>0){
		var index = ajax.length;
		ajax[index] = new sack();
		
		ajax[index].requestFile = 'func/getstate.php?state='+id;	
		ajax[index].onCompletion = function(){
				createCities(sel,index,child) 
				$('#label_city').show();
				$('#keyword_city').text(document.getElementById('biz_city').options[document.getElementById('biz_city').selectedIndex].text);
				$('#chk_city').attr('checked', 'checked'); 
				updateQuery()

				};	
		ajax[index].runAJAX();
	}
	
}

function getCountry(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        
        ajax[index].requestFile = 'func/getcountry.php?country='+id;    
        ajax[index].onCompletion = function(){
                createCities(sel,index,child) 
                //$('#label_city').show();
                //$('#keyword_city').text(document.getElementById('biz_city').options[document.getElementById('biz_city').selectedIndex].text);
               // $('#chk_city').attr('checked', 'checked'); 
               // updateQuery()

                };    
        ajax[index].runAJAX();
    }
    
}

function getNoState(sel,child)
{
    var countryCode = sel.options[sel.selectedIndex].value;
    var id=sel.value;
    document.getElementById(child).options.length = 0;
    if(countryCode.length>0){
        var index = ajax.length;
        ajax[index] = new sack();
        ajax[index].requestFile = '/my/func/getnostate.php?country='+id;    
        ajax[index].onCompletion = function(){ createCities3(sel,index,child) };
        $('#state').css('display','none');    
        ajax[index].runAJAX();
    }
}

function createCities(sel,index,child)
{
    var obj = document.getElementById(child);
 
    if(is_int(ajax[index].response)){
        $('#state').css('display','none');
       getNoState(sel,'biz_city');
    }else{
        $('#state').css('display','');
        eval(ajax[index].response);
        restore();check_cat_dup();
    }
}

function createCities3(sel,index,child)
{
    var obj = document.getElementById(child);

    eval(ajax[index].response);
    restore();check_cat_dup();
}

function is_int(value){
  if((parseFloat(value) == parseInt(value)) && !isNaN(value)){
      return true;
  } else {
      return false;
  }
}


//============VERIFY=================

function restore()
{
	for(i=1; i<=5; i++)
	$('#err'+i).hide();
	
		$('#biz_name').css('background-color','#fff');
		$('#biz_add1').css('background-color','#fff');
		$('#dhtmlgoodies_city').css('background-color','#fff');
		$('#dhtmlgoodies_city2').css('background-color','#fff');
		$('#dhtmlgoodies_city3').css('background-color','#fff');
}
function verify()
{
var e;
e=false;
if(!$('#biz_name').val())
	{
		$('#err1').show();
		$('#biz_name').css('background-color','#fdd');
		e=true;
	}
/*if(!$('#biz_add1').val())
	{
		$('#err2').show();
		$('#biz_add1').css('background-color','#fdd');
		e=true;
	}*/
if(!$('#dhtmlgoodies_city').val())
	{
		$('#err3').show();
		$('#dhtmlgoodies_city').css('background-color','#fdd');
		e=true;
	}
	
//don't allow same subcat
if(check_cat_dup()) e=true;
	
//don't allow cat without subcat
if($('#dhtmlgoodies_country').val() && !$('#dhtmlgoodies_city').val())
	{
		$('#err5').show();
		$('#dhtmlgoodies_city').css('background-color','#fdd');
		e=true;
	}
if($('#dhtmlgoodies_country2').val() && !$('#dhtmlgoodies_city2').val())
	{
		$('#err5').show();
		$('#dhtmlgoodies_city2').css('background-color','#fdd');
		e=true;
	}
if($('#dhtmlgoodies_country3').val() && !$('#dhtmlgoodies_city3').val())
	{
		$('#err5').show();
		$('#dhtmlgoodies_city3').css('background-color','#fdd');
		e=true;
	}

if (e)
{
$('#replyTitle').ScrollTo(600);
}
if (e==false)
	{
		document.frm.action="?f=submit";
		document.frm.button.disabled=true;
		document.frm.submit();
	}
}

////////////
function check_cat_dup()
{

	//don't allow same subcat
	if($('#dhtmlgoodies_city2').val() && $('#dhtmlgoodies_city2').val() == $('#dhtmlgoodies_city').val())
		{
			$('#err4').show();
			$('#dhtmlgoodies_city2').css('background-color','#fdd');
			return true;
		}
	if($('#dhtmlgoodies_city3').val() && ( $('#dhtmlgoodies_city3').val() == $('#dhtmlgoodies_city').val() || $('#dhtmlgoodies_city3').val() == $('#dhtmlgoodies_city2').val() ) )
		{
			$('#err4').show();
			$('#dhtmlgoodies_city3').css('background-color','#fdd');
			return true;
		}
	
	return false;
}


////////////////map


var map;
var geocoder;
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
    
    var markerlatlng = new google.maps.LatLng(markery, markerx);
    var marker = new google.maps.Marker({
    map: map,
    draggable : true, 
    position: markerlatlng
    });

    google.maps.event.addListener(marker, "dragstart", function()
    {  
    
      }
    );
    google.maps.event.addListener(marker, "dragend", function() {
        
            var mylatlng = String(marker.getPosition());
            mylatlng = mylatlng.replace("(","");
            mylatlng = mylatlng.replace(")","");
            var mylatlng_array = mylatlng.split(",");
            
              $('#x').val(mylatlng_array[1]);
              $('#y').val(mylatlng_array[0]);
              $('#zoom').val(map.getZoom());
              
              }
    );
    google.maps.event.addListener(map,"dragend", function() {
        
            alert(mylatlng);
            var maplatlng = String(map.getCenter());
            maplatlng = maplatlng.replace("(","");
            maplatlng = maplatlng.replace(")","");
            var maplatlng_array = maplatlng.split(",");
            

            $('#mapx').val(maplatlng_array[1]);
            $('#mapy').val(maplatlng_array[0]);
            $('#zoom').val(map.getZoom());
            });
  }

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
            draggable : true, 
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
        
        google.maps.event.addListener(marker, "dragstart", function()
    {  
    
      }
    );
    google.maps.event.addListener(marker, "dragend", function() {
        
            var mylatlng = String(marker.getPosition());
            mylatlng = mylatlng.replace("(","");
            mylatlng = mylatlng.replace(")","");
            var mylatlng_array = mylatlng.split(",");
            
              $('#x').val(mylatlng_array[1]);
              $('#y').val(mylatlng_array[0]);
              $('#zoom').val(map.getZoom());
              
              }
    );
    google.maps.event.addListener(map,"dragend", function() {
        
            alert(mylatlng);
            var maplatlng = String(map.getCenter());
            maplatlng = maplatlng.replace("(","");
            maplatlng = maplatlng.replace(")","");
            var maplatlng_array = maplatlng.split(",");

            $('#mapx').val(maplatlng_array[1]);
            $('#mapy').val(maplatlng_array[0]);
            $('#zoom').val(map.getZoom());
            });

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
  
 function initialize2(mapy,mapx,zoom,markery,markerx) {
	 
map = new GMap2(document.getElementById("map_canvas"));

var center = new GLatLng(mapy, mapx);
geocoder = new GClientGeocoder();  // GEO
map.setCenter(center, zoom);
//var marker = new GMarker(center, {draggable: true});
var mxy= new GLatLng(markery, markerx);
var marker = new GMarker(mxy, {draggable: true});


GEvent.addListener(marker, "dragstart", function()
{  map.closeInfoWindow();  }//
);
GEvent.addListener(marker, "dragend", function() {
          //var myHtml = marker.getPoint()+ "<br/>" + map.getZoom();	
          //marker.openInfoWindow(myHtml);
		  $('#x').val(marker.getPoint().x);
		  $('#y').val(marker.getPoint().y);
		  $('#mapx').val(map.getCenter().x);
		  $('#mapy').val(map.getCenter().y);
		  $('#zoom').val(map.getZoom());
		  }
);
map.addOverlay(marker);
        map.addControl(new GSmallMapControl());
        GEvent.addListener(map,"moveend", function(overlay,latlng) {
		  $('#x').val(marker.getPoint().x);
		  $('#y').val(marker.getPoint().y);
		  $('#mapx').val(map.getCenter().x);
		  $('#mapy').val(map.getCenter().y);
		  $('#zoom').val(map.getZoom());
        });

    }





function addAddressToMap2(response) {
      if (!response || response.Status.code != 200) {
		$('#address').css({'color':'red'});
        $('#address').text(t_CannotGeo);

		 $('#address').animate({backgroundColor: '#FF9'}, 100, function() {
		   				$('#address').animate({backgroundColor: '#FFF' }, 100, function() {
		   						$('#address').animate({backgroundColor: '#FF9' }, 100, function() {
		   							$('#address').animate({backgroundColor: '#FFF' }, 100);
								});
						});
		  });
		 
      } else {
		 $('#address').css('color','#060');
		 
		 $('#address').animate({backgroundColor: '#FF9'}, 100, function() {
		   				$('#address').animate({backgroundColor: '#FFF' }, 100, function() {
		   						$('#address').animate({backgroundColor: '#FF9' }, 100, function() {
		   							$('#address').animate({backgroundColor: '#FFF' }, 100);
								});
						});
		  });

	   	map.clearOverlays();
        place = response.Placemark[0];
        point = new GLatLng(place.Point.coordinates[1],
                            place.Point.coordinates[0]);
        marker = new GMarker(point, {draggable: true});
        map.setCenter(point, 13);
        map.addOverlay(marker);
		var addr = document.getElementById('address');
		addr.firstChild.data = place.address;
		
		GEvent.addListener(marker, "dragend", function() {
          //var myHtml = marker.getPoint()+ "<br/>" + map.getZoom();	
          //marker.openInfoWindow(myHtml);
		  $('#x').val(marker.getPoint().x);
		  $('#y').val(marker.getPoint().y);
		  $('#zoom').val(map.getZoom());
		  }//
		);
		
		$('#x').val(marker.getPoint().x);
		$('#y').val(marker.getPoint().y);
		$('#mapx').val(map.getCenter().x);
		$('#mapy').val(map.getCenter().y);
		$('#zoom').val(map.getZoom());
		
      }
    }


function updateQuery()
{
	var full_add;
	full_add='';
	//if($('#chk_bizname').attr('checked')) full_add+=$('#biz_name').val()+',';
	if($('#chk_add1').attr('checked')) full_add+=$('#biz_add1').val()+',';
	//if($('#chk_add2').attr('checked')) full_add+=$('#biz_add2').val()+',';
	if($('#chk_city').attr('checked')) full_add+=document.getElementById('biz_city').options[document.getElementById('biz_city').selectedIndex].text+',';
	if($('#chk_state').attr('checked')) full_add+=document.getElementById('state').options[document.getElementById('state').selectedIndex].text;
	$('#search_add').val(full_add);
	showLocation();
}

function showLocation()
{
      var address = $('#search_add').val();
     addAddressToMap(address);
}

function showLocation2()
{
      var address = $('#search_add').val();
      geocoder.getLocations(address, addAddressToMap);
}


function findLocation(address) {
      var address = $('#search_add').val();
      showLocation();
    }


// $(document).ready(function() { initialize() });


function bizname2permalink(name)
{
	$('#biz_permalink').attr('disabled','disabled');
	$('#biz_permalink_tips').hide();$('#biz_permalink_img').hide()
	$.post("./biz_validate_ajax.php?"+Math.random(), {
			f:'ajax_name2permalink',
			name:name
			},function(data){
					$('#biz_permalink').val(data.permalink);
					$('#biz_permalink').removeAttr('disabled');
					if(data.duplicate==1) $('#biz_permalink_tips').slideDown();
					else{
						$('#biz_permalink_img').show();
						$('#biz_permalink_tips').slideUp()
						}
			},"json");
}

function validate_permalink(permalink)
{
	$('#biz_permalink').attr('disabled','disabled');
	$.post("./biz_validate_ajax.php?"+Math.random(), {
			f:'ajax_validatepermalink',
			permalink:permalink
			},function(data){
					$('#biz_permalink').val(data.permalink);
					$('#biz_permalink').removeAttr('disabled');
					if(data.duplicate==1) $('#biz_permalink_tips').slideDown();
					else{
						$('#biz_permalink_img').show();
						$('#biz_permalink_tips').slideUp()
						}
			},"json");
}
