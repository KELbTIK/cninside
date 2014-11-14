<?php 
/**
 * MeePlace Event detail page
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
///////////GET

$id=$_GET['id'];
$page=!empty($_GET['page'])?$_GET['page']:"1";


/////////////verify no id
if(empty($id))
{ echo "<script>alert('Page not exist.');history.go(-1);</script>";
exit;}



// find
$find=mysql_query("select * from `event` where `id`='$id' and `approved`=1") or die('Query Error!');
//////////////verify myself list
if(mysql_num_rows($find)==0)
{
 echo "<script>alert('Page not exist.');history.go(-1);</script>";
exit;
}

$row=mysql_fetch_array($find);

$page_title =$row['event_name'].' | '.get_sitename();  //

/////////////photo sum////////

$ps=mysql_query("select * from `event_photo` where `business_id`='$id'") or die('Query Error!');
//////////////verify myself list
$var_ps=$ps=mysql_num_rows($ps);

///////////////////////////////////////////

function get_cat($cat_id)
{
$str="SELECT * FROM `event_cat` where id='$cat_id'";
$rc = mysql_query($str);
$row=mysql_fetch_array($rc);
return $row['cat_name'];
}
////////////////////////////////////////////


///////////////  if  comment
if($_GET[f]=='reply')
{
@session_start();
if($_SESSION["email"] or $_SESSION["display_name"])
{
		
		$rc = mysql_query("select * from `event` where id='$id' and `approved`=1");
		$row=mysql_fetch_array($rc);
		$reviews_num=$row[reviews_num]+1;
		$reviews_num;
		
		$event_desc=nl2br(strip_tags(trim($_POST['event_desc'])));
		$reply_date=date(YmdHis);
		$user_id=get_user_data(user_id);
		$event_id=$id;
		
		$query="insert into `event_discuss` (`event_id`,`user_id`,`event_desc`,`reply_date`) values ('$event_id','$user_id','$event_desc','$reply_date')";
		if(!empty($event_desc)){
		$result=mysql_query($query);
		//update reviews num
		$query="UPDATE `event` set  `reviews_num`='$reviews_num'  where `id`='$id'";
		$result=mysql_query($query);
		///////user 's  review number //////////
		$row1 = mysql_fetch_array(mysql_query("select * from `user` where user_id='$user_id'"));
		$reviews_num=$row1[reviews_num]+1;
		$query="UPDATE `user` set reviews_num='$reviews_num' where user_id='$user_id'";
		$result=mysql_query($query);
		//////////end review number adding////////
		}
}

header("Location: ../event/detail.php?id=".$id);
exit;
}



/////////// web link
if(!empty($row[site_url])&&$row[site_url]!='http://')
$var_biz['link1']= " [ <a  href=\"$row[site_url]\" target=\"_blank\" rel=\"external nofollow\">Event Site</a> ] ";
$temp=1;
 if(!empty($row[ticket_url])&&$row[ticket_url]!='http://')
 {
	// if($temp==1) $var_biz['link2'].= "<br>";
$var_biz['link2']=  " [ <a  href=\"$row[ticket_url]\" target=\"_blank\" rel=\"external nofollow\">Tickets</a> ] ";
 }
////////// price

if($row[free]==1)
$var_biz['price']= l('Free');
else{
    if($row['priceFrom']<$row['priceTo'])
	$var_biz['price']= "$".$row['priceFrom']."  to  $".$row['priceTo'];
	else{
	if($row['priceFrom']!=0)
	$var_biz['price']= "$".$row['priceFrom'];
	else
	$var_biz['price']= l('Free');
	}}
	


$var_me['email']=$_SESSION['email'];

$var_biz['id']=$id;
$var_biz['bizname']=$row['event_name'];
$var_biz['catid']=$row['category'];
$var_biz['catname']=l(get_cat($row['category']));
$var_biz['when']=event_time($row['date_from'],$row['date_to']);
$var_biz['where']=$row['where'];
$var_biz['whatwhy']=$row['whatwhy'];
$var_biz['reviewnum']=$row['reviews_num'];
$var_biz['picurl']='e_'.$row['photo_url'];

$var_biz['zoom']=!empty($row['zoom'])?$row['zoom']:0;
$var_biz['mapy']=!empty($row['mapy'])?$row['mapy']:"0";
$var_biz['mapx']=!empty($row['mapx'])?$row['mapx']:"0";
$var_biz['y']=!empty($row['y'])?$row['y']:"0";
$var_biz['x']=!empty($row['x'])?$row['x']:"0";

$var_biz['location']=get_city_name($row['location']);
$var_biz['province']=get_province_name($row['location']);
$var_biz['country']=get_country_name($row['location']);


// set up url for related biz
if($row['location'] && $row['related_biz_id']){

    $result = mysql_query("SELECT permalink, business_name FROM business WHERE business_id='".$row['related_biz_id']."'"); 
    if($result){
        $row2 = mysql_fetch_array($result);
        $var_biz['related_biz_url']= '/'._BIZ_DIR_ . '/'. $row2['permalink'];
        $var_biz['related_biz'] =  $row2['business_name'];
    }
}

if($_SESSION["admin_type"]){
        $var_biz['edit_btn']='1'; //admin or moderator. Show edit biz, edit comment, delete comment buttons       
}
$var_author['picurl']='p_'.get_user_data(photo_url,$row['user_id']);
$var_author['id']=$row['user_id'];
$var_author['name']=get_user_data(nameORemail,$row['user_id']);


// review start ////////////////
$rc="select * from `event_discuss` where event_id='$id' ";
				
  $rows=mysql_query($rc);
  $rows=mysql_num_rows($rows);	 
  $limitfrom=($page-1)*10;	
  $rc.="  ORDER BY `reply_date` DESC ";
  $rc.="  LIMIT $limitfrom,10";	
  @$limitto=mysql_num_rows($rc);
  $rc= mysql_query($rc);
  $i=0;
  $var_reply=array();
  while($row=mysql_fetch_array($rc))
  {
	  $var_lists['found']='yes';
	  
		$var_reply[$i]['userid']=$row['user_id'];
		$var_reply[$i]['username']=get_user_data(nameORemail,$row['user_id']);
		$var_reply[$i]['friendsnum']=get_user_data(friends_num,$row['user_id']);
		$var_reply[$i]['reviewsnum']=get_user_data(reviews_num,$row['user_id']);
		$var_reply[$i]['picurl']='p_'.get_user_data(photo_url,$row['user_id']);
			
		$var_reply[$i]['id']=$row['talk_reply_id'];
		$var_reply[$i]['date']=turn_date($row['reply_date'],ftimeordate);
		$var_reply[$i]['message']=$row['event_desc'];
        if($_SESSION["admin_type"]){
            $var_reply[$i]['edit_btn']='1'; //admin or moderator. Show edit /delete event comments
            $var_reply[$i]['comment_id']=$row['event_discuss_id'];      
        }
	  $i+=1;
  }
	$var_lists['pager']=get_page_list($_GET['page'],$rows,10);
	$var_lists['limitfrom']=$limitfrom+1;
	$var_lists['limitto']=$limitfrom+$limitto;
	$var_lists['itemsnum']=$rows;
	
	
//  in
$result=mysql_query("SELECT * FROM `event_in` where event_id='$id' ORDER BY `id` DESC limit 0,30");	
$var_ins['num']= mysql_num_rows($result);
$i=0;
$var_in=array();
while($row=mysql_fetch_array($result))
{
	$var_in[$i]['picurl']='p_'.get_user_data(photo_url,$row['user_id']);
	$var_in[$i]['userid']=$row['user_id'];
	$var_in[$i]['username']=utf_substr(get_user_data(nameORemail,$row['user_id']),35);
	 $i+=1;
}
// cool
$result=mysql_query("SELECT * FROM `event_cool` where event_id='$id' ORDER BY `id` DESC limit 0,30");	
$var_cools['num']= mysql_num_rows($result);
$i=0;
$var_cool=array();
while($row=mysql_fetch_array($result))
{
	$var_cool[$i]['picurl']='p_'.get_user_data(photo_url,$row['user_id']);
	$var_cool[$i]['userid']=$row['user_id'];
	$var_cool[$i]['username']=utf_substr(get_user_data(nameORemail,$row['user_id']),35);
	$i+=1;
}
// review end ////////////////
// recently added events
 $up=mysql_query("select * from `event` where  `approved`=1 ORDER BY `id` DESC  LIMIT 0 , 5 ") or die('Error!');	
 $i=0;
 $var_new=array();
  while($mup=mysql_fetch_array($up)){
	 $var_new[$i]['picurl']= 'e_'.$mup['photo_url'];
	 $var_new[$i]['id']= $mup['id'];
	 $var_new[$i]['name']= utf_substr($mup['event_name'],30);
	 $var_new[$i]['date']= turn_date($mup['date_from'],fdate);
	 $var_new[$i]['whatwhy']= utf_substr(str_replace("<br />"," ",$mup['whatwhy']),60);
     if($_SESSION["admin_type"]){
        $var_new[$i]['edit_btn']='1'; //admin edit       
     }
	 $i+=1;
  }
//recently added events end ///


//$smarty->debugging = true;
$var_apikey=get_key();
$admin_type = $_SESSION[admin_type];
$smarty->assign("admin_type",$admin_type); 
$smarty->assign("var_apikey",$var_apikey); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_reply",$var_reply); 
$smarty->assign("var_author",$var_author);
$smarty->assign("var_ps",$var_ps);
$smarty->assign("var_biz",$var_biz);
$smarty->assign("var_ins",$var_ins);
$smarty->assign("var_in",$var_in);
$smarty->assign("var_cools",$var_cools);
$smarty->assign("var_cool",$var_cool);
$smarty->assign("var_new",$var_new);

$smarty->assign("page_title",$page_title); 
$smarty->display('event/detail.tpl');
?>