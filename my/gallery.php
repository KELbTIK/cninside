<?php 
/**
 * MeePlace User Gallery
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
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

if(!$_GET[id]) die('No User ID Queried');
$user_id=(int) $_GET[id];
$userObj= new MP_User();
$userObj->user_id=$user_id;
$var_user=$userObj->get_user();
if(!$var_user) die('No found person ID='.$user_id);
$var_photos=$userObj->get_gallery();

//For version below 2.8
if(!$var_photos) {$var_photos[1]['photo_url']=$var_user['photo_url'];}

$page_title = sprintf(l('%s\'s Gallery'),$var_user['nameORemail']).' | '.get_sitename();  //

$var_me['user_id']=get_user_data('user_id');

$smarty->assign("page_title",$page_title); 
$smarty->assign("var_user",$var_user); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("var_photos",$var_photos); 
$smarty->display('my/gallery.tpl');

?>