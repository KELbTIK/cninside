<?php
 /**
 * MeePlace Classified's subcategory feedback via AJAX
 * @package MeePlace
 * @package Community
 
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


?>


<?php

if(isset($_GET['cat'])){
  
 $str="SELECT * FROM `deals_subcat` where `cat_id`='".$_GET[cat]."'";
	$rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
		while($row=mysql_fetch_array($rc)){
    
        $catid=$row['subcat_id'];
		$catname=l($row['subcat_name']);
        if(get_magic_quotes_gpc()==1){
            echo "obj.options[obj.options.length] = new Option('".addslashes($catname)."','$catid');\n";
        }else{
            echo "obj.options[obj.options.length] = new Option('$catname','$catid');\n";      
        }
      }
}

?> 