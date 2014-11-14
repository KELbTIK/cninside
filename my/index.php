<?php 
/**
 * MeePlace Profile homepage. For me, or friend
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
@session_start();

include_once(dirname(__FILE__)."/../inc/func/get_sth.php");
include_once(_ABSPATH_.'/inc/func/header.php');


$var_me['id']=$user_id=get_user_data('user_id');  // My user ID

if(!$_GET[id] && !$var_me['id']) // Not view friend's and not logged in
{
    session_destroy();
    header("Location: ./login.php?referer=/my/");
    exit;
}


$id=$_GET[id];  //Look for user ID


if($user_id==$id && $id)
{
    echo "<script>location='./'</script>";
    exit;
}


if(!$_GET[id])
{
    $is_me=1;
}
else
{
    $is_me=0;
}


if(empty($id))  // get id=''
$kid=$user_id;  // current id = myself
else
$kid=$id;   //   current id= get id

// PAGE f Select
        $page_text=$_GET[f];  // Set default
        switch ($_GET[f])
        {
            case "Lists":
                $is='list';
                $is_list="current";
                $disp=l("Lists");
                break;
            case "Reviews":
                $is='review';
                $is_review="current";
                $disp=l("Reviews");
                break;
            case "Payments":
                $is='payment';
                $is_payment="current";
                $disp=l("Payment History");
                break;    
            case "Compliments":
                $is='compliment';
                $is_compliment="current";
                $disp=l("Compliments");
                break;
            case "Friends":
                $is='friend';
                $is_friend="current";
                $disp=l("Friends");
                break;
            case "Bookmarks":
                $is='bookmark';
                $is_bookmark="current";
                $disp=l("Bookmarks");
                break;
            case "Im-In":
                $a="event_in";
                $is='event';
                $is_event="current";
                $disp=l("I'm In");
                break;
            case "Sounds-Cool":
                $a="event_cool";
                $is='event';
                $is_event="current";
                $disp=l("Sounds Cool");
                break;
            case "Events":
                $is='event';
                $is_event="current";
                $disp=l("Events");
                break;
            case "Favorites":
                $is='favorite';
                $is_favorite="current";
                $disp=l("Favorites");
                break;
            default:
            $is='home';
            $is_home="current";
            $disp=l("Reviews");
            $page_text="Reviews";  // HOME
        }
        
$page=empty($_GET[page])?"1":$_GET[page];
$order=empty($_GET[order])?"time":$_GET[order];
$searchtext=$_GET[searchtext];
$f=$_GET[f];


///////////////////////////////////////////////////////////////
function get_cat($id)
{
$str="SELECT * FROM `business_category` where cat_id='$id'";
$rc = mysql_query($str);
    $row=mysql_fetch_array($rc);
        return $row['cat_name'];
}
///////////////////////////////////////////////////////////////
function get_subcat($id)
{
$str="SELECT * FROM `business_sub_category` where b_sub_cat_id='$id'";
$rc = mysql_query($str);
    $row=mysql_fetch_array($rc);
        return $row['b_subcat_name'];
}
function new_msg_num()
{
    global $user_id;
     $result=mysql_query("SELECT * FROM `masssge` where msg_to='$user_id' and checked=0 and owner='$user_id'");    
    return mysql_num_rows($result);     
}
function is_friend()
{
  
  global $user_id, $id;
    $result=mysql_query("SELECT * FROM `friend` where user_id='$user_id' and friend_id='$id' and `verify_code`='' ");    
    if(mysql_num_rows($result)==0)
    return false;
    else
    return true;
}
function is_cool()
{
    
    global $user_id, $id;
    $result=mysql_query("SELECT * FROM `compliment` where user_id='$user_id' and target_id='$id' and type=1");    
    if(mysql_num_rows($result)==0)
    return false;
    else
    return true;
}
function is_funny()
{
  
    global $user_id, $id;
    $result=mysql_query("SELECT * FROM `compliment` where user_id='$user_id' and target_id='$id' and type=2");        
    if(mysql_num_rows($result)==0)
    return false;
    else
    return true;
}
/**
 * If friend request sent?
 */
function friendRequestSent($user_id, $friend_id)
{
    if(!$user_id || !$friend_id || $user_id==$friend_id )
        return false;
        
    $sql="select * from `friend` where `user_id` = {$user_id} and `friend_id` = {$friend_id} and `verify_code` != '' ";
    $rc=mysql_query($sql);
    if(mysql_num_rows($rc))
    {
        $row=mysql_fetch_assoc($rc);
        ///my/func.php?f=verifyfriend&code=".$code
        return $row['verify_code'];
    }
        
    return false;
}

///////////////////////// list /////////////////////////  
if($is_list){

  $query_user=!empty($id)?$id:$user_id;
  $rc="SELECT * FROM `list` where user_id='$query_user' ORDER BY `id` DESC  ";
  
  $rows=mysql_query($rc);
  $rows=mysql_num_rows($rows);     
  
  $limitfrom=($page-1)*10;   
  $rc.="  LIMIT $limitfrom,10";  
  $rc= mysql_query($rc);
  
  $limitto=mysql_num_rows($rc); 
  $i=0;
  while($row=mysql_fetch_array($rc))
  {
      $var_listlists['found']='yes';
      $inrc=("SELECT * FROM `list_item`  where list_id='$row[id]' ");
      $query=mysql_query($inrc);
      $inrow=mysql_fetch_array($query);
      $itemnum=mysql_num_rows($query);
      
      $var_listlist[$i]['id']= $row[id];
      $var_listlist[$i]['name']= $row[list_name];
      $var_listlist[$i]['itemnum']= $itemnum;
      $var_listlist[$i]['date']=turn_date($row[date_created],fdatetime);
      $var_listlist[$i]['desc']=$row[list_desc];
        
      $i+=1;
  }
    $var_listlists['pager']=get_page_list($_GET[page],$rows,10);
    $var_listlists['limitfrom']=$limitfrom+1;
    $var_listlists['limitto']=$limitfrom+$limitto;
    $var_listlists['itemsnum']=$rows;
}
//////////////////end list /////////////////////////////
//////////////////friend /////////////////////////////
elseif($is_friend){

  $query_user=!empty($id)?$id:$user_id;
  $rc="SELECT * FROM `friend` where user_id='$query_user' ORDER BY `id` DESC  ";
  
  //if($order=='time') $rc.=" ORDER BY `id` DESC  ";                        
  //elseif($order=='rating')            
  $rows=mysql_query($rc);
  $rows=mysql_num_rows($rows);
  
  $limitfrom=($page-1)*10;
  $rc.="  LIMIT $limitfrom,10"; 
  $rc= mysql_query($rc);
  $limitto=mysql_num_rows($rc);  
  $i=0;
  while($row=mysql_fetch_array($rc))
  {
      $var_friendlists['found']='yes';
      
      $var_friendlist[$i]['picurl']='p_'.get_user_data(photo_url,$row[friend_id]);
      $var_friendlist[$i]['id']= $row[friend_id];
      $var_friendlist[$i]['name']=get_user_data(nameORemail,$row[friend_id]);
      $var_friendlist[$i]['location']=get_city_name(get_user_data(city,$row[friend_id]));
      $var_friendlist[$i]['date']=turn_date($row[date_created],fdatetime);
      $var_friendlist[$i]['desc']=$row[list_desc];
      if(friendRequestSent($var_me['id'],$row['friend_id']))
              $var_friendlist[$i]['pending']=1;
      $i+=1;
  }
      $var_friendlists['pager']=get_page_list($_GET[page],$rows,10);
    $var_friendlists['limitfrom']=$limitfrom+1;
    $var_friendlists['limitto']=$limitfrom+$limitto;
    $var_friendlists['itemsnum']=$rows;
}
//////////////////end friend /////////////////////////////
//////////////////event /////////////////////////////
elseif($is_event){
    // menu select
    $var_eventlists['selector']= "<h3>".l('See').": [ <a href=./?f=Events>".l("Event I Submit")."</a> ] - [ <a href=./?f=Im-In>".l("Event I'm In")."</a> ] - [ <a href=./?f=Sounds-Cool>".l("Event Sounds Cool")."</a> ]<br><br></h3>";
    $query_user=!empty($id)?$id:$user_id;
    //if  default
    $rc="SELECT * FROM `event` where user_id='$query_user' ORDER BY `id` DESC ";
    //if   i'm in
    if($a=='event_in') $rc="SELECT * FROM `event_in` where user_id='$query_user' ORDER BY `id` DESC";
    // if  sounds cool
    if($a=='event_cool') $rc="SELECT * FROM `event_cool` where user_id='$query_user' ORDER BY `id` DESC";
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    
    $limitfrom=($page-1)*10;
    $rc.="  LIMIT $limitfrom,10"; 
    $rc= mysql_query($rc);
    
    $limitto=mysql_num_rows($rc); 
  $i=0;
    while($row=mysql_fetch_array($rc))
    {
      $var_eventlists['found']='yes';
      $var_eventlists['a']=$a;
      if($a=='event_in'){ /// html   IN
            $irc="SELECT * FROM `event` where id='$row[event_id]' limit 0,1 ";
            $irow=mysql_fetch_array(mysql_query($irc));
      }elseif($a=='event_cool'){/////////////////// html   COOL
            $irc="SELECT * FROM `event` where id='$row[event_id]' limit 0,1 ";
            $irow=mysql_fetch_array(mysql_query($irc));
      }
        $var_eventlist[$i]['picurl']='e_'.($irow[photo_url]?$irow[photo_url]:$row[photo_url]);
        $var_eventlist[$i]['id']=$irow[id]?$irow[id]:$row[id];
        $var_eventlist[$i]['name']=$irow[event_name]?$irow[event_name]:$row[event_name];
        $var_eventlist[$i]['date']=event_time($irow[date_from],$irow[date_to]);
        $var_eventlist[$i]['datebrief']= event_time($row[date_from],$row[date_to]);
        $i+=1;
    }
      $var_eventlists['pager']=get_page_list($_GET[page],$rows,10);
    $var_eventlists['limitfrom']=$limitfrom+1;
    $var_eventlists['limitto']=$limitfrom+$limitto;
    $var_eventlists['itemsnum']=$rows;
}
//////////////////end event /////////////////////////////
//////////////////compliment /////////////////////////////
elseif($is_compliment){

    $query_user=!empty($id)?$id:$user_id;
    $rc="SELECT * FROM `compliment` where target_id='$query_user' ORDER BY `id` DESC ";
    
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    
    $limitfrom=($page-1)*20;
    $rc.="  LIMIT $limitfrom,20";
    $rc= mysql_query($rc);
    $limitto=mysql_num_rows($rc); 
      $i=0;
    while($row=mysql_fetch_array($rc))
    {
        $var_complimentlists['found']='yes';
        if($row[type]==1) $type="COOL";
        elseif($row[type]==2) $type="FUNNY";
        
        $var_complimentlist[$i]['id']=$row[user_id];
        $var_complimentlist[$i]['name']=get_user_data(nameORemail,$row[user_id]);
        $var_complimentlist[$i]['type']=$type;
        $i+=1;
    }
      $var_complimentlists['pager']=get_page_list($_GET[page],$rows,10);
    $var_complimentlists['limitfrom']=$limitfrom+1;
    $var_complimentlists['limitto']=$limitfrom+$limitto;
    $var_complimentlists['itemsnum']=$rows;
}
//////////////////end compliment /////////////////////////////

//////////////////payment /////////////////////////////
elseif($is_payment){

    $query_user=!empty($id)?$id:$user_id;
    $rc="SELECT * FROM `transactions` where txn_user_id='$query_user' ORDER BY `txn_id` DESC ";
    
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    
    $limitfrom=($page-1)*20;
    $rc.="  LIMIT $limitfrom,20";
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
      $var_paymentlists['pager']=get_page_list($_GET[page],$rows,10);
    $var_paymentlists['limitfrom']=$limitfrom+1;
    $var_paymentlists['limitto']=$limitfrom+$limitto;
    $var_paymentlists['itemsnum']=$rows;
}
////////////////// payment /////////////////////////////

 //////////////////////  bookmark /////////////////////
elseif($is_bookmark){
    //$query_user=$user_id;
    $query_user=!empty($id)?$id:$user_id;
    $rc="SELECT * FROM `bookmark`  where user_id='$query_user' ";
    $rc.=" ORDER BY `bookmark_id` DESC   ";                
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    $limitfrom=($page-1)*10;
    $rc.="  LIMIT $limitfrom,10"; 
    $rc= mysql_query($rc);
    $limitto=mysql_num_rows($rc); 
    $i=0;
    while($row=mysql_fetch_array($rc))
    {
        $var_bookmarklists['found']='yes';
        $inrc=("SELECT * FROM `business`  where business_id='$row[business_id]' ");
        $inrow=mysql_fetch_array(mysql_query($inrc));
        $var_bookmarklist[$i]['id']=$row[business_id];
        $var_bookmarklist[$i]['name']=$inrow[business_name];
        $var_bookmarklist[$i]['rating']=$inrow[rating];
        $var_bookmarklist[$i]['myrating']=$row[rating];
        $var_bookmarklist[$i]['ratingmod']=get_rating_img($inrow[rating]);
        $var_bookmarklist[$i]['myratingmod']=get_rating_img($row[rating]);
        $var_bookmarklist[$i]['catname']=get_cat($inrow[cat_id]);
        $var_bookmarklist[$i]['subcatname']=get_subcat($inrow[sub_cat_id]);
        $var_bookmarklist[$i]['location']=get_city_name($inrow[city_id]);
        $i+=1;
    }
    $var_bookmarklists['pager']=get_page_list($_GET[page],$rows,10);
    $var_bookmarklists['limitfrom']=$limitfrom+1;
    $var_bookmarklists['limitto']=$limitfrom+$limitto;
    $var_bookmarklists['itemsnum']=$rows;
}
//////////////////end bookmark /////////////////////////////
//////////////////////////// favorite
elseif($is_favorite){
    $query_user=!empty($id)?$id:$user_id;
    $rc="SELECT * FROM `favorite` where user_id='$query_user' ORDER BY `id` DESC ";
    //if($order=='time') $rc.=" ORDER BY `id` DESC  ";                        
    //elseif($order=='rating')        
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    $limitfrom=($page-1)*10;
    $rc.="  LIMIT $limitfrom,10";
    $rc= mysql_query($rc);
    $limitto=mysql_num_rows($rc); 
    $i=0;
    while($row=mysql_fetch_array($rc))
    {
        $var_favoritelists['found']='yes';
        $var_favoritelist[$i]['id']=$row[friend_id];
        $var_favoritelist[$i]['name']=get_user_data(nameORemail,$row[friend_id]);
        $var_favoritelist[$i]['picurl']='p_'.get_user_data(photo_url,$row[friend_id]);
        $var_favoritelist[$i]['location']=get_city_name(get_user_data(city,$row[friend_id]));
        $i+=1;
    }
    $var_favoritelists['pager']=get_page_list($_GET[page],$rows,10);
    $var_favoritelists['limitfrom']=$limitfrom+1;
    $var_favoritelists['limitto']=$limitfrom+$limitto;
    $var_favoritelists['itemsnum']=$rows;
}
//////////////////end favorite /////////////////////////////
//////////////////////  home  &   review /////////////////////
else{ 
    $query_user=!empty($id)?$id:$user_id;
    $rc="SELECT * FROM `business_reviews` where user_id='$query_user' ";
    if($searchtext) $rc.=" and (`review_desc` like '%$searchtext%' ) ";
    if($order=='time') $rc.=" ORDER BY `review_date` DESC  ";                        
    elseif($order=='rating') $rc.=" ORDER BY `rating` DESC ";            
    $rows=mysql_query($rc);
    $rows=mysql_num_rows($rows); 
    $limitfrom=($page-1)*10; 
    $rc.="  LIMIT $limitfrom,10";
    $rc= mysql_query($rc);
    $limitto=mysql_num_rows($rc);
    $i=0;
    while($row=mysql_fetch_array($rc))
    {
        $var_reviewlists['found']='yes';
        $inrc=("SELECT * FROM `business`  where business_id='$row[business_id]' ");
        $inrow=mysql_fetch_array(mysql_query($inrc));
        $var_reviewlist[$i]['id']=$row[business_id];
        $var_reviewlist[$i]['name']=$inrow[business_name];
        $var_reviewlist[$i]['rating']=$inrow[rating];
        $var_reviewlist[$i]['myrating']=$row[rating];
        $var_reviewlist[$i]['ratingmod']=get_rating_img($inrow[rating]);
        $var_reviewlist[$i]['myratingmod']=get_rating_img($row[rating]);
        $var_reviewlist[$i]['catname']=get_cat($inrow[cat_id]);
        $var_reviewlist[$i]['subcatname']=get_subcat($inrow[sub_cat_id]);
        $var_reviewlist[$i]['location']=get_city_name($inrow[city_id]);
        $var_reviewlist[$i]['date']=turn_date($row[review_date],ftimeordate);
        $var_reviewlist[$i]['desc']=$row[review_desc];
        $i+=1;
    }
    $var_reviewlists['pager']=get_page_list($_GET[page],$rows,10);
    $var_reviewlists['limitfrom']=$limitfrom+1;
    $var_reviewlists['limitto']=$limitfrom+$limitto;
    $var_reviewlists['itemsnum']=$rows;
}
      
////////////////////////////////////////////////////////////////////////////
//////////////////                    Right Section                ////////////////
////////////////////////////////////////////////////////////////////////////

    
$query_user=!empty($id)?$id:$user_id;
$result=mysql_query("SELECT * FROM `friend` where user_id='$query_user' ORDER BY `id` DESC limit 0,10");    
$i=0;
while($row=mysql_fetch_array($result)){ 
    $var_friends['found']='yes';
    $var_friend[$i]['id']=$row[friend_id];
    $var_friend[$i]['picurl']='p_'.get_user_data(photo_url,$row[friend_id]);
    $var_friend[$i]['name']=utf_substr(get_user_data(nameORemail,$row[friend_id]),20);
    if(friendRequestSent($query_user,$row['friend_id']))
    {
        //It's me, then display pending friend
        if($is_me)
        {
            $var_friend[$i]['pending']=1; //pending text
        }
        //Not me, then hide pending friend
        else
        {
            unset($var_friend[$i]);
            $i--;
        }
    }
    $i+=1;
}

// Search for add friend requests
if($query_user==$var_me['id']) 
{
    $result=mysql_query("SELECT * FROM `friend` where friend_id='{$var_me['id']}' and `verify_code`!='' ORDER BY `id` DESC limit 0,10");
    while($row=mysql_fetch_array($result))
    {     
        if($row['user_id']!=$var_me['id'])
        {
            $var_friends['found']='yes';
            $var_friend[$i]['id']=$row[user_id];
            $var_friend[$i]['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
            $var_friend[$i]['name']=utf_substr(get_user_data(nameORemail,$row[user_id]),20);
            
            if($var_friend[$i]['verifycode']=friendRequestSent($row['user_id'],$row['friend_id']))
            {
                $var_friend[$i]['pending']=2; //accept link
            }
            $i+=1;
        }
    }
}
///////////////////////////////////////

// compliment
$query_user=!empty($id)?$id:$user_id;
$result=mysql_query("SELECT * FROM `compliment` where target_id='$query_user' ORDER BY `id` DESC limit 0,5");
$i=0;
while($row=mysql_fetch_array($result))
{
    $var_compliments['found']='yes';
        if($row[type]==1) $type=l("COOL");
        elseif($row[type]==2) $type=l("FUNNY");
        $var_compliment[$i]['id']=$row[user_id];
        $var_compliment[$i]['name']=utf_substr(get_user_data(nameORemail,$row[user_id]),20);
        $var_compliment[$i]['picurl']='p_'.get_user_data(photo_url,$row[user_id]);
        $var_compliment[$i]['type']=$type;
        $i+=1;
}
// lists
$query_user=!empty($id)?$id:$user_id;
$result=mysql_query("SELECT * FROM `list` where user_id='$query_user' ORDER BY `id` DESC limit 0,5");    
$i=0;
while($row=mysql_fetch_array($result))
{
    $var_sidelists['found']='yes';
    $var_sidelist[$i]['id']= $row[id];
    $var_sidelist[$i]['name']= utf_substr($row[list_name],20);
    $var_sidelist[$i]['date']=turn_date($row[date_created],fdatetime);
    $var_sidelist[$i]['desc']=utf_substr($row[list_desc],50);
    $i+=1;
}


$var_user['id']=$kid;
$var_user['name']=get_user_data('nameORemail',$kid);
$var_user['picurl']='p_'.get_user_data('photo_url',$kid);
$var_user['newmsgnum']=new_msg_num();

$var_user['isfriend']=is_friend();
$var_user['iscool']=is_cool();
$var_user['isfunny']=is_funny();
$var_user['friendRequestSent']=friendRequestSent($var_me['id'],$var_user['id']);

$var_user['coolnum']=get_user_data('vote_cool',$id);
$var_user['funnynum']=get_user_data('vote_funny',$id);

$var_user['location']=get_city_name(get_user_data('city',$id));
$var_user['regdate']=turn_date(get_user_data('reg_date',$id),fdate);
$var_user['headline']=get_user_data('headline',$id);
$var_user['find_me_in']=get_user_data('find_me_in',$id);
$var_user['hometown']=get_user_data('hometown',$id);
$var_user['blog_url']=get_user_data('blog_url',$id);
$var_user['not_planet']=get_user_data('not_planet',$id);
$var_user['review_comment']=get_user_data('review_comment',$id);
$var_user['fav_web']=get_user_data('fav_web',$id);
$var_user['book']=get_user_data('book',$id);
$var_user['concert']=get_user_data('concert',$id);
$var_user['movie']=get_user_data('movie',$id);
$var_user['meal']=get_user_data('meal',$id);
$var_user['do_not_tell']=get_user_data('do_not_tell',$id);
$var_user['discovery']=get_user_data('discovery',$id);
$var_user['current_crash']=get_user_data('current_crash',$id);


if($id) //friend's 
    $page_title = sprintf(l('%s\'s Profile'),$var_user['name']).' | '.get_sitename();  //
else //my zone
    $page_title = l('My Profile').' | '.get_sitename();  //


$var_page['title']=$page_text;
$var_page['disp']=$disp;

$var_search['page']=$page;
$var_search['order']=$order;
$var_search['searchtext']=$searchtext;

// get the count for profile
$result=mysql_query("SELECT id FROM `friend` where user_id='$kid'");    
$num_friends= mysql_num_rows($result);
$result=mysql_query("SELECT review_id FROM `business_reviews` where user_id='$kid'");
$num_reviews = mysql_num_rows($result);
$result=mysql_query("SELECT id FROM `list` where user_id='$kid'");
$num_lists= mysql_num_rows($result);
$result=mysql_query("SELECT id FROM `business_photo` where user_id='$kid'");
$num_gallery = mysql_num_rows($result);

// end

$var_get['id']=$id;
$admin_type = $_SESSION[admin_type];
$smarty->assign("admin_type",$admin_type);
$smarty->assign("var_me",$var_me); 
$smarty->assign("var_listlists",$var_listlists); 
$smarty->assign("var_listlist",$var_listlist); 
$smarty->assign("var_friendlists",$var_friendlists); 
$smarty->assign("var_friendlist",$var_friendlist); 
$smarty->assign("var_eventlists",$var_eventlists); 
$smarty->assign("var_eventlist",$var_eventlist); 
$smarty->assign("var_complimentlists",$var_complimentlists); 
$smarty->assign("var_complimentlist",$var_complimentlist); 
$smarty->assign("var_bookmarklists",$var_bookmarklists); 
$smarty->assign("var_bookmarklist",$var_bookmarklist); 
$smarty->assign("var_favoritelists",$var_favoritelists); 
$smarty->assign("var_favoritelist",$var_favoritelist); 
$smarty->assign("var_reviewlists",$var_reviewlists); 
$smarty->assign("var_reviewlist",$var_reviewlist); 
$smarty->assign("var_paymentlists",$var_paymentlists); 
$smarty->assign("var_paymentlist",$var_paymentlist);
$smarty->assign("var_friends",$var_friends); 
$smarty->assign("var_friend",$var_friend); 
$smarty->assign("var_compliments",$var_compliments); 
$smarty->assign("var_compliment",$var_compliment); 
$smarty->assign("var_sidelists",$var_sidelists); 
$smarty->assign("var_sidelist",$var_sidelist); 
$smarty->assign("page_title",$page_title); 
$smarty->assign("is",$is); 
$smarty->assign("var_user",$var_user); 
$smarty->assign("var_page",$var_page); 
$smarty->assign("var_search",$var_search); 
$smarty->assign("var_get",$var_get); 

$smarty->assign("num_friends",$num_friends);
$smarty->assign("num_lists",$num_lists);
$smarty->assign("num_reviews",$num_reviews);
$smarty->assign("num_gallery",$num_gallery); 

if( ($id) || (empty($_SESSION["email"]) && empty($_SESSION["display_name"])) ) //friend's 
$smarty->display('my/index_notfriend.tpl');
else
$smarty->display('my/index.tpl');
?>