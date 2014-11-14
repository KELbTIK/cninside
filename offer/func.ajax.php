<?php 
/**
 * MeePlace Special Offers Functional AJAX.
 * @package MeePlace
 * @subpackage Special Offers
 
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


//Read Biz Info
$biz_id=$_REQUEST['businessId'];
$query="select * from `business` where `business_id`= '$biz_id' and `approved`=1 limit 1";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);
if(empty($row[business_name])) {
	die(l('ERROR!'));
}

////////Is Owner?/////////
    
if(!$_SESSION["admin_type"]){
    if(empty($_SESSION['email'])) 
        die("{'S':'NotLogin'}");
    elseif(get_user_data('user_id',$row['user_id'])!=get_user_data('user_id'))
        die("{'S':'NotOwner'}");
    
}

// Special Offers for this biz
$offerObj= new MP_SpecialOffers();


if($_REQUEST['type']=='delete')
{
	if($offerId=$offerObj->deleteOne($_REQUEST['offerId']))
	{
		die("{'S':'1','offerId':'".$offerId."'}");
	}
	else
	{
		die("{'S':'0'}");
	}
}


if($_REQUEST['type']=='update')
{
	if($offerId=$offerObj->updateOne($_REQUEST['offerId'],$_REQUEST['businessId'],$_REQUEST['offerTitle'],$_REQUEST['offerDescription'],$_REQUEST['offerUrl'],$_REQUEST['offerPhone']))
	{
		die("{'S':'1','offerId':'".$offerId."'}");
	}
	else
	{
		die("{'S':'0'}");
	}
}


if($_REQUEST['type']=='insert')
{
	if($offerId=$offerObj->insertOne($_REQUEST['businessId'],$_REQUEST['offerTitle'],$_REQUEST['offerDescription'],$_REQUEST['offerUrl'],$_REQUEST['offerPhone']))
	{
		die("{'S':'1','offerId':'".$offerId."'}");
	}
	else
	{
		die("{'S':'0'}");
	}
}



if($_REQUEST['type']=='load')
{
	$offerObj->businessId=$_REQUEST['businessId'];
	$offerArray=$offerObj->getLatestOne();
	
	$var_biz['offer_id']=$offerArray['offer_id'];
	$var_biz['offer_description']=$offerArray['offer_description'];
	$var_biz['offer_descriptionNoTag']=str_replace("<br />","\n",$offerArray['offer_description']);
	$var_biz['offer_url']=$offerArray['offer_url'];
	$var_biz['offer_phone']=$offerArray['offer_phone'];
	$var_biz['offer_submit_time']=turn_date($offerArray['offer_submit_time'],'fdate');
	$var_biz['title']=$offerArray['title'];
	$var_biz['S']='1';
	
	echo json_encode($var_biz);
}
?>