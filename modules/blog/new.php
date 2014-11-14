<?php 
/**
 * MeePlace Create an event
 * @package MeePlace
 * @subpackage Events
 
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
@session_start();
@set_time_limit(0);
@ini_set("memory_limit","80M");

if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) ) 
{
header("Location: ../my/login.php");
exit;
}

include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

// Already Sent Register
if($_GET[f]=="submit")
{
/////////////////get POST
$user_id=get_user_data(user_id);
$blog_title=nl2br(strip_tags(trim($_POST[blog_title])));

$submit_date=date(Ymd);

if(_NEW_BLOG_APPROVAL_NEED_==0)//needn't
	$approved=1;
else
	$approved=0;


// write 
$query="insert into `blog` (`blog_title`, `user_id`, `submit_date`,`approved`) values ('$blog_title','$user_id', '$submit_date', $approved)";
$result=mysql_query($query) or die('Error!'.$query);
// find again
$find=mysql_query("select * from `blog` where `blog_title`='$blog_title' and `user_id`='$user_id'") or die('Query Error!');
$row=mysql_fetch_array($find);
$id=$row[id];

 /*
//photo
if ($_FILES["file"]["error"]==0)
{
$fName=$_FILES["file"]["name"];
$fDir=$_FILES["file"]["tmp_name"];
$ext=strrchr($fName,".");
$deniedExtensions=array('html','htm','php','php2','php3','php4','php5','phtml','pwml','inc','asp','aspx','ascx','jsp','cfm','cfc','pl','bat','exe','com','dll','vbs','js','reg','cgi','htaccess','asis','sh','shtml','shtm','phtm');
if (in_array($ext,$deniedExtensions))
{ echo "<script>alert('".l("Photo extensions illegal!")."'); history.go(-1);</script>";
exit;}
else{
$imgurl=date(YmdHis).$user_id;
if (move_uploaded_file($fDir,"../images/event/e_".$imgurl))
{
//
	pic_resize(900,400,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl);
	pic_resize(195,180,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_195x180");
	pic_resize(100,100,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_100x100");
	pic_resize(80,80,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_80x80");
	pic_resize(40,40,"../images/event/e_".$imgurl,"../images/event/e_".$imgurl."_40x40");

$query="insert into `event_photo` (`photo_url`,`business_id`) values ('$imgurl','$id')";
$result=mysql_query($query) or die('ERROR!'.$query);	//

$query="update event SET `photo_url` = '$imgurl' WHERE `id` =$id ";
$result=mysql_query($query) or die('ERROR!'.$query);
}
else
{
echo "<script>alert('".l("Photo upload error!")."'); history.go(-1);</script>";
exit;
}}}

////end photo 


//Submit Notification 
		if(_MAILNOTIFY_ADMIN_EVENT_SUBMIT_)	
		{
			$mail= new MP_Mailer();	
			$mail->fromMail = _SMTP_FROM_ ;
			$mail->fromName = _SMTP_FROMNAME_; 
			$mail->toMail=_MAILNOTIFY_ADMIN_EVENT_SUBMIT_;              
			$mail->Subject  = sprintf(l("A new event [%s] submitted"),stripslashes(str_replace("&nbsp;"," ",$event_name)));
			$mail->Body = $mail->Subject."<br /><a href='http://"._DOMAIN_."/mgt/' target='_blank'>Go to Management</a>";
			$mail->MPSend();
		}
*/
// navigate
if (!empty($row[id]) && $approved==1)
echo "<script>location='./detail.php?id=".$row[id]."'</script>";
else
echo "<script>alert('".l("Blog posted, and it will be shown after being approved.")."');location='./search.php'</script>";
		
}



$page_title =l('New Blog').' | '.get_sitename();  //

$smarty->assign("page_title",$page_title); 
$smarty->display('modules/blog/new.tpl');
?>