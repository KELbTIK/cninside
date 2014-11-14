<?php 
/**
 * MeePlace homepage
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

		$page_title = get_homepage_title();

/////1-1    HOT BUSINESS    bookmark   from last month 30days ago till now
			$now=date(Ym)-1;
			$now.=date(d);
			$now.="000000";
			$query="SELECT count( * ) AS num, business_id FROM  bookmark where 1=1 and bookmark_date>$now GROUP BY business_id ORDER BY `num` DESC LIMIT 0 , 1";
			$rc=mysql_query($query);
			$row=mysql_fetch_array($rc);
			$rc=mysql_query("select * from `business` where business_id='$row[business_id]'  and  `approved`=1 limit 0,1");
			$row=mysql_fetch_array($rc);
			
		
			$var_hotbusiness['picurl']= 'b_'.$row['photo_url'];
			$var_hotbusiness['bizname']=utf_substr($row['business_name'],25);
			if($row['starbiz']) $var_hotbusiness['starbiz']="<img src='/theme/"._THEME_."/images/b_star.png' class='starbiz' />";
			$var_hotbusiness['ratingmod']=get_rating_img($row['rating']);
			$var_hotbusiness['catid']=$row['cat_id'];
			$var_hotbusiness['catname']=get_biz_cat_translated($row['cat_id']);
			$var_hotbusiness['catpermalink']=get_biz_cat_permalink($row['cat_id']);
			$var_hotbusiness['subcatid']=$row['sub_cat_id'];
			$var_hotbusiness['subcatname']=get_biz_subcat_translated($row['sub_cat_id']);
			$var_hotbusiness['subcatpermalink']=get_biz_subcat_permalink($row['sub_cat_id']);
			$var_hotbusiness['catid2']=$row['cat_id2'];
			$var_hotbusiness['catname2']=get_biz_cat_translated($row['cat_id2']);
			$var_hotbusiness['cat2permalink']=get_biz_cat_permalink($row['cat_id2']);
			$var_hotbusiness['subcatid2']=$row['sub_cat_id2'];
			$var_hotbusiness['subcatname2']=get_biz_subcat_translated($row['sub_cat_id2']);
			$var_hotbusiness['subcat2permalink']=get_biz_subcat_permalink($row['sub_cat_id2']);
			$var_hotbusiness['catid3']=$row['cat_id3'];
			$var_hotbusiness['catname3']=get_biz_cat_translated($row['cat_id3']);
			$var_hotbusiness['cat3permalink']=get_biz_cat_permalink($row['cat_id3']);
			$var_hotbusiness['subcatid3']=$row['sub_cat_id3'];
			$var_hotbusiness['subcatname3']=get_biz_subcat_translated($row['sub_cat_id3']);
			$var_hotbusiness['subcat3permalink']=get_biz_subcat_permalink($row['sub_cat_id3']);
			
			$var_hotbusiness['add1']=utf_substr($row['business_add1'],50);
			$var_hotbusiness['add2']=utf_substr($row['business_add2'],25);
			$var_hotbusiness['phone']=utf_substr($row['business_phone'],20);
			$var_hotbusiness['bizurl']=advanced_biz_name($row['business_id']);
			
			if(!biz_existed($row[business_id])) unset($var_hotbusiness);
			
/////1-2  OTHER  HOT BUSINESS
			$rc="SELECT count( * ) AS num, business_id FROM  bookmark where 1=1 and bookmark_date>$now GROUP BY business_id ORDER BY `num` DESC LIMIT 1 , 6";
			$rc=mysql_query($rc);
			while($row=mysql_fetch_array($rc))
			{
				$krc=mysql_query("select * from `business` where business_id='$row[business_id]' and  `approved`=1 limit 0,1");
				$krow=mysql_fetch_array($krc);
				
				if(biz_existed($krow[business_id])) 				
				$var_hotbusiness['otherhotbusiness_li'].=' <li><a href="'._BIZ_DIR_.'/'.advanced_biz_name($krow[business_id]).'">'.utf_substr($krow[business_name],20).'</a></li>';
	   		}
	   
/////2-1 BEST OF
	   
			$rc = mysql_query("SELECT count( * ) AS num, r.cat_id as cat_id, c.cat_name as cat_name FROM  business_category as c , business_reviews as r where c.cat_id=r.cat_id  GROUP BY r.cat_id ORDER BY `num` DESC LIMIT 0 , 4 ");
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
				$inrc = mysql_query("SELECT * FROM `business` where cat_id='$cur_cat' and  `approved`=1 ORDER BY `reviews_num` DESC, `rating` DESC limit 0,10 ");
				$i=0;
				while($inrow=mysql_fetch_array($inrc))
				{		
					$i+=1;
					$b_rating[$i]=$inrow[rating];
					$b_id[$i]=$inrow[business_id];
					$b_name[$i]=$inrow[business_name];
					$b_photo_url[$i]=$inrow[photo_url];
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
				{$var_bestof[$k]['bizli'].="<li>&nbsp;<a href=\""._BIZ_DIR_."/".advanced_biz_name($b_id[$i])."\" title=\"$b_name[$i] \nRating:  $b_rating[$i]\">".utf_substr($b_name[$i],15)."</a></li>";
						unset($b_rating[$i]);		unset($b_id[$i]);		unset($b_name[$i]);
				}
			}
	   
// 2-2 CATEGORIES

//////////////////////get biz cat list//////
			function get_biz_cat_list($path)
			{ 
				$rc = mysql_query("select * from `business_category` ORDER BY `cat_name` ASC");
					while($row=mysql_fetch_array($rc))
					{
						$displayName=l($row[cat_name]);
						$t.= "<li><i class=\"fa fa-".$row[cat_image]."\"></i> <a href=\"/"._CAT_DIR_."/".get_biz_cat_permalink($row[cat_id])."/\">$displayName</a></li>";
					}
					return $t; 
			}
			$var_category_li= get_biz_cat_list("./"); // between ul and /ul


// 3-1 TOP EVENTS
					 ////not end	 ////if no end time, not end
			$now=date(YmdHis);
			$query="select * from `event` where  (date_to>=$now or date_from>=$now) and  `approved`=1 ORDER BY `reviews_num` DESC   LIMIT 0 , 4";
			$up=mysql_query($query) ;
			$i=0;
			$var_topevents=array();
			while($row=mysql_fetch_array($up))
			{
					$var_topevents[$i]['picurl']=$row['photo_url'];
					$var_topevents[$i]['id']=$row['id'];
					$var_topevents[$i]['name']=utf_substr($row['event_name'],23);
					$var_topevents[$i]['time']=event_time($row['date_from'],$row['date_to']);
					$i+=1;
			}
			
// 4-1 Popular Events This Week
		
			$now=date(Ymd);
			$wd=date(N);
			
			$nowf=$now-($wd-1);
			$nowt=$now+(7-$wd);
			$nowF=$nowf."000000";
			$nowT=$nowt."240000";
			$up=mysql_query("select * from `event` where ((date_from>='$nowF' and date_from<='$nowT') or (date_to>='$nowF' and date_to<='$nowT') or (date_from<='$nowF' and date_to>='$nowT')) and  `approved`=1  ORDER BY `reviews_num` DESC   LIMIT 0 , 6");	
			$i=0;
			$var_popevents=array();
			while($row=mysql_fetch_array($up))
			{
				 $var_popevents[$i]['picurl']=$row['photo_url'];
				 $var_popevents[$i]['id']=$row['id'];
				 $var_popevents[$i]['name']=utf_substr($row['event_name'],50);
				 $var_popevents[$i]['time']=event_time($row['date_from'],$row['date_to']);
				 $i+=1;
			}
		
// 5-1 New reviews
		
			$rc = mysql_query("SELECT * FROM `business_reviews` as r ,`business` as b where r.business_id=b.business_id  and b. approved=1 ORDER BY `review_date`  DESC  LIMIT 0 , 6 ");
			$i=0;
			$var_newreviews=array();
			while($row=mysql_fetch_array($rc))
			{
				if($row['starbiz']) $var_newreviews[$i]['starbiz']="<img src='/theme/default/images/b_star.png' class='starbiz' />";
				$var_newreviews[$i]['picurl']='b_'.$row[photo_url];
				$var_newreviews[$i]['url']=advanced_biz_name($row[business_id]);
				$var_newreviews[$i]['name']=$row[business_name];
				$var_newreviews[$i]['reviewdate']=turn_date($row[review_date],ftimeordate);
				$var_newreviews[$i]['reviewdesc']=utf_substr(str_replace("<br />"," ",$row[review_desc]),70);
                
                if($_SESSION["admin_type"]){
                    $var_newreviews[$i]['edit_btn']='1'; //admin - show edit comment, delete comment buttons
                    $var_newreviews[$i]['reviewid']=$row[review_id];       
                }
                
				$i+=1;
			}       
/////////////////////////////////RIGHT//////////////////////////////////////////////

//6-1 Latest Reviewer
			$query=mysql_query("SELECT distinct user_id  FROM `business_reviews`   ORDER BY `review_date` DESC limit  2");
			$i=0;
			$var_lastreviewer=array();
			while($row=mysql_fetch_array($query))
			{
				$var_lastreviewer[$i]['uid']=$user_id=$row['user_id'];
				$var_lastreviewer[$i]['picurl']=get_user_data(photo_url,$user_id);
				$var_lastreviewer[$i]['name']=get_user_data(nameORemail,$user_id);
				$var_lastreviewer[$i]['fb_user_id']=get_user_data(fb_user,$user_id);
				$var_lastreviewer[$i]['location']=get_city_name(get_user_data(city,$user_id));
				$var_lastreviewer[$i]['regdate']=turn_date(get_user_data('reg_date',$user_id),fdate);
				if(!user_existed($user_id))
					unset($var_lastreviewer[$i]);
				else
 					$i+=1;
			}

//7-1 Hot Business  -   the most reviewed business in past 7 days
			$nowF=date(Ymd)-7;
			$nowF.="000000";
			$query="SELECT count( * ) AS num, business_id FROM business_reviews WHERE review_date >$nowF  and 1=1 GROUP BY business_id ORDER BY `num` DESC LIMIT 0 , 1";
			$row=mysql_fetch_array(mysql_query($query));
			
			$var_hotbiz['reviewnumrecent']=$row['num'];   // reviews number in 7 days
			$queryin="SELECT * FROM business WHERE business_id=$row[business_id] and  `approved`=1 LIMIT 0 , 1";			
			if(!empty($row[business_id]))// or produce an error
			{
				$row=mysql_fetch_array(mysql_query($queryin)); 
				 $var_hotbiz['bizurl']=advanced_biz_name($row['business_id']);
				 if($row['starbiz']) $var_hotbiz['starbiz']="<img src='/theme/default/images/b_star.png' class='starbiz' />";
				 $var_hotbiz['picurl']='b_'.$row['photo_url'];
				 $var_hotbiz['bizname']=utf_substr($row['business_name'],25);
				 $var_hotbiz['ratingmod']=get_rating_img($row['rating']);
				 $var_hotbiz['catid']=$row['cat_id'];
				 $var_hotbiz['catname']=get_biz_cat_translated($row['cat_id']);
				 $var_hotbiz['catpermalink']=get_biz_cat_permalink($row['cat_id']);
				 $var_hotbiz['subcatid']=$row['sub_cat_id'];
				 $var_hotbiz['subcatname']=get_biz_subcat_translated($row['sub_cat_id']);
				 $var_hotbiz['subcatpermalink']=get_biz_subcat_permalink($row['sub_cat_id']);
				 $var_hotbiz['catid2']=$row['cat_id2'];
				 $var_hotbiz['catname2']=get_biz_cat_translated($row['cat_id2']);
				 $var_hotbiz['cat2permalink']=get_biz_cat_permalink($row['cat_id2']);
				 $var_hotbiz['subcatid2']=$row['sub_cat_id2'];
				 $var_hotbiz['subcatname2']=get_biz_subcat_translated($row['sub_cat_id2']);
				 $var_hotbiz['subcat2permalink']=get_biz_subcat_permalink($row['sub_cat_id2']);
				 $var_hotbiz['catid3']=$row['cat_id3'];
				 $var_hotbiz['catname3']=get_biz_cat_translated($row['cat_id3']);
				 $var_hotbiz['cat3permalink']=get_biz_cat_permalink($row['cat_id3']);
				 $var_hotbiz['subcatid3']=$row['sub_cat_id3'];
				 $var_hotbiz['subcatname3']=get_biz_subcat_translated($row['sub_cat_id3']);
				 $var_hotbiz['subcat3permalink']=get_biz_subcat_permalink($row['sub_cat_id3']);
				
				 $var_hotbiz['add1']=utf_substr($row['business_add1'],50);
				 $var_hotbiz['add2']=utf_substr($row['business_add2'],25);
				 $var_hotbiz['phone']=utf_substr($row['business_phone'],20);
				 $var_hotbiz['zip']=$row[zip]!=0?$row[zip]:"";
				 $var_hotbiz['location']=get_city_name($row[city_id]);
				 
				 $var_hotbiz['reviewnum']=$row[reviews_num];
				 $var_hotbiz['click']=$row[click];
			}
			

//8-0  New Special Offers
	$offerObj= new MP_SpecialOffers();
	$offerObj->displayNum=3;
	$offerObj->offset=0;
	$rows=0;
	$pagerows=0;
	$var_newoffers=$offerObj->getList($rows,$pagerows);
	
			
//8-1  New Lists

			$query=mysql_query("SELECT * FROM `list` ORDER BY `id` DESC  limit 0,5");
			$i=0;
			$var_newlists=array();
			while($row=mysql_fetch_array($query))
			{
				$tempquery=mysql_query("SELECT * FROM `list_item` where list_id='$row[id]' limit 1 ") ;
				$inrow=mysql_fetch_array($tempquery);
				$tempquery=mysql_query("SELECT * FROM `business` where business_id='$inrow[business_id]' and  `approved`=1 limit 1 ") ;
				$inrow=mysql_fetch_array($tempquery);
				
				$var_newlists[$i]['picurl']=get_user_data(photo_url,$row[user_id]);
				$var_newlists[$i]['uid']=$row[user_id];
				$var_newlists[$i]['id']=$row[id];
				$var_newlists[$i]['name']=utf_substr($row[list_name],30);
				$var_newlists[$i]['desc']=utf_substr($row[list_desc],50);
				$i+=1;
			}

//9-1    New Chatters
			$rc = mysql_query("SELECT * FROM `talk` ORDER BY `reply_time` DESC  LIMIT 0 , 5 ");
			$i=0;
			$var_newchatters=array();
			while($row=mysql_fetch_array($rc))
			{
				$var_newchatters[$i]['uid']=$user_id=$row['user_id'];
				$var_newchatters[$i]['picurl']=get_user_data(photo_url,$user_id);
				$var_newchatters[$i]['uname']=get_user_data(nameORemail,$user_id);
				$var_newchatters[$i]['replytime']=turn_date($row[reply_time],ftimeordate);
				$var_newchatters[$i]['tid']=$row[topic_id];
				$var_newchatters[$i]['tname']=utf_substr($row[topic_name],25);
				$i+=1;
			}

// social buttons/icons
        
            $rc = mysql_query("SELECT * FROM `social` where is_active='1'");
            $i=0;
            $var_social=array();
            while($row=mysql_fetch_array($rc))
            {
                
                $var_social[$i]['url']=$row['url'];
                $var_social[$i]['image']=$row['image'];
                
                
                $i+=1;
            } 
	   

$var_otherhotbusiness['li']=$var_hotbusiness['otherhotbusiness_li']; // FIX 2.1 sp1

$smarty->assign("page_title",$page_title); 
$smarty->assign("var_hotbusiness",$var_hotbusiness); 
$smarty->assign("var_otherhotbusiness",$var_otherhotbusiness);  //FIX 2.1 sp1
$smarty->assign("var_bestof",$var_bestof); 
$smarty->assign("var_category_li",$var_category_li); 
$smarty->assign("var_topevents",$var_topevents);
$smarty->assign("var_popevents",$var_popevents); 
$smarty->assign("var_newreviews",$var_newreviews); 
$smarty->assign("var_lastreviewer",$var_lastreviewer); 
$smarty->assign("var_hotbiz",$var_hotbiz);
$smarty->assign("var_newoffers",$var_newoffers);
$smarty->assign("var_newlists",$var_newlists); 
$smarty->assign("var_newchatters",$var_newchatters);
$smarty->assign("var_social",$var_social);

$smarty->display('index.tpl');
   
?>