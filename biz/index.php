<?php 
/**
 * MeePlace Business top category page.
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
 

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php'); 

//////////////////////////////////////////

$page_title = l('Search Reviews').' | '.get_sitename();  //

///// BEST OF
	   
			$rc = mysql_query("SELECT count( * ) AS num, r.cat_id as cat_id, c.cat_name as cat_name FROM  business_category as c , business_reviews as r where c.cat_id=r.cat_id  GROUP BY r.cat_id ORDER BY `num` DESC LIMIT 0 , 6 ");
			$k=0;
			$var_bestof=array();
			while($row=mysql_fetch_array($rc))
			{
				$k+=1;
				$var_bestof[$k]['catid']=$cur_cat=$row['cat_id']; //current cat id 
				$var_bestof[$k]['reviewnum']=$row['num'];//current num
				$var_bestof[$k]['catname']=l($row['cat_name']);
				$var_bestof[$k]['catpermalink']=get_biz_cat_permalink($row['cat_id']);
				//curr cat TOP 5 biz             
				// comment  top 10 then rating top 5
				$inrc = mysql_query("SELECT * FROM `business` where cat_id='$cur_cat' and `approved`=1 ORDER BY `reviews_num` DESC, `rating` DESC limit 0,10 ");
				$i=0;
				while($inrow=mysql_fetch_array($inrc))
				{		
					$i+=1;
					$b_rating[$i]=$inrow['rating'];
					$b_id[$i]=$inrow['business_id'];
					$b_name[$i]=$inrow['business_name'];
					$b_photo_url[$i]=$inrow['photo_url'];
				}
				
				// sort by review number, then now order by rating in the top 10
				for($s=1; $s<=($i-1);$s++)
				{
					for($j=($s+1); $j<=$i; $j++)
					{			
						if($b_rating[$s]<$b_rating[$j])
						{
							$temp_rating=$b_rating[$s];
							$temp_id=$b_id[$s];
							$temp_name=$b_name[$s];
							$temp_photo_url=$b_photo_url[$s];
							
							$b_rating[$s]=$b_rating[$j];
							$b_id[$s]=$b_id[$j];
							$b_name[$s]=$b_name[$j];
							$b_photo_url[$s]=$b_photo_url[$j];
							
							$b_rating[$j]=$temp_rating;
							$b_id[$j]=$temp_id;
							$b_name[$j]=$temp_name;
							$b_photo_url[$j]=$temp_photo_url;
						}
					}
				}
				
				$var_bestof[$k]['picurl']='b_'.$b_photo_url[1]; // top 1 biz's pic as the category's
			
				
				for($i=1;$i<=5;$i++)
				{
						$var_bestof[$k]['bizli'].="<li>&nbsp;<a href=\"".advanced_biz_name($b_id[$i])."\" title=\"$b_name[$i] \nRating:  $b_rating[$i]\">".utf_substr($b_name[$i],15)."</a></li>";
						unset($b_rating[$i]);
						unset($b_id[$i]);
						unset($b_name[$i]);
						unset($b_photo_url[$i]);
				}
			}
	   
// 2-2 CATEGORIES

//////////////////////get biz cat list//////
function get_biz_cat_list($path)
{ 
	$rc = mysql_query("select * from `business_category`  ORDER BY `cat_name` ASC");
		while($row=mysql_fetch_array($rc))
		{
			$displayName=l($row[cat_name]);
	 		$t.= "<li><img src=\"/theme/".get_theme()."/images/$row[cat_image]\" /> <a href=\"/"._CAT_DIR_."/".get_biz_cat_permalink($row[cat_id])."/\">$displayName</a></li>";
		}
		return $t; 
}
	   $var_category_li= get_biz_cat_list("../"); // between ul and /ul
	   
	   
	   

$smarty->assign("page_title",$page_title); 
$smarty->assign("var_bestof",$var_bestof); //arr
$smarty->assign("var_category_li",$var_category_li); 
$smarty->display('biz/index.tpl');
?>