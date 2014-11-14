<?php
/**  
 * MeePlace buy points
 * @package MeePlace
 
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
session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
if ($_GET[id]){
  $owner =  $_GET[id];
  //$city_id = get_user_data('city',$owner);
}else{
  $me = get_user_data('user_id'); // logged in user
  //$city_id = get_user_data('city',$me);
}

 // $city_combo = get_btable_using_cityid($city_id); 
  //$location = $city_combo[location];
  //if (strlen($location)<4) $location = 'los_angeles_ca'; // no city_id, set to default 
include_once(_ABSPATH_.'/inc/func/header.php');
$page_title = l('Buy Credit Points').' | '.get_sitename();  //  

$user_id=get_user_data('user_id');
if(!$user_id) echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"Error!\"); location='account.php';</script>";
$msg='';

$query="select * from `user` where `user_id`= '$user_id'";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);


$var_user['user_id']=$row['user_id'];   
$var_user['email']=$row['email']; 
$var_user['fullname']= $fullname = $row['first_name']." ".$row['last_name'] ;
$site=$row['site'];

$topic=l('Buy Credit Points for ').$fullname;

if($site){
    //$comments=" <a href=http://$site/my/?".$row['user_id'].">$fullname</a>";
    $var_user['link']= "http://$site/my/?".$row['user_id'];
}else{
    //$comments=" <a href=http://"._DOMAIN_."/my/?".$row['user_id'].">$fullname</a>";
    $var_user['link']= "http://"._DOMAIN_."/my/?".$row['user_id'];    
}
$date=date(YmdHis);


if (_PAYPAL_ENABLE_){
    
    // on tpl page, set to currency to USD, language code to US. These values can be changed. 
    // For paypal currency codes list, visit https://cms.paypal.com/us/cgi-bin/?&cmd=_render-content&content_ID=developer/e_howto_api_nvp_currency_codes  
    // For paypal language codes list, visit  https://cms.paypal.com/us/cgi-bin/?&cmd=_render-content&content_ID=developer/e_howto_api_nvp_country_codes
    
    // hidden fields: item_number=biz_id
    
    
        // get pricing for starbiz
         $query="SELECT * FROM points_pricing WHERE status='1'";
         $result=mysql_query($query) or die($query);
         $has_price = mysql_num_rows($result);
         $paypal_pricing = '';
         if ($has_price > 0){
             $i = 0;
             while($row=mysql_fetch_array($result)){
                 
                 if ($i == 0){
                    $paypal_pricing .=  "  <input type=\"radio\" checked=\"checked\" name=\"amount\" value=\"".$row['price']."\"> ".$row['title']."<br/>"; 
                 }else{
                    $paypal_pricing .=  "  <input type=\"radio\" name=\"amount\" value=\"".$row['price']."\"> ".$row['title']."<br/>"; 
                 }
                 $i++;
             }
         
         } 
 
}

$smarty->assign("paypal_pricing",$paypal_pricing);
$smarty->assign("var_user",$var_user);  
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/buy_points.tpl');
?>