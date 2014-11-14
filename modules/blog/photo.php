<?php 
/**
 * MeePlace Event photo view
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
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

$id=$_GET[id];

		$query="select * from `event` where `id`= '$id'";
		$result=mysql_query($query);
		$row=mysql_fetch_array($result);
  $var_biz['bizname']=$title=$row[event_name];
  $var_biz['bizid']=$id;
  $var_biz['picurl']='e_'.$row[photo_url];
  
/////////////////page exist///////////////////////

if(empty($row[event_name])) {
	
	echo "<script type=\"text/javascript\" language=\"javascript\"> alert(\"Page not exist!\"); history.go(-1);</script>";
		exit;
}
//   album
  		$query="select * from `event_photo` where `business_id`= '$id' ORDER BY `id` DESC ";
		$result=mysql_query($query);
		$i=0;
		$var_pic=array();
		while($row=mysql_fetch_array($result))
		{
			$var_pic[$i]['picurl']='e_'.$row[photo_url];
			$i+=1;
		}

$page_title =sprintf(l('Photos for event %s'),$title).' | '.get_sitename();  //

$smarty->assign("var_biz",$var_biz); 
$smarty->assign("var_pic",$var_pic); 
$smarty->assign("page_title",$page_title); 
$smarty->display('event/photo.tpl');
?>