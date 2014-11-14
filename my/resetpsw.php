<?php
/**
 * MeePlace Reset Password
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




$page_title = l('Reset Password').' | '.get_sitename();  //


if($_GET[f]=='submit'){
	//Captcha
	$r_0=strtolower(strip_tags(trim($_SESSION[r])));
	$r_1=strtolower(strip_tags(trim($_POST[r])));
	if($r_0!==$r_1)
	{
		die("<script>alert('Sorry, you typed a wrong secure code'); history.go(-1)</script>");
	}


	//get variables
	//$birthday=$_POST[year].$_POST[month].$_POST[day];
	$email=strtolower(strip_tags(trim($_POST[email])));
	//query db
	$query="SELECT * FROM user where `email`='$email' limit 1";// and `birthday`='$birthday'";
	$rc=mysql_query($query);
	$row=mysql_fetch_array($rc);
	//get rnd
	$rnd=rand(1000,9999);
	$rndmd5=md5($rnd);
	//////////////got user_id///////////
	$id=$row[user_id];

	if(empty($id))
	{
		$var_notice= "<br><br><br><br><br><br><br><br><br><br><br><center>".l('Email is not existed!')."<br><br><a href=javascript:history.go(-1)>&laquo; ".l('Back to edit')."</a></center><br><br><br><br><br><br><br><br><br><br>";
	}
	else
	{
		//save to db
		$query="UPDATE `user` SET `password` = '$rndmd5' WHERE `user_id`='$id' LIMIT 1;";
		$rc=mysql_query($query) or die('Error! Please contact us!');
		//send mail

		$mail= new MP_Mailer();
		$mail->fromMail = _SMTP_FROM_ ;
		$mail->fromName = _SMTP_FROMNAME_;
		$mail->toMail=$email;
		$mail->Subject  = l("Your password has been reset");
		$mail->Body     = "Hi, <br>".sprintf(l('This is a system mail from %s for resetting your password.'),_SITENAME_). l('If you didn\'t perform a resetting action, there may be someone attempting to get your password. And please tell us.')."<br><br>".l('Your new password had been changed to').": <span style=\"color:red; font-weight:bold\">".$rnd."</span><br><br>"._SITENAME_;
		$mail->MPSend();
		$var_notice= "<br><br><br><br><br><br><br><br><br><br><br><center><h1>".l('Your new password had been sent to your email!')."</h1></center><br><br><br><br><br><br><br><br><br><br>";
	}
}


//$smarty->compile_check = true;
//$smarty->debugging = true;

$smarty->assign("page_title",$page_title);
$smarty->assign("var_notice",$var_notice);
$smarty->display('my/resetpsw.tpl');

?>