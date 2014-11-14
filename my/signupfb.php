<?php
/**
 * MeePlace - Email for Facebook Users
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
session_start();
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');



	//redirect
	$referer= rawurlencode($_GET['referer']);
 
	if(empty($referer)) $referer=rawurlencode(str_replace("http://"._DOMAIN_,"",$_SERVER['HTTP_REFERER']));
	if(strtolower(substr($referer,-11))=='signupfb.php') $referer=rawurlencode('/');
    
if(empty($_SESSION["fb_user"]) )
{
header("Location: ./loginfb.php");
exit;
}

$page_title = l('Complete Profile').' | '.get_sitename();  //

$fb_user=$_SESSION["fb_user"];
$fb_email=$_SESSION["email"];
$fb_display_name=$_SESSION["display_name"];




$loginfail=0;


if($_POST)
{
	$nickname=strip_tags(trim($_POST[nickname]));
	$email=strtolower(strip_tags(trim($_POST[email])));

//// Email empty
	if(empty($email)){$loginfail=1;}
////Invalid email
	//if(!preg_match('/^([a-z0-9])(([-a-z0-9._])*([a-z0-9]))*\@([a-z0-9])*(\.([a-z0-9])([-a-z0-9_-])([a-z0-9])+)*$/i',$email))
    //$loginfail=2; 
    
    if (!eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email)) {$loginfail=2; }
    
		
	
//// check nickname
/*	$result="SELECT `user_id`,`nickname` FROM user where `nickname`='$nickname'";
	$query=mysql_query("$result");
	$row=mysql_fetch_array($query);
	$rows=mysql_num_rows($query);	
	if($rows!=0&&$row[user_id]!=$user_id&&$nickname!=''){$loginfail=4;}
*/	
//// check email
	$result="SELECT `user_id`,`email` FROM user where `email`='$email'";
	$query=mysql_query("$result");
	$row=mysql_fetch_array($query);
	$rows=mysql_num_rows($query);	
	if($rows!=0&&$email!=''){$loginfail=3;}
	
	
	if($loginfail==0){ // no error
//		$query="UPDATE `user` set nickname='$nickname', email='$email' where `fb_user`='$fb_user'";
		$query="UPDATE `user` set email='$email' where `fb_user`='$fb_user'";
		mysql_query($query) or die('Update error');
		
		$userObj= new MP_User();
		$userObj->fb_user=$fb_user;
		$_SESSION["fb_user"]=$fb_user;
		$_SESSION["email"]=$email;
		$_SESSION["display_name"]=$fb_display_name;
		// Redirect
		header("Location: /");
		exit;
	}
}


	
	$_SESSION["fb_user"]=$fb_user;
	$_SESSION["email"]=$fb_email;
	$_SESSION["display_name"]=$fb_display_name;
	
$smarty->assign("loginfail",$loginfail); 
$smarty->assign("referer",$referer); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/signupfb.tpl');

?>