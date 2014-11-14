<?php 
/**
 * MeePlace Account Management
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



session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) ) 
{
header("Location: ./login.php");
exit;
}

$page_title = l('Account').' | '.get_sitename();  //
$user_id = get_user_data('user_id');
/*
$var_me['picurl']='p_'.get_user_data('photo_url');
$var_me['email']=get_user_data('email');
$var_me['firstname']=get_user_data('first_name');
$var_me['lastname']=get_user_data('last_name');
$var_me['nickname']=get_user_data('nickname');
$var_me['headline']=get_user_data('headline');
$var_me['fb_user_id']=get_user_data('fb_user');
*/

$query="select * from `user` where `user_id`= '$user_id'";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);

$var_me['picurl']='p_'.$row['photo_url'];
$var_me['email']= $row['email'];
$var_me['firstname']= $row['first_name'];
$var_me['lastname']= $row['last_name'];
$var_me['nickname']= $row['nickname'];
$var_me['headline']= $row['headline'];
$var_me['fb_user_id']= $row['fb_user'];
$var_me['credit']= $row['credit'];

//$smarty->compile_check = true;
//$smarty->debugging = true;

$smarty->assign("page_title",$page_title); 
$smarty->assign("var_me",$var_me); 
$smarty->display('my/account.tpl');

?>