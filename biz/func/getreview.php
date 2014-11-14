<?php
/**
 * MeePlace business review. Get by AJAX
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
 
include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php'); 

if ( $_REQUEST['id'] )
	$var_biz['business_id']=$_REQUEST['id'];

$query="select * from `business` where `business_id`= '{$var_biz['business_id']}' and `approved`=1";
$result=mysql_query($query);
$row=mysql_fetch_assoc($result);
$var_me['user_id']=get_user_data('user_id');  
$var_owner['user_id']=$row['user_id'];   // current owner user id

///////////////  if  owner reply
if(!empty($_REQUEST[reviewid]) &&  $var_me['user_id']==$var_owner['user_id'])
{
@session_start();
if($_SESSION["email"] or $_SESSION["display_name"]) 
{
		$review_id=$_REQUEST[reviewid];
		$owner_reply=strip_tags(trim($_REQUEST['replytext']));
		$owner_reply=str_replace("[br]","<br />",$owner_reply);
		$owner_reply_date=date(YmdHis);
		mysql_query("UPDATE `business_reviews` SET  `owner_reply` =  '$owner_reply' WHERE  `review_id` =$review_id LIMIT 1 ;");
		mysql_query("UPDATE `business_reviews` SET  `owner_reply_date` =  '$owner_reply_date' WHERE  `review_id` =$review_id LIMIT 1 ;");
}
}
//////////////////////////////// 


///////////////  if  comment
if(!empty($_REQUEST[comment]))
{
	@session_start();
	if($_SESSION["email"] or $_SESSION["display_name"]) 
	{
		$rc = mysql_query("select * from `business` where business_id='$_REQUEST[id]' and `approved`=1");
		$row=mysql_fetch_array($rc);
		$city_id=$row[city_id];
		$reviews_num=$row[reviews_num]+1;
		$cat_id=$row[cat_id];

		$review_desc=strip_tags(trim($_REQUEST['comment']));
		$review_desc=str_replace("[br]","<br />",$review_desc);
		//$review_desc=addslashes($review_desc);
		$review_date=date(YmdHis);
		$user_id=get_user_data(user_id);
		$business_id=$_REQUEST['id'];
		$rating=$_REQUEST['rating'];
        
        /////////////// multiple ratings - section 1 ///////////////////
        if (strpos($rating, '&')> 0){  // get average rating for this review from multiple ratings
            $rating_array = explode('&', $rating);
            $total_rating = 0;
            $i =0;
            foreach ($rating_array as $value){
                $value_array = explode('=', $value); 
                $item_rating = $value_array[1];
                $total_rating += $item_rating;
                $i++;     
            }
         
            $rating_a = round ($total_rating / $i,0);
        
        } else{ // single rating
            $rating_a = $rating;    
        }
        
        /////////////// end of multiple ratings - section 1 ///////////////////

		if(_NEW_BIZ_REVIEW_APPROVAL_NEED_)
			$tmp_approval=0;
		else
			$tmp_approval=1;
			
		$query="insert into `business_reviews` (`review_desc`,`review_date`,`user_id`,`business_id`,`rating`,`cat_id`,`city_id`,`approved`) values ('$review_desc','$review_date','$user_id','$business_id','$rating_a','$cat_id','$city_id','$tmp_approval')";
		
		$result=mysql_query($query);
		
        /////////////// multiple ratings - section 2 ///////////////////
        if (strpos($rating, '&')> 0){ 
            $review_id = mysql_insert_id();
            foreach ($rating_array as $value){

                $value_array = explode('=', $value);
                $item_id = substr($value_array[0],6);                  
                $item_rating = $value_array[1];
                
                $query="insert into `business_rating` (`review_id`,`item_id`,`rating`) values ('$review_id','$item_id','$item_rating')";

                $result=mysql_query($query);    
            }
        }
        /////////////// end of multiple ratings ///////////////////
        
		//count average star
		if(_NEW_BIZ_REVIEW_APPROVAL_NEED_==0)
		{
			$rc = mysql_query("select * from `business_reviews` where business_id='$_REQUEST[id]' and `approved`=1 ");
			$rows=0;
			$aver_rating=0;
			while($row=mysql_fetch_array($rc))
			{
				if($row[rating]!=0)
				{
					$rows+=1;
					$aver_rating+=$row[rating];
				}
			}
			$aver_rating=round($aver_rating/$rows,2);
			//new rating   &   new reviews number
			$query="UPDATE `business` set rating='$aver_rating', `reviews_num`='$reviews_num'  where `business_id`='$_REQUEST[id]'";
			$result=mysql_query($query);
		}
		////////user 's  review number //////////
		$row = mysql_fetch_array(mysql_query("select * from `user` where user_id='$user_id'"));
		$reviews_num=$row[reviews_num]+1;
		$query="UPDATE `user` set reviews_num='$reviews_num' where user_id='$user_id'";
		$result=mysql_query($query);
		//////////end review number adding////////
		
	
		
		
		//Send Notification 
		
		$bizObj=new MP_Business();
		$bizObj->biz_id=$var_biz['business_id'];
		
		//To admin
		if(_MAILNOTIFY_ADMIN_BIZ_REVIEW_)	
		{
			$mail= new MP_Mailer();	
			$mail->fromMail = _SMTP_FROM_ ;
			$mail->fromName = _SMTP_FROMNAME_; 
			$mail->toMail=_MAILNOTIFY_ADMIN_BIZ_REVIEW_;              
			$mail->Subject  = sprintf(l("A new business review submitted"));
			$mail->Body = $mail->Subject."<br />Business:<br>{$bizObj->get('business_name')}<br>Review Content:<br />{$review_desc}<br/ ><br /><a href='http://"._DOMAIN_."/mgt/' target='_blank'>Go to Management</a>";
			$mail->MPSend();
			unset($mail);
		}
		
		//To owner
		if(_MAILNOTIFY_OWNER_BIZ_REVIEW_ && $var_owner['user_id'] && $var_owner['user_id']!==$var_me['user_id'] )	
		{
			$ownerObj=new MP_User($var_owner['user_id']);
			$reviewerObj=new MP_User($var_me['user_id']);
			$templateObj=new MP_MailTemplate('bizreview');
			
			$replaceArray= array(
						'[Time!]'=>turn_date($review_date,'fdatetime'),
						'[Sender!]'=>$reviewerObj->get_user('nameORemail'),
						'[Receiver!]'=>$ownerObj->get_user('nameORemail'),
						'[Business!]'=>$bizObj->get('business_name'),
						'[Content!]'=>$review_desc,
						'[Domain!]'=>_DOMAIN_,
						'[Sitename!]'=>_SITENAME_,
						);
			$templateObj->replaceContentWordsWithArray($replaceArray);
			$mail= new MP_Mailer();	
			$mail->fromMail = _SMTP_FROM_ ;
			$mail->fromName = _SMTP_FROMNAME_; 
			$mail->toMail= get_user_data('email',$var_owner['user_id']);             
			$mail->Subject  = sprintf(l($templateObj->getTitle()));
			$mail->Body = $templateObj->getContent();
			$mail->MPSend();
			unset($mail);
		}
		
		
	}
}



////////////////SHOW REVIEWS//////////////// 


$rc="select * from `business_reviews` where business_id='$_REQUEST[id]'  and `approved`=1  ";
if(!empty($_REQUEST['searchtext']))
$rc.=" and`review_desc` like '%$_REQUEST[searchtext]%'";

  $rows=mysql_query($rc);
  $rows=mysql_num_rows($rows);	 
  $limitfrom=($_REQUEST['page']-1)*10;	
  
if($_REQUEST['order']=='time')
  $rc.="  ORDER BY `review_date` DESC ";
elseif($_REQUEST['order']=='rating')
  $rc.="  ORDER BY `rating` DESC ";
  $rc.="  LIMIT $limitfrom,10";	
  $rc= mysql_query($rc);
  //$limitto=mysql_num_rows($rc);	//
  $i=0;
  $var_list=array();
  while($row=mysql_fetch_array($rc))
  {
  $var_lists['found']='yes';
  if($_SESSION["admin_type"]){
    $var_list[$i]['edit_btn']='1';    
  }
  $var_list[$i]['userid']=$row['user_id'];
  $var_list[$i]['username']=get_user_data(nameORemail,$row['user_id']);
  $var_list[$i]['picurl']='p_'.get_user_data(photo_url,$row['user_id']);
  $var_list[$i]['friendsnum']=get_user_data(friends_num,$row['user_id']);
  $var_list[$i]['reviewsnum']=get_user_data(reviews_num,$row['user_id']);
  $var_list[$i]['location']=get_city_name(get_user_data(city,$row['user_id']));
  $var_list[$i]['ratingmod']=get_rating_img($row['rating']);
  $var_list[$i]['date']=turn_date($row['review_date'],ftimeordate);
  $var_list[$i]['msg']=$row['review_desc'];
  $var_list[$i]['bizid']=$_REQUEST['id'];
  $var_list[$i]['reviewid']=$row['review_id'];
  $var_list[$i]['owner_reply']=$row['owner_reply'];
  $var_list[$i]['owner_reply_date']=turn_date($row['owner_reply_date'],ftimeordate);
  $var_list[$i]['useful']=$row['useful'];
  $var_list[$i]['funny']=$row['funny'];
  $var_list[$i]['lame']=$row['lame'];
  $var_list[$i]['fb_user_id']=get_user_data(fb_user,$row['user_id']);
  //get mulitple ratings
  $query="SELECT `business_rating`.rating, `business_rating_items`.title FROM `business_rating`,`business_rating_items` WHERE `business_rating`.item_id=`business_rating_items`.item_id AND `business_rating`.review_id='".$row['review_id']."'";

  $rc2= mysql_query($query);
  $total = mysql_num_rows($rc2);
      if ($total >0){
          $j =0;
            while($row2=mysql_fetch_array($rc2)){
               $var_list[$i]['mrating'][$j]['rating']= get_rating_img($row2['rating']);
               $var_list[$i]['mrating'][$j]['title']= l($row2['title']); 
               $j+=1; 
            }  
      }
      $i+=1; 
  }
  
  $var_lists['pager']= get_page_list($_REQUEST['page'],$rows,10,",'r'"); //($CurPage,$TotalItem,$PageSize)

 
$smarty->assign("var_lists",$var_lists);
$smarty->assign("var_list",$var_list);
$smarty->assign("var_me",$var_me);
$smarty->assign("var_owner",$var_owner);
$smarty->display('biz/func/getreview.tpl');

?>