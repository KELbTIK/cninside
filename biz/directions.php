<?php 
/**
 * MeePlace Business Get Directions popup.
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
include_once(dirname(__FILE__).'/../inc/func/get_sth.php');
include_once(_ABSPATH_.'/inc/func/header.php');



$biz_id=(int)$_GET['id'];
$msg='';

$bizObj = new MP_Business();
$bizObj->biz_id = $biz_id;
$row = $bizObj->get();

///////////////////////page exist///////////////////////

if(empty($row['business_name'])) {
  $msg= l("Business not exist!");
}

if(!$row['zoom']) {
  $msg= l("No map for this business!");
}

//template vars.
$page_title =l('Get Directions').' | '.get_sitename();  //


$smarty->assign("var_biz",$row); 
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/directions.tpl');
?>