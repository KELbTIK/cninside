<?php
/**
 * MeePlace Apply StarBiz
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
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');
 
$biz_id=$_GET['id'];
$msg='';

$query="select * from business where `business_id`= '$biz_id' and `approved`=1";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);
$name=$row['business_name'];

///////////////////////page exist///////////////////////

if(empty($row[business_name])) {
  $msg= "Business not exist!";
}

////// user loged in?  my business? /////////


if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) ) {
	$msg=l("Please Login!"); 
}

if(!get_user_data('user_id',$row['user_id'])==get_user_data('user_id')) {
	$msg=l('This business is not yours!');
}


$var_owner['user_id']= $owner_id = $row['user_id'];
// get owner info
$query2="select * from `user` where `user_id`= '$owner_id'";
$result2=mysql_query($query2);
$row2=mysql_fetch_assoc($result2);

$var_owner['email']= $row2['email']; 
$var_owner['fullname']=$user_name = $row2['first_name']." ".$row2['last_name'];
$var_owner['credit']= $row2['credit'];


$var_biz['id']=$biz_id;
$var_biz['bizname']= $row['business_name'];
$biz_name = mysql_real_escape_string($row['business_name']); 
$var_biz['bizurl']=advanced_biz_name($row['business_id']); 
$var_biz['phone']=$row['business_phone'];
$var_biz['city_id']=$row['city_id']; 

$topic=l('StarBiz Request ').$biz_name;
$comments="<a href=http://"._DOMAIN_."/"._BIZ_DIR_."/".$row['permalink'].">$biz_name</a>";     

$user_link = "<a href='/my/?id=$owner_id'>$user_name</a>";
$date=date(YmdHis);

    
// get pricing for starbiz
 $query="SELECT * FROM business_pricing WHERE status='1'";
 $result=mysql_query($query) or die($query);
 $has_price = mysql_num_rows($result);
 $paypal_pricing = '';
 
 if ($has_price > 0){
     $i = 0;
     while($row=mysql_fetch_array($result)){
         
         if ($i == 0){
            $paypal_pricing .=  "  <input type=\"radio\" checked=\"checked\" name=\"amount\" value=\"".$row['price']."\"> $".$row['price']." - ".$row['title'] . "<br/>" . $row['des'] . "<br/>"; 
         }else{
            $paypal_pricing .=  "  <input type=\"radio\" name=\"amount\" value=\"".$row['price']."\"> $".$row['price']." - ".$row['title'] . "<br/>" . $row['des'] .  "<br/>"; 
         }
         $i++;
     }

     
     
}else{
     // when no price is set, use previous starbiz request - no fee, only need admin approval
    
        $contact_name=strip_tags($_POST[contact_name]);
        $contact_email=strip_tags($_POST[contact_email]);

        if(!$contact_name and !empty($_POST) ) $msg=l('Please input your name');
        if(!$contact_email and !empty($_POST) ) $msg=l('Please input your email');


        if (!empty($_POST) and $msg=='') {
            $var_f='info';

            $query="insert into `contact_us` (`topic`,`contact_name`,`contact_email`,`comment`,`date`) values ('$topic','$contact_name','$contact_email','$comments','$date')";


            $result=mysql_query($query) or die('ERROR: ' .$query);

            $mail= new MP_Mailer();	
            $mail->fromMail = $contact_email;
            $mail->fromName = $contact_name; 
            $mail->toMail=_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_;              
            $mail->Subject  =  l("StarBiz Request").": $topic";
            $mail->Body     = "<h3>$topic</h3><br><h3>".l("Contact Name").": </h3> $contact_name<br><h3>".l("Contact Email").":</h3> $contact_email<br><h3>".l("Contents").":</h3> ".l("Business").": $comments - $btable<br>".l("Submitted by").": $user_link<br>";
            $mail->MPSend();

	            $msg= l("Your StarBiz request posted. We will contact you later.");
        }

}

$page_title = l('Apply StarBiz').' | '.get_sitename();  //
$smarty->assign("paypal_pricing",$paypal_pricing);
$smarty->assign("var_f",$var_f);  
$smarty->assign("var_biz",$var_biz); 
$smarty->assign("msg",$msg); 
$smarty->assign("var_owner",$var_owner); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/apply_starbiz_new.tpl');
?>