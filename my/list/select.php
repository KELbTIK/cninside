<?php 
/**
 * MeePlace Edit a list's business items.
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

include_once(dirname(__FILE__)."/../../inc/func/get_sth_admin.php");


include_once(_ABSPATH_.'/inc/func/header.php');


@session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
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

/////////////if  submit

if($_GET[f]=='submit')
{

$result=mysql_query("delete from `list_item` where list_id='$id'");
$a= $_POST[toBox];

for($i=0;$i<count($_POST[toBox]);$i++)
{
$query=mysql_query("insert into `list_item` (`list_id`,`business_id`) values ('$id','$a[$i]')") or die("Error!");
}	
echo "<script>alert('".l("List Updated")."');location='../?f=Lists';</script>"	;
exit;
}

  $i=0;
$user_id=get_user_data(user_id);
$rc = mysql_query("select * FROM `bookmark` where user_id='$user_id' ORDER BY `bookmark_id` DESC ");
while($row=mysql_fetch_array($rc))
{
	$inrc = mysql_query("select * FROM `business` where business_id='$row[business_id]'");
	$inrow=mysql_fetch_array($inrc);
				$var_list[$i]['id']= $row[business_id];
				$var_list[$i]['name']=$inrow[business_name];
				$var_list[$i]['rating']= $inrow[rating];
				$var_list[$i]['location']= get_city_name($inrow[city_id]);
		  $i+=1;
 }

  $i=0;
$rc = mysql_query("SELECT * FROM `list_item` where list_id='$id' ");
while($row=mysql_fetch_array($rc))
{
  $inrc = mysql_query("select * FROM `business` where business_id='$row[business_id]'");
  $inrow=mysql_fetch_array($inrc);
  		$var_listlist[$i]['id']= $row[business_id];
				$var_listlist[$i]['name']=$inrow[business_name];
				$var_listlist[$i]['rating']= $inrow[rating];
				$var_listlist[$i]['location']= get_city_name($inrow[city_id]);
  }


$page_title = l('Select Item').' | '.get_sitename();  //

$smarty->assign("page_title",$page_title); 
$smarty->assign("var_listlist",$var_listlist); 
$smarty->assign("var_list",$var_list); 
$smarty->assign("var",$var); 
$smarty->display('my/list/select.tpl');

?>