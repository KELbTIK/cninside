<?php
/**
 * MeePlace Classified's threads list
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

include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

function get_cat($cat_id)
{
$str="SELECT * FROM `deals_subcat` where subcat_id='$cat_id'";
$rc = mysql_query($str);
while($row=mysql_fetch_array($rc)){
$catid=$row['subcat_id'];
$catname=$row['subcat_name'];
return l($catname);
}
}
	$st=strip_tags(trim($_GET[st]));
	
    $period = _CLASS_EXPIRED_DAYS_;

    $date_condition = date('Ymdhms',mktime() - 3600*24*$period);

	// cat query
    if(empty($_GET[subcat]))
	{
	$rc="select * from `deals` where topic_date >= '$date_condition' ";
	if($_GET[cat]!=0)  $rc.=" and (`cat_id`='$_GET[cat]') ";
			if(!empty($st))  
			{
			$rc.=" and (`title` like '%$st%' OR `content` like '%$st%')";
			}
	}
	else {
	//sub cat query
	$rc="select * from `deals` where topic_date >= '$date_condition' ";
	//if($_GET[subcat]!=0||!empty($st))  $rc.=" where "; 
	if($_GET[subcat]!=0)  $rc.="  and (`subcat_id`='$_GET[subcat]') ";
		if(!empty($st))  
		{$rc.=" and (`title` like '%$st%' OR `content` like '%$st%')";}
	}

	$rows=mysql_query($rc);
	$rows=mysql_num_rows($rows);	 
	$limitfrom=($_GET[page]-1)*20;	
	$rc.="  ORDER BY `reply_time` DESC  LIMIT $limitfrom,20";	

	$rc= mysql_query($rc);
	$limitto=mysql_num_rows($rc);	
	$i=0;
	$var_list=array();
	while($row=mysql_fetch_array($rc))
	{
		$var_lists['found']='yes';
			
		$var_list[$i]['userid']=$row[user_id];
		$var_list[$i]['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
		$var_list[$i]['username']=get_user_data(nameORemail,$row[user_id]);
		$var_list[$i]['topicid']=$row[id];
		$var_list[$i]['topicname']=$row[title];
		$var_list[$i]['subcatid']=$row[subcat_id];
		$var_list[$i]['subcatname']=get_cat($row[subcat_id]);
		$var_list[$i]['subcatidlink']=$var_list[$i]['subcatid']+10000;
		$var_list[$i]['replynum']=$row[reply_num];
		$var_list[$i]['replytime']=!empty($row[reply_time])?turn_date($row[reply_time],ftimeordate):turn_date($row[topic_date],ftimeordate);
		
		$i+=1;
	}
	$var_lists['pager']=get_page_list($_GET[page],$rows,20,",0");
	$var_lists['limitfrom']=$limitfrom+1;
	$var_lists['limitto']=$limitfrom+$limitto;
	$var_lists['itemsnum']=$rows;
	
	
	//////////////////////////////////////////


$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_list",$var_list); 
$smarty->display('comm/classified/getlist.tpl');


?>