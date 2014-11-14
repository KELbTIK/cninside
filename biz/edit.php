<?php 
/**
 * MeePlace Business edit popup.
 * @package MeePlace
 * @subpackage Business
 
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
include_once(dirname(__FILE__).'/../inc/func/get_sth.php');
include_once(_ABSPATH_.'/inc/func/header.php');



$biz_id=$_GET['id'];
$msg='';

$query="select * from `business` where `business_id`= '$biz_id' and `approved`=1";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);
$name=$row['business_name'];

///////////////////////page exist///////////////////////

if(empty($row[business_name])) {
  $msg= l("Business not exist!");
}

//////////////// user loged in?   my business? /////////////////////////////

if(empty($_SESSION['email'])) {
	$msg=l("Please Login!"); 
}

if(get_user_data('user_id',$row['user_id'])!=get_user_data('user_id')) {
	$msg=l("This business is not yours!");
}


//template vars.
$page_title =l('Edit business').' | '.get_sitename();  //

$var_me['user_id']=get_user_data('user_id');  
$var_me['email']=$_SESSION[email];  // my email
$var_me['name']=get_user_data('nameORemail');  // my name

$var_owner['user_id']=$row['user_id'];   // current owner user id
$var_owner['email']=get_user_data('email',$row['user_id']) ; // current owner email
$var_owner['name']=get_user_data('nameORemail',$row['user_id']) ; // current owner name



$var_biz['id']=$biz_id;
$var_biz['bizname']=$row['business_name'];
$var_biz['permalink']=$row['permalink'];
$var_biz['zip']=$row['zip'];
$var_biz['zoom']=!empty($row['zoom'])?$row['zoom']:0;
$var_biz['mapy']=!empty($row['mapy'])?$row['mapy']:"0";
$var_biz['mapx']=!empty($row['mapx'])?$row['mapx']:"0";
$var_biz['y']=!empty($row['y'])?$row['y']:"0";
$var_biz['x']=!empty($row['x'])?$row['x']:"0";
$var_biz['ratingmod']=get_rating_img($row['rating']);
$var_biz['reviewnum']=$row['reviews_num'];
$var_biz['click']=$row['click'];
$var_biz['picurl']='b_'.$row['photo_url'];
$var_biz['catid']=$row['cat_id'];
$var_biz['catname']=get_biz_cat($row['cat_id']);
$var_biz['subcatid']=$row['sub_cat_id'];
$var_biz['subcatname']=get_biz_subcat($row['sub_cat_id']);
$var_biz['catid2']=$row['cat_id2'];
$var_biz['catname2']=get_biz_cat($row['cat_id2']);
$var_biz['subcatid2']=$row['sub_cat_id2'];
$var_biz['subcatname2']=get_biz_subcat($row['sub_cat_id2']);
$var_biz['catid3']=$row['cat_id3'];
$var_biz['catname3']=get_biz_cat($row['cat_id3']);
$var_biz['subcatid3']=$row['sub_cat_id3'];
$var_biz['subcatname3']=get_biz_subcat($row['sub_cat_id3']);

$var_biz['add1']=$row['business_add1'];
$var_biz['add2']=$row['business_add2'];
$var_biz['phone']=$row['business_phone'];
$var_biz['cityid']=$row['city_id'];
$var_biz['city']=get_city_name($row['city_id']);
$var_biz['provinceid']=get_province_id($row['city_id']);
$var_biz['province']=get_province_name($row['city_id']);
$var_biz['c_name']=get_country_name($row['city_id']);
$var_biz['video_url']=!empty($row['video_url'])?$row['video_url']:"";

$var_biz['web']=!empty($row['business_web'])?$row['business_web']:"";
$var_biz['bizurl']=advanced_biz_name($row['business_id']);

$var_biz['user_id']=$row['user_id'];  //owner

$var_biz['description']=$row['description'];
$var_biz['price_range']=$row['price_range'];
$var_biz['open_hours']=$row['open_hours'];

$var_biz['openhours']='0';
if($var_biz['open_hours'] && $var_biz['open_hours']!=',,,,,,,,') // Custom Hours
{
	$ar=explode(",",$var_biz['open_hours']);  
	foreach($ar  as  $k=> $v)   
	{
		$var_biz['wk'.$k]=$v;
	}
	$var_biz['custom_hours']='1';
	$var_biz['openhours']='2';
}
elseif($row['from_hour'] || $row['to_hour'] || $row['weeks']) // Regular Hours
{
	$var_biz['from_hour']=$row['from_hour'];
	$var_biz['to_hour']=$row['to_hour'];
	$ar=explode(",",$row['weeks']);  
	foreach($ar   as   $s)   
	{
		$var_biz['week'.$s]=$s;
	}
	$var_biz['regular_hours']='1';
	$var_biz['openhours']='1';
}//end regular hours


//////////////////// biz category's items ////////////////////////////

// check to see if category for this business has any items/custom fields
$cat_has_items = items_is_whos($biz_id);  
    
$query="SELECT A.value,B.title FROM `business_feature_item` as A,business_sub_category_item as B WHERE A.item_id=B.id and A.status=1 and A.business_id=$biz_id";

$result=mysql_query($query);
// get items/customer category values for this business
$bitems = array();
while($row_item = mysql_fetch_assoc($result))
    {
        
        if (strpos ($row_item[value], '|')){
           $row_item[value] = explode('|', $row_item[value]); 
            $row_item[checkbox] = count($row_item[value]);           
        }else{
           $row_item[checkbox] = 0; 
        }
    $bitems[] = $row_item;
    
    }


/////////POST

if (!empty($_POST) and $msg=='') {
	$permalink=strip_tags(trim($_POST['permalink']));
	$add1=strip_tags(trim($_POST['add1']));
	$add2=strip_tags(trim($_POST['add2']));
    $biz_city=$_POST['biz_city'];
	
	$cat_id=(int)$_POST['dhtmlgoodies_country'];
	$sub_cat_id=(int)$_POST['dhtmlgoodies_city'];
	$cat_id2=(int)$_POST['dhtmlgoodies_country2'];
	$sub_cat_id2=(int)$_POST['dhtmlgoodies_city2'];
	$cat_id3=(int)$_POST['dhtmlgoodies_country3'];
	$sub_cat_id3=(int)$_POST['dhtmlgoodies_city3'];
    // not allow to have the same main cat
    if(($sub_cat_id == $sub_cat_id2)){
        $cat_id2=0;                        
        $sub_cat_id2 =0;  
    }
    
    if(($sub_cat_id == $sub_cat_id3)){
        $cat_id3=0;                        
        $sub_cat_id3 =0;  
    }
    
    if(($sub_cat_id2 == $sub_cat_id3)){
        $cat_id3=0;                        
        $sub_cat_id3 =0;  
    } 
	
	$phone=strip_tags(trim($_POST['phone']));
	$zip=strip_tags(trim($_POST['zip']));
	$description=strip_tags(trim($_POST['description']));
	$pricerange=strip_tags(trim($_POST['pricerange']));
	$weeks='';
	$open_hours='';
	$fromhour='';
	$tohour='';
    
    $web=strip_tags(trim($_POST['web']));
    if($web && strpos($web,'http://') === false){
         $web = 'http://'. $web; 
    }
    
     $video=strip_tags(trim($_POST['video']));
    if($video && strpos($video,'http://') === false){
         $video = 'http://'. $video; 
    }
	
	if($_REQUEST['openhours']=='1') // Regular Hours
	{
		for($i=0; $i<=7; $i++)
		{
			if($_REQUEST['week'.$i])
			$weeks.=$i.',';
		}
		$fromhour=strip_tags(trim($_REQUEST['fromhour']));
		$tohour=strip_tags(trim($_REQUEST['tohour']));
	}
	elseif($_REQUEST['openhours']=='2') //Custom Hours
	{
		for($i=0; $i<=7; $i++)
		{
			if($_REQUEST['wk'.$i])
			{
				$open_hours.=strip_tags(trim($_REQUEST['fromhour'.$i]));
				$open_hours.='-';
				$open_hours.=strip_tags(trim($_REQUEST['tohour'.$i]));
			}
			$open_hours.=',';
		}
		
	}
	
	
	
	
	
	//check if permalink existed
	if(biz_permalink_duplicate($permalink) && $var_biz['permalink']!=$permalink )
	die('Permalink duplicated');
	
	mysql_query("UPDATE  `business` SET `permalink`='$permalink', `cat_id`='$cat_id', `sub_cat_id`='$sub_cat_id',`cat_id2`='$cat_id2', `sub_cat_id2`='$sub_cat_id2',`cat_id3`='$cat_id3', `sub_cat_id3`='$sub_cat_id3', `business_add1` =  '$add1', `business_add2` =  '$add2', `city_id` =  '$biz_city', `business_phone` =  '$phone', `business_web` =  '$web', `zip` =  '$zip', `video_url` =  '$video', `description` =  '$description', `from_hour` =  '$fromhour', `to_hour` =  '$tohour', `weeks` =  '$weeks', `price_range` =  '$pricerange', `open_hours`='$open_hours' WHERE  `business`.`business_id` =$_REQUEST[id] LIMIT 1;") or die("Fail to write to db.");
    
    // clean up existing location if select a category that doesn't require location
    
        $str="select * from business_category where cat_id='$cat_id' LIMIT 1";

        $rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
        $row1=mysql_fetch_array($rc);
        if($row1['location_required']){

        } else{
            // clean up previous stored loc
            mysql_query("UPDATE  `business` SET `business_add1` =  '', `business_add2` =  '', `city_id` =  '0', `zip` =  '' WHERE  `business`.`business_id` =$_REQUEST[id] LIMIT 1;") or die("Fail to write to db.");
        }
        
     // clean up existing hours if select a category that doesn't require hours    
        if($row1['has_hours']){

        } else{
            // clean up previous stored loc
            mysql_query("UPDATE  `business` SET `from_hour` =  '', `to_hour` =  '' WHERE  `business`.`business_id` =$_REQUEST[id] LIMIT 1;") or die("Fail to write to db.");
        }
    // clean up existing price range if select a category that doesn't require price range     
        if($row1['has_pricerange']){

        } else{
            // clean up previous stored loc
            mysql_query("UPDATE  `business` SET `price_range` =  '0' WHERE  `business`.`business_id` =$_REQUEST[id] LIMIT 1;") or die("Fail to write to db.");
        }   
        
    
	$msg=l("Business Details Changed!")."<br /> <br />".l("You may need to refresh the browser to see your changes.");
}

/////////////////////////////////////////////////////////////////////////////////////////
$var_cat=get_biz_cats_options();

// check if location is optional for main cat

$str="select * from business_category where cat_id='".$var_biz['catid']."' LIMIT 1";

$rc = mysql_query($str) or die ("Sorry! could not execute query $str ".mysql_error());
$row1=mysql_fetch_array($rc);
if($row1['location_required']){
    $location_required = 1;
} else{
    $location_required = 0;
}

if($row1['has_hours']){
    $has_hours = 1;
} else{
    $has_hours = 0;
}

if($row1['has_pricerange']){
    $price_range = 1;
} else{
    $price_range = 0;
}

$var_country=get_country_options();
$smarty->assign("var_country",$var_country); 
$smarty->assign("location_required",$location_required);
$smarty->assign("has_hours",$has_hours); 
$smarty->assign("price_range",$price_range); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("var_biz",$var_biz);
$smarty->assign("var_bitems",$bitems);
$smarty->assign("var_cat_has_items",$cat_has_items); 
$smarty->assign("var_cat",$var_cat); 
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/edit.tpl');
?>