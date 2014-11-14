{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/7521.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/my_gallery.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/jquery.galleria.classic.css" />

<script>
var bizid='{$var_user.user_id}';
var token='{$var_me.token}';
var theme_dir='{$smarty.const._THEME_}';
</script>
<script type="text/javascript" src="/theme/{$smarty.const._THEME_}/js/jquery.galleria.js"></script>

<script>
//Language Variables.
var t_SureToDelete="{l t='Sure to delete this photo?'}";
var t_PhotoDeleted="{l t='Photo Deleted'}";
</script>

{literal}

<style type="text/css">
<!--
#galleria{height:400px;}

#main {height:auto;}
img{ border:0}
a.button{ padding:5px; font-size:12px; background:#61A2CC; color:#fff; -webkit-border-radius: 5px;-webkit-box-shadow:#666 0px 0px 4px;-moz-border-radius:5px;-moz-box-shadow:#666 0px 0px 4px;text-shadow:#000 0px 1px 1px;border: 1px solid #159; font-weight:bold;
    float:right;margin-top:-5px;
    }
.button img{ vertical-align:middle}
a.button:hover{ text-decoration:none; background:#48A; }
.uploaddiv{ width:96%;padding:1%; margin:0 1%; background:#FFF; border:1px #ccc solid;}
.uploaddiv h3{ margin:8px; float:left;}
.uploaddiv .uploadifyQueue{ float:left; margin:9px;}
.uploaddiv .cancel{ float:left; margin:0 10px;}
.uploaddiv .percentage{ color:blue;font-weight: bold;text-transform: uppercase;}
#upload_btn{ display:none;}
#galleria{height:500px;}
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
<div class="con box">
<span class="coner c1"></span>
<span class="coner c2"></span>
<span class="coner c3"></span>
<span class="coner c4"></span>
<h2>{l t='%s\'s Photos' r=$var_user.nameORemail}</h2>


<div id="btns" style=" position:absolute; right:10px; top:16px;">
<a href="./?id={$var_user.user_id}" class="button"><img src="/theme/{$smarty.const._THEME_}/images/b_prevpage.png" border="0"/> &nbsp;{l t='Back to Profile'}</a>

</div>

<div id="galleria"> 
<!--loop-->
    {foreach from=$var_photos item=i}

    <img src="/images/business/b_{$i.photo_url}" alt="<a href='/{$smarty.const._BIZ_DIR_}/{$i.permalink}' target='new'>{$i.business_name}</a><br>{l t='Uploaded'} {$i.datetime}" /> 
    
    {/foreach}
<!--/loop-->
</div>
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
