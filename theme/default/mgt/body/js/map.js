// Map Settings

var map;
var geocoder;
var markersArray = []; 


function save_map()
{
var key=$('#apikey').val();
var markerx=$('#markerx').val();
var markery=$('#markery').val();
var mapx=$('#mapx').val();
var mapy=$('#mapy').val();
var mapzoom=$('#mapzoom').val();
var _GOOGLE_MAP_ENABLED_=$('#_GOOGLE_MAP_ENABLED_').attr('checked');

$.post("/mgt/body/system_map_submit.php?"+Math.random(), {
key:key,
markerx:markerx,
markery:markery,
mapx:mapx,
mapy:mapy,
mapzoom:mapzoom,
_GOOGLE_MAP_ENABLED_:_GOOGLE_MAP_ENABLED_
},function(data){tips('Map Settings Saved.');nav()});
//setTimeout("nav()",5000)
}




function map_init(mapy,mapx,zoom,markery,markerx) {
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


google.maps.event.addListener(marker, "dragend", function() {
    
        var mylatlng = String(marker.getPosition());
        mylatlng = mylatlng.replace("(","");
        mylatlng = mylatlng.replace(")","");
        var mylatlng_array = mylatlng.split(",");
        
          document.getElementById('markerx').value=mylatlng_array[1];
          document.getElementById('markery').value=mylatlng_array[0];
          document.getElementById('mapzoom').value=map.getZoom();
          }
);
google.maps.event.addListener(map,"dragend", function() {
    
        var maplatlng = String(map.getCenter());
        maplatlng = maplatlng.replace("(","");
        maplatlng = maplatlng.replace(")","");
        var maplatlng_array = maplatlng.split(",");
        
        document.getElementById('mapx').value=maplatlng_array[1];
        document.getElementById('mapy').value=maplatlng_array[0];
        document.getElementById('mapzoom').value=map.getZoom();
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

        $('#markerx').val(mylatlng_array[1]);
        $('#markery').val(mylatlng_array[0]);
        $('#mapx').val(maplatlng_array[1]);
        $('#mapy').val(maplatlng_array[0]);
        $('#mapzoom').val(map.getZoom());

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

function showLocation()
{
     var address = $('#searchaddress').val();
     addAddressToMap(address);
}


function findLocation(address) {
      var address = $('#searchaddress').val();
      showLocation();
    }



function getMyPosition()
{
	if (navigator.geolocation) {
	   tips('Click "Share Location" button<br /> on the top of your browser to continue....');
	   navigator.geolocation.getCurrentPosition(function(position) {  
	   s = position.coords.latitude+","+position.coords.longitude;
		var address = $('#searchaddress').val(s);
		showLocation();
		
	 }); 
	  
	} else {
	  alert("I'm sorry, but geolocation services are not supported by your browser.");
	}  
}

