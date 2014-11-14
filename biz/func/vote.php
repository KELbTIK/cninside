<?php
/**
 * MeePlace Business reviews vote via JSON
 * @package MeePlace
 * @subpackage Business
 */
@session_start();

include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");


if($_SESSION["email"] or $_SESSION["display_name"]) 
{
	$user_id=get_user_data(user_id);
	$review_id=(int)$_POST[review_id];
	
	$rc = mysql_query("select * from `business_reviews_votelog` where review_id=".$review_id." AND user_id=".$user_id." LIMIT 1");
		if(mysql_num_rows($rc))
		{
		echo json_encode(array("state"=>"<span style='color:#ff0000'>".l('You have voted on this review before').".</span>"));
		exit;
		}
	
	
	$row = mysql_fetch_array(mysql_query("select * from `business_reviews` where review_id='$review_id'"));
	
	if('useful'==$_POST[type])  //useful
	{
	$useful=$row['useful']+1;
	$query="UPDATE `business_reviews` set useful='$useful' where review_id='$review_id'";
	}
	elseif('funny'==$_POST[type])  //funny
	{
	$funny=$row['funny']+1;
	$query="UPDATE `business_reviews` set funny='$funny' where review_id='$review_id'";
	}
	elseif('lame'==$_POST[type])  //lame
	{
	$lame=$row['lame']+1;
	$query="UPDATE `business_reviews` set lame='$lame' where review_id='$review_id'";
	}
	else  //no prama
	{
		echo "ERROR!";
		exit;
	}
	
	$result=mysql_query($query); 
	//////////end review number adding////////
	

	$query="insert into `business_reviews_votelog` (`review_id`,`user_id`) values ('$review_id','$user_id')";
	$result=mysql_query($query);
	
	
	echo json_encode(array("state"=>"<span style='color:#8DA326'>".l("Your vote posted").".</span>"));
}
else //not login
{
	echo json_encode(array("state"=>"<span style='color:#ff0000'>".l('Please <a href="/my/login.php">Sign in</a> first').".</span>"));
}
//////////////////////////////// 

?>