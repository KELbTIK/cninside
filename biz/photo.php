<?php 
/**
 * MeePlace Business photos view.
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
 
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");

include_once(_ABSPATH_.'/inc/func/header.php');

$id=$_GET[id];

		$query="select * from `business` where `business_id`= '$id'";
		$result=mysql_query($query);
		$row=mysql_fetch_array($result);


/////////////////page exist///////////////////////

if(empty($row[business_name])) {
	echo "<script type=\"text/javascript\" language=\"javascript\"> alert(\"".l("Page not exist")."\"); history.go(-1);</script>";
	exit;
}

/////some template vars.
$var_biz['id']=$row['business_id'];
$var_biz['bizname']=$title=$row['business_name'];
$var_biz['picurl']='b_'.$row['photo_url'];
$var_biz['permalink']=$row['permalink']; 

/////query for pic items
$query="select * from `business_photo` where `business_id`= '$id' ORDER BY `id` DESC ";
$result=mysql_query($query);
$i=0;
$var_pic=array();
while($row=mysql_fetch_array($result))
{
	$var_pic[$i]['picurl']='b_'.$row['photo_url'];
	$i+=1;
}



$var_me['user_id']=get_user_data('user_id');
$var_me['token']=get_user_data('token');

$page_title =sprintf(l('Photos for %s'),$title).' | '.get_sitename();  //
$smarty->assign("var_pic",$var_pic); 
$smarty->assign("var_biz",$var_biz);
$smarty->assign("var_me",$var_me); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/photo.tpl');


?>