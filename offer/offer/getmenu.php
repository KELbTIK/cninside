<?php
/**
 * MeePlace Special Offers thread's categories
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
include_once(_ABSPATH_.'/inc/func/header.php');

$str="SELECT * FROM `business_category`";
$rc = mysql_query($str);
$i=0;
$var_item=array();
while($row=mysql_fetch_array($rc)){
$var_item[$i]['catid']=$row['cat_id'];
$var_item[$i]['catname']=l($row['cat_name']);
$var_item[$i]['cat_image']=$row['cat_image'];
$i+=1;
}

$smarty->assign("var_item",$var_item); 
$smarty->display('offer/offer/getmenu.tpl');

?>
