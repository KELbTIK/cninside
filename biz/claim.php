<?php 
/**
 * MeePlace Business Claim popup.
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

$biz_id=$_GET['id'];
$msg='';
$information=strip_tags(trim($_POST[information]));
$phone=strip_tags(trim($_POST[phone]));
$email=strip_tags(trim($_POST[email]));
$fullname=strip_tags(trim($_POST[name]));
$isowner=$_POST[isowner];

$query="select * from `business` where `business_id`= '$biz_id' and `approved`=1";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);
$name=$row['business_name'];

///////////////////////page exist///////////////////////

if(empty($row[business_name])) {
  $msg= "Business not exist!";
}

//////////////// user loged in?  already my business? /////////////////////////////

if(!($_SESSION["email"]) and !($_SESSION["display_name"]) ) {
	$msg=l("Please Login!"); 
}

if($row['user_id']==get_user_data('user_id')) {
	$msg=l('This business is yours already! There\'s no need to claim!');
}

//template vars.
$page_title =l('Claim business').' | '.get_sitename();  //

$var_me['user_id']=get_user_data('user_id');  
$var_me['email']=$_SESSION['email'];  // my email
$var_me['name']=get_user_data('nameORemail');  // my name
$var_me['fullname']=get_user_data('first_name')." ".get_user_data('last_name');  // my name

$var_biz['id']=$biz_id;
$var_biz['bizname']=$row['business_name'];
$var_biz['bizurl']=advanced_biz_name($row['business_id']);
$var_biz['phone']=$row['business_phone'];

$var_owner['user_id']=$row['user_id'];   // current owner user id
$var_owner['email']=get_user_data('email',$row['user_id']) ; // current owner email
$var_owner['name']=get_user_data('nameORemail',$row['user_id']) ; // current owner name

/////////

/// existing the same pending claim?
	$query="select * from `business_claim` where `business_id`= $var_biz[id] and `user_id`=$var_me[user_id] and `state`=0 ";
	$result=mysql_query($query);
	if(mysql_num_rows($result))
	{
		$msg=l("Your previous claiming request is still under judgement!");
	}
/////////POST

if (!empty($_POST) and $msg=='') {
	mysql_query("INSERT INTO `business_claim` (`user_id` ,`email`,`phone`,`business_id` ,`information` ,`isowner`,`name`) VALUES ( '$var_me[user_id]','$email', '$phone', '$var_biz[id]', '$information' ,'$isowner', '$fullname');") or die("Fail to write to db.");
	//Submit Notification 
	if(_MAILNOTIFY_ADMIN_BIZ_CLAIM_)	
	{
		$mail= new MP_Mailer();	
		$mail->fromMail = _SMTP_FROM_ ;
		$mail->fromName = _SMTP_FROMNAME_; 
		$mail->toMail=_MAILNOTIFY_ADMIN_BIZ_CLAIM_;              
		$mail->Subject  = sprintf(l("New business claim request for [%s]"),stripslashes(str_replace("&nbsp;"," ",$var_biz['bizname'])));
		$mail->Body = $mail->Subject."<br /><a href='http://"._DOMAIN_."/mgt/' target='_blank'>Go to Management</a>";
		$mail->MPSend();
	}
	$msg= l("Your claiming request posted, please wait for our judgement!");
}

/////////////////////////////////

$smarty->assign("var_me",$var_me); 
$smarty->assign("var_biz",$var_biz); 
$smarty->assign("msg",$msg); 
$smarty->assign("var_owner",$var_owner); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/claim.tpl');
?>