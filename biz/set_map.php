<?php
@session_start();

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");



 ///get
 $sheet='business'; // database sheet
 $where='business_id'; // where
 $equal=$_REQUEST[id]; // where `$where`='$equal'
 /// database


 $query="select * from `$sheet` where `$where`='$equal'";
 $rc=mysql_query($query) or die("ERROR: $query");
 $row=mysql_fetch_assoc($rc);
$x=!empty($row[x])?$row[x]:"0";
$y=!empty($row[y])?$row[y]:"0";
$mapx=!empty($row[mapx])?$row[mapx]:"0";
$mapy=!empty($row[mapy])?$row[mapy]:"0";
$zoom=!empty($row[zoom])?$row[zoom]:"0";


if($row['user_id']!=get_user_data('user_id')) {
	echo l("This business is not yours!");
	exit;
}




if($_POST)
{
	 ///get
	 $sheet='business'; // database sheet
	 $where='business_id'; // where
	 $equal=$_POST[id]; // where `$where`='$equal'
	 /// database

	//
	$query="update `$sheet` set `x`='$_POST[x]',`y`='$_POST[y]',`mapx`='$_POST[mapx]',`mapy`='$_POST[mapy]',`zoom`='$_POST[zoom]'
	where `$where`='$equal'";
	$result=mysql_query($query) or die("ERROR! $query");
	echo "<script>alert('Map Updated!');parent.$.fn.fancybox.close();</script>";
	exit;

}




?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Map Adjust</title>
<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
em
{ font-weight:normal; font-size:11px; color:#999; float:right;}
-->
</style>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
 <script type="text/javascript">
 function initialize() {
     var tmp='<?=$zoom?>';
if(tmp=='0')
{
    document.getElementById("map_canvas").innerHTML="<br /><br /><br /><br /><br /><center>No Map<br><a href=javascript:create()>Create?</a></center>";
}
else
{

   // geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(<?=$mapy?>, <?=$mapx?>);
    var myOptions = {
      zoom: <?=$zoom?>,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    var markerlatlng = new google.maps.LatLng(<?=$y?>, <?=$x?>);
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

          document.getElementById('x').value=mylatlng_array[1];
          document.getElementById('y').value=mylatlng_array[0];
          document.getElementById('zoom').value=map.getZoom();
          }
);
google.maps.event.addListener(map,"dragend", function() {

        var maplatlng = String(map.getCenter());
        maplatlng = maplatlng.replace("(","");
        maplatlng = maplatlng.replace(")","");
        var maplatlng_array = maplatlng.split(",");

        document.getElementById('mapx').value=maplatlng_array[1];
        document.getElementById('mapy').value=maplatlng_array[0];
        document.getElementById('zoom').value=map.getZoom();
        });

    }
 }



function create()
{
         var latlng = new google.maps.LatLng(0, 0);
    var myOptions = {
      zoom: 0,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    var markerlatlng = new google.maps.LatLng(<?=$y?>, <?=$x?>);
    var marker = new google.maps.Marker({
    map: map,
    draggable : true,
    position: markerlatlng
    });

google.maps.event.addListener(marker, "dragstart", function()
{  map.closeInfoWindow();  }
);
google.maps.event.addListener(marker, "dragend", function() {

        var mylatlng = String(marker.getPosition());
        mylatlng = mylatlng.replace("(","");
        mylatlng = mylatlng.replace(")","");
        var mylatlng_array = mylatlng.split(",");

          document.getElementById('x').value=mylatlng_array[1];
          document.getElementById('y').value=mylatlng_array[0];
          document.getElementById('zoom').value=map.getZoom();
          }
);
google.maps.event.addListener(map,"dragend", function() {

        var maplatlng = String(map.getCenter());
        maplatlng = maplatlng.replace("(","");
        maplatlng = maplatlng.replace(")","");
        var maplatlng_array = maplatlng.split(",");

        document.getElementById('mapx').value=maplatlng_array[1];
        document.getElementById('mapy').value=maplatlng_array[0];
        document.getElementById('zoom').value=map.getZoom();
        });
}
    </script>



    <link href="/theme/<?=_THEME_?>/mgt/body/css/common.css" rel="stylesheet" />
    <link href="/theme/<?=_THEME_?>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

</head>

<body id="popup">
<form action="?id=<?=$equal?>" method="post" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Map Adjustment</h3>
        </div>
        <div class="panel-body">
            <div class="col-sm-6 col-xs-12">
                <div id="map_canvas" style="height: 338px; overflow:hidden; border:1px #ccc solid; margin:0 auto;">
                    <div class="text-center">Please wait...</div>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3 control-label">Marker X</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="x" type="text" id="x" value="<?=$x?>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3 control-label">Marker Y</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="y" type="text" id="y" value="<?=$y?>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3 control-label">Zoom</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="zoom" type="text" id="zoom" value="<?=$zoom?>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3 control-label">Map X</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="mapx" type="text" id="mapx" value="<?=$mapx?>" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-3 control-label">Map Y</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="mapy" type="text" id="mapy" value="<?=$mapx?>" />
                    </div>
                </div>
            </div>
            <div class="col-xs-12 text-center">
                <br/>
                <div class="small">
                    If you want to make a "No Map" item, <br />
                    please delete the value in ZOOM field.
                    <input name="id" type="hidden" id="id" value="<?=$equal?>" />
                </div>
                <input class="btn btn-primary" type="submit" name="button" id="button" value="Update" />
            </div>
        </div>
    </div>
</form>

<script>setTimeout("initialize()",500);</script>
</body>
</html>