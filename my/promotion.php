<?php
/**
 * MeePlace credit points
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
| Copyright: (c) 2010 ProClones, LLC. All rights reserved. 12-18-2012
+------------------------------------------------------------------------+
 */
session_start();
if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
    header("Location: ./login.php");
    exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");

  $user_id = get_user_data('user_id'); // logged in user
  if (strlen($location)<4) $location = 'los_angeles_ca'; // no city_id, set to default 
include_once(_ABSPATH_.'/inc/func/header.php');
$page_title = l('Claim Your Credit Points').' | '.get_sitename();  //  

if(!$user_id) echo "<script type=\"text/javascript\" language=\"javascript\">alert(\"Error!\"); location='account.php';</script>";
$msg='';

$query="select * from `user` where `user_id`= '$user_id'";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);


$var_user['user_id']=$row['user_id'];   
$var_user['email']=$contact_email = $row['email']; 
$var_user['fullname']= $fullname = $row['first_name']." ".$row['last_name'] ;


$topic=l('Claim Credit Points for ').$fullname;
     $comments=" <a href=http://"._DOMAIN_."/my/?".$row['user_id'].">$fullname</a>";
    $var_user['link']= "http://"._DOMAIN_."/my/?".$row['user_id'];    

if($_POST){  
   
   $code = $_POST['code'];

   // check to see if user has used the same code or not
   $query="select * from `coupons_history` where `txn_coupon`= '$code' AND txn_user_id='$user_id'";

   $result=mysql_query($query);
   $total=mysql_num_rows($result);

   if($total>0){
       $msg = l('Sorry, you already used this promotional code') . '<input action="action" type="button" onclick="history.go(-1);" value="Back" />';
   }else{  // not use yet
       // check to see if the code is valid
       $today = date('Y-m-d'); 
       $query2="select * from `coupons` where `coupon`= '$code' AND expire >='$today' AND c_type='free_points' AND status='1' LIMIT 1";
       $result2=mysql_query($query2);
       $total2= mysql_num_rows($result2);
       $row = mysql_fetch_assoc($result2);
       $amount = $row['amount'];
       if($total2 == 1){
          //add points to user record
          mysql_query("UPDATE user SET credit= (credit + $amount) WHERE user_id = '$user_id'");            
          //add to coupons history
          $sql = "INSERT INTO  `coupons_history` (txn_user_id, txn_coupon, txn_date, txn_amount) VALUES( '$user_id', '$code', '$today', '$amount')";
          mysql_query($sql);
          
          $mail= new MP_Mailer();
            // send email confirmation to admin       
            if(_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_){   
                $mail->fromMail = _SMTP_FROM_;
                $mail->fromName = _SITENAME_ . " " . l("Support"); 
                $mail->toMail=_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_;              
                $mail->Subject  = "$topic $today";
                $mail->Body     = "<h1>$topic</h1><p>".l("Name").": $comments</p><p>".l("Paid Date").": $today</p><p>".l("Credit Points").": $amount</p>";
                $mail->MPSend();
            }        
            
            // send email confirmation to customer
            $mail->fromMail = _SMTP_FROM_; 
            $mail->fromName = _SITENAME_ . " " . l("Support"); 
            $mail->toMail= $contact_email;              
            $mail->Subject  =  "$topic";
            $mail->Body     = l("Dear") . " " . $fullname . ", <p>". l("You have claimed your free credit points")."</p> <p>".l("Name").": $comments</p><p>".l("Date").": $today</p><p>".l("Credit Points"). ": $amount</p><p></p> <p>".l("Regards").",<br/>"._SITENAME_ . " " . l("Support"). "</p>";
            $mail->MPSend();
            
            $msg= l("Congratulations!") . ' ' . $amount . ' ' . l("credit points have been added to your account");  
       }else{
           $msg= l("Sorry, invalid promotional code!") . '<input action="action" type="button" onclick="history.go(-1);" value="Back" />';
       }
   } 
}

$smarty->assign("var_user",$var_user);  
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/promotion.tpl');
?>