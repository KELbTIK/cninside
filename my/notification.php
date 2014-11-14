<?php 
/**
 * MeePlace Email notification setting.
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
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


$page_title = l('Mail Notification').' | '.get_sitename();  //



if($_GET[f]=="change")
{
$userid=get_user_data(user_id);

if(!$userid){echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"Error in Changing Email Address!\"); location='account.php';</script>";
}

$f1=$_POST[f1]?'1':'0';
$f2=$_POST[f2]?'1':'0';
$f3=$_POST[f3]?'1':'0';
$f4=$_POST[f4]?'1':'0';

$result=mysql_query("UPDATE `user` SET `notification_1`='$f1' ,`notification_2`='$f2' ,`notification_3`='$f3',`notification_4`='$f4' WHERE `user_id` ='$userid'");	

echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"Changing Notifications Settings Successful!\"); location='account.php';</script>";
exit;
}



$email=$_SESSION[email];
$result=mysql_query("SELECT * FROM user where email='$email'");	
$val=mysql_fetch_array($result);


$var_noti[1]=$val[notification_1];
$var_noti[2]=$val[notification_2];
$var_noti[3]=$val[notification_3];
$var_noti[4]=$val[notification_4];

//$smarty->debugging = true;
$smarty->assign("var_noti",$var_noti); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/notification.tpl');


?>