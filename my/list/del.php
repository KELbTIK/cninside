<?php 
/**
 * MeePlace Delete a list
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
include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
@session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
exit;
}

$user_id=get_user_data(user_id);
$id=$_GET[id];
/////////////verify no id
if(empty($id))
{ echo "<script>alert('Page not exist.');history.go(-1);</script>";
exit;}
//////////////verify myself list
$query=mysql_query("select * from `list` where id='$id' and user_id='$user_id'");		
if(mysql_num_rows($query)==0)
{
 echo "<script>alert('Page not exist.');history.go(-1);</script>";
exit;
}


$result=mysql_query("delete from `list` where id='$id'");
echo "<script>alert('List deleted.');location='../?f=Lists';</script>";
?>