<?php 
/**
 * MeePlace Change Email.
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


	$urlRows=parse_url($_SERVER['HTTP_REFERER']);
	$url=$urlRows["path"];
	if(!empty($urlRows["query"]))
	$url.="?".$urlRows["query"];

// Validate Login
function validate_login($uid,$password)
{
	$result=mysql_query("SELECT * FROM user where user_id='$uid'");	
	$val=mysql_fetch_array($result);
	
	  if($val[password] && $val[password]===md5($password))  return true;
	  else  return false;
}


$page_title = l('Change Password').' | '.get_sitename();  //


$user_id=get_user_data(user_id);

if(!$user_id) die("Not logged in?");

if(get_user_data('fb_user')){
	echo "<script>alert('".l('You are logged in with FB Connect, there is no password to edit')."');</script>";
	echo "<script>location='$url'</script>";
	exit;
}

if($_POST)
{	

	
	if(empty($_POST[old_password]))
	{
		echo "<script>alert('".l('Please input old password')."');</script>";
		echo "<script>location='$url'</script>";
		exit;
	}
	if(empty($_POST[password]))
	{
		echo "<script>alert('".l('Please input new password')."');</script>";
		echo "<script>location='$url'</script>";
		exit;
	}
	if($_POST[password]!=$_POST[rpassword])
	{
		echo "<script>alert('".l('Please input the same password in confirm password field')."');</script>";
		echo "<script>location='$url'</script>";
		exit;
	}
	
	//Check old password
	if(!validate_login($user_id,$_POST[old_password]) )
	{
		echo "<script>alert('".l('Wrong old password')."');</script>";
		echo "<script>location='$url'</script>";
		exit;
	}
	
	
	//Start changing
		$password=md5($_POST[password]);
		$query="UPDATE `user` set password='$password' where `user_id`='$user_id'";
		$result=mysql_query($query);
		//@session_start();
		//session_destroy();  //删掉 session
		echo "<script>alert('".l('Password has been changed')."');location='./account.php';</script>";
		exit;
	

	
	
	exit;
}


$var_currentemail=get_user_data(email);
$smarty->assign("var_currentemail",$var_currentemail); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/changepassword.tpl');


?>