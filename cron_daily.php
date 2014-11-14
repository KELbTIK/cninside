<?php
/**
 * MeePlace flag a comment
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
include_once(dirname(__FILE__)."/inc/func/get_sth.php");

// deactivate starbiz after expiration date

$today = date('Y-m-d', mktime());
$query="UPDATE  business SET starbiz = '0' WHERE starbiz_exp < '$today'";
$rc=mysql_query($query);

// send reminder email for starbiz that expires soon
$period = _STARBIZ_REMINDER_;
$target = date('Y-m-d',mktime() + 3600*24*$period);
$query="SELECT b.*, u.first_name, u.last_name, u.email FROM  business AS b, user AS u WHERE b.user_id = u.user_id AND starbiz = '1' AND starbiz_exp = '$target'";
$rc=mysql_query($query);


while($row = mysql_fetch_array($rc)){
    $mail= new MP_Mailer();
    $full_name = $row['first_name'] . ' ' . $row['last_name'];
    $email =  $row['email'];
    $business=$row['business_name'];
    $business_url = "http://"._DOMAIN_."/"._BIZ_DIR_."/".$row['permalink'];
    $starbiz_exp = date('M d, Y', strtotime($row['starbiz_exp']));
    
    $mail->fromMail = _SMTP_FROM_; 
    $mail->fromName = _SITENAME_ . l("Support"); 
    $mail->toMail= $email;              
    $mail->Subject  =  l("StarBiz Reminder") . " - " . _SITENAME_;
    $mail->Body     = l("Dear") . " " . $full_name . ", <p>". l("We would like to remind you that your listing has StarBiz status until")." $starbiz_exp.</p> <p>". l("StarBiz status keep your business listing on top of search results on our site so make sure to renew your StarBiz status.")."</p><p>".l("Business").": $business</p><p>".l("URL").": $business_url</p><p>".l("Regards").",<br/>"._SITENAME_ . l("Support"). "</p>";
   $mail->MPSend();     
}

?>