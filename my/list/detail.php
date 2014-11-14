<?php 
/**
 * MeePlace List's detail page.
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



$page=empty($_GET[page])?"1":$_GET[page];

$var['id']=$id=$_GET[id];
$user_id=get_user_data(user_id);
$query=mysql_query("select * from `list` where id='$list_name'");		

/////////////verify no id
if(empty($id))
{ echo "<script>alert('".l('Page not exist').".');history.go(-1);</script>";
exit;}
//////////////verify myself list
$query=mysql_query("select * from `list` where id='$id' ");		
if(mysql_num_rows($query)==0)
{
 echo "<script>alert('".l('Page not exist').".');history.go(-1);</script>";
exit;
}

$row=mysql_fetch_array($query);
$var['list_name']=$list_name=$row[list_name];
$var['list_desc']=$list_desc=$row[list_desc];
$var['user_create']=$user_create=$row[user_id];
$var['user_create_name']=get_user_data(nameORemail,$user_create);
$var['date_create']=$date_create=$row[date_created];
$var['date_create_formated']=turn_date($date_create,fdatetime);
///////////////////////////////////////////////////////////////
function get_cat($id)
{
$str="SELECT * FROM `business_category` where cat_id='$id'";
$rc = mysql_query($str);
	$row=mysql_fetch_array($rc);
		return $row['cat_name'];
}
///////////////////////////////////////////////////////////////
function get_subcat($id)
{
$str="SELECT * FROM `business_sub_category` where b_sub_cat_id='$id'";
$rc = mysql_query($str);
	$row=mysql_fetch_array($rc);
		return $row['b_subcat_name'];
}


/////////////////////////////////////////////////////////

$rc = "SELECT * FROM `list_item` where list_id='$id' ";

		$rows=mysql_query($rc);
		$rows=mysql_num_rows($rows);	

$limitfrom=($page-1)*10;	
$rc.="  LIMIT $limitfrom,10";
$rc= mysql_query($rc);
  $i=0;
$limitto=mysql_num_rows($rc);	
		while($row=mysql_fetch_array($rc))
		{
			$var_lists['found']='yes';
				$inrc=("SELECT * FROM `business`  where business_id='$row[business_id]' ");
				$query=mysql_query($inrc);
					$inrow=mysql_fetch_array($query);
					$itemnum=mysql_num_rows($query);
				$var_list[$i]['id']= $row[business_id];
				$var_list[$i]['name']=$inrow[business_name];
                $var_list[$i]['bizurl']=$inrow[permalink];
				$var_list[$i]['rating']= $inrow[rating];
				$var_list[$i]['ratingmod']=get_rating_img($inrow[rating]);
				$var_list[$i]['catname']= get_cat($inrow[cat_id]);
				$var_list[$i]['subcatname']=get_subcat($inrow[sub_cat_id]);
				$var_list[$i]['location']= get_city_name($inrow[city_id]);
		  $i+=1;
		}
			$var_lists['pager']=get_page_list($_GET[page],$rows,10);
	$var_lists['limitfrom']=$limitfrom+1;
	$var_lists['limitto']=$limitfrom+$limitto;
	$var_lists['itemsnum']=$rows;
	
$page_title = l('List Detail').' | '.get_sitename();  //

$smarty->assign("page_title",$page_title); 
$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_list",$var_list); 
$smarty->assign("var",$var); 
$smarty->display('my/list/detail.tpl');
?>