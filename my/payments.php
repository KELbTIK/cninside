<?php 
/**
 * MeePlace payments.
 * @package MeePlace
 * @subpackage my accont
 
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
include_once(_ABSPATH_.'/inc/func/header.php');

$page=empty($_GET[page])?"1":$_GET[page];
$item_per_page = 10;

    $page_title = l('Payments').' | '.get_sitename();  //

    $user_id=get_user_data(user_id);

    $rc="SELECT * FROM `transactions` where txn_user_id='$user_id' ORDER BY `txn_id` DESC ";
    
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    
    $limitfrom=($page-1)*$item_per_page;
    $rc.="  LIMIT $limitfrom,$item_per_page";
    $rc= mysql_query($rc);
    $limitto=mysql_num_rows($rc); 
      $i=0;
    while($row=mysql_fetch_array($rc))
    {
        $var_paymentlists['found']='yes';      
        $var_paymentlist[$i]['txn_txn_id']=$row[txn_txn_id];
        $var_paymentlist[$i]['txn_business_id']=$row[txn_business_id];
        $var_paymentlist[$i]['txn_description']=$row[txn_description];
        $var_paymentlist[$i]['txn_amount_paid']=$row[txn_amount_paid];
        $var_paymentlist[$i]['txn_date']=date('M d, Y', strtotime($row[txn_date]));
        $i+=1;
    }
      $var_paymentlists['pager']=get_page_list($_GET[page],$rows,$item_per_page);
    $var_paymentlists['limitfrom']=$limitfrom+1;
    $var_paymentlists['limitto']=$limitfrom+$limitto;
    $var_paymentlists['itemsnum']=$rows;



//$smarty->debugging = true;
$smarty->assign("var_paymentlist",$var_paymentlist);
$smarty->assign("var_paymentlists",$var_paymentlists); 
$smarty->assign("page_title",$page_title); 
$smarty->display('my/payments.tpl');

?>