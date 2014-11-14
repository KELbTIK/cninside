<?php 
/**
 * MeePlace Event Search
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


////////////GET
$city=!empty($_GET['city'])?$_GET['city']:0;
$fsort=!empty($_GET['fsort'])?$_GET['fsort']:"date";
$time=!empty($_GET['time'])?$_GET['time']:"all";
$cat=!empty($_GET['cat'])?$_GET['cat']:"0";
$page=!empty($_GET['page'])?$_GET['page']:"1";
$searchtext=!empty($_GET['searchtext'])?$_GET['searchtext']:"";

//////////////////////////////
function get_cat_list()
{
$rc = mysql_query("select * from `event_cat`");
while($row=mysql_fetch_array($rc)){
$temp.= "<li class=Sitem onclick=this.className='SitemS';set('cat','$row[id]')>".l($row[cat_name])."</li>";}
return $temp;
}
///////////////////////////////////////////

function get_cat($cat_id)
{
if($cat_id==0) return l("ALL");
$str="SELECT * FROM `event_cat` where id='$cat_id'";
$rc = mysql_query($str);
$row=mysql_fetch_array($rc);
return l($row['cat_name']);
}
/////////////////////////////////////////////////////////////////////////////////////////
// DISPLAY  Event list
$rc="select * from `event` where 1=1 and `approved`=1 ";
//////  cat
if($cat!=0)  $rc.=" and category='$cat' ";
/////  time
if($time!='all') {
	if($time=='today')
	{
		$nowF=date(Ymd)."000000";
		$nowT=date(Ymd)."240000";
	}
	elseif($time=='tomorrow')
	{
		$now=date(Ymd)+1;
		$nowF=$now."000000";
		$nowT=$now."240000";	
	}
	elseif($time=='thisweekend')
	{
		$now=date(Ymd);
		$wd=date(N);
		$nowf=$now+(6-$wd);
		$nowt=$now+(7-$wd);
		$nowF=$nowf."000000";
		$nowT=$nowt."240000";
	}
	elseif($time=='thisweek')
	{
		$now=date(Ymd);
		$wd=date(N);
		$nowf=$now-($wd-1);
		$nowt=$now+(7-$wd);
		$nowF=$nowf."000000";
		$nowT=$nowt."240000";	
	}
	elseif($time=='nextweek')
	{
		$now=date(Ymd);
		$wd=date(N);
		$nowf=$now-($wd-1)+7;
		$nowt=$now+(7-$wd)+7;
		$nowF=$nowf."000000";
		$nowT=$nowt."240000";		
	}
	elseif($time=='thismonth')
	{
		$now=date(Ym);
		$nowF=$now."00000000";
		$nowT=$now."31240000";	
	}
$rc.=" and ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT'))  ";
}
///////search text
if($searchtext)
 $rc.=" and (`event_name` LIKE '%$searchtext%' OR `where` LIKE '%$searchtext%' OR `whatwhy`  LIKE '%$searchtext%' ) ";


////////city
if($city!=0)
$rc.=" and  location=$city ";

//////   sort
if($fsort=='date')
{
	$rc.=" ORDER BY `date_from` DESC  ";
}
elseif($fsort=='mostpopular')
{
	$rc.=" ORDER BY `reviews_num` DESC ";
}
elseif($fsort=='recentlyadded')
{
	$rc.=" ORDER BY `id` DESC ";
}
elseif($fsort=='free')
{
	$rc.=" and (free='1' or (priceFrom='0' and priceTo='0'))";
	$rc.=" ORDER BY `date_from` DESC  ";
}
//////////////////////////end 
$rows=mysql_query($rc);
$rows=mysql_num_rows($rows);	 // 算总数

$limitfrom=($page-1)*10;	//从
$rc.="  LIMIT $limitfrom,10";	//从	每页显示数
$rc= mysql_query($rc);

$limitto=mysql_num_rows($rc);	//该次查询总数
$i=0;
$var_list=array();
	while($row=mysql_fetch_array($rc))
	{
		$var_lists['found']='yes';
		$var_list[$i]['picurl']='e_'.$row[photo_url];
		$var_list[$i]['id']=$row[id];
		$var_list[$i]['name']=utf_substr($row[event_name],50);
		$var_list[$i]['date']=event_time($row[date_from],$row[date_to]);
		$var_list[$i]['catname']=get_cat($row[category]);
		$var_list[$i]['where']=utf_substr(str_replace("<br />"," ",$row[where]),60);
		$var_list[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$row[whatwhy]),300);
		$var_list[$i]['reviewnum']=$row['reviews_num'];
		$var_list[$i]['userid']=$row[user_id];
		$var_list[$i]['username']=get_user_data(nameORemail,$row[user_id]);
		
		$i+=1;
	  }
	  $var_lists['pager']=get_page_list($_GET[page],$rows,10);
	  $var_lists['limitfrom']=$limitfrom+1;
	  $var_lists['limitto']=$limitfrom+$limitto;
	  $var_lists['itemsnum']=$rows;
////////////////////////
$up=mysql_query("select * from `event` where  `approved`=1 ORDER BY `id` DESC  LIMIT 0 , 10 ") or die('Error!');	
$i=0;
$var_new=array();
  while($mup=mysql_fetch_array($up)){
	    $var_new[$i]['picurl']='e_'.$mup[photo_url];
		$var_new[$i]['id']=$mup[id];
		$var_new[$i]['name']=utf_substr($mup[event_name],30);
		$var_new[$i]['date']=turn_date($mup[date_from],fdate);
		$var_new[$i]['catname']=get_cat($mup[category]);
		$var_new[$i]['whatwhy']=utf_substr(str_replace("<br />"," ",$mup[whatwhy]),60);
	
	$i+=1;
  }

$var_search['searchtext']=stripslashes($searchtext);
$var_search['catid']=$cat;
$var_search['catname']=get_cat($cat);
$var_search['page']=$page;
$var_search['time']=$time;
$var_search['fsort']=$fsort;
$var_search['catlistli']=get_cat_list();
$var_search['time']=$time;



$page_title =l('Events Search').' | '.get_sitename();  //


$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_list",$var_list); 
$smarty->assign("var_new",$var_new);
$smarty->assign("var_search",$var_search);
$smarty->assign("page_title",$page_title); 
$smarty->display('event/search.tpl');

?>