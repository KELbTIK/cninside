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



/*
 * SEO URI Entry
 */
//===SEO Reqirement, So this subcatname is actually subcatPermalink===
if(!empty($_GET['subcatname']))
{
	$subcat_permalink = trim(htmlspecialchars($_GET['subcatname']));
    $cat_permalink = trim(htmlspecialchars($_GET['catname']));

	//$query="select * from `business_sub_category` where `permalink`= '{$subcat_permalink}' limit 1";
	$query = "SELECT *
        FROM `business_sub_category` AS s, business_category AS c
        WHERE s.b_maincat_id = c.cat_id
        AND s.permalink = '$subcat_permalink'
        AND c.permalink = '$cat_permalink' LIMIT 1";
    $result=mysql_query($query);
	$row=mysql_fetch_assoc($result);
	$cat_id=$row['b_maincat_id'];
	$subcat_id=$row['b_sub_cat_id'];
    // fix typo case for url
    if (!$cat_id) $cat_id = 1000000000;
    if (!$subcat_id) $subcat_id = 1000000000;

    $subcat_name = $row['b_subcat_name'];
    $subcat_name_lan = l( $subcat_name);
	$_GET['cat']=$cat_id;
	$_GET['subcat']=$subcat_id;

	$meta_keywords=$row['keywords'];
	$meta_description=$row['description'];

}
//===SEO Reqirement, So this subcatname is actually subcatPermalink===
elseif(!empty($_GET['catname']))
{
  $cat_permalink=$_GET['catname'];
  $cat_permalink= trim(htmlspecialchars($cat_permalink));
  $query="select * from `business_category` where `permalink`= '$cat_permalink' limit 1";
  $result=mysql_query($query);
  $row=mysql_fetch_assoc($result);
  $cat_id=$row['cat_id'];
  // fix typo case for url
  if (!$cat_id) $cat_id = 1000000000;
  $cat_name = $row['cat_name'];
  $cat_name_lan = l($cat_name);
  $cat_permalink = $row['permalink'];
  $_GET['cat']=$cat_id;
  $_GET['subcat']='';

	$meta_keywords=$row['keywords'];
	$meta_description=$row['description'];
	//has no catname nor cat id, go to search
  //if(!$cat_id) header("Location: /search/");
}
if(!empty($_GET['cityname']))
{
	$city_name=$_GET['cityname'];
	$city_name=strtolower(trim($city_name));
	$query="select * from `city` where LOWER(city_name)= '$city_name' limit 1";
	$result=mysql_query($query);
	$row=@mysql_fetch_assoc($result) or header("Location: /search");
	$city_id=$row['city_id'];
	$_GET['city']=$city_id;
}

//////////////////////get biz cat list//////
function get_biz_cat_list($path)
{
	$rc = mysql_query("select * from `business_category`  ORDER BY `cat_name` ASC");
		while($row=mysql_fetch_array($rc))
		{
			//no need   $urlPage="page=".$_GET['page'];
			//$urlCatename="catname=".get_biz_cat_permalink($row[cat_id]);
            $urlCatename="catname=".$row['permalink'];
			$urlCityname=$_GET['cityname']?("&cityname=".$_GET['cityname']):"";
			$urlSearchtext=$_GET['searchtext']?("&searchtext=".$_GET['searchtext']):"";

			$displayName=l($row[cat_name]);
			//no need   $urlSubcatname="&subcatname=".$_GET['subcatname'];
			if($_GET['searchtext']||$_GET['cityname'])
	 		$t.= "<li><a href='/search?".$urlCatename.$urlCityname.$urlSearchtext."'><i class=\"fa fa-".$row[cat_image]."\"></i> ".l($displayName)."</a></li>";
			else
			$t.= "<li><a href='/"._CAT_DIR_."/".get_biz_cat_permalink($row[cat_id])."/'><i class=\"fa fa-".$row[cat_image]."\"></i> ".l($displayName)."</a></li>";
		}
		return $t;
}


$page_title = l('Business Search').' | '.get_sitename();  //

////////////// variables ////////////////////////////

if(!empty($_GET[Hsearchtext])||!empty($_GET[Hcity])){
$searchtext=$_GET[Hsearchtext];
$city=$_GET[Hcity];}
else
{
$searchtext=$_GET[searchtext];
$city=$_GET[city];
}
$searchtext=htmlspecialchars($searchtext);
if(empty($city)) $city=0;

$subcat=$_GET[subcat];
//if(empty($subcat)){
$cat=$_GET[cat];

if(empty($cat)) $cat=0;

$page=$_GET[page];
if(empty($page)) $page=1;

$f=$_GET[f];

///////////////////////////////////////////////////////////////////
function get_subcat_list($catid)
{
	$str="SELECT * FROM `business_sub_category` where b_maincat_id='$catid' ORDER BY `b_subcat_name` ASC ";
	$rc = mysql_query($str);
	while($row=mysql_fetch_array($rc))
	{
		//no need   $urlPage="page=".$_GET['page'];
		//$urlSubcatname="subcatname=".get_biz_subcat_permalink($row[b_sub_cat_id]);
        $urlSubcatname="subcatname=".$row[permalink];
		$urlCityname=$_GET['cityname']?("&cityname=".$_GET['cityname']):"";
		$urlSearchtext=$_GET['searchtext']?("&searchtext=".$_GET['searchtext']):"";
		$catPermalink=get_biz_cat_permalink($catid);

		$displayName=l($row[b_subcat_name]);
		if($_GET['searchtext']||$_GET['cityname'])
	 		$t.= "<li><a href='/search?".$urlSubcatname.$urlCityname.$urlSearchtext."'>{$displayName}</a></li>";
		else
			$t.= "<li><a href='/"._CAT_DIR_."/$catPermalink/".$row[permalink]."/'>{$displayName}</a></li>";

	}
	return $t;
}

$var_cat['catid']=$cat;
//$var_cat['catname']=get_biz_cat_translated($cat);
$var_cat['catname'] = $cat_name_lan;
//$var_cat['catpermalink']=get_biz_cat_permalink($cat);
$var_cat['catpermalink'] = $cat_permalink;
$var_cat['catlist']=get_biz_cat_list('set');

$var_cat['subcatid']=$subcat;
//$var_cat['subcatname']=get_biz_subcat_translated($subcat);
$var_cat['subcatname'] = $subcat_name_lan;
$var_cat['subcatlist']=get_subcat_list($cat);

$var_search['cityname']=stripslashes($_GET['cityname']);
$var_search['subcatname']=$_GET['subcatname'];
$var_search['catname']=$_GET['catname'];
$var_search['page']=$_GET['page'];
$var_search['searchtext']=stripslashes($searchtext);


/////meta tag for search business
if(!$meta_keywords)
{
	$meta_keywords=_KEYWORDS_;
	$meta_keywords= str_replace("%CATEGORY%",$var_cat['catname'],$meta_keywords);
	$meta_keywords= str_replace("%SUBCATEGORY%",$var_cat['subcatname'],$meta_keywords);
	$meta_keywords=get_cleankeywords($meta_keywords);
}
if(!$meta_description)
{
	$meta_description= _DESCRIPTION_;
	$meta_description= str_replace("%CATEGORY%",$var_cat['catname'],$meta_description);
	$meta_description= str_replace("%SUBCATEGORY%",$var_cat['subcatname'],$meta_description);
	$meta_description=get_cleandescription($meta_description);
}

$page_title_cat=_PAGE_TITLE_CAT_;
    $page_title_cat= str_replace("%CATEGORY%",$var_cat['catname'],$page_title_cat);
    $page_title_cat= str_replace("%SUBCATEGORY%",$var_cat['subcatname'],$page_title_cat);
    $page_title_cat=get_cleanpage_title($page_title_cat);

/**
 * Check dulplicated business array
 *
 * @param $bid      business id who is checking for
 * @param $var_list  array needed to be checked
 * @param $extra
 */
function check_dulplicated($bid, array &$var_list, $extra, $type)
{
	for($i=0; $i<= count($var_list); $i++)
	{
		//found dulplicated
		if($bid==$var_list[$i]['id'])
		{
			//if the old one has no review, but new one has.
			//Then copy review to old one and return true to unset new item
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
//Output meta
$smarty->assign("page_keywords",$meta_keywords);
$smarty->assign("page_description",$meta_description);
$smarty->assign("page_title_cat",$page_title_cat);


$itemsPerPage=20;
//redim searhtext without htmlspecialchars
$searchtext=$_GET['searchtext'];
/// search results
$rc="select b.business_id, business_name, business_add1, business_add2, business_phone, business_web, city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, user_id, rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, description, from_hour, to_hour, weeks, price_range, submit_date, approved, permalink, starbiz, submitter_id, open_hours, b.description as `extra`, '1' as `type` from business as b where 1=1 and `approved`=1 ";
if($subcat) $rc.=" and (sub_cat_id='$subcat' OR sub_cat_id2='$subcat' OR sub_cat_id3='$subcat' ) ";
elseif($cat!=0) $rc.=" and (cat_id='$cat' OR cat_id2='$cat' OR cat_id3='$cat') ";
if($city!=0) $rc.=" and b.city_id='$city' ";
if($searchtext)
{
	$rc.=" and (`business_name` LIKE '%$searchtext%' OR `business_add1` LIKE '%{$searchtext}%' OR `business_add2`  LIKE '%{$searchtext}%' OR `description` LIKE '%{$searchtext}%' ) ";
	if( _MULTI_SEARCH_ENABLE_ )
	{
		$rc.=" union all select b.business_id, business_name, business_add1, business_add2, business_phone, business_web, b.city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, b.user_id, b.rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, b.description, from_hour, to_hour, weeks, price_range, submit_date, b.approved, b.permalink, starbiz, submitter_id, open_hours, cat_name as `extra`, '' as `type` from business as b, business_category as c where b.cat_id =c.cat_id and cat_name like '%{$searchtext}%'";
		if($subcat) $rc.=" and (b.sub_cat_id='$subcat' OR b.sub_cat_id2='$subcat' OR b.sub_cat_id3='$subcat' ) ";
		elseif($cat!=0) $rc.=" and (b.cat_id='$cat' OR b.cat_id2='$cat' OR b.cat_id3='$cat') ";
		if($city!=0) $rc.=" and b.city_id='$city' ";

		$rc.=" union all select b.business_id, business_name, business_add1, business_add2, business_phone, business_web, b.city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, b.user_id, b.rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, b.description, from_hour, to_hour, weeks, price_range, submit_date, b.approved, b.permalink, starbiz, submitter_id, open_hours, b_subcat_name as `extra`, '' as `type` from business as b, business_sub_category as s where b.sub_cat_id =s.b_sub_cat_id and b_subcat_name like '%{$searchtext}%'";
		if($subcat) $rc.=" and (b.sub_cat_id='$subcat' OR b.sub_cat_id2='$subcat' OR b.sub_cat_id3='$subcat' ) ";
		elseif($cat!=0) $rc.=" and (b.cat_id='$cat' OR b.cat_id2='$cat' OR b.cat_id3='$cat') ";
		if($city!=0) $rc.=" and b.city_id='$city' ";

		$rc.=" union all select b.business_id, business_name, business_add1, business_add2, business_phone, business_web, b.city_id, zip, b.cat_id, sub_cat_id, cat_id2, sub_cat_id2, cat_id3, sub_cat_id3, b.user_id, b.rating, click, reviews_num, photo_url, x, y, mapx, mapy, zoom, video_url, b.description, from_hour, to_hour, weeks, price_range, submit_date, b.approved, b.permalink, starbiz, submitter_id, open_hours, review_desc as `extra`, '2' as `type` from business as b, business_reviews as r where b.business_id =r.business_id and review_desc like '%{$searchtext}%'";
		if($subcat) $rc.=" and (b.sub_cat_id='$subcat' OR b.sub_cat_id2='$subcat' OR b.sub_cat_id3='$subcat' ) ";
		elseif($cat!=0) $rc.=" and (b.cat_id='$cat' OR b.cat_id2='$cat' OR b.cat_id3='$cat') ";
		if($city!=0) $rc.=" and b.city_id='$city' ";
	}
}

$rows=mysql_query($rc);
$rows=mysql_num_rows($rows);
$limitfrom=($page-1)*$itemsPerPage;
$rc.=" ORDER BY  `starbiz` DESC ,  `rating` DESC  ";
/*
 * If you don't want Star Business to be placed the top, please remove `starbiz` DESC from the query above.
 */
$rc.=" LIMIT $limitfrom,$itemsPerPage";

$rc= mysql_query($rc);
$limitto=mysql_num_rows($rc);
$i=0;
$var_list=array();
		while($row=mysql_fetch_array($rc))
		{
			if(check_dulplicated($row['business_id'],$var_list,$row['extra'],$row['type'])) continue;

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

$querystring_page = explode("&", $_SERVER['QUERY_STRING']);
array_shift($querystring_page);
$querystring_page = implode('&', $querystring_page);

		$var_lists['pager']=get_page($_GET[page],$rows,$itemsPerPage, $querystring_page);
		$var_lists['limitfrom']=$limitfrom+1;
		$var_lists['limitto']=$limitfrom+$limitto;
		$var_lists['itemsnum']=$rows;

$admin_type = $_SESSION[admin_type];
$smarty->assign("admin_type",$admin_type);
$smarty->assign("var_search",$var_search);
$smarty->assign("var_cat",$var_cat);
$smarty->assign("var_lists",$var_lists);
$smarty->assign("var_list",$var_list);
$smarty->assign("page_title",$page_title);
$smarty->display('biz/search.tpl');

?>