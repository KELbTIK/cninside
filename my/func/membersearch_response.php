<?php
/**
 * MeePlace a member search interface
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
include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_."/inc/func/header.php");


function search_user_search($keyword)
{

$keywords = explode(" ", $keyword);
$i=0;
$scity = $_GET['scity'];
if ($_GET['scity']){
        $rc="select * from `user` as u, city as c where c.city_id=u.city ";
        while($i<count($keywords)) {
		        $rc .= "  and ( u.first_name LIKE '%$keywords[$i]%' OR u.last_name LIKE '%$keywords[$i]%' OR u.nickname LIKE '%$keywords[$i]%' OR u.headline LIKE '%$keywords[$i]%' OR u.find_me_in LIKE '%$keywords[$i]%' OR u.hometown LIKE '%$keywords[$i]%' OR u.blog_url LIKE '%$keywords[$i]%' OR u.not_planet LIKE '%$keywords[$i]%' OR u.review_comment LIKE '%$keywords[$i]%' OR u.fav_web LIKE '%$keywords[$i]%' OR u.book LIKE '%$keywords[$i]%' OR u.concert LIKE '%$keywords[$i]%' OR u.movie LIKE '%$keywords[$i]%' OR u.meal LIKE '%$keywords[$i]%' OR u.do_not_tell LIKE '%$keywords[$i]%' OR u.discovery LIKE '%$keywords[$i]%' OR u.current_crash LIKE '%$keywords[$i]%' OR c.city_name like '%$keywords[$i]%') AND (c.city_name like '%$scity%' OR u.hometown LIKE '%$scity%')";
		        $i++;
		        $rows=mysql_query($rc);
		        $rows=mysql_num_rows($rows);	
        }

}else{

               $rc="select * from `user` as u where ";
        while($i<count($keywords)) {
                $rc .= "  ( u.first_name LIKE '%$keywords[$i]%' OR u.last_name LIKE '%$keywords[$i]%' OR u.nickname LIKE '%$keywords[$i]%' OR u.headline LIKE '%$keywords[$i]%' OR u.find_me_in LIKE '%$keywords[$i]%' OR u.hometown LIKE '%$keywords[$i]%' OR u.blog_url LIKE '%$keywords[$i]%' OR u.not_planet LIKE '%$keywords[$i]%' OR u.review_comment LIKE '%$keywords[$i]%' OR u.fav_web LIKE '%$keywords[$i]%' OR u.book LIKE '%$keywords[$i]%' OR u.concert LIKE '%$keywords[$i]%' OR u.movie LIKE '%$keywords[$i]%' OR u.meal LIKE '%$keywords[$i]%' OR u.do_not_tell LIKE '%$keywords[$i]%' OR u.discovery LIKE '%$keywords[$i]%' OR u.current_crash LIKE '%$keywords[$i]%')";
                $i++;
                $rows=mysql_query($rc);
                $rows=mysql_num_rows($rows);    
        }
}


if($_GET['rank']=='reviews_num')
$rc.=" order by `reviews_num` DESC ";
else
$rc.=" order by `user_id` DESC ";
$limitfrom=($_GET[page]-1)*5;
$rc.=" LIMIT $limitfrom,5";

$rc= mysql_query($rc);

$limitto=mysql_num_rows($rc);

echo l("Show")." ".($limitfrom+1)." ".l('to')." ".($limitfrom+$limitto)." / ".$rows." ".l('items').".";
		while($row=mysql_fetch_array($rc))
		{
		$found="yes";
		?>
		<div class="con">
<div style="float:left; width:100px; text-align:center; padding-top:5px; padding-bottom:5px; height:100px"><a href="./?id=<?=$row[user_id]?>"><img src="../images/photos/p_<?=$row[photo_url]?>_100x100" border="0"/></a></div>
<div style="float:left; padding-left:10px; width:550px;">

<h3><a href="./?id=<?=$row[user_id]?>"><?=get_user_data(nameORemail,$row[user_id])?></a></h3>
              <?php
              if(get_city_name($row[city]))
			  echo l('Location').": ".get_city_name($row[city])."<br />";?>
              
              <?php
			 //echo $row[nickname]?" Nickname: ".$row[nickname].", ":"";
				echo $row[headline]?" Headline: ".$row[headline].", ":"";
				echo $row[find_me_in]?" Find Me In: ".$row[find_me_in].", ":"";
				echo $row[hometown]?" Hometown: ".$row[hometown].", ":"";
				echo $row[not_planet]?" When Not Using Your Caddy: ".$row[not_planet].", ":"";
				echo $row[fav_web]?" Second Favorite Website: ".$row[fav_web].", ":"";
				echo $row[book]?" The Last Great Book I Read: ".$row[book].", ":"";
				echo $row[concert]?" First Concert: ".$row[concert].", ":"";
				echo $row[movie]?" Favorite Movie: ".$row[movie].", ":"";
				echo $row[meal]?" Last Meal On Earth: ".$row[meal].", ":"";
				echo $row[do_not_tell]?" Favorite Course: ".$row[do_not_tell].", ":"";
				echo $row[discovery]?" Most Recent Discovery: ".$row[discovery].", ":"";
				echo $row[current_crash]?" Favorite Golfer: ".$row[current_crash].", ":"";
			  ?><br />
<em><?=l('Member Since')?>: <?=turn_date($row[reg_date],fdate)?>
<br /><?=$row['reviews_num']?> <?=l('reviews')?>
<br /><?=l('Compliments')?>: <?=$row['vote_funny']?> <?=l('FUNNY')?>, <?=$row[vote_cool]?> <?=l('COOL')?></em>
<br />

<a class="Bbtn" href="/my/?id=<?=$row[user_id]?>"><?=l('View Profile')?></a> 
<?php 
$user_id=get_user_data('user_id');
$id=$row[user_id];
			$result=mysql_query("SELECT * FROM `friend` where user_id='$user_id' and friend_id='$id' and `verify_code`=''");	
			
			if(mysql_num_rows($result)!=0)
			echo "<em>".l('This is your friend')."</em>";
			?>
            
</div></div><div id="clear"></div>

<?php

 }
echo get_page_list($_GET[page],$rows,5); //($CurPage,$TotalItem,$PageSize)

if(!$found){echo "<br/><br/><br><br><center>No result found.</center><br><br><br>";}
}





search_user_search($_GET[srm]);
?>
             <div id="clear"></div>