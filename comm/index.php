<?php 
/**
 * MeePlace Community homepage. e.g. Chatter, Deals
 * @package MeePlace
 * @subpackage Community
 
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
@session_start();


include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');
//////////////////////////////////////////

$zone_name=$_GET[f];
$var_me['email']=$_SESSION[email];
$page_title = l($zone_name).' | '.get_sitename();  //


$smarty->assign("zone_name",$zone_name); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("page_title",$page_title); 
$smarty->display('comm/index.tpl');
?>