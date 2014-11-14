<?php 
/**
 * MeePlace Create a Chatter thread
 * @package MeePlace
 * @package Community
 
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
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ../../my/login.php");
exit;
}



include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

// Already Sent Register
if($_GET[f]=="submit")
{
		$userid=get_user_data(user_id);
		$topic_name=nl2br(strip_tags(trim($_POST[topic])));
		$catid=$_POST[radio];
		$content=nl2br(strip_tags(trim($_POST[content])));
		$topic_date=date(YmdHis);
		$query="insert into `talk` (`topic_name`,`category`,`message`,`user_id`,`topic_date`,`reply_time`) values ('$topic_name','$catid','$content','$userid','$topic_date','$topic_date')";
		$result=mysql_query($query) or die('error! #1');
		
		$query="UPDATE `talk_cat` set last_time='$topic_date' where `cat_id`='$catid'";
		$result=mysql_query($query) or die('error! #2');
        header("Location: ../?f=Chatter");
		exit;
}


function get_cat()
{
 $str="select * from talk_cat";
	$rc = mysql_query($str);
$temp='';
$i=0;
		while($row=mysql_fetch_array($rc)){
        $id=$row['cat_id'];
		$n=l($row['cat_name']);
		if($i==0)
		{$temp.= "<li><label><input type=\"radio\" name=\"radio\" id=\"radio\" value=\"$id\" checked=\"checked\" /> $n</label></li>";  }
		else
		{$temp.= "<li><label><input type=\"radio\" name=\"radio\" id=\"radio\" value=\"$id\" /> $n</label></li>";}
		$i++;
      }
return $temp;
}



////////
$get_cat=get_cat();
$page_title = l('New Conversation').' | '.get_sitename();  //
$smarty->assign("get_cat",$get_cat); 
$smarty->assign("page_title",$page_title); 
$smarty->display('comm/chatter/new.tpl');

?>

