<?php 
/**
 * MeePlace Edit a list's name and description.
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




$user_id=get_user_data(user_id);
$var['id']=$id=$_GET[id];
/////////////verify no id
if(empty($id))
{ echo "<script>alert('".l('Page not exist').".');history.go(-1);</script>";
exit;}
//////////////verify myself list
$query=mysql_query("select * from `list` where id='$id' and user_id='$user_id'");		
if(mysql_num_rows($query)==0)
{
 echo "<script>alert('".l('Page not exist').".');history.go(-1);</script>";
exit;
}


$row=mysql_fetch_array($query);
$var['list_name']=$list_name=$row[list_name];
$var['list_desc']=$list_desc=$row[list_desc];


////////////////////////////submit   update
if($_GET[f]=='submit')
{
$list_name=nl2br(strip_tags(trim($_POST[list_name])));
$list_desc=nl2br(strip_tags(trim($_POST[list_desc])));

$query=mysql_query("UPDATE `list` SET `list_name` = '$list_name', `list_desc` = '$list_desc' WHERE `id` =$id ");


echo "<script>alert('".l('List Updated').".');history.go(-2);</script>";
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
$smarty->display('my/list/edit.tpl');
?>

