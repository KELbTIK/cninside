<?php 
/**
 * MeePlace Create a list
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


include_once(_ABSPATH_.'/inc/func/header.php');


@session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ../login.php");
exit;
}

if($_GET[f]=='submit')
{
$list_name=nl2br(strip_tags(trim($_POST[list_name])));
$list_desc=nl2br(strip_tags(trim($_POST[list_desc])));
$user_id=get_user_data(user_id);
$date_created=date(YmdHis);

$query=mysql_query("select * from `list` where list_name='$list_name' and user_id='$user_id'");		

if(empty($list_name))
{
echo "<script>alert('".l("List name cannot be empty")."');history.go(-1);</script>";	
}


if(mysql_num_rows($query)==0)
{
$query=mysql_query("insert into `list` (`list_name`,`list_desc`,`user_id`,`date_created`) values ('$list_name','$list_desc','$user_id','$date_created')") or die("Error!");

$query=mysql_query("select * from `list` where list_name='$list_name' and user_id='$user_id'");		
$row=mysql_fetch_array($query);


header("Location: ./select.php?id=$row[id]");
exit;

}
else
{
echo "<script>alert('You have created the same list name before.');history.go(-1);</script>";
}
}



  $i=0;
$rc = mysql_query("SELECT * FROM `list_sample` ORDER BY `id` DESC");
		while($row=mysql_fetch_array($rc)){
			$var_list[$i]['tempN']=$tempN=str_replace("'","\'",$row[list_name]);
			$var_list[$i]['tempD']=$tempD=str_replace("'","\'",$row[list_desc]);
			$var_list[$i]['list_name']=$row[list_name];
			$var_list[$i]['list_desc']=$row[list_desc];
					  $i+=1;
 }

$page_title = l('Create List').' | '.get_sitename();  //
$smarty->assign("page_title",$page_title); 
$smarty->assign("var_list",$var_list); 
$smarty->assign("var",$var); 
$smarty->display('my/list/new.tpl');

?>