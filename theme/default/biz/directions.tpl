<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Generator" content="MeePlace {$smarty.const._VERSION_}" />
<script src="/theme/{$get_theme}/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/biz_detail.css" />
<link rel="stylesheet" type="text/css" href="/theme/{$get_theme}/js/pt/doc/styles/main.css" media="screen" />
<link href="/theme/{$get_theme}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link href="http://code.google.com/apis/maps/documentation/javascript/examples/standard.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
//Get smarty variables
var markerx={$var_biz.x};
var markery={$var_biz.y};
var mapzoom={$var_biz.zoom};
var business_name='{$var_biz.business_name}';
</script>

{literal}
<script type="text/javascript">
  var directionDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  var marker;
  var geocoder;
  var start = new google.maps.LatLng(markery, markerx);
  var destination = new google.maps.LatLng(markery, markerx);
  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    
    var myOptions = {
      zoom:mapzoom,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: destination
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));


    marker = new google.maps.Marker({
        position: start, 
        map: map, 
        draggable:true,
        icon: 'http://google-maps-icons.googlecode.com/files/factory.png',
        zIndex:999
    });   

    google.maps.event.addListener(marker, 'mouseup', function() {
        // alert(marker.getPosition().lat());
    		start = marker.getPosition();
    		calcRoute();
    });
  }
  
  function calcRoute() {
	  var selectedMode = document.getElementById("mode").value;

	 	if($('#addressinput').val())
		{
			start=$('#addressinput').val();
	 	    //geocoder.geocode( { 'address': $('#addressinput').val()}, function(results, status) {
	 	    //  if (status == google.maps.GeocoderStatus.OK) {
	 	    //    map.setCenter(results[0].geometry.location);
	 	        //marker = new google.maps.Marker({
	 	        //    map: map, 
	 	        //    position: results[0].geometry.location
	 	        //});
		 	    $('#addressinput').val('');
				$('#addressinputdiv').hide();
	 	    //  } else {
	 	    //    alert("Geocode was not successful for the following reason: " + status);
	 	    //  }
	 	    //});
			
		}
	  
        var request = {
        		origin:start, 
        		destination:destination,
        		travelMode: google.maps.DirectionsTravelMode[selectedMode]
        		//travelMode: google.maps.DirectionsTravelMode.DRIVING
    		};
    		directionsService.route(request, function(response, status) {
     	if (status == google.maps.DirectionsStatus.OK) {
        		directionsDisplay.setDirections(response);
      	}
    });
  }
</script>

{/literal}

</head>
<body onload="initialize()" style="background:none;">
    <div id="container">
        <!--Main Start-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Get Directions for'} {$var_biz.business_name}</h3>
            </div>
            <div class="panel-body">
                {if $msg}
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <h3 class="text-center">{$msg}</h3>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p class="text-center">[ <a href="javascript:parent.jQuery.fancybox.close();">OK</a> ]</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                {else}
                    <div id="map_canvas" class="col-sm-7 col-xs-12" style="height:363px;"></div>

                    <div class="col-sm-5 col-xs-12">
                        <div class="form-group visible-xs"></div>
                        <div class="form-group">
                            <select id="mode" onchange="calcRoute();" class="form-control">
                                <option value="DRIVING">{l t='Driving'}</option>
                                <option value="WALKING">{l t='Walking'}</option>
                                <option value="BICYCLING">{l t='Bicycling'}</option>
                            </select>
                        </div>

                        <div>{l t='Usage: Drag the blue marker to generate directions'}.</div>
                        <div id="directionsPanel">
                            <div id="addressinputdiv">
                                <br /><br /><br />
                                {l t='Or type in your target address to generate the destination'}.
                                <br /><br />
                                <div class="form-group">
                                    <input type="text" name='addressinput' id='addressinput' class="form-control" />
                                </div>
                                <input type="button" value="{l t='Go'}" onclick="calcRoute()" class="btn btn-success"/>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
        <!--Main End-->
        </div>
    </body>
</html>