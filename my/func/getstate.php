<?php 
/**
 * MeePlace get business state via AJAX
 * @package MeePlace
 * @subpackage Profile
 
+------------------------------------------------------------------------+
| MeePlace v3.0 ( www.proclones.com )
+------------------------------------------------------------------------+
| MeePlace IS NOT FREE SOFTWARE
| If you have downloaded this software from a website other
| than www.proclones.com or if you have received
| this software from someone who is not a representative of
| ProClones, you are involved in an illegal activity.
| ---
| In such case, please contact: support@proclones.com.
+------------------------------------------------------------------------+
| Developed by: Proclones (www.proclones.com) / support@proclones.com
| Copyright: (c) 2010 ProClones, LLC. All rights reserved.
+------------------------------------------------------------------------+
 */
include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");


if(isset($_GET['state'])){
  
 $str="select * from city where city_state=".$_GET['state'];
	$rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
		while($row=mysql_fetch_array($rc)){
    
        $subc=$row['city_name'];
		$subcid=$row['city_id'];
      echo "obj.options[obj.options.length] = new Option('$subc','$subcid');\n";
      }
}

?> 