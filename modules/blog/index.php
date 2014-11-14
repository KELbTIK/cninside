<?php 
/**
 * MeePlace Event homepage
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
include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

///////////////////////////////////////////

function get_cat($cat_id)
{
$str="SELECT * FROM `event_cat` where id='$cat_id'";
$rc = mysql_query($str);
$row=mysql_fetch_array($rc);
return l($row['cat_name']);
}

 //today
$nowF=date(Ymd)."000000";
$nowT=date(Ymd)."240000";
$query="select * from `event` where `approved`=1 and ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT'))  ORDER BY `reviews_num` DESC   LIMIT 0 , 4";
$up=mysql_query($query) or die($query);	
  $i=0;
  $var_today=array();
  while($row=mysql_fetch_array($up)){
		$var_today[$i]['picurl']='e_'.$row[photo_url];
		$var_today[$i]['id']=$row[id];
		$var_today[$i]['name']=utf_substr($row[event_name],23);
		$var_today[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_today[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),50);
		$var_today[$i]['reviewsnum']=$row[reviews_num];
	  $i+=1;
  }
 // tomorrow
$now=date(Ymd)+1;
$nowF=$now."000000";
$nowT=$now."240000";

$up=mysql_query("select * from `event` where `approved`=1 and  ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT')) ORDER BY `reviews_num` DESC   LIMIT 0 , 4") or die('Error: tomorrow!');	
  $i=0;
  $var_tomorrow=array();
  while($row=mysql_fetch_array($up)){
		$var_tomorrow[$i]['picurl']='e_'.$row[photo_url];
		$var_tomorrow[$i]['id']=$row[id];
		$var_tomorrow[$i]['name']=utf_substr($row[event_name],23);
		$var_tomorrow[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_tomorrow[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),50);
		$var_tomorrow[$i]['reviewsnum']=$row[reviews_num];
	  $i+=1;
  }
  //THIS WEEKEND
$now=date(Ymd);
$wd=date(N);

$nowf=$now+(6-$wd);
$nowt=$now+(7-$wd);
$nowF=$nowf."000000";
$nowT=$nowt."240000";
$up=mysql_query("select * from `event` where `approved`=1 and  ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT'))  ORDER BY `reviews_num` DESC   LIMIT 0 , 4") or die('Error: this weekend!');	
  $i=0;
  $var_thisweekend=array();
  while($row=mysql_fetch_array($up)){
		$var_thisweekend[$i]['picurl']='e_'.$row[photo_url];
		$var_thisweekend[$i]['id']=$row[id];
		$var_thisweekend[$i]['name']=utf_substr($row[event_name],23);
		$var_thisweekend[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_thisweekend[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),50);
		$var_thisweekend[$i]['reviewsnum']=$row[reviews_num];
	  $i+=1;
  }
 //THIS WEEK
$now=date(Ymd);
$wd=date(N);

$nowf=$now-($wd-1);
$nowt=$now+(7-$wd);
$nowF=$nowf."000000";
$nowT=$nowt."240000";
$up=mysql_query("select * from `event` where  `approved`=1 and ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT'))  ORDER BY `reviews_num` DESC   LIMIT 0 , 4") or die('Error: this week!');	
  $i=0;
  $var_thisweek=array();
  while($row=mysql_fetch_array($up)){
		$var_thisweek[$i]['picurl']='e_'.$row[photo_url];
		$var_thisweek[$i]['id']=$row[id];
		$var_thisweek[$i]['name']=utf_substr($row[event_name],23);
		$var_thisweek[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_thisweek[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),50);
		$var_thisweek[$i]['reviewsnum']=$row[reviews_num];
	  $i+=1;
  }
//next week
$now=date(Ymd);
$wd=date(N);

$nowf=$now-($wd-1)+7;
$nowt=$now+(7-$wd)+7;
$nowF=$nowf."000000";
$nowT=$nowt."240000";
$up=mysql_query("select * from `event` where  `approved`=1 and ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT')) ORDER BY `reviews_num` DESC   LIMIT 0 , 4") or die('Error: next week!');	
  $i=0;
  $var_nextweek=array();
  while($row=mysql_fetch_array($up)){
		$var_nextweek[$i]['picurl']='e_'.$row[photo_url];
		$var_nextweek[$i]['id']=$row[id];
		$var_nextweek[$i]['name']=utf_substr($row[event_name],23);
		$var_nextweek[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_nextweek[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),50);
		$var_nextweek[$i]['reviewsnum']=$row[reviews_num];
	  $i+=1;
  }
// this month
$now=date(Ym);
$nowF=$now."00000000";
$nowT=$now."31240000";

$up=mysql_query("select * from `event` where  `approved`=1 and ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT')) ORDER BY `reviews_num` DESC   LIMIT 0 , 4") or die('Error: this month!');	
  $i=0;
  $var_thismonth=array();
  while($row=mysql_fetch_array($up)){
		$var_thismonth[$i]['picurl']='e_'.$row[photo_url];
		$var_thismonth[$i]['id']=$row[id];
		$var_thismonth[$i]['name']=utf_substr($row[event_name],23);
		$var_thismonth[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_thismonth[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),50);
		$var_thismonth[$i]['reviewsnum']=$row[reviews_num];
	  $i+=1;
  }
	  
//HOT THIS WEEK
$now=date(Ymd);
$wd=date(N);

$nowf=$now-($wd-1);
$nowt=$now+(7-$wd);
$nowF=$nowf."000000";
$nowT=$nowt."240000";
$up=mysql_query("select * from `event` where `approved`=1 and  ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT'))  ORDER BY `reviews_num` DESC   LIMIT 0 , 10") or die('Error: hot this week!');	
  $i=0;
  $var_hotthisweek=array();
  while($row=mysql_fetch_array($up)){
		$var_hotthisweek[$i]['picurl']='e_'.$row[photo_url];
		$var_hotthisweek[$i]['id']=$row[id];
		$var_hotthisweek[$i]['name']=utf_substr($row[event_name],50);
		$var_hotthisweek[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_hotthisweek[$i]['catname']=get_cat($row[category]);
		$var_hotthisweek[$i]['where']=utf_substr(str_replace("<br />"," ",$row[where]),60);
		$var_hotthisweek[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),300);
		$var_hotthisweek[$i]['reviewsnum']=$row[reviews_num];
		$var_hotthisweek[$i]['userid']=$row[user_id];
		$var_hotthisweek[$i]['username']=get_user_data(nameORemail,$row[user_id]);
	  $i+=1;
  }
//Recent Added event
	  $up=mysql_query("select * from `event`  where  `approved`=1 ORDER BY `id` DESC  LIMIT 0 , 10 ") or die('Error: Recent added!');	
	    $i=0;
	    $var_newevent=array();
	  while($mup=mysql_fetch_array($up)){
		$var_newevent[$i]['picurl']='e_'.$mup[photo_url];
		$var_newevent[$i]['id']=$mup[id];
		$var_newevent[$i]['name']=utf_substr($mup[event_name],30);
		$var_newevent[$i]['date']=turn_date($mup[date_from],fdate);
		$var_newevent[$i]['catname']=get_cat($mup[category]);
		$var_newevent[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$mup[whatwhy]),60);
		$var_newevent[$i]['reviewsnum']=$mup[reviews_num];
		$var_newevent[$i]['userid']=$mup[user_id];
		$var_newevent[$i]['username']=get_user_data(nameORemail,$mup[user_id]);
	  $i+=1;
  }
	  
	  
$page_title =l('Blogs').' | '.get_sitename();  //

$smarty->assign("var_today",$var_today); 
$smarty->assign("var_tomorrow",$var_tomorrow); 
$smarty->assign("var_thisweekend",$var_thisweekend); 
$smarty->assign("var_thisweek",$var_thisweek); 
$smarty->assign("var_nextweek",$var_nextweek);
$smarty->assign("var_thismonth",$var_thismonth);
$smarty->assign("var_hotthisweek",$var_hotthisweek);
$smarty->assign("var_newevent",$var_newevent);

$smarty->assign("page_title",$page_title); 
$smarty->display('modules/blog/index.tpl');
?>