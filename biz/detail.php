<?php 
/**
 * MeePlace Business Detail Page.
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
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');
/*
 * Clean URI Entry
 */
if(!empty($_GET['name']))
{
  $permalink=$_GET['name'];
  //$permalink= strtolower(trim(htmlspecialchars($permalink)));
  //$query="select * from `business` where LOWER(permalink)= '$permalink' and `approved`=1 limit 1";

  // avoid built in function to speed up query when table is large
  $permalink= trim(htmlspecialchars($permalink));
  $query="select * from `business` where permalink= '$permalink' and `approved`=1 limit 1";
  
  $result=mysql_query($query);
  $row=mysql_fetch_array($result);
  $biz_id=$row['business_id']; 
  $id=$biz_id;
  $_GET['id']=$biz_id;
}
elseif(!empty($_GET['id']))
{
/*
 * Original Entry: by ID
 */
$biz_id=$_GET['id'];
$query="select * from `business` where `business_id`= '$biz_id' and `approved`=1 limit 1";
$result=mysql_query($query);
$row=mysql_fetch_array($result);
$name=$row['permalink'];
$name=advanced_biz_name($biz_id);
$name='http://'._DOMAIN_.'/'._BIZ_DIR_.'/'.$name;
header("HTTP/1.1 301 Moved Permanently");
header("Location: $name");
}



/////////////photo sum////////

$ps=mysql_query("select * from `business_photo` where `business_id`='$biz_id'") or die('Query Error!');
//////////////verify myself list
$var_ps=$ps=mysql_num_rows($ps);

/////////////////////////////////////////////////////
 $video_url=$row['video_url'];
if($video_url=="http://") $video_url='';
 
$video_btn_display=!empty($video_url)?"":"none";
if($video_url) $var_biz['video_btn']='1';
/////////////////////////////////////////////////////
/*
$tips_avai=mysql_query("select * from `business_hole` where `business_id`='$biz_id'") or die('Query Error! Tips Btn');
$tips_avai=mysql_num_rows($tips_avai);
$tips_btn_display=$tips_avai?"":"none";
if($tips_avai) $var_biz['tips_btn']='1';
*/
///////////////////////page exist///////////////////////

if(empty($row[business_name])) {
  echo "<script type=\"text/javascript\" language=\"javascript\"> alert(\"".l("Page not exist")."! [$permalink]\"); history.go(-1);</script>";
  exit;
}

////////////////////// click ///////////////////////////////////////

$click=$row[click]+1;
$query=mysql_query("update `business` set `click`='$click' where `business_id`='$biz_id'");

//template vars.
$page_title =$row['business_name'].', '.get_city_name($row['city_id']).' | '.get_sitename();  //
$var_apikey=get_key();

$var_me['email']=$_SESSION[email];


// get user/visitor information
  
if( $var_me['email']){

    $var_me['user_id']=get_user_data('user_id');

}

$var_biz['id']=$biz_id;
$var_biz['bizname']=$row['business_name'];
if($row['starbiz'])  $var_biz['starbiz']="<img src='/theme/"._THEME_."/images/b_star.png' class='starbiz' />";
$var_biz['zip']=$row['zip'];
$var_biz['zoom']=!empty($row['zoom'])?$row['zoom']:0;
$var_biz['mapy']=!empty($row['mapy'])?$row['mapy']:"0";
$var_biz['mapx']=!empty($row['mapx'])?$row['mapx']:"0";
$var_biz['y']=!empty($row['y'])?$row['y']:"0";
$var_biz['x']=!empty($row['x'])?$row['x']:"0";
$var_biz['rating']=$row['rating'];
$var_biz['ratingmod']=get_rating_img($row['rating']);
$var_biz['reviewnum']=$row['reviews_num'];
$var_biz['click']=$row['click'];
$var_biz['picurl']='b_'.$row['photo_url'];
$var_biz['catid']=$row['cat_id'];
$var_biz['map_enabled']=get_biz_cat_map($row['cat_id']);
$var_biz['catname']=get_biz_cat_translated($row['cat_id']);
$var_biz['catpermalink']=get_biz_cat_permalink($row['cat_id']);

$var_biz['subcatid']=$row['sub_cat_id'];
$var_biz['subcatname']=get_biz_subcat_translated($row['sub_cat_id']);
$var_biz['subcatpermalink']=get_biz_subcat_permalink($row['sub_cat_id']);

$var_biz['catid2']=$row['cat_id2'];
$var_biz['catname2']=get_biz_cat_translated($row['cat_id2']);
$var_biz['cat2permalink']=get_biz_cat_permalink($row['cat_id2']);

$var_biz['subcatid2']=$row['sub_cat_id2'];
$var_biz['subcatname2']=get_biz_subcat_translated($row['sub_cat_id2']);
$var_biz['subcat2permalink']=get_biz_subcat_permalink($row['sub_cat_id2']);

$var_biz['catid3']=$row['cat_id3'];
$var_biz['catname3']=get_biz_cat_translated($row['cat_id3']);
$var_biz['cat3permalink']=get_biz_cat_permalink($row['cat_id3']);

$var_biz['subcatid3']=$row['sub_cat_id3'];
$var_biz['subcatname3']=get_biz_subcat_translated($row['sub_cat_id3']);
$var_biz['subcat3permalink']=get_biz_subcat_permalink($row['sub_cat_id3']);

$var_biz['add1']=$row['business_add1'];
$var_biz['add2']=$row['business_add2'];
$var_biz['phone']=$row['business_phone'];
$var_biz['location']=get_city_name($row['city_id']);
$var_biz['province']=get_province_name($row['city_id']);
$var_biz['country']=get_country_name($row['city_id']); 
$var_biz['video_url']=$row['video_url'];


// Special Offers for this biz
$offerObj= new MP_SpecialOffers();
$offerObj->businessId=$var_biz['id'];
$offerArray=$offerObj->getLatestOne();

$var_biz['offer_id']=$offerArray['offer_id'];
$var_biz['offer_description']=$offerArray['offer_description'];
$var_biz['offer_descriptionNoTag']=str_replace("<br />","\n",$offerArray['offer_description']);
$var_biz['offer_url']=$offerArray['offer_url'];
$var_biz['offer_phone']=$offerArray['offer_phone'];
$var_biz['offer_submit_time']=turn_date($offerArray['offer_submit_time'],'fdate');
$var_biz['title']=$offerArray['title'];
	//YouTube Page to SWF
	$pattern = '/https?:\/\/(www\.)?youtube\.com\/watch\?v=([^\&]*)(&.*)?/i';
	$replacement = 'http://www.youtube.com/v/$2';
	$var_biz['video_url']=preg_replace($pattern, $replacement, $var_biz['video_url']);


$var_biz['web']=!empty($row[business_web])&&$row[business_web]!="http://"?"$row[business_web]":"";
$var_biz['bizurl']=advanced_biz_name($row['business_id']);

$var_biz['user_id']=$row['user_id'];  //owner

$var_biz['description']=trim(nl2br(strip_tags($row['description'])));
$var_biz['descriptionbrief']=utf_substr($var_biz['description'],350);

$var_biz['open_hours']=$row['open_hours'];
if($var_biz['open_hours']==',,,,,,,,') $var_biz['open_hours']='';

if($var_biz['open_hours']) // Custom Hours
{
	$ar=explode(",",$var_biz['open_hours']);  
	foreach($ar  as  $k=> $v)   
	{
		if($k=='1' && $v) $var_biz['wk1']=l("Mon. ").$v;
		elseif($k=='2' && $v) $var_biz['wk2']=l("Tue. ").$v;
		elseif($k=='3' && $v) $var_biz['wk3']=l("Wed. ").$v;
		elseif($k=='4' && $v) $var_biz['wk4']=l("Thu. ").$v;
		elseif($k=='5' && $v) $var_biz['wk5']=l("Fri. ").$v;
		elseif($k=='6' && $v) $var_biz['wk6']=l("Sat. ").$v;
		elseif($k=='7' && $v) $var_biz['wk7']=l("Sun. ").$v;
	}
	$var_biz['wk']=1;
}
elseif($row['from_hour'] || $row['to_hour'] || $row['weeks']) // Regular Hours
{
	$var_biz['from_hour']=$row['from_hour'];
	$var_biz['to_hour']=$row['to_hour'];
	
	$var_biz['weeks']='';
	if($row['weeks']=='1,2,3,4,5,6,7,') $var_biz['weeks']=l('Whole week');
	elseif($row['weeks']=='1,2,3,4,7,') $var_biz['weeks']=l('Sunday - Thursday');
	elseif($row['weeks']=='1,2,3,4,5,7,') $var_biz['weeks']=l('Sunday - Friday');
	elseif($row['weeks']=='1,2,3,4,5,') $var_biz['weeks']=l('Monday - Friday');
	elseif($row['weeks']=='1,2,3,4,5,6,') $var_biz['weeks']=l('Monday - Saturday');
	else 
	{
		$ar=explode(",",$row['weeks']);  
		foreach($ar   as   $s)   
		{
			if($s=='1') $var_biz['weeks'].=l("Mon. ");
			elseif($s=='2') $var_biz['weeks'].=l("Tue. ");
			elseif($s=='3') $var_biz['weeks'].=l("Wed. ");
			elseif($s=='4') $var_biz['weeks'].=l("Thu. ");
			elseif($s=='5') $var_biz['weeks'].=l("Fri. ");
			elseif($s=='6') $var_biz['weeks'].=l("Sat. ");
			elseif($s=='7') $var_biz['weeks'].=l("Sun. ");
		}
	}
}//end regular hours

$var_biz['price_range']=$row['price_range'];



/////
$keywords=_KEYWORDS_;
$keywords= str_replace("%BIZNAME%",$var_biz['bizname'],$keywords);
$keywords= str_replace("%BIZDESC%",$var_biz['descriptionbrief'],$keywords);
$keywords= str_replace("%CATEGORY%",$var_biz['catname'],$keywords);
$keywords= str_replace("%SUBCATEGORY%",$var_biz['subcatname'],$keywords);
$keywords= str_replace("%CITY%",$var_biz['location'],$keywords);
$keywords= str_replace("%ZIP%",$var_biz['zip'],$keywords);
$keywords= str_replace("%PHONE%",$var_biz['phone'],$keywords);

$description= _DESCRIPTION_;
$description= str_replace("%BIZNAME%",$var_biz['bizname'],$description);
$description= str_replace("%BIZDESC%",$var_biz['descriptionbrief'],$description);
$description= str_replace("%CATEGORY%",$var_biz['catname'],$description);
$description= str_replace("%SUBCATEGORY%",$var_biz['subcatname'],$description);
$description= str_replace("%CITY%",$var_biz['location'],$description);
$description= str_replace("%ZIP%",$var_biz['zip'],$description);
$description= str_replace("%PHONE%",$var_biz['phone'],$description);

$page_title_cat=_PAGE_TITLE_CAT_;
$page_title_cat= str_replace("%BIZNAME%",$var_biz['bizname'],$page_title_cat);
$page_title_cat= str_replace("%BIZDESC%",$var_biz['descriptionbrief'],$page_title_cat);
$page_title_cat= str_replace("%CATEGORY%",$var_biz['catname'],$page_title_cat);
$page_title_cat= str_replace("%SUBCATEGORY%",$var_biz['subcatname'],$page_title_cat);
$page_title_cat= str_replace("%CITY%",$var_biz['location'],$page_title_cat);
$page_title_cat= str_replace("%ZIP%",$var_biz['zip'],$page_title_cat);
$page_title_cat= str_replace("%PHONE%",$var_biz['phone'],$page_title_cat);

$smarty->assign("page_keywords",get_cleankeywords($keywords)); 
$smarty->assign("page_description",get_cleandescription($description)); 
$smarty->assign("page_title_cat",get_cleanpage_title($page_title_cat));

/////////Claim biz button/ Edit biz button////////

if(empty($_SESSION['email']) && $var_biz['user_id'] == 0) 
	$var_biz['logintoclaim_btn']='1'; //Login to claim
elseif(get_user_data('user_id',$row['user_id'])!=get_user_data('user_id') && $var_biz['user_id'] == 0)
	$var_biz['claim_btn']='1'; //Display claim button
elseif(get_user_data('user_id',$row['user_id'])==get_user_data('user_id'))
	$var_biz['edit_btn']='1'; //Owner. Show edit button
	

if(!$var_biz['starbiz'] && get_user_data('user_id',$row['user_id'])==get_user_data('user_id'))
	$var_biz['applystarbiz_btn']='1'; //Not StarBiz and isOwner. Show apply starbiz button.
    
if($_SESSION["admin_type"]){
        $var_biz['edit_btn']='1'; //admin - show edit biz, edit comment, delete comment buttons
         
    }

    //////////////////// biz category's items ////////////////////////////
    
    
$query="SELECT A.value,B.title FROM `business_feature_item` as A,business_sub_category_item as B WHERE A.item_id=B.id and A.status=1 and A.business_id=$biz_id";

$result=mysql_query($query);

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
 
/////////////////////////////////////////////////////////////////////////////////////////
///////side bar //////
$rc=mysql_query("select * from business_reviews ORDER BY `review_date` DESC limit 0,5");
$i=0;
$var_newreview=array();
while($row=mysql_fetch_array($rc)){
  $inrow=mysql_fetch_array(mysql_query("select * from business where business_id=$row[business_id] and  `approved`=1"));
$var_newreview[$i]['bizname']=$inrow['business_name'];
$var_newreview[$i]['picurl']='b_'.$inrow['photo_url'];
$var_newreview[$i]['reviewdate']=turn_date($row['review_date'],ftimeordate);
$var_newreview[$i]['reviewbrief']=utf_substr($row['review_desc'],70);
$var_newreview[$i]['catname']=get_biz_cat($inrow['cat_id']);
$var_newreview[$i]['subcatname']=get_biz_subcat($inrow['sub_cat_id']);

$var_newreview[$i]['bizurl']=advanced_biz_name($inrow['business_id']);
$var_newreview[$i]['reviewid']=$row['review_id'];
if($_SESSION["admin_type"]){
        $var_newreview[$i]['edit_btn']='1'; //admin - show edit biz, edit comment, delete comment buttons       
    }

$i+=1;
}

///////biz rating items //////

$query =  "select cate_rating_item from business_sub_category WHERE b_sub_cat_id='".$var_biz['subcatid']."' LIMIT 1";

$row2=mysql_fetch_array(mysql_query($query));
$subcat_items = $row2['cate_rating_item'];

if($subcat_items !=''){
    $query =  "select * from business_rating_items WHERE item_id IN ($subcat_items)";
    $rc=mysql_query($query);
    $has_ratingitems = mysql_num_rows($rc); 
}else{  //subcat has no item, check maincat
    $query =  "select cate_rating_item from business_category WHERE cat_id='".$var_biz['catid']."' LIMIT 1";
    $row3=mysql_fetch_array(mysql_query($query));
    $cat_items = $row3['cate_rating_item'];
    if($cat_items !=''){
       $query =  "select * from business_rating_items WHERE item_id IN ($cat_items)";
       $rc=mysql_query($query);
       $has_ratingitems = mysql_num_rows($rc);  
    }
}



if ($has_ratingitems > 0){
   $i=0;
   $var_ratingitems=array(); 
    while($row=mysql_fetch_array($rc)){
        $var_ratingitems[$i]['item_id']=$row['item_id'];   
        $var_ratingitems[$i]['title']=l($row['title']);

        $i+=1;
    }
}

////////////////////////////////////
// Get First Page of Reviews , for a better SEO.
require (_ABSPATH_.'/biz/func/bizreview.class.php');

$obj_review=new BizReview($biz_id);
$html_review=$obj_review->getFirstPageHtml();


////////////////////////////////////
$admin_type = $_SESSION[admin_type];
$smarty->assign("admin_type",$admin_type); 
$smarty->assign("var_apikey",$var_apikey); 
$smarty->assign("var_me",$var_me); 
$smarty->assign("var_biz",$var_biz);
$smarty->assign("var_bitems",$bitems);  
$smarty->assign("var_ps",$var_ps); 
$smarty->assign("html_review",$html_review);
$smarty->assign("video_btn_display",$video_btn_display); 
$smarty->assign("tips_btn_display",$tips_btn_display); 
$smarty->assign("var_newreview",$var_newreview); 
$smarty->assign("var_ratingitems",$var_ratingitems);
$smarty->assign("has_ratingitems",$has_ratingitems); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/detail.tpl');
?>
