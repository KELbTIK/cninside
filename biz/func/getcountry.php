<?php 
/**
 * MeePlace get business state via AJAX
 * @package MeePlace
 * @subpackage Business
 
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

if(isset($_GET['country'])){
 $str="select * from country where c_id=".$_GET['country'];
 $rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
 $row= mysql_fetch_array($rc);
 $has_state = $row['has_state'];
 $country = $row['c_name']; 
 
 if ($has_state == 'N'){
      $str="select * from province where province_name= '$country' LIMIT 1";

      $rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
     while($row=mysql_fetch_array($rc)){ 
       $province_id = $row['province_id'];  
     }
      echo $province_id;
 }else{ 
     $str="select * from province where country_id=".$_GET['country'];
     $rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
    echo "obj.options[obj.options.length] = new Option('".l('Select State')."','');\n";
        while($row=mysql_fetch_array($rc)){
    
        $subc=$row['province_name'];
        $subcid=$row['province_id'];
      echo "obj.options[obj.options.length] = new Option('".addslashes($subc)."','$subcid');\n";
      }
 }
}
?> 