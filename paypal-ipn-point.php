<?php
/**
 * MeePlace Buy Points Paypal
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
include_once(_ABSPATH_."/inc/func/header.php"); 

if (_PAYPAL_TESTMODE_){
    define ( 'SANDBOX',TRUE );
}else{
    define ( 'SANDBOX',FALSE );     
}

$p = new paypal();
if ( $p->validateIPN() )
 
{
    $paid_date = date('Y-m-d');
    $user_id = $p->ipn['item_number'];
   $txn_id = $p->ipn['txn_id'];
   $buyer_email = $p->ipn['payer_email'];
   $seller_email = $p->ipn['receiver_email'];
   $payment_status = $p->ipn['payment_status'];
   $first_name = $p->ipn['first_name'];
   $last_name = $p->ipn['last_name'];
   $address = $p->ipn['address_street'];
   $city = $p->ipn['address_city'];
   $state = $p->ipn['address_state'];
   $zip = $p->ipn['address_zip'];
   $country = $p->ipn['address_country'];
   $amount = intval($p->ipn['payment_gross']);
   $description = l('Buy Credit Points');
   
    if($user_id) {

        $topic=l('Buy Credit Points'). ' ' . $first_name . ' ' . $last_name;
        $comments=" <a href=http://"._DOMAIN_."/my/?".$row['user_id'].">$fullname</a>";

        $date=date("M d, Y");
        if($first_name){
            $contact_name = $first_name . ' ' . $last_name;
        }else{
            $contact_name = get_user_data(nameORemail, $user_id);   
        }
        
        if($buyer_email){
            $contact_email = $buyer_email;
        }else{
             $contact_email = get_user_data(email, $user_id); 
        } 
        
        
        $mail= new MP_Mailer();
        // send email confirmation to admin       
        if(_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_){   
            $mail->fromMail = $seller_email;
            $mail->fromName = _SITENAME_ . " " . l("Support"); 
            $mail->toMail=_MAILNOTIFY_ADMIN_CONTACT_SUBMIT_;              
            $mail->Subject  = "$topic $date";
            $mail->Body     = "<h1>$topic</h1><p>".l("Name").": $comments</p><p>".l("Paid Date").": $date</p><p>".l("Amount").": ".l("$")."$amount</p>";
            $mail->MPSend();
        }        
        
        // send email confirmation to customer
        $mail->fromMail = $seller_email; 
        $mail->fromName = _SITENAME_ . " " . l("Support"); 
        $mail->toMail= $contact_email;              
        $mail->Subject  =  "$topic";
        $mail->Body     = l("Dear") . " " . $contact_name . ", <p>". l("We have received your payment to upgrade to buy credit points")."</p> <p>".l("Name").": $comments</p><p>".l("Paid Date").": $date</p><p>".l("Amount"). ": ".l("$"). "$amount</p><p></p><p>".l("Thank you for doing business with us!")."</p><p>".l("Regards").",<br/>"._SITENAME_ . " " . l("Support"). "</p>";
        $mail->MPSend(); 
    }

        // add transaction record
        $sql = "INSERT INTO  `transactions` (txn_user_id, txn_txn_id, txn_date, txn_buyer_email, txn_seller_email, txn_amount_paid, txn_payment_type, txn_payment_status, txn_description, txn_first_name, txn_last_name, txn_address, txn_city, txn_state, txn_zip, txn_country ) VALUES( '$user_id', '$txn_id', '$paid_date', '$buyer_email', '$seller_email', '$amount', 'paypal-point', '$payment_status', '$description', '$first_name', ' $last_name', '$address', '$city', '$state', '$zip', '$country')";
        $q = mysql_query($sql);
    
        // add credit points
        if ($user_id){
            mysql_query("UPDATE user SET credit=(credit + $amount) WHERE user_id = '$user_id'");
        }

        
}

class paypal
{
    var $processURL;
    var $fields;
    var $ipn;
    var $response;

    function paypal ()
    {
        if ( SANDBOX == FALSE )
        {
            $this->processURL = 'https://www.paypal.com/cgi-bin/webscr';
        }
        else
        {
            $this->processURL = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
        }
    }

    function validateIPN ()
    {
        $url = parse_url ( $this->processURL );

        $postString = NULL;

        if ( is_array ( $_POST ) && count($_POST) > 0 )
        {
            foreach ( $_POST as $field => $value )
            {
                $this->ipn [ $field ] = $value;
                $postString .= $field.'='.urlencode(stripslashes($value)).'&';
            }
        }

        $postString .= 'cmd=_notify-validate';

        $fp = fsockopen ( $url['host'], '80', $err_num, $err_str, 30 );
        if ( $fp )
        {
            fputs($fp, "POST $url[path] HTTP/1.1\r\n");
            fputs($fp, "Host: $url[host]\r\n");
            fputs($fp, "Content-type: application/x-www-form-urlencoded\r\n");
            fputs($fp, "Content-length: ".strlen($postString)."\r\n");
            fputs($fp, "Connection: close\r\n\r\n");
            fputs($fp, $postString . "\r\n\r\n");

            while ( !feof ( $fp ) )
            {
                $this->response .= fgets ( $fp, 1024 );
            }

            fclose ( $fp );
        }

        if ( eregi ( "VERIFIED", $this->response ) )
        {
            return TRUE;
        }

        return FALSE;
    }

    function addField ( $name, $value )
    {
        $this->fields [ $name ] = $value;
    }
}

?>