<?php
/**
 * MeePlace Classified's thread detail
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
		$rc = mysql_query("select * from `deals` where id='$_GET[id]'");
		$row=mysql_fetch_array($rc);
		$reply_num=$row[reply_num]+1;
		
		$content=strip_tags(trim($_GET[comment]));
		$content=str_replace("[br]","<br />",$content);
		$reply_date=date(YmdHis);
		$user_id=get_user_data(user_id);
		$id=$_GET[id];

		$query="insert into `deals_reply` (`content`,`user_id`,`topic_id`,`reply_date`) values ('$content','$user_id','$id','$reply_date')";
		$result=mysql_query($query);
		
		$query="UPDATE `deals` set reply_time='$reply_date' where `id`='$id'";
		$result=mysql_query($query);
		
		$query="UPDATE `deals` set reply_num='$reply_num' where `id`='$id'";
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
$str="SELECT * FROM `deals_cat` where cat_id='$cat_id'";
$rc = mysql_query($str);
while($row=mysql_fetch_array($rc)){
$catname=$row['cat_name'];
return l($catname);
}
}
function get_subcat($cat_id)
{
$str="SELECT * FROM `deals_subcat` where subcat_id='$cat_id'";
$rc = mysql_query($str);
while($row=mysql_fetch_array($rc)){
$catname=$row['subcat_name'];
return l($catname);
}
}

/////   basic info
$rc = mysql_query("select * from `deals` where id='$_GET[id]'");
$row=mysql_fetch_array($rc);

////// direct link
$showme ="http://";
$showme .= $_SERVER['HTTP_HOST'];
$showme .= "/comm/?f=Classified&aid=";
$showme .=$_GET[id];
////// template vars
$var_topic['name']=$row[title];
$var_topic['catname']=get_cat($row[cat_id]);
$var_topic['subcatname']=get_subcat($row[subcat_id]);


$var_topic['date']=turn_date($row[topic_date],ftimeordate);
$var_topic['message']=$row[content];
$var_topic['directlink']=$showme;
$var_topic['id']=(int)$_GET[id];
$var_topic['options_avail']=($row[s1]=="0"&&$row[s2]=="0"&&$row[s3]=="0"&&$row[s4]=="0"&&$row[s5]=="0"&&$row[s6]=="0"&&$row[s7]=="0")?"none":"";
$var_topic['option1_avail']=$row[s1]=="0"?"none":"";
$var_topic['option2_avail']=$row[s2]=="0"?"none":"";
$var_topic['option3_avail']=$row[s3]=="0"?"none":"";
$var_topic['option4_avail']=$row[s4]=="0"?"none":"";
$var_topic['option5_avail']=$row[s5]=="0"?"none":"";
$var_topic['option6_avail']=$row[s6]=="0"?"none":"";
$var_topic['option7_avail']=$row[s7]=="0"?"none":"";

$var_topic['permis_avail']=($row[f1]=="0"&&$row[f2]=="0"&&$row[f3]=="0"&&$row[f4]=="0")?"none":"";
$var_topic['permi1_avail']=$row[f1]=="0"?"none":"";
$var_topic['permi2_avail']=$row[f2]=="0"?"none":"";
$var_topic['permi3_avail']=$row[f3]=="0"?"none":"";
$var_topic['permi4_avail']=$row[f4]=="0"?"none":"";
$var_topic['photo_url']=$row[photo_url];

if($_SESSION["admin_type"]){
    $var_topic['edit_btn']='1'; //admin - show edit button     
}

$var_author['friendsnum']=get_user_data(friends_num,$row[user_id]);
$var_author['reviewsnum']=get_user_data(reviews_num,$row[user_id]);
$var_author['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
$var_author['id']=$row[user_id];
$var_author['name']=get_user_data(nameORemail,$row[user_id]);



////// replies
	$rc="select * from `deals_reply` where topic_id='$_GET[id]' ";
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
			
		$var_reply[$i]['id']=$row[id];
		$var_reply[$i]['date']=turn_date($row[reply_date],ftimeordate);
		$var_reply[$i]['message']=$row[content];
        if($_SESSION["admin_type"]){
            $var_reply[$i]['edit_btn']='1'; //admin - show edit button     
        }
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
$smarty->display('comm/classified/detail.tpl');
?>
