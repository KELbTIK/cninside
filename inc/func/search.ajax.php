<?php 
header('Content-Type: application/json; charset=utf-8');
include_once(dirname(__FILE__)."/../../inc/func/get_sth.php");

/*
elseif($_POST['action']=="ajax" && $_POST['cities'] && $_POST['module']=="get")
{
	$keyword = trim($_POST['cities']);
	$keyword = str_replace("||sp_rp_and||", "&", $keyword);
	$query='select * from `business` where business_name="'.$keyword.'"';
	$rc=mysql_query($query);
	if($row = mysql_fetch_assoc($rc))
	{
		$queryc="select * from `city`,`city_state` where id=city_state and city_id=".$row['city_id'];
		$rcc=mysql_query($queryc);
		if($rowc = mysql_fetch_assoc($rcc))
		{
			echo $rowc['city_id']."---".strreplace($rowc['city_name']).",".$rowc['name'];
		}
	}
}*/
//////////////BIZ SEARCH//////////////
if($_POST['type']=='biz')
{
	$keyword = $_POST['biz'];
	$keyword = str_replace("||sp_rp_and||", "&", $keyword);
	if($keyword=="")
	$query="select * from `business` order by business_id DESC LIMIT 0,20";
	else
	$query="select * from `business` where business_name like '%".$keyword."%' ORDER BY business_name asc limit 0,20";
	
	$rc=mysql_query($query);
	$i=0;
	while($row = mysql_fetch_array($rc))
	{
		$array[$row['business_id']]=$row;
	}
	if(!$array) exit;
	
	
		$str="<ul>";
		foreach($array as $business_id => $row)
		{
			$showName=preg_replace("/(".$keyword.")/i","<abbr>$1</abbr>",$row['business_name']);
			
			$str.="<li onClick=\"fillBiz('".$business_id."','".addslashes($row['business_name'])."','".addslashes($row['permalink'])."')\">".$showName."</li>";
		}
		$str.= "</ul>";
		
	echo $str;
}

//////////////CITY SEARCH//////////////
elseif($_POST['type']=='city')
{
	$keyword = $_POST['cities'];
	$keyword = str_replace("||sp_rp_and||", "&", $keyword);
	
	if(strlen($keyword)<2) exit;
	
	$query="select * from `country`,`city`,`province` where city_name like '".$keyword."%' and `city`.`city_state`= `province`.`province_id` and (`country`.c_id = `province`.country_id  OR (`country`.c_name = `province`.province_name AND `country`.has_state='N'))order by c_name asc, city_name asc limit 0,20";
	
	$rc=mysql_query($query);
	$i=0;
    $j=0;
	while($row = mysql_fetch_array($rc))
	{
        if($row['province_short']){   // if state has abbreviation, use it
		    $cityArray[$row['province_short']][$row['city_name']]=$row['city_id'];
        }else{
            $cityArray[$row['province_name']][$row['city_name']]=$row['city_id'];
        }
        $countryArray[$j]['country']= $row['c_name'];
        $j++;
	}

	if(!$cityArray) exit;
	
    $j2=0;
	//Separate Provinces
	foreach($cityArray as $pName => $cList)
	{
        $country =   $countryArray[$j2]['country'];
        $j2++;
        if ($country != $pName){
            $str.="<p>$country: $pName</p>";    
        }else{
            $str.="<p>$country</p>";    
        }
        
		$str.="<ul>";
		foreach($cList as $cName => $cId)
		{
			if($keyword) 
			{
				$showName=preg_replace("/(".$keyword.")/i","<abbr>$1</abbr>",$cName);
			}
			else
			{
				$showName=$cName;
			}
            if ($country != $pName){ 
            $loc_string = $cName .', ' . $pName . ', ' . $country;	
            }else{
            $loc_string = $cName .', ' . $country;    
            }
			$str.="<li onClick=\"fills('".$cId."','".addslashes($loc_string)."')\">".$showName."</li>";
		}
		$str.= "</ul>";
	}
	echo $str;
}



function strreplace($str)
{
	$str = str_replace("&", "&amp;", trim($str));
	$str = str_replace("'", "&#39;", $str);
	return $str;
}
?>