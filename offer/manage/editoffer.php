<?php 
/**
 * MeePlace special offer edit.
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
include_once(dirname(__FILE__).'/../../inc/func/get_sth.php');
include_once(_ABSPATH_.'/inc/func/header.php');


//template vars.
$page_title =l('Edit deal').' | '.get_sitename();  //

$objOffer= new MP_SpecialOffers();
$objOffer->id=$_GET['id'];
$var_offer=$objOffer->getOne(); 


$bizObj= new MP_Business();
$bizObj->biz_id=$var_offer['business_id'];
$var_biz=$bizObj->get();

//////////////// user loged in?   my business? /////////////////////////////

if(empty($_SESSION['email'])) {
	$msg=l("Please Login!"); 
} 

if(get_user_data('user_id',$var_biz['user_id'])!=get_user_data('user_id')) {
	$msg=l("This business is not yours!");
}





/**
 * POST form
 * 
 */

if (!empty($_POST) and $msg=='') {
	
	$description=strip_tags(trim($_POST['description']));
	$url=strip_tags(trim($_POST['url']));
	$phone=strip_tags(trim($_POST['phone']));
	mysql_query("UPDATE `special_offer` SET `offer_description`='$description', `offer_url`='$url', `offer_phone`='$phone' WHERE `offer_id` =$_REQUEST[id] LIMIT 1;") or die("Fail to write to db.");
	$msg=l("Offer Detail Changed!")."<br /> <br />";
}

/////////////////////////////////////////////////////////////////////////////////////////

$smarty->assign("var_biz",$var_biz); 
$smarty->assign("var_offer",$var_offer); 
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('offer/manage/editoffer.tpl');
?>