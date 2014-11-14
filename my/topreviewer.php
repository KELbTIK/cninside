<?php 
/**
 * MeePlace Top Reviewer
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
include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');




?>
<!-- Non-common HEAD Section  Start-->
<title>Top Reviewers  -</title>
<!-- Non-common HEAD Section  End-->
<div class="body">


    <div class="body_center">
      
      <h2 class="body_center_title2">Top Reviewers</h2>
<?php
$rc = mysql_query("SELECT distinct(user_id) FROM `business_reviews`");
$ids = array();
while($row=mysql_fetch_array($rc))
{
	$x = mysql_query("SELECT count(*) as cnt FROM `business_reviews` where user_id=".$row['user_id']);
	$rrr = mysql_fetch_assoc($x);
	$ids[] = array($row['user_id']=>$rrr['cnt']);
}
foreach($ids as $v)
{
	foreach($v as $k=>$vv)
	{
		$iids[$k] = $vv;
	}
}
$iii = 1;
arsort($iids);
foreach($iids as $k=>$v)
{
	if($iii>15)
		break;
	$rc = mysql_query("SELECT * FROM `user` where user_id=".$k);
	$row = mysql_fetch_assoc($rc);
	if(file_exists("images/photos/p_".$row[user_id]))
		$imgsrc = "../images/photos/p_".$row[user_id];
	else
		$imgsrc = "../images/photos/p_";
?>
      <div class="reviews_list">
        <p class="reviews_pic">
		<a href="<?=$_si['siteurl']?>my/<?=get_user_data(nameORemail,$row[user_id])?>-<?=$row[user_id]?>"><img src="<?=$imgsrc?>" width="40" height="40" border="0" alt="" /></a>
		</p>
        <ul class="reviews_cont">
          <li class="reviews_name">User name:<a href="<?=$_si['siteurl']?>my/<?=get_user_data(nameORemail,$row[user_id])?>-<?=$row[user_id]?>"><?=get_user_data(nameORemail,$row[user_id])?></a></li>
          <li class="reviews_time">Total reviews:<?=$v?></li>
          <li class="reviews_text">Location:<?=get_city_name($row[city])?></li>
        </ul>
        <p class="line1"></p>
      </div>
<?php
$iii += 1;
 }?>
    </div>
    <div class="body_right">
      <h2 class="body_right_title">Recent Reviewer</h2>
      <div class="body_right_cont">
<?php
$k=0;// last user 
$t=0;// aready listed
while($t<2)
{
	$query=mysql_query("SELECT * FROM `business_reviews`   ORDER BY `review_date` DESC limit $k,1");
$row=mysql_fetch_array($query);
$k+=1;

	if($row[user_id]!=$user_id) 
	{$user_id=$row[user_id];
	?>
        <div class="reviewer_list">
          <p class="reviewer_pic"><img src="<?=$_si['siteurl']?>images/photos/p_<?=get_user_data(photo_url,$user_id)?>" onload="imgsize(this,60,60)" /></p>
          <ul class="reviewer_cont">
            <li class="reviewer_name"><a href="<?=$_si['siteurl']?>my/<?=get_user_data(nameORemail,$user_id)?>-<?=$user_id?>"><?=get_user_data(nameORemail,$user_id)?></a></li>
            <li class="reviewer_add"><span>Location:</span><?=get_city_name(get_user_data(city,$user_id))?></li>
            <li class="reviewer_time"><span>Member Since:</span><?=turn_date(get_user_data('reg_date',$user_id),fdate)?></li>
            <li class="reviewer_view"><a href="<?=$_si['siteurl']?>my/<?=get_user_data(nameORemail,$user_id)?>-<?=$user_id?>">View Profile</a></li>
          </ul>
        </div>
        <p class="line2"></p>
<?php 
$t+=1;
}
}
?>
      </div>
      <h2 class="body_right_title">Hot business</h2>
      <div class="body_right_boder">
<?php 
// the most reviewed business in past 3 days
$nowF=date(Ymd)-3;
$nowF.="000000";
$query="SELECT count( * ) AS num, business_id FROM business_reviews WHERE review_date >$nowF  and 1=1 GROUP BY business_id ORDER BY `num` DESC LIMIT 0 , 1";
$row=mysql_fetch_array(mysql_query($query));
$num=$row[num];
@$row=mysql_fetch_array(mysql_query("SELECT * FROM business WHERE business_id=$row[business_id] LIMIT 0 , 1"));
if(!empty($row[business_id])){
?>
        <div class="business_list">
		  <h3 class="hotbusiness_name"><a href="<?=$_si['siteurl']?>business/<?=seotitle($row[business_name])?>-<?=$row[business_id]?>"><?=utf_substr($row[business_name],25)?></a><?=special_icon($row[business_level])?></h3>
          <p class="business_pic"><a href="<?=$_si['siteurl']?>business/<?=seotitle($row[business_name])?>-<?=$row[business_id]?>">
		  <img src="<?=$_si['siteurl']?>images/business/t_<?=$row[photo_url]?>" border="0" onload="imgsize(this,100,100)" /></a></p>
          <ul class="business_cont">
            <li class="business_category">Category:</li>
            <li>? <a href="<?=$_si['siteurl']?>business/search/<?=seotitle(get_biz_cat($row[cat_id]))?>-<?=$row[cat_id]?>/"><?=get_biz_cat($row[cat_id])?></a> / <a href="<?=$_si['siteurl']?>business/search/<?=seotitle(get_biz_cat($row[cat_id]))?>-<?=$row[cat_id]?>/<?=seotitle(get_biz_subcat($row[sub_cat_id]))?>-<?=$row[sub_cat_id]?>/"><?=get_biz_subcat($row[sub_cat_id])?></a></li>
            <li><?=utf_substr($row[business_add1],50)?></li>
            <li><?=$row[reviews_num]?> reviews and <?=$row[click]?> clicks in all</li>
            <li>on this business</li>
            <li><?=$num?> reviewes in recent 3 days.</li>
          </ul>
        </div>
             <?php }?>  
      </div>
      <h2 class="body_right_title">New Chatters </h2>
      <div class="body_right_chatters">
<?php
$rc = mysql_query("SELECT * FROM `talk` 
ORDER BY `reply_time` DESC  LIMIT 0 , 5 ");

while($row=mysql_fetch_array($rc))
{
	if(file_exists("images/photos/p_".$row[user_id]))
		$imgsrc = "../images/photos/p_".$row[user_id];
	else
		$imgsrc = "../images/photos/p_";
?>
        <div class="chatters_list">
          <p class="chatters_pic"><img src="<?=$imgsrc?>" width="20" height="20" alt="" /></p>
          <ul class="chatters_cont">
            <li class="chatters_name"><a href="<?=$_si['siteurl']?>comm/chatter-<?=$row[topic_id]?>"><?=utf_substr($row[topic_name],25)?></a></li>
            <li class="chatters_time"><?=turn_date($row[topic_date],ftimeordate) ?></li>
          </ul>
          <p class="line3"></p>
        </div>
<?php }?>
        <p class="chatters_more"><a href="<?=$_si['siteurl']?>comm/chatter/">More...</a></p>
      </div>
      
    </div>
    <p class="clear"></p>
  </div>