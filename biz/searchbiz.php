<?php
/**
 * MeePlace Business Search.
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

$itemsPerPage=50;
/////meta tag for search business
if(!$meta_keywords)
{
    $meta_keywords=_KEYWORDS_;
    $meta_keywords=get_cleankeywords($meta_keywords);
}
if(!$meta_description)
{
    $meta_description= _DESCRIPTION_;
    $meta_description=get_cleandescription($meta_description);
}

//get values from querystring
$querystring = explode("&", $_SERVER['QUERY_STRING']);
$i=1;
foreach($querystring as $q) {
      list($key, $value) = explode("=", $q);

      // get features list - exclude first 4 element for page, sort_by, srm, city, categories    - update reset filter 577 as well
      if ($i<=5)
      {
        $querystring_array[$key]=$value;
      }else{
        $item_list_array[$key]=htmlspecialchars_decode(urldecode($value));
      }
      $i++;
}

$keyword = $_GET[srm];
//$cityname = $_GET[city];
$sort_by = $_GET[sort_by];

// set sort by
$url_sort_by = $_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING'];

$sort_by_section = "<h2> Sort By </h2>";

if ($sort_by == '1'){
    $sort_by_section .="<input type=\"radio\" checked=\"checked\" name=\"sort_by\" value=\"1\" />Best Match<br />";
}else{
    $url_sort_by = preg_replace('/(sort_by=)(\d+)/i','${1}1', $url_sort_by);
    $sort_by_section .="<input type=\"radio\" name=\"sort_by\" value=\"1\" onClick=\"window.location='$url_sort_by'; return true;\" />Best Match<br />";
}

if ($sort_by == '2'){
    $sort_by_section .= "<input type=\"radio\" checked=\"checked\" name=\"sort_by\" value=\"2\" />Highest Rated<br />";
}else{
    $url_sort_by = preg_replace('/(sort_by=)(\d+)/i','${1}2', $url_sort_by);
    $sort_by_section .= "<input type=\"radio\" name=\"sort_by\" value=\"2\" onClick=\"window.location='$url_sort_by'; return true;\" />Highest Rated<br />";
}

if ($sort_by == '3'){

    $sort_by_section .= "<input type=\"radio\" checked=\"checked\" name=\"sort_by\" value=\"3\" />Most Reviewed<br />";
}else{
    $url_sort_by = preg_replace('/(sort_by=)(\d+)/i','${1}3', $url_sort_by);
    $sort_by_section .= "<input type=\"radio\" name=\"sort_by\" value=\"3\" onClick=\"window.location='$url_sort_by'; return true;\" />Most Reviewed<br />";
}


// get categories
$cat_list = $querystring_array["categories"];
$cat_list_array = explode(',', $cat_list);

    // check checkboxes, categories and features
    function modify_url($mod)
    {
        $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $query = explode("&", $_SERVER['QUERY_STRING']);
        if (!$_SERVER['QUERY_STRING']) {$queryStart = "?";} else {$queryStart = "&";}
        // modify/delete data
        foreach($query as $q)
        {
            list($key, $value) = explode("=", $q);
            if(array_key_exists($key, $mod))
            {
                if($mod[$key])
                {
                    //$url = preg_replace('/'.$key.'='.$value.'/', $key.'='.$mod[$key], $url);
                    if($value != null){
                        $value_new = explode(',', $value);
                    }
                    $value_new[] = $mod[$key];
                    $value_new = implode(',', $value_new);
                    $url = preg_replace('/'.$key.'='.$value.'/', $key.'='.$value_new, $url);
                }
                else
                {
                    $url = preg_replace('/&?'.$key.'='.$value.'/', '', $url);
                }
            }
        }

        // add new data
        foreach($mod as $key => $value)
        {
            if($value && !preg_match('/'.$key.'=/', $url))
            {
                $url .= $queryStart.$key.'='.$value;
            }
        }
        return $url;
    }

    // uncheck checkboxes, features
    function modify_url_uncheck($mod)
    {
        $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $query = explode("&", $_SERVER['QUERY_STRING']);
        if (!$_SERVER['QUERY_STRING']) {$queryStart = "?";} else {$queryStart = "&";}
        // modify/delete data
        foreach($query as $q)
        {
            list($key, $value) = explode("=", $q);
            if(array_key_exists($key, $mod))
            {
                if($mod[$key])
                {
                    $value_new = explode(',', $value);
                    $element_uncheck = array_search($mod[$key],$value_new);
                    unset($value_new["$element_uncheck"]);
                    $value_new = implode(',', $value_new);
                    $url = preg_replace('/'.$key.'='.$value.'/', $key.'='.$value_new, $url);
                }
                else
                {
                    $url = preg_replace('/&?'.$key.'='.$value.'/', '', $url);
                }
            }
        }
        // add new data
        foreach($mod as $key => $value)
        {
            if($value && !preg_match('/'.$key.'=/', $url))
            {
                $url .= $queryStart.$key.'='.$value;
            }
        }
        return $url;
    }

    // uncheck checkboxes, categories
    function modify_url_uncheck_cat($mod)
    {
        $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $query = explode("&", $_SERVER['QUERY_STRING']);
        if (!$_SERVER['QUERY_STRING']) {$queryStart = "?";} else {$queryStart = "&";}
        // modify/delete data
        foreach($query as $q)
        {
            list($key, $value) = explode("=", $q);
            $query_array[$key]=$value;
            if(array_key_exists($key, $mod))
            {
                if($mod[$key])
                {
                    $value_new = explode(',', $value);
                    $element_uncheck = array_search($mod[$key],$value_new);
                    unset($value_new["$element_uncheck"]);
                    $value_new = implode(',', $value_new);
                    $url = preg_replace('/'.$key.'='.$value.'/', $key.'='.$value_new, $url);
                }
                else
                {
                    $url = preg_replace('/&?'.$key.'='.$value.'/', '', $url);
                }
            }
        }

        // add new data
        foreach($mod as $key => $value)
        {
            if($value && !preg_match('/'.$key.'=/', $url))
            {
                $url .= $queryStart.$key.'='.$value;
            }
        }

        return $url;
    }

    // check or uncheck radio buttons, features
    function modify_url_radio($mod)
    {
        $url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $query = explode("&", $_SERVER['QUERY_STRING']);
        if (!$_SERVER['QUERY_STRING']) {$queryStart = "?";} else {$queryStart = "&";}
        // modify/delete data
        foreach($query as $q)
        {
            list($key, $value) = explode("=", $q);
            if(array_key_exists($key, $mod))
            {
                if($mod[$key])
                {
                    $url = preg_replace('/'.$key.'='.$value.'/', $key.'='.$mod[$key], $url);

                }
                else
                {
                    $url = preg_replace('/&?'.$key.'='.$value.'/', '', $url);
                }
            }
        }
        // add new data
        foreach($mod as $key => $value)
        {
            if($value && !preg_match('/'.$key.'=/', $url))
            {
                $url .= $queryStart.$key.'='.$value;
            }
        }
        return $url;
    }



// Get main cat checkboxes list
function get_biz_cat_list_checkbox($cat_list_array, $keyword)
{

    $rc = mysql_query("select * from `business_category`  where keywords LIKE '%$keyword%' OR cat_name = '$keyword' ORDER BY `cat_name` ASC");

    $total = mysql_num_rows($rc);
    // if no result, show all categories

    if(!$total){
        $rc = mysql_query("select * from `business_category`  ORDER BY `cat_name` ASC");
    }
        while($row=mysql_fetch_array($rc))
        {
            $displayName=l($row[cat_name]);
            $cat_id = $row[cat_id];
            // Check to see checkbox is already checked
              if (array_search($cat_id, $cat_list_array) === false) {
                $checked = '';
                $url = modify_url(array("categories"=>"$cat_id"));

            }else{
                $checked = 'checked="checked"';

                $url = modify_url_uncheck_cat(array("categories"=>"$cat_id"));
                $url_host = "http://".$_SERVER['HTTP_HOST']. $_SERVER['PHP_SELF'] . '?';
                $query = str_replace("$url_host", '', $url);
                $query = explode("&", $query);
                 foreach($query as $q){
                    list($key, $value) = explode("=", $q);
                    $query_array[$key]=$value;
                 }
                // get feature list for selected categories

                $selected_categories = $query_array['categories'];

                $str="SELECT cate_item FROM `business_category` WHERE cat_id IN ($selected_categories)";
                $rc2 = mysql_query($str);
                if($rc2){
                    while($row2=mysql_fetch_array($rc2)){
                        $selected_cat_items .= ',' . $row2['cate_item'];
                    }
                }

                $selected_cat_items = explode(',', $selected_cat_items);

                // get feature list for this category
                $str="SELECT cate_item FROM `business_category` where cat_id='".$cat_id."'";
                $rc3 = mysql_query($str);
                $row3=mysql_fetch_array($rc3);
                $this_cat_items = $row3['cate_item'];

                // continue to process if this category has items, if not, nothing to do
                if( $this_cat_items) {
                    $this_cat_items = explode(',', $this_cat_items);

                    // check to see any items that are in used for other selected categories
                    foreach($this_cat_items as $k=>$v){

                        if(in_array($v,$selected_cat_items) == false){   //item not in use
                                $reset_items[] = $v;
                        }
                    }

                    // copy the query array to reset features

                    $query=$query_array;
                    if(is_array($reset_items))   { // if there is no item in use, skip here
                        foreach($query_array as $k=>$v){
                            // get the feature id out of the key
                            $k_array= explode('_',$k);

                            //check to see if this feature is okay to reset , if ok, reset element from the copied query array
                            if(in_array($k_array[0],$reset_items) ) unset($query["$k"]);

                        }
                    }

                    // setup url

                    $i=0;
                    foreach($query as $key => $value)
                    {
                            if ($i==0){
                                $url_new = $key.'='.$value;
                            }else{
                                $url_new .= '&' . $key.'='.$value;
                            }
                            $i++;
                    }
                   $url = $url_host . $url_new;

                }else{
                   $url = modify_url_uncheck_cat(array("categories"=>"$cat_id"));
                }

            }
            //reset page to 1  whenever a category is select to get paging work correctly
            $url = preg_replace('/(page=)(\d+)/i','${1}1', $url);
            $t.= "<input type=\"checkbox\" $checked id=\"maincat_$cat_id\" name=\"maincat_$cat_id\" onClick=\"window.location='$url'; return true;\" />$displayName<br />";

        }
        return $t;
}

// Get features checkboxes list
function get_item_list_checkbox($cat_list,$item_list_array, $keyword)
{

    $rc = mysql_query("select cate_item from `business_category` where cat_id IN ($cat_list)");
    if($rc) $total = mysql_num_rows($rc);
    $cat_items = '';


    if($total){

        while($row=mysql_fetch_array($rc))
        {
            // Get the list of items for each category
            $cat_items[]= trim($row['cate_item']);
        }
     }

     if(is_array($cat_items)){
        $cat_items = implode(',', $cat_items);
     }

    // convert string to array to clean up duplicates and empty elements, re-index the array
    $item_array = explode(',', $cat_items);
    $item_array = array_unique($item_array);

    foreach($item_array as $key => $value) {
        if(is_null($value) || $value == "") {
        unset($item_array[$key]);
        }
    }

    $items = array_values($item_array);
    $items = implode(',',$items);

    // get info for items
    if(count($items)>0){
        $rc = mysql_query("SELECT * FROM `business_sub_category_item` WHERE id in ($items) AND status='1'");
        if($rc){
        while($row=mysql_fetch_array($rc)) {

            $displayName=l($row["title"]);
            $item_id = $row["id"];
            $item_type = $row["type"];
            $item_values = $row["value"];

            //selected features

            $item_list_array_key = $query_key = $item_id . '_features';
            $items_in = $item_list_array["$item_list_array_key"];
            $items_in_array = explode(',', $items_in);

            // Checkboxes or radio for each item
            $item_value_array= explode('|',$item_values);

            // only print feature title/ item title for checkboxes or radio buttons
            if($item_type=='checkbox' || $item_type=='radio')
            $t .= "<div class=\"view\"><h3>$displayName</h3>";

            foreach($item_value_array as $v){
                // for print out using language, otherwise use $v
                $item_value_lan = l($v);
                //clean up spaces
                $item_value = str_replace(' ','_', $v);
                if($item_type=='checkbox'){

                    // Check to see checkbox is already checked
                    if (array_search($item_value, $items_in_array) === false) {
                        $checked = '';
                        $url = modify_url(array("$query_key"=>urlencode($item_value)));
                    }else{
                        $checked = 'checked="checked"';
                        $url = modify_url_uncheck(array("$query_key"=>urlencode($item_value)));
                    }

                    //reset page to 1  whenever a feature is select to get paging work correctly
                    $url = preg_replace('/(page=)(\d+)/i','${1}1', $url);
                     $t.= "<input type=\"checkbox\" $checked id=\"$item_id\" name=\"$item_id\" onClick=\"window.location='$url'; return true;\" />$item_value_lan<br />";

                }elseif($item_type=='radio'){

                    // Check to see which radio button is selected
                    if (array_search($item_value, $items_in_array) === false) {
                        $checked = '';
                    }else{
                        $checked = 'checked="checked"';

                    }

                    $url = modify_url_radio(array("$query_key"=>urlencode($item_value)));
                    //reset page to 1  whenever a feature is select to get paging work correctly
                    $url = preg_replace('/(page=)(\d+)/i','${1}1', $url);
                    $t.= "<input type=\"radio\" $checked id=\"$item_id\" name=\"$item_id\" value=\"$v\" onClick=\"window.location='$url'; return true;\" />$item_value_lan<br />";

                }

             }
             $t .='</div>';
         } // end while
    }// end if


        return $t;
        }

}

function check_dulplicated($bid, array &$var_list, $extra, $type)
{
    for($i=0; $i<= count($var_list); $i++)
    {
        //found dulplicated
        if($bid==$var_list[$i]['id'])
        {
            //if the old one has no review, but new one has.
            //Then copy review to old one and return true to unset new item
            $re["total_duplicate"] =$re["total_duplicate"] + 1;
            if($var_list[$i]['extra']=='' && $extra != '' && $type == 2)
            {
                $var_list[$i]['extra'] = $extra;
                $var_list[$i]['type'] = $type;
            }
            return true;
        }
    }
    return false;
}


// pagination
function get_page($CurPage,$TotalItem,$PageSize,$querrystring_page)
{
if(empty($CurPage)) $CurPage=1;
if($TotalItem==0) return false;

$totalpage=ceil($TotalItem/$PageSize);

$prename="‹";
$headname="&laquo;";
$nextname="›";
$lastname="&raquo;";

if($totalpage>1)
{
    if($CurPage==1)
    $nextnum=$CurPage+1;
    elseif($CurPage==$totalpage)
    $prenum=$CurPage-1;
    else
    {
    $prenum=$CurPage-1;
    $nextnum=$CurPage+1;
    }
}

//////  $pre  $next
if(!empty($prenum)) {
    $url="?page=$prenum&$querrystring_page";
    $pre="<li><a href=\"javascript:;\" onClick=\"window.location='$url'; return true;\">$prename</a></li>";
}else{
    $pre="<li class=\"disabled\"><span class=\"disabled\">$prename</span></li>";
}

if(!empty($nextnum)){
    $url="?page=$nextnum&$querrystring_page";
    $next="<li><a href=\"javascript:;\" onClick=\"window.location='$url'; return true;\">$nextname</a></li>";
}else{
    $next="<li class=\"disabled\"><span class=\"disabled\">$nextname</span></li>";
}
////$head  //last
if($CurPage==1) {
    $head="<li class=\"disabled\"><span class=\"disabled\">$headname</span></li>";
}else{
    $url="?page=1&$querrystring_page";
    $head="<li><a href=\"javascript:;\" onClick=\"window.location='$url'; return true;\">$headname</a></li>";
}

if($CurPage==$totalpage) {
    $last="<li class=\"disabled\"><span class=\"disabled\">$lastname</span></li>";
}else{
    $url="?page=$totalpage&$querrystring_page";
    $last="<li><a href=\"javascript:;\" onClick=\"window.location='$url'; return true;\">$lastname</a></li>";
}


if($totalpage-$CurPage>3&&$totalpage>7)
{
$ellipsis_r="...";
}

if($totalpage>7&&$CurPage>4)
{
$ellipsis_l="...";
}



if($totalpage<=7)
{
$ifrom=1;
$ito=$totalpage;
}
else // more than 7 pages
{
    //CurPage
    if($CurPage<=4)
    {
        $ifrom=1;
        $ito=7;
    }
    //CupPage
    elseif($totalpage-$CurPage<=3)
    {
        $ifrom=$CurPage-6+$totalpage-$CurPage;
        $ito=$totalpage;
    }
    //CurPage
    else
    {
        $ifrom=$CurPage-3;
        $ito=$CurPage+3;
    }
}
////num
for($i=$ifrom; $i<=$ito; $i++)
{
    if($i==$CurPage)
    {
        $num.="<li><span class=\"current\">$i</span></li>";
    }
    else
    {
        $url="?page=$i&$querrystring_page";
        $num.="<li><a href=\"javascript:;\" onClick=\"window.location='$url'; return true;\">$i</a></li>";
    }
}

$output="<ul class=\"pagination\" id=\"digg\">";
$output.=$head;
$output.=$pre;
$output.=$ellipsis_l;
$output.=$num;
$output.=$ellipsis_r;
$output.=$next;
$output.=$last;
$output.="</ul>";

return $output;
}

if($keyword =='' && !$city){
           // not showing filters
}else{
    $cat_list_checkbox = get_biz_cat_list_checkbox($cat_list_array,$keyword);
    $item_list_checkbox = get_item_list_checkbox($cat_list,$item_list_array,$keyword);
    // to reset filter
    $querystring_reset = "?page=1&sort_by=1&srm=$keyword&city=$city";

    if ($cat_list_checkbox){

        $reset = "<center><input class=\"Bbtn\" type=\"button\" value=\"".l('Reset Filter')."\" name=\"Submit\"  onClick=\"window.location='$querystring_reset'; return true;\" /></center>";

        $categories .= $cat_list_checkbox;
    }

    if ($item_list_checkbox){

        $features .= $item_list_checkbox;
    }

}

////////////////////////////////////////// Searching ///////////////////////////////////////////////////////////////
$page=$_GET[page];
if(empty($page)) $page=1;

// get cities
if(!empty($_GET['city']))
{
/*    $city_name=strtolower(trim($_GET['city']));

    $query="select city_id from `city` where city_name= LOWER('$city_name')";
    $result=mysql_query($query);
    while($row=@mysql_fetch_assoc($result)){

    $city[]=$row["city_id"];
    }

    $city = implode(',',$city); */

    $loc_string= trim($_GET['city']);
    $loc_array = explode(',', $loc_string);
    $loc_array_size = count($loc_array);
    if( $loc_array_size == 1){ // e.g. Los Angeles
        $cityname = trim($loc_array[0]);
        $query="select city_id from `city` where city_name= '$cityname'";
        $result=mysql_query($query);
        while($row=@mysql_fetch_assoc($result)){
            $city[]=$row["city_id"];
        }
        $city = implode(',',$city);
    }elseif($loc_array_size == 2){    // e.g. Paris, France
        $cityname = trim($loc_array[0]);
        $countryname = trim($loc_array[1]);

        //check country
        $query="select c_id from `country` where c_name= '$countryname'";
        $result=mysql_query($query);
        $total = mysql_num_rows($result);
        if($total >0){  //valid country
                  $query="select city_id from `city`,`province`,`country` where country.c_name= province.province_name and province.province_id = city.city_state and city_name= '$cityname' and c_name = '$countryname' LIMIT 1";
                  $result=mysql_query($query);
                  while($row=@mysql_fetch_assoc($result)){
                        $city=$row["city_id"];
                   }
        }else{ // country not found, maybe user type in state name instead  e.g. Los Angeles,CA
                $query="select city_id from `city`,`province` where province.province_id = city.city_state and city_name= '$cityname' and (province_name = '$countryname' or province_short = '$countryname')LIMIT 1";
                  $result=mysql_query($query);
                  while($row=@mysql_fetch_assoc($result)){
                        $city=$row["city_id"];
                   }
        }


    }elseif($loc_array_size >= 3){ // e.g. Los Angeles, California, United States
        $cityname = trim($loc_array[0]);
        $statename = trim($loc_array[1]);
        $countryname = trim($loc_array[2]);

        $query="select city_id from `city`,`province`,`country` where country.c_id= province.province_id and province.province_id = city.city_state and city_name= '$cityname' and (province_name  = '$statename' or province_short= '$statename')and c_name = '$countryname' LIMIT 1";
      $result=mysql_query($query);
      while($row=@mysql_fetch_assoc($result)){
            $city=$row["city_id"];
       }
    }

}

// get categories
$cat_list =  $querystring_array['categories'];
if($cat_list){
    $cat_condition = " AND b.cat_id IN ($cat_list)";
}else{
    //if no categories selected, set no category condition
    $cat_condition ='';
}

$item_filter = '';
if(is_array($item_list_array)) {
    foreach($item_list_array as $k=>$v){


        // Get items/features values
        $item_id = explode('_', $k);
        $item_id = $item_id[0];
        $item_value_array = explode(',', $v);

        // set up features/items condition

        foreach($item_value_array as $v){
            //clean up the underscores
            if($v){  //avoid empty querystring
                $v = mysql_real_escape_string(str_replace('_', ' ', $v));
                $item_filter[]= "(item_id='" . $item_id . "' AND value LIKE '%" . $v . "%') ";
            }
        }
    } //end foreach

}//end if

if ($item_filter){
    $item_filter = implode(' OR ',$item_filter);
    $item_filter = " AND ($item_filter)";
}

if(!$keyword && !$city){
    // don't perform search if both keyword and city are not entered
    $var_lists['found']='';
}else{

$rc="SELECT DISTINCT b.business_id, business_name, business_add1, business_add2, business_phone, business_web, city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, user_id, rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, description, from_hour, to_hour, weeks, price_range, submit_date, approved, permalink, starbiz, submitter_id, open_hours, b.description AS `extra`, '1' AS `type` FROM business as b LEFT JOIN business_feature_item AS i ON b.business_id = i.business_id WHERE `approved`=1 ";
$rc.=$cat_condition .  $item_filter;
if($city) $rc.=" AND b.city_id IN ($city) ";
if($keyword)
{

/*        $keywords = explode(" ", $keyword);
    $i=0;
    while($i<count($keywords)) {
        if($i==0){
        $rc_b ="`business_name` LIKE '%$keywords[$i]%' OR `description` LIKE '%$keywords[$i]%' OR `business_add1` LIKE '%$keywords[$i]%' OR `business_add2`  LIKE '%$keywords[$i]%' OR b.description LIKE '%$keywords[$i]%' ";

        $rc_c ="`cat_name` LIKE '%$keywords[$i]%'";
        $rc_c_keyword ="`keywords` LIKE '%$keywords[$i]%'";
        $rc_sc ="`b_subcat_name` LIKE '%$keywords[$i]%'";
        $rc_sc_keyword ="`keywords` LIKE '%$keywords[$i]%'";
        $rc_r ="`review_desc` LIKE '%$keywords[$i]%'";

        }else{
        $rc_b.=" OR `business_name` LIKE '%$keywords[$i]%' OR `description` LIKE '%$keywords[$i]%' OR `business_add1` LIKE '%$keywords[$i]%' OR `business_add2`  LIKE '%$keywords[$i]%' OR b.description LIKE '%$keywords[$i]%' ";

        $rc_c .=" OR `cat_name` LIKE '%$keywords[$i]%'";
        $rc_c_keyword .=" OR `keywords` LIKE '%$keywords[$i]%'";
        $rc_sc .=" OR `b_subcat_name` LIKE '%$keywords[$i]%'";
        $rc_sc_keyword .=" OR `keywords` LIKE '%$keywords[$i]%'";
        $rc_r .=" OR `review_desc` LIKE '%$keywords[$i]%'";
        }
        $i++;
    } */

    $rc_b ="`business_name` LIKE '%$keyword%' OR `description` LIKE '%$keyword%' ";
    $rc_c ="`cat_name` LIKE '%$keyword%'";
    $rc_c_keyword ="`keywords` LIKE '%$keyword%'";
    $rc_sc ="`b_subcat_name` LIKE '%$keyword%'";
    $rc_sc_keyword ="`keywords` LIKE '%$keyword%'";
    $rc_r ="`review_desc` LIKE '%$keyword%'";

    $rc .= " AND ($rc_b)";

    if( _MULTI_SEARCH_ENABLE_ )
    {
        $rc.=" UNION ALL SELECT b.business_id, business_name, business_add1, business_add2, business_phone, business_web, b.city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, b.user_id, b.rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, b.description, from_hour, to_hour, weeks, price_range, submit_date, b.approved, b.permalink, starbiz, submitter_id, open_hours, cat_name AS `extra`, '' AS `type` FROM business as b, business_category AS c WHERE b.cat_id =c.cat_id";
        $rc.=$cat_condition;
        if($city) $rc.=" AND b.city_id IN ($city) ";
        $rc .= " AND ($rc_c OR $rc_c_keyword)";

        $rc.=" union all select b.business_id, business_name, business_add1, business_add2, business_phone, business_web, b.city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, b.user_id, b.rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, b.description, from_hour, to_hour, weeks, price_range, submit_date, b.approved, b.permalink, starbiz, submitter_id, open_hours, b_subcat_name as `extra`, '' as `type` from business as b, business_sub_category as s where b.sub_cat_id =s.b_sub_cat_id";
        $rc.=$cat_condition;
        if($city) $rc.=" AND b.city_id IN ($city) ";
        $rc .= " AND ($rc_sc OR $rc_sc_keyword)";


        $rc.=" UNION ALL SELECT b.business_id, business_name, business_add1, business_add2, business_phone, business_web, b.city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, b.user_id, b.rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, b.description, from_hour, to_hour, weeks, price_range, submit_date, b.approved, b.permalink, starbiz, submitter_id, open_hours, review_desc AS `extra`, '2' AS `type` FROM business AS b, business_reviews AS r WHERE b.business_id =r.business_id";
        $rc.=$cat_condition;
        if($city) $rc.=" AND b.city_id IN ($city) ";
        $rc .= " AND ($rc_r)";
    }
}

// Clean up duplicates when mutil serch enable
if( _MULTI_SEARCH_ENABLE_ ){
    $rc = "SELECT temp.* FROM ($rc) AS temp GROUP BY temp.business_id";

}


// sort by
 if ($sort_by=='2'){
      $rc.="  ORDER BY  `rating` DESC";
 }elseif ($sort_by == '3'){
      $rc.="  ORDER BY  `reviews_num` DESC";
 }else{
    $rc .= "  ORDER BY  `starbiz` DESC";
 }


$result2=mysql_query($rc);

// total with duplicates
$rows=mysql_num_rows($result2);

$limitfrom=($page-1)*$itemsPerPage;

$rc.=" LIMIT $limitfrom,$itemsPerPage";


// run query for the current page
$result= mysql_query($rc);

$limitto=mysql_num_rows($result);
$i=0;
$var_list=array();

        while($row=mysql_fetch_array($result))
        {
            $var_lists['found']='yes';

            //Not desciption search then hide description
            if($row['type']==1 && (!$searchtext || strpos($row['description'],$searchtext)===false))
            {
                //not found searchtext in description. Hide.
                $row['extra']='';
            }

            $var_list[$i]=$row;
            $var_list[$i]['id']=$row['business_id'];
            $var_list[$i]['bizname']=$row['business_name'];
            $var_list[$i]['starbiz']=($row['starbiz']) ?"<img src='/theme/"._THEME_."/images/b_star.png' class='starbiz' />":'';
            $var_list[$i]['zip']=$row['zip'];
            $var_list[$i]['zoom']=!empty($row['zoom'])?$row['zoom']:0;
            $var_list[$i]['mapy']=$row['mapy'];
            $var_list[$i]['mapx']=$row['mapx'];
            $var_list[$i]['y']=$row['y'];
            $var_list[$i]['x']=$row['x'];
            $var_list[$i]['rating']=$row['rating'];
            $var_list[$i]['ratingmod']=get_rating_img($row['rating']);
            $var_list[$i]['reviewnum']=$row['reviews_num'];
            $var_list[$i]['click']=$row['click'];
            $var_list[$i]['picurl']='b_'.$row['photo_url'];
            $var_list[$i]['catid']=$row['cat_id'];
            $var_list[$i]['catname']=get_biz_cat_translated($row['cat_id']);
            $var_list[$i]['catpermalink']=get_biz_cat_permalink($row['cat_id']);

            $var_list[$i]['subcatid']=$row['sub_cat_id'];
            $var_list[$i]['subcatname']=get_biz_subcat_translated($row['sub_cat_id']);
            $var_list[$i]['subcatpermalink']=get_biz_subcat_permalink($row['sub_cat_id']);

            $var_list[$i]['catid2']=$row['cat_id2'];
            $var_list[$i]['catname2']=get_biz_cat_translated($row['cat_id2']);
            $var_list[$i]['cat2permalink']=get_biz_cat_permalink($row['cat_id2']);

            $var_list[$i]['subcatid2']=$row['sub_cat_id2'];
            $var_list[$i]['subcatname2']=get_biz_subcat_translated($row['sub_cat_id2']);
            $var_list[$i]['subcat2permalink']=get_biz_subcat_permalink($row['sub_cat_id2']);

            $var_list[$i]['catid3']=$row['cat_id3'];
            $var_list[$i]['catname3']=get_biz_cat_translated($row['cat_id3']);
            $var_list[$i]['cat3permalink']=get_biz_cat_permalink($row['cat_id3']);

            $var_list[$i]['subcatid3']=$row['sub_cat_id3'];
            $var_list[$i]['subcatname3']=get_biz_subcat_translated($row['sub_cat_id3']);
            $var_list[$i]['subcat3permalink']=get_biz_subcat_permalink($row['sub_cat_id3']);

            $var_list[$i]['add1']=$row['business_add1'];
            $var_list[$i]['add2']=$row['business_add2'];
            $var_list[$i]['phone']=$row['business_phone'];
            $var_list[$i]['location']=get_city_name($row[city_id]);
            $var_list[$i]['state']=get_province_name($row[city_id]);
            $var_list[$i]['video_url']=$row['video_url'];
            $var_list[$i]['web']=!empty($row[business_web])&&$row[business_web]!="http://"?"$row[business_web]":"";
            $var_list[$i]['bizurl']=advanced_biz_name($row['business_id']);

            $var_list[$i]['submitter_photo']=get_user_data('photo_url',$row['submitter_id']);
            $i+=1;
             }
} // end if

// Pagination

//remove page from querystring for pagination
$querystring_page = explode("&", $_SERVER['QUERY_STRING']);
array_shift($querystring_page);
$querystring_page = implode('&', $querystring_page);

$var_lists['pager']=get_page($_GET[page],$rows,$itemsPerPage, $querystring_page);
$var_lists['limitfrom']=$limitfrom+1;
$var_lists['limitto']=$limitfrom+$limitto;
$var_lists['itemsnum']=$rows;
$smarty->assign("page_keywords",$meta_keywords);
$smarty->assign("page_description",$meta_description);
$smarty->assign("var_keyword",$keyword);
$smarty->assign("var_cityname",$loc_string);
$smarty->assign("categories",$categories);
$smarty->assign("sort_by_section",$sort_by_section);
$smarty->assign("features",$features);
$smarty->assign("reset",$reset);
$smarty->assign("var_lists",$var_lists);
$smarty->assign("var_list",$var_list);
$smarty->assign("page_title",$page_title . ' ' . $loc_string );
$smarty->display('biz/searchbiz.tpl');

?>