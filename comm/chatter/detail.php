<?php
/**
 * MeePlace Chatter's thread detail
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


///////////////  if  comment
if(!empty($_GET[comment]))
{
@session_start();
if($_SESSION["email"] or $_SESSION["display_name"])
{
		$rc = mysql_query("select * from `talk` where topic_id='$_GET[id]'");
		$row=mysql_fetch_array($rc);
		$cat_id=$row[category];
		$reply_num=$row[reply_num]+1;
        
		$message=strip_tags(trim($_GET[comment]));
		$message=str_replace("[br]","<br />",$message);
		$reply_date=date(YmdHis);
		$user_id=get_user_data(user_id);
		$topic_id=$_GET[id];

		$query="insert into `talk_reply` (`message`,`user_id`,`topic_id`,`reply_date`) values ('$message','$user_id','$topic_id','$reply_date')";
		$result=mysql_query($query);
		
		$query="UPDATE `talk` set reply_time='$reply_date' where `topic_id`='$topic_id'";
		$result=mysql_query($query);
		
		$query="UPDATE `talk` set reply_num='$reply_num' where `topic_id`='$topic_id'";
		$result=mysql_query($query);
		
		$query="UPDATE `talk_cat` set last_time='$reply_date' where `cat_id`='$cat_id'";
		$result=mysql_query($query);
/*		////////user 's  review number //////////
		$row = mysql_fetch_array(mysql_query("select * from `user` where user_id='$user_id'"));
		$reviews_num=$row[reviews_num]+1;
		$query="UPDATE `user` set reviews_num='$reviews_num' where user_id='$user_id'";
		$result=mysql_query($query);
		//////////end review number adding////////*/
}
}
//////////////////////////////// 




function get_cat($cat_id)
{
$str="SELECT * FROM `talk_cat` where cat_id='$cat_id'";
$rc = mysql_query($str);
while($row=mysql_fetch_array($rc)){
$catid=$row['cat_id'];
$catname=$row['cat_name'];
return l($catname);
}
}
/////// get topic basic
$rc = mysql_query("select * from `talk` where topic_id='$_GET[id]'");
$row=mysql_fetch_array($rc);

////// direct link
$showme ="http://";
$showme .= $_SERVER['HTTP_HOST'];
$showme .= "/comm/?f=Chatter&aid=";
$showme .=$_GET[id];
////// template vars
$var_topic['name']=$row[topic_name];
$var_topic['catname']=get_cat($row[category]);
$var_topic['date']=turn_date($row[topic_date],ftimeordate);
$var_topic['message']=$row[message];
$var_topic['directlink']=$showme;
$var_topic['id']=(int)$_GET[id];


$var_author['friendsnum']=get_user_data(friends_num,$row[user_id]);
$var_author['reviewsnum']=get_user_data(reviews_num,$row[user_id]);
$var_author['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
$var_author['id']=$row[user_id];
$var_author['name']=get_user_data(nameORemail,$row[user_id]);



////// replies

	$rc="select * from `talk_reply` where topic_id='$_GET[id]' ";
	$rows=mysql_query($rc);
	$rows=mysql_num_rows($rows);	
	$limitfrom=($_GET[page]-1)*20;	
	$rc.="  ORDER BY `reply_date` DESC   LIMIT $limitfrom,20";	
	$rc= mysql_query($rc);
	$limitto=mysql_num_rows($rc);	
	$i=0;
	$var_reply=array();
	while($row=mysql_fetch_array($rc))
	{
		$var_lists['found']='yes';
		
		$var_reply[$i]['userid']=$row[user_id];
		$var_reply[$i]['username']=get_user_data(nameORemail,$row[user_id]);
		$var_reply[$i]['friendsnum']=get_user_data(friends_num,$row[user_id]);
		$var_reply[$i]['reviewsnum']=get_user_data(reviews_num,$row[user_id]);
		$var_reply[$i]['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
			
		$var_reply[$i]['id']=$row[talk_reply_id];
		$var_reply[$i]['date']=turn_date($row[reply_date],ftimeordate);
		$var_reply[$i]['message']=$row[message];
		$i+=1;
	}
	$var_lists['pager']=get_page_list($_GET[page],$rows,20,",2");
	$var_lists['limitfrom']=$limitfrom+1;
	$var_lists['limitto']=$limitfrom+$limitto;
	$var_lists['itemsnum']=$rows;
		



$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_reply",$var_reply); 
$smarty->assign("var_topic",$var_topic);
$smarty->assign("var_author",$var_author);
$smarty->display('comm/chatter/detail.tpl');
?>