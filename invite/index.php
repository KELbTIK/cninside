<?php 
/**
 * MeePlace Invite a friend
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
 
session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) ) 
{
header("Location: ../my/login.php?referer=/invite/");
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

$msg='';
if($_GET[f]){
	if(!$_POST['email_1']) $msg=l('Please input receiver\'s email!');
}
if($_GET[f] && $msg==''){
    
     $comments=$_POST[subject];
	//$comments=nl2br(strip_tags($_POST[subject]));
    $comments = str_replace('\n\r', '<br>', $comments);
    $comments = str_replace('\r', '', $comments);
    $comments = str_replace('\n', '<br>', $comments);
    $comments = str_replace('&lt;br&gt;', '<br>', $comments);
    $comments = str_replace('&lt;br/&gt;', '<br/>', $comments);
    $comments = str_replace('&lt;br/ &gt;', '<br/ >', $comments);
	$date=date(YmdHis);
	$user_id=get_user_data('user_id');
	$reminder=$_POST[checkbox]?"1":"0";
	for ($i=1;$i<=5;$i++){
		$name=strip_tags($_POST['fname_'.$i]);
		$name=str_replace("&nbsp;"," ",$name);
		$email=strip_tags($_POST['email_'.$i]);
		if(!empty($email)){
			
			
			$mail= new MP_Mailer();	
			$mail->fromMail = get_user_data(email) ;
			$mail->fromName = get_user_data(nameORemail); 
			$mail->toMail=$email;              
			$mail->Subject  = sprintf(l("Invitation from %s"),str_replace("&nbsp;"," ",get_user_data('nameORemail')));
			if(get_magic_quotes_gpc()==1){
                $mail->Body = "Hi, ".$name."<br>".$comments;
            }else{
                $mail->Body = "Hi, ".$name."<br>".stripslashes($comments);
            }
			$mail->MPSend();
			
			$query="insert into `invite` (`topic`,`contact_name`,`contact_email`,`comment`,`date`,`user_id`,`reminder`) values ('$topic','$name','$email','$comments','$date','$user_id','$reminder')";
			$result=mysql_query($query);
			
			$msg=l('Invitation sent!');
		
		}
	}
}


$var_me['name']=get_user_data('nameORemail');

$page_title = l('Invite Your Friends').' | '.get_sitename();  //

$smarty->assign("msg",$msg);  
$smarty->assign("var_me",$var_me);  
$smarty->assign("page_title",$page_title); 
$smarty->display('invite/index.tpl');
?>