<?php
/**
 * MeePlace Special Offer's threads list
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
    $str="SELECT * FROM `business_category` where cat_id='$cat_id'";
    $rc = mysql_query($str);
    while($row=mysql_fetch_array($rc)){
    $catid=$row['cat_id'];
    $catname=$row['cat_name'];
    return l($catname);
    }
}

    $page=empty($_GET[page])?"1":$_GET[page];
	$st=strip_tags(trim($_GET['st']));
    $cat=strip_tags(trim($_GET['cat']));
    $id=strip_tags(trim($_GET['id'])); 
	
/*	$offerObj= new MP_SpecialOffers();
	if($_GET['cat']!=0) $offerObj->categoryId=$_GET['cat'];
	if($_GET['st']) $offerObj->otherConditions=" b.business_name like '%{$_GET['st']}%' ";
	//$offerObj->displayNum=22;
	$offerObj->offset=($_GET['page']-1)*$offerObj->displayNum;	//从
	//$rows=0;
	$pagerows=0;
    var_dump($rows);
	$var_list=$offerObj->getList($rows,$pagerows);
    var_dump($rows);
    var_dump($pagerows); 
	if($rows) $var_lists['found']='yes';
	$var_lists['pager']=get_page_list($_GET['page'],$rows,$offerObj->displayNum,",0");
	$var_lists['limitfrom']=$offerObj->offset+1;
	$var_lists['limitto']=$offerObj->offset+$pagerows;
	$var_lists['itemsnum']=$rows; */
    
    if($id) {
              $biz_condition = " and o.business_id='".$id."'";
    }
    
    if($cat) $categoryId_query="and b.cat_id='".$cat."'";
    //    if($this->subCategoryId) $subCategoryId_query="and b.sub_cat_id=".$this->subCategoryId;
    if($st)  $otherConditions_query=" b.business_name like '%".$st."%' ";
    
    $rc="SELECT * FROM `special_offer` as o, `business` as b WHERE o.business_id = b.business_id $categoryId_query $otherConditions_query ORDER BY `offer_id` DESC";
    
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    
    $limitfrom=($page-1)*10;
    $rc.="  LIMIT $limitfrom,10"; 
    $rc= mysql_query($rc);
    
    $limitto=mysql_num_rows($rc); 
    $i=0;
    while($row=mysql_fetch_array($rc))
    {
      $var_lists['found']='yes';
      $var_list[$i]= $row;
      $var_list[$i]['offer_descriptionNoTag']= str_replace("<br />","\n",$row['offer_description']);
      $var_list[$i]['offer_submit_time']=turn_date($row['offer_submit_time'],'fdate');
      $var_list[$i]['city_name']=get_city_name($var_list[$i]['city_id']);
      $var_list[$i]['cat_name']=l(get_biz_cat($var_list[$i]['cat_id']));
      $var_list[$i]['subcat_name']=l(get_biz_subcat($var_list[$i]['sub_cat_id']));
      $var_list[$i]['ratingmod']=get_rating_img($var_list[$i]['rating']);
      
      $i+=1;
    }
    
    $var_lists['pager']=get_page_list($page,$rows,10);
    $var_lists['limitfrom']=$limitfrom+1;
    $var_lists['limitto']=$limitfrom+$limitto;
    $var_lists['itemsnum']=$rows;

	//////////////////////////////////////////

$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_list",$var_list); 
$smarty->display('offer/offer/getlist.tpl');
?> 