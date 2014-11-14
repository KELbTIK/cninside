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

$biz_id=$_POST['id'];
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
$var_owner['email']= $buyer_email = $row2['email']; 
$var_owner['fullname']=$fullname = $row2['first_name']." ".$row2['last_name'];
$first_name=$row2['first_name'];
$last_name =$row2['last_name'];  
$var_owner['credit']= $credit = $row2['credit'];


$var_biz['id']=$biz_id;
$var_biz['bizname']= $row['business_name'];
$biz_name = mysql_real_escape_string($row['business_name']); 
$var_biz['bizurl']=advanced_biz_name($row['business_id']);
$var_biz['phone']=$row['business_phone'];

$topic=l('StarBiz Payment ').$biz_name;
    $comments="<a href=http://"._DOMAIN_."/"._BIZ_DIR_."/".$row['permalink'].">$biz_name</a>";     

$user_link = "/my/?id=$owner_id'>$fullname</a>";
$date=date(YmdHis);
$paid_date = date('Y-m-d');
$method = $_POST['method'];
$amount = $_POST['amount'];
$txn_txn_id = date('Ymdhms');
$description = l('StarBiz Payment');


     if($method =='point'){ // pay by credit points
         // check available points again
 
           if($credit >= $amount){ 
            // add transaction record
            $sql = "INSERT INTO  `transactions` (txn_user_id, txn_txn_id, txn_date, txn_buyer_email,  txn_amount_paid, txn_payment_type, txn_payment_status, txn_description, txn_first_name, txn_last_name) VALUES( '$user_id', '$txn_txn_id', '$paid_date', '$buyer_email', '$amount', 'point-biz', 'Completed', '$description', '$first_name', ' $last_name')";
            mysql_query($sql);
        
            // deduct point
            mysql_query("UPDATE user SET credit = (credit - $amount) WHERE user_id = '$owner_id'");
            
            // Check the duration of starbiz  
           $sql3 = "SELECT * FROM business_pricing WHERE price ='$amount' LIMIT 1";

            $result3 = mysql_query($sql3);
            
            if($result3) {
                $row3 = mysql_fetch_array($result3);
                $duration = (int)$row3['duration'];
                
                if($duration <=0) $duration = 1;    // handle exception when no duration in the price
                
                $expirationDate = date('Y-m-d', mktime() + (24*3600*$duration));
            }else{ // no pricing is set, handle exception here
                $expirationDate = date('Y-m-d', mktime() + 0);
            }
            
            // activate starbiz and set expiration date
           
           $sql4 = "UPDATE business SET starbiz_exp='$expirationDate', starbiz='1' WHERE business_id = '$biz_id'";
           mysql_query($sql4);


           $mail= new MP_Mailer();
            // send email confirmation to admin       
            if(_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_){   
                $mail->fromMail = _SMTP_FROM_;
                $mail->fromName = _SITENAME_ . l("Support"); 
                $mail->toMail=_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_;              
                $mail->Subject  = "$topic $paid_date";
                $mail->Body     = "<h1>$topic</h1><p>".l("Name").": $comments</p><p>".l("Paid Date").": $paid_date</p><p>".l("Amount").": $amount ".l("credit points")." </p>";
                $mail->MPSend();
            }        
            
            // send email confirmation to customer
            $mail->fromMail = _SMTP_FROM_; 
            $mail->fromName = _SITENAME_ . l("Support"); 
            $mail->toMail= $buyer_email;              
            $mail->Subject  =  "$topic";
            $mail->Body     = l("Dear") . " " . $fullname . ", <p>". l("We have received your payment to upgrade your business listing to StarBiz.")."</p> <p>".l("Name").": $comments</p><p>".l("Paid Date").": $paid_date</p><p>".l("Amount"). ": $amount ".l("credit points")." </p><p></p><p>".l("Thank you for doing business with us!")."</p><p>".l("Regards").",<br/>"._SITENAME_ . " " .l("Support"). "</p>";
            $mail->MPSend();  

           }else{ // don't have enough points to use
              $msg = 'error';
           } 
           
     } // pay by paypal
     
     //if (_PAYPAL_ENABLE_){
    
    // on tpl page, set to currency to USD, language code to US. These values can be changed. 
    // For paypal currency codes list, visit https://cms.paypal.com/us/cgi-bin/?&cmd=_render-content&content_ID=developer/e_howto_api_nvp_currency_codes  
    // For paypal language codes list, visit  https://cms.paypal.com/us/cgi-bin/?&cmd=_render-content&content_ID=developer/e_howto_api_nvp_country_codes
    
    // hidden fields: item_number=biz_id
    
$smarty->assign("credit",$credit);
$smarty->assign("amount",$amount);
$smarty->assign("method",$method);
$page_title = l('Apply StarBiz').' | '.get_sitename();  //
$smarty->assign("var_f",$var_f);  
$smarty->assign("var_biz",$var_biz); 
$smarty->assign("msg",$msg); 
$smarty->assign("var_owner",$var_owner); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/apply_starbiz_next.tpl');
?>