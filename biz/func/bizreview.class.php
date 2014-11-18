<?php
/**
 * MeePlace business review class    !!! temporary only for first page of reviews. good for SEO.  Waiting to move previous method to this class. and cancel the previous 'getreview.php'
 * @since v2.76
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
include_once(_ABSPATH_."/inc/func/header.php");

class BizReview
{
	/*
	 * Review page number
	 */
	public $page;

	public $searchtext;

	public $order;
	/*
	 * Logged in user info array
	 */
	public $var_me;
	/*
	 * Business owner user info array
	 */
	public $var_owner;
	/*
	 * Business info array
	 */
	public $var_biz;
	/*
	 * Review data
	 */
	public $var_list;
	/*
	 * Review other properties
	 */
	public $var_lists;
	/*
	 * Construct function
	 */
	public function __construct($biz_id)
	{
		@session_start();
		$this->var_biz['business_id']=(int)$biz_id;

		$this->page=1;

		$this->initBizInfo();


		$this->searchtext=$_REQUEST['searchtext'];
		$this->order=($_REQUEST['order'])?$_REQUEST['order']:'time';

	}
	/*
	 * Initiater Business array
	 */
	private function initBizInfo()
	{
		$query="select * from `business` where `business_id`= '".$this->var_biz['business_id']."' and `approved`=1";
		$result=mysql_query($query);
		$row=mysql_fetch_assoc($result);
		if($_SESSION["email"] or $_SESSION["display_name"]) {
			$this->var_me['user_id']=get_user_data('user_id');
		}
		$this->var_owner['user_id']=$row['user_id'];   // current owner user id
		$this->var_biz=$row;
		////
	}
	/*
	 * Owner Reply action
	 */
	public function ownerReply()
	{
		if(!empty($_REQUEST[reviewid]) && $this->var_me['user_id'] &&  $this->var_me['user_id']==$this->var_owner['user_id'])
		{
					$review_id=$_REQUEST[reviewid];
					$owner_reply=strip_tags(trim($_REQUEST['replytext']));
					$owner_reply=str_replace("[br]","<br />",$owner_reply);
					$owner_reply_date=date(YmdHis);
					mysql_query("UPDATE `business_reviews` SET  `owner_reply` =  '$owner_reply' WHERE  `review_id` =$review_id LIMIT 1 ;");
					mysql_query("UPDATE `business_reviews` SET  `owner_reply_date` =  '$owner_reply_date' WHERE  `review_id` =$review_id LIMIT 1 ;");
					return true;
		}
		else
			return false;
	}
	/*
	 * Get reviews HTML
	 */
	public function getReviewsHtml($page='')
	{
		global $smarty;
		if (!$page) $page=$this->page;

		$rc="select * from `business_reviews` where business_id='".$this->var_biz['business_id']."' and `approved` = 1 ";
		if(!empty($this->searchtext))
		$rc.=" and`review_desc` like '%$_REQUEST[searchtext]%'";

		$rows=mysql_query($rc);
		$rows=mysql_num_rows($rows);
		$limitfrom=($page-1)*10;

		if($this->order=='time')
		$rc.="  ORDER BY `review_date` DESC ";
		elseif($this->order=='rating')
		$rc.="  ORDER BY `rating` DESC ";
		$rc.="  LIMIT $limitfrom,10";
		$rc= mysql_query($rc);
		//$limitto=mysql_num_rows($rc);	//
		$i=0;
		while($row=mysql_fetch_array($rc))
		{
		$this->var_lists['found']='yes';
		if($_SESSION["admin_type"]){
            $this->var_list[$i]['edit_btn']='1';
        }
		$this->var_list[$i]['userid']=$row[user_id];
		$this->var_list[$i]['username']=get_user_data(nameORemail,$row[user_id]);
		$this->var_list[$i]['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
		$this->var_list[$i]['friendsnum']=get_user_data(friends_num,$row[user_id]);
		$this->var_list[$i]['reviewsnum']=get_user_data(reviews_num,$row[user_id]);
		$this->var_list[$i]['location']=get_city_name(get_user_data(city,$row[user_id]));
		$this->var_list[$i]['ratingmod']=get_rating_img($row[rating]);
		$this->var_list[$i]['date']=turn_date($row[review_date],ftimeordate);
		$this->var_list[$i]['msg']=$row[review_desc];
		$this->var_list[$i]['bizid']=$this->var_biz[business_id];
		$this->var_list[$i]['reviewid']=$row[review_id];
		$this->var_list[$i]['owner_reply']=$row[owner_reply];
		$this->var_list[$i]['owner_reply_date']=turn_date($row[owner_reply_date],ftimeordate);
		$this->var_list[$i]['useful']=$row[useful];
		$this->var_list[$i]['funny']=$row[funny];
		$this->var_list[$i]['lame']=$row[lame];
		$this->var_list[$i]['fb_user_id']=get_user_data(fb_user,$row[user_id]);

        //get mulitple ratings
        $query="SELECT `business_rating`.rating, `business_rating_items`.title FROM `business_rating`,`business_rating_items` WHERE `business_rating`.item_id=`business_rating_items`.item_id AND `business_rating`.review_id='".$row['review_id']."'";

        $rc2= mysql_query($query);
        $total = mysql_num_rows($rc2);
            if ($total >0){
                $j =0;
                    while($row2=mysql_fetch_array($rc2)){
                       $this->var_list[$i]['mrating'][$j]['rating']= get_rating_img($row2['rating']);
                       $this->var_list[$i]['mrating'][$j]['title']= l($row2['title']);
                       $j+=1;
                    }
		    }
            $i+=1;
        }

		$pagerObj= new Helper_Pagination();
		$pagerObj->fp=$this->var_biz['business_id'];

		$pagerObj->curPageNum=$page;
		$pagerObj->totalItemNum=$rows;
		$pagerObj->itemNumPerPage=10;
		$pagerObj->additionValue=",'r'";

		$this->var_lists['pager']=$pagerObj->makeHTML();

		$smarty->assign("var_lists",$this->var_lists);
		$smarty->assign("var_list",$this->var_list);
		$smarty->assign("var_me",$this->var_me);
		$smarty->assign("var_owner",$this->var_owner);
		return $smarty->fetch('biz/func/getreview.tpl');
	}
	/*
	 * Get first page html
	 */
	public function getFirstPageHtml()
	{
		return $this->getReviewsHtml($page=1);
	}
}





/*


///////////////  if  comment
if(!empty($_REQUEST[comment]))
{
@session_start();
if($_SESSION["email"] or $_SESSION["display_name"]) {
		$rc = mysql_query("select * from `business` where business_id='$_REQUEST[id]' and `approved`=1");
		$row=mysql_fetch_array($rc);
		$city_id=$row[city_id];
		$reviews_num=$row[reviews_num]+1;
		$cat_id=$row[cat_id];

		$review_desc=strip_tags(trim($_REQUEST['comment']));
		$review_desc=str_replace("[br]","<br />",$review_desc);
		$review_date=date(YmdHis);
		$user_id=get_user_data(user_id);
		$business_id=$_REQUEST['id'];
		$rating=$_REQUEST['rating'];

		$query="insert into `business_reviews` (`review_desc`,`review_date`,`user_id`,`business_id`,`rating`,`cat_id`,`city_id`) values ('$review_desc','$review_date','$user_id','$business_id','$rating','$cat_id','$city_id')";
		$result=mysql_query($query);

		$rc = mysql_query("select * from `business_reviews` where business_id='$_REQUEST[id]'");
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
		////////user 's  review number //////////
		$row = mysql_fetch_array(mysql_query("select * from `user` where user_id='$user_id'"));
		$reviews_num=$row[reviews_num]+1;
		$query="UPDATE `user` set reviews_num='$reviews_num' where user_id='$user_id'";
		$result=mysql_query($query);
		//////////end review number adding////////
}
}

*/




?>