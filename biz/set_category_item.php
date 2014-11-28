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

//////////////// user loged in //////////

if(empty($_SESSION['email'])) {
    $msg=l("Please Login!"); 
}

// Update/Add biz cat item for this biz record

if($_POST)
{
    if(!$_POST['business_id'])
        exit("Error");
        
                // checkboxes are not validated by js, validate here in stead
            // Get biz cat item ids used by the category of this business record  (firt category and subcategory only)
            $istring = items_is_whos($_POST['business_id']);
            
            if(!empty($istring)){ 
                    //  Get the list of required fields
                $resx3 = mysql_query("select * from `business_sub_category_item` where id in ($istring) AND required='1' AND type='checkbox'");
                 
                while($rowx3 = mysql_fetch_assoc($resx3)) {
                    $required_checkbox_fields[]=$rowx3[id];
                    $required_checkbox_name["$rowx3[id]"][]=$rowx3[title]; 

                }
            }    

    foreach($_POST as $k=>$p)
    {
        if(preg_match("/iii\_(\d+)/", $k, $aid))   //radio
        {
               
                $have = mysql_fetch_assoc(mysql_query("select * from business_feature_item where item_id=".$aid[1]." and business_id=".$_POST['business_id']));
                if($have) {
                    mysql_query("update business_feature_item set value='".$p."' where item_id=".$aid[1]." and business_id=".$_POST['business_id']);
                }else{
                    mysql_query("insert into business_feature_item set value='".$p."',item_id=".$aid[1].",business_id=".$_POST['business_id']);   
                }
            


        }

        if(preg_match("/ch\_(\d+)/", $k, $aid))   //checkbox
        {


            if ($existing_id !=  $aid[1]){
                 $existing_id = $aid[1];
                 // clear up for new checkbox item
                 $p_new = '';
                 $p_new =  $p ;
            }elseif(($existing_id ==  $aid[1]) && $p!=''){
                  $p_new .=  '|' .$p ;  
            }
            
            $p_new_check = trim(str_replace ('|', '', $p_new));
            
            // if this checkbox field is required, check it now
            if(in_array($aid[1], $required_checkbox_fields) && $p_new_check==''){
                
                $field_name = $required_checkbox_name["$aid[1]"][0];
                   $msg .=l("$field_name") . ' ' . l("field is required") . '. \n'; 
            }else{
            
                if ($p_new_check ==''){
                    
                    // none checkbox is checked
                    
                    mysql_query("delete from business_feature_item where item_id=".$aid[1]." and business_id=".$_POST['business_id']);
                    
                }else{
                    
                    $have = mysql_fetch_assoc(mysql_query("select * from business_feature_item where item_id=".$aid[1]." and business_id=".$_POST['business_id']));

                    if($have){
                        mysql_query("update business_feature_item set value= '".$p_new."' where item_id=".$aid[1]." and business_id=".$_POST['business_id']);
                    }else{
                       mysql_query("insert into business_feature_item set value='".$p_new."',item_id=".$aid[1].",business_id=".$_POST['business_id']);
                    }
                }
            
            }

        }
        
        
        
        if(preg_match("/t\_(\d+)/", $k, $aid))   //text
        {
            $have = mysql_fetch_assoc(mysql_query("select * from business_feature_item where item_id=".$aid[1]." and business_id=".$_POST['business_id']));
            if($have)
                mysql_query("update business_feature_item set value='".$p."' where item_id=".$aid[1]." and business_id=".$_POST['business_id']);
            else
                mysql_query("insert into business_feature_item set value='".$p."',item_id=".$aid[1].",business_id=".$_POST['business_id']);
        }
        
        
        if(preg_match("/ccc\_(\d+)/", $k, $caid))
        {
            mysql_query("update business_feature_item set status='".$p."' where item_id=".$caid[1]." and business_id=".$_POST['business_id']);
        }
    }
        
        if($msg){
            echo "<script>alert('".$msg."');</script>";    
        }else{
            echo "<script>alert('Info Updated!');parent.jQuery.fancybox.close();</script>";
        exit;
        }
}


$biz_id=$_GET['id'];
$msg='';

// Check ownership

$query="select * from `business` where `business_id`= '$biz_id' and `approved`=1";
$result=mysql_query($query);
$rowb=mysql_fetch_assoc($result);
$var_bizname=$rowb['business_name'];
$business_owner =   $rowb['user_id'];

///////////////////////page exist///////////////////////

if(empty($rowb[business_name])) {
  $msg= l("Business not exist!");
}


if($business_owner!=get_user_data('user_id')) {
    $msg=l("This business is not yours!");
}

/*
$sql = "select * from `business` where business_id= $biz_id and user_id= $business_owner";
$res = mysql_query($sql);
$row = mysql_fetch_assoc($res);
*/

// Get biz cat item ids used by the category of this business record
$istring = items_is_whos($biz_id);

// if the category has items/custom fields - get the list of items  
if(!empty($istring)){
$resx = mysql_query("select * from `business_sub_category_item` where id in ($istring) order by type");     // ORDER BY - workaround for required field validation, all checkboxes are put together

$i = 0;
    while($rowx = mysql_fetch_assoc($resx)) {
        // Get the items information
        $var_items[] = $rowx;
        
        // Get the value for each item in biz record
        $res_bitem = mysql_query("select * from `business_feature_item` where business_id=$biz_id and status=1 and item_id=" . $rowx[id]);
        $row_bitem = mysql_fetch_assoc($res_bitem);
        
        
        // Store in array which value is selected
        $var_items[$i][chosen] =  $row_bitem[value];
        
        // Convert value from string to array for checkbox value

        if (strpos ($var_items[$i][chosen], '|')){
           $var_items[$i][chosen] = explode('|', $var_items[$i][chosen]);             
        }
        
        
        $rowx[value] = htmlspecialchars($rowx[value]);
         // Convert the available values from string to array - needed to display on tpl 
        $var_items[$i][value_array] =  explode("|",$rowx[value]);
        $i++;
    }
    
    //  Get the list of required fields
    $resx2 = mysql_query("select * from `business_sub_category_item` where id in ($istring) AND required='1' AND type !='checkbox'");
     
    while($rowx2 = mysql_fetch_assoc($resx2)) {

        if($rowx2['type']=='checkbox'){
            //$require_fields[]='"ch_' . $rowx2[id] . '"';    won't work for checkboxes
        }elseif($rowx2['type']=='radio'){
            $required_fields[]='"iii_' . $rowx2[id].'"';
        }else{
            $required_fields[]='"t_' . $rowx2[id].'"';    
        }
        $required_fields_name[]='"'.$rowx2[title].'"';

    }
}                                            

// for javascript  - required fields
//$required_fields = '"iii_5","iii_3"';

$required_fields = implode(',', $required_fields);
$required_fields_name = implode(',', $required_fields_name);
$alertMsg = l('Please fill out the following fields:');
$smarty->assign("required_fields",$required_fields); 
$smarty->assign("required_fields_name",$required_fields_name);
$smarty->assign("alertMsg",$alertMsg);

$page_title = l('Additional Info').' | '.get_sitename();  
$smarty->assign("var_biz_id",$biz_id);
$smarty->assign("var_items",$var_items);
$smarty->assign("var_bizname",$var_bizname); 
$smarty->assign("msg",$msg); 
$smarty->assign("page_title",$page_title); 
$smarty->display('biz/set_category_item.tpl');
?>