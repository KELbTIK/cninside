<?php
/**
 * MeePlace Special Offer's manage list
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
return $catname;
}
}


	$st=strip_tags(trim($_GET['st']));
	
	
	
	$bizObj= new MP_Business();
	$bizObj->biz_id = $_GET['id'];
	//judge if is owner
    if(!$_SESSION["admin_type"]){ 
        if($bizObj->get('user_id')!=get_user_data('user_id'))
            die('Not your business?');
    }
	$var_biz['business_name']=$bizObj->get('business_name');
	$var_biz['permalink']=$bizObj->get('permalink');
	
	
	
	$offerObj= new MP_SpecialOffers();
	if($_GET['id']!=0) $offerObj->businessId=$_GET['id'];
	else die(l('ERROR!'));
	$offerObj->displayNum=20;
	$offerObj->offset=($_GET['page']-1)*$offerObj->displayNum;
	$rows=0;
	$pagerows=0;
	$var_list=$offerObj->getList($rows,$pagerows);
	
	
	
	if($rows) $var_lists['found']='yes';
	$var_lists['pager']=get_page_list($_GET['page'],$rows,$offerObj->displayNum,",0");
	$var_lists['limitfrom']=$offerObj->offset+1;
	$var_lists['limitto']=$offerObj->offset+$pagerows;
	$var_lists['itemsnum']=$rows;
	
	//////////////////////////////////////////


$smarty->assign("var_lists",$var_lists); 
$smarty->assign("var_list",$var_list); 
$smarty->assign("var_biz",$var_biz); 
$smarty->display('offer/manage/getlist.tpl');

?> 