<?php
/**
 * MeePlace header
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

/* Replace language variables in template 
	@ params:    t : text    r : replace to     g: third param
	@ in tpl:    {l t="Be a member of %s please %s" r="MeePlace" g="abc"}
	@ return:    Be a member of MeePlace please abc
*/
function lr($params)
{
	extract($params);
	$t=l($t);					
	if($r=='')
		return $t;
		
	else
		return sprintf($t,$r,$g);
}
		
function getCurrentLanguage() {
	global $lang, $languages;
	if (array_key_exists ( $lang->language_area, $languages )) {
		return $lang->language_area;
	} else if (array_key_exists ( $lang->language_country, $languages )) {
		return $lang->language_country;
	} else {
		return "en";
	}
}

////////////////////////////////////////////////////

$i=0;
$var_language=array();
foreach($languages as $key=>$value)
{
	$var_language[$i]['lang']=$key;
	$var_language[$i]['name']=$languages[$key]["text"];
	$var_language[$i]['image']=$languages[$key]["image"];
	$i++;
}

//////////////////////////////////////////////////////////////////
function get_city_list($method)			// method:0 => <select>
{
	if(!$method) $method=0;
	isset($_COOKIE["city"])?$cookie_id=$_COOKIE["city"]:$cookie_id='';
	$rc = mysql_query("select * from `city`");
		// output
		$output='';
		while($row=mysql_fetch_array($rc))
		{
		$id=$row['city_id'];
        $name=$row['city_name'];
				  $state_list=array();  
					  
				  $str="SELECT * FROM `province` ORDER BY `province_name` ASC";
				  $rc = mysql_query($str);
				  while($row=mysql_fetch_array($rc))
				  {
					  $id=$row['province_id'];
					  $name=$row['province_name'];
						  // city query
						  $instr="SELECT * FROM `city` where `city_state`=$id ORDER BY `city_name` ASC";
						  $inrc = mysql_query($instr);
						  while($inrow=mysql_fetch_array($inrc))
						  {
							  $state_list[$name][$inrow['city_id']]=$inrow['city_name'];
						  }
				  }
				  
				  foreach ($state_list as $key => $value) 
				  {
					  $output .= "<optgroup label=\"$key\">\n";
					  foreach($value as $key => $value)
					  {
							  $selected="";
							  //if($id==$cookie_id)
							  if($key==$_GET['Hcity']||$key==$_GET['city']) 	$selected=" selected='selected'";
							  $output .= "<option value=\"$key\" $selected>$value</option>\n";
					  }
					  $output .= "</optgroup>\n";
				  }
		}

return $output;		
}
///////////////////////////////////////////////////
	
	
	if($_SESSION["email"])
	{
		$info['logas']=l("Logged in as:")." <a href=\"/my/account.php\">$_SESSION[display_name]</a>";
		//If a FB connect?
		if (get_user_data('fb_user'))
		{
			$info['logas'].=" <img src='/theme/"._THEME_."/images/fb_16.gif' border='0' style='vertical-align:text-bottom' />";
		}
		
		$info['logtext']="| <a href=\"/my/account.php\">".l("Account")."</a> | <a href=\"/my/logout.php\">".l("Log out")."</a>"; 
		$info['logged']=true;
	}
	else
	{
		$info['logas']=l("Hello, Guest. Please")." <a href=\"/my/login.php\">".l("Login or Register")."</a>";// - <a href=\""._ABSPATH_."/my/logout.php\">Log out</a>";
		$info['logtext']="| <a href=\"/my/login.php\">".l("Login or Register")."</a>";
		$info['logged']=false;
	}
	
	
	$get_sitename=get_sitename();
	$get_theme= get_theme();
    
 //////////////////// Speedbar / Menu //////////////////////////////
        $rc = mysql_query("SELECT * FROM `links` WHERE `active` = '1' ORDER BY `sort` ASC");
        $total_links = mysql_num_rows($rc);
        if($total_links >0){ 
        $i=0;
       // $menu =  '<ul id="navi">';  
        $menu =   '<ul class="nav navbar-nav">';
        while($row=mysql_fetch_assoc($rc)){
            if($i==0){
                $menu .= '<li>';
            }else{
                $menu .= '<li>';    
            }
            
            if(strpos($row['url'], 'http://')===false){
            
                $menu .=  '<a href="http://' ._DOMAIN_ .'/'.$row['url'].'" alt="'.$row['title'].'">'.l($row['title']).'</a>';
            
            }else{
                
                $menu .=  '<a href="'.$row['url'].'" alt="'.$row['title'].'">' . l($row['title']) .'</a>';
                
            }
        
            // sub links
               $rc_sub = mysql_query("SELECT * FROM `links_sub` WHERE `active` = '1' AND `main_link_id`= '{$row['link_id']}' ORDER BY `sort` ASC");
                $total = mysql_num_rows($rc_sub);
                if($total > 0){
                    $j=0;
                    $menu .='<ul>';
                    while($row_sub=mysql_fetch_assoc($rc_sub)){
                        
                        if(strpos($row_sub['url'], 'http://')===false){
            
                            $menu .=  '<li><a href="http://' ._DOMAIN_ .'/'.$row_sub['url'].'" alt="'.$row_sub['title'].'">'.$row_sub['title'].'</a></li>';
            
                    }else{
                
                            $menu .=  '<li><a href="'.$row_sub['url'].'" alt="'.$row_sub['title'].'">'.$row_sub['title'].'</a></li>';
                
            }

                        $j++;
                    }
                    $menu .='</ul>';
                }
                $menu .='</li>';
            $i++;
        }
        
        $menu .=  '</ul>';
        }else{
        $menu = '<p></p>';    
        }
        
        $smarty->assign("menu",$menu);
 
 /////////////////// End of Speedbar //////////////////////////////  

/* Smarty output */

if($_SESSION['admin_type']=='A' || $_SESSION['admin_type']=='M'){
  $is_admin = '1';  
}else{
  $is_admin = '0';  
}
$current_language_abbr=getCurrentLanguage();
$current_language=$languages[$current_language_abbr]["text"];
$smarty->register_function("l", "lr");
$smarty->assign_by_ref("ads",$ads);
$smarty->assign("var_language",$var_language); 
$smarty->assign("current_language",$current_language); 
$smarty->assign("page_keywords",get_cleankeywords()); 
$smarty->assign("page_description",get_cleandescription()); 
$smarty->assign("page_title_cat",get_cleanpage_title());
$smarty->assign("get_sitename",$get_sitename); 
$smarty->assign("get_theme",$get_theme); 
$smarty->assign("global_msg",$_COOKIE['global_msg']); 
$smarty->assign("get_getcitylist",get_city_list(0)); 
$smarty->assign("info",$info);
$smarty->assign("is_admin",$is_admin); 
?>