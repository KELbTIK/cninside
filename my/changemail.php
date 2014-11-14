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


$page_title = l('Change Email').' | '.get_sitename();  //

init();

function init(){
// Already Sent chgmail Form
if($_GET[f]=="change")
{
$userid=get_user_data(user_id);
$email=strtolower(strip_tags(trim($_POST[changeto])));
$result=mysql_query("SELECT `email` FROM user where email='".$email."'");	
$val=mysql_fetch_array($result);
if($val[email]==$email)
	{
		echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"This email address has already been used by others!\");</script>";
		return false;
	}



if(!$userid){echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"Error in Changing Email Address!\"); location='account.php';</script>";
}
$changeto=strtolower(strip_tags(trim($_POST[changeto])));
$result=mysql_query("UPDATE `user` SET `email` = '$changeto' WHERE `user_id` ='$userid'");	

session_start();
session_destroy();  //删掉 session
echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"Changing Email Address Successful! Now Please Re-login! \"); location='login.php';</script>";
exit;
}
}


$var_currentemail=get_user_data(email);
$smarty->assign("var_currentemail",$var_currentemail); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/changemail.tpl');


?>