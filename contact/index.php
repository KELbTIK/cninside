<?php
/**
 * MeePlace Feedback
 * @package MeePlace
 
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



if(!empty($_GET[f])){
$var_f='info';

$topic=$_POST[topic];
$contact_name=strip_tags($_POST[contact_name]);
$contact_email=strip_tags($_POST[contact_email]);
$comments=nl2br(strip_tags($_POST[comments]));
$date=date(YmdHis);


$result=mysql_query("insert into `contact_us` (`topic`,`contact_name`,`contact_email`,`comment`,`date`) values ('$topic','$contact_name','$contact_email','$comments','$date')") or die("Sending Fialed!");

$mail= new MP_Mailer();	
$mail->fromMail = $contact_email;
$mail->fromName = $contact_name; 
$mail->toMail=_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_;              
$mail->Subject  =  l("Feedback").": $topic $date";
$mail->Body     = "<h3>".l("Type").": </h3> $topic<br><h3>".l("Contact Name").": </h3> $contact_name<br><h3>".l("Contact Email").":</h3> $contact_email<br><h3>".l("Contents").":</h3> $comments<br>";
$mail->MPSend();

}

$page_title = l('Contact us').' | '.get_sitename();  //
$smarty->assign("var_f",$var_f);  
$smarty->assign("page_title",$page_title); 
$smarty->display('contact/index.tpl');
?>