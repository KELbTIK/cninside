{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/my_gallery.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/jquery.galleria.classic.css" />
<!--Main Start-->  

<script type="text/javascript" src="/theme/{$smarty.const._THEME_}/js/jquery.galleria.js"></script>
<script>
//Language Variables.
var t_SureToDelete="{l t='Sure to delete this photo?'}";
var t_PhotoDeleted="{l t='Photo Deleted'}";
var t_SureToAvatar="{l t='Sure to set this photo as your avatar?'}";
var t_AvatarUpdated="{l t='Avatar Updated'}";
</script>

{literal}

<style type="text/css">
<!--
#galleria{height:400px;}
-->
</style>
<script>
// current picture 'photo_url'
var current_photo_url;
function deletePhoto(photo_url)
{
	var a=confirm(t_SureToDelete);
	if(a==0) return ;
	
	$.post("./gallery-ajax.php?"+Math.random(), {
	f:'deletePhoto',
	v:photo_url
	},function(data){alert(t_PhotoDeleted); document.location.reload();});
}

function setAvatar(photo_url)
{
	var a=confirm(t_SureToAvatar);
	if(a==0) return ;
	
	$.post("./gallery-ajax.php?"+Math.random(), {
	f:'setAvatar',
	v:photo_url
	},function(data){alert(t_AvatarUpdated);});
}

</script>

<style media="screen,projection" type="text/css"> 
	.nav{padding:6px 0; margin:0; clear:both;letter-spacing:3px;text-transform:uppercase; text-align:center}
	a.button{ padding:5px; font-size:12px; background:#61A2CC; color:#fff; -webkit-border-radius: 5px;-webkit-box-shadow:#666 0px 0px 4px;-moz-border-radius:5px;-moz-box-shadow:#666 0px 0px 4px;text-shadow:#000 0px 1px 1px;border: 1px solid #159; font-weight:bold;}
	.button img{ vertical-align:middle}
	a.button:hover{ text-decoration:none; background:#48A; }
</style> 
{/literal}


<div id="main">
<div class="content">
<div class="left">
<div class="con box">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
<h2>{l t='%s\'s Gallery' r=$var_user.nameORemail}</h2>


<div id="btns" style=" position:absolute; right:10px; top:16px;">
<a href="./?id={$var_user.user_id}" class="button"><img src="/theme/{$smarty.const._THEME_}/images/b_prevpage.png" border="0"/> &nbsp;{l t='Back to Profile'}</a>
{if $var_me.user_id==$var_user.user_id}
<a href="javascript:void(0)" onclick="deletePhoto(current_photo_url)" class="button"><img src="/theme/{$smarty.const._THEME_}/images/b_del.png" border="0"/> {l t='Delete'}</a>
<a href="javascript:void(0)"onclick="setAvatar(current_photo_url)"  class="button"><img src="/theme/{$smarty.const._THEME_}/images/b_picture.png" border="0"/> {l t='Set as Profile Photo'}</a>
<a href="new_photo.php" class="button"><img src="/theme/{$smarty.const._THEME_}/images/b_reload.png" border="0"/> {l t='Upload Photo'}</a>
{/if}
</div>


<div id="galleria"> 
<!--loop-->
    {foreach from=$var_photos item=i}
    <img src="/images/photos/p_{$i.photo_url}" />
    {/foreach}
<!--/loop-->
</div> 


</div>
</div>

<div class="right">
<div class="con box" style=" padding:1px; text-align:center;">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
<p align="center">
 	{$ads->getAdCode(3)}
</p>

</div>
</div>

</div>
</div>

    <script>
    // Load the classic theme
    Galleria.loadTheme('/theme/{$smarty.const._THEME_}/js/jquery.galleria.classic.js');
    // Initialize Galleria
    $('#galleria').galleria();
    </script>
<!--Main End-->
{include file="footer.tpl"}
