<?php 
/**
 * MeePlace Edit profile
 * @package MeePlace
 * @subpackage Profile
 
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
@set_time_limit(0);
@ini_set("memory_limit","80M");


if(empty($_SESSION["email"]) and empty($_SESSION["display_name"]) )
{
header("Location: ./login.php");
exit;
}

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');

$user_id = get_user_data(user_id);

    //Delete user  
    $rc=mysql_query("DELETE FROM `user` WHERE user_id='$user_id'");




    //Delete business_claim
    
    $rc=mysql_query("DELETE FROM `business_claim` WHERE user_id='$user_id'");

    //Delete biz following
     $rc=mysql_query("DELETE FROM `bookmark` WHERE user_id='$user_id'");

    //Delete comment
     $rc=mysql_query("DELETE FROM `comment` WHERE user_id='$user_id'");

    //Delete comment
     $rc=mysql_query("DELETE FROM `comment` WHERE target_id='$user_id'");

    //Delete compliment
     $rc=mysql_query("DELETE FROM `compliment` WHERE user_id='$user_id'");

    //Delete compliment
     $rc=mysql_query("DELETE FROM `compliment` WHERE target_id='$user_id'");

    //Delete deals
     $rc=mysql_query("DELETE FROM `deals` WHERE user_id='$user_id'");
 
    //Delete deals_reply
     $rc=mysql_query("DELETE FROM `deals_reply` WHERE user_id='$user_id'");

    //Delete event_cool
     $rc=mysql_query("DELETE FROM `event_cool` WHERE user_id='$user_id'");

    //Delete event_discuss
     $rc=mysql_query("DELETE FROM `event_discuss` WHERE user_id='$user_id'");

    //Delete event_in
     $rc=mysql_query("DELETE FROM `event_in` WHERE user_id='$user_id'");

    //Delete favorite
     $rc=mysql_query("DELETE FROM `favorite` WHERE user_id='$user_id'");

    // Delete friends
     $rc=mysql_query("DELETE FROM `friend` WHERE user_id='$user_id'");
     $rc=mysql_query("DELETE FROM `friend` WHERE friend_id='$user_id'");
 
    // Delete list
     $rc=mysql_query("DELETE FROM `list` WHERE user_id='$user_id'");

    // Delete private messages
     $rc=mysql_query("DELETE FROM `masssge` WHERE user_id='$user_id'");

    // Delete chatter/forum
     $rc=mysql_query("DELETE FROM `talk` WHERE user_id='$user_id'");
     $rc=mysql_query("DELETE FROM `talk_reply` WHERE user_id='$user_id'");

     // Delete event
     $rc=mysql_query("DELETE FROM `event` WHERE user_id='$user_id'");

     // Update biz rating and review count before deleting reviews
     
     $query="select rating, business_id from `business_reviews` where `user_id`= '$user_id'";
     $rc=mysql_query("$query") or die("ERROR: $query");
     $total = mysql_num_rows($rc);
     if ($total){
                while ($row = mysql_fetch_array($rc)){
                $rating = $row['rating'];
                $business_id = $row['business_id'];
                $query="select rating, reviews_num from `business` where `business_id`= '$business_id' LIMIT 1";
                $rc2=mysql_query("$query") or die("ERROR: $query");
                $row2 = mysql_fetch_array($rc2);
                $current_rating = $row2['rating'];
                $current_reviews_num = $row2['reviews_num'];
                
                $new_rating =  (($current_rating * $current_reviews_num) - $rating) / ($current_reviews_num - 1);
                
                $query = "update `business` set rating = '$new_rating', reviews_num = (reviews_num - 1) WHERE `business_id`= '$business_id'"; 
                $rc3=mysql_query("$query") or die("ERROR: $query");  
                }
     }
     
     //Delete reviews
    
    $rc=mysql_query("DELETE FROM `business_reviews` WHERE user_id='$user_id'");
     

     //Delete photo  

            $query="select photo_url from `user_photo` where `user_id`= '$user_id'";
            $rc=mysql_query("$query") or die("ERROR: $query");
            $total = mysql_num_rows($rc);
            if ($total){
                while ($row = mysql_fetch_array($rc)){
                $photo_url = $row['photo_url'];
                if($photo_url){
                    $photo1 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_100x100';
                    $photo2 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_16x16';
                    $photo3 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_20x20';
                    $photo4 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_40x40';
                    $photo5 = _ABSPATH_.'/images/photos/p_'.$photo_url.'_60x60';
                    $photo6 = _ABSPATH_.'/images/photos/p_'.$photo_url;

                    unlink($photo1);
                    unlink($photo2);
                    unlink($photo3);
                    unlink($photo4);
                    unlink($photo5);
                    unlink($photo6); 
                }
                } 
            
            $rc=mysql_query("DELETE FROM `user_photo` WHERE user_id='$user_id'");
            }
            

session_destroy(); 

header("Location: /");   
?>