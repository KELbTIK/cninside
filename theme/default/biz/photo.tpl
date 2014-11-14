{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/my_gallery.css" />
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/jquery.galleria.classic.css" />
<script>
var bizid='{$var_biz.id}';
var token='{$var_me.token}';
var theme_dir='{$smarty.const._THEME_}';
</script>
<script type="text/javascript" src="/theme/{$smarty.const._THEME_}/js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="/theme/{$smarty.const._THEME_}/js/uploadify/jquery.uploadify.v2.1.0.min.js"></script>
<script type="text/javascript" src="/theme/{$smarty.const._THEME_}/js/jquery.galleria.js"></script>

{literal}
<script type="text/javascript">
$(document).ready(function() {
	$('#file').uploadify({
		'uploader': '/theme/'+theme_dir+'/js/uploadify/uploadify.swf',
		'script': '/biz/photo_upload_ajax.php',
		'scriptData': {id:bizid, token:token},
		'folder': '/images/business',
		'onCancel':  function(){$('#upload_btn').fadeIn();},
		'onProgress':  function(){$('#upload_btn').fadeOut();},
		'fileDesc': 'Please select picture file - jpg, gif, png',
		'fileExt': '*.jpg;*.gif;*.png',
        {/literal} 
        'sizeLimit': {$smarty.const._MAX_SIZE_},
        {literal}
		'cancelImg': '/theme/'+theme_dir+'/js/uploadify/cancel.png',
        'onComplete': function(event, ID, fileObj, response, data){if(response!=1){alert(response);}else{alert('Upload finished');window.location.reload();}},
		'onSelectOnce': function(){$('#upload_btn').fadeIn();}
	});


});

</script>

<style type="text/css">
<!--
#main {height:auto;}
img{ border:0}
a.button{ padding:5px; font-size:12px; background:#61A2CC; color:#fff; -webkit-border-radius: 5px;-webkit-box-shadow:#666 0px 0px 4px;-moz-border-radius:5px;-moz-box-shadow:#666 0px 0px 4px;text-shadow:#000 0px 1px 1px;border: 1px solid #159; font-weight:bold;
	float:right;margin-top:-5px;
	}
.button img{ vertical-align:middle}
a.button:hover{ text-decoration:none; background:#48A; }
.uploaddiv{ width:96%;padding:1%; margin:0 1%; background:#FFC; display:none; border:1px #ccc solid;}
.uploaddiv h2{ margin:8px; float:left;}
.uploaddiv .uploadifyQueue{ float:left; margin:9px;}
.uploaddiv .cancel{ float:right; margin:0 10px;}
.uploaddiv .percentage{ color:red;}
#upload_btn{ display:none;}
#galleria{height:500px;}
-->
 </style>
{/literal}

 <!--Main Start-->  
 <div id="main">
 <h1 style="padding:10px 20px; border-bottom:1px #ccc solid; margin:5px 10px;">{l t='Photos for %s' r=$var_biz.bizname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
 <a href="/{$smarty.const._BIZ_DIR_}/{$var_biz.permalink}" class="Bbtn">{l t='Return to %s' r=$var_biz.bizname}</a>
 
 
 
 {if $var_me.user_id}
 	<a href="javascript:void(0)" onclick="$('.uploaddiv').slideDown()" class="button">{l t='Upload photo for %s' r=$var_biz.bizname} &dArr;</a>
 	{if $smarty.get.f == 'addphoto'}
 	<script>
 	{literal}
 	$(document).ready(function() {
 		setTimeout("$('.uploaddiv').slideDown()",500);
 	});
 	{/literal}
 	</script>
 	{/if}
 {else}
 	<a href="/my/login.php" class="button">{l t='Login to upload photo &raquo;'}</a>
 	{if $smarty.get.f == 'addphoto'}
 	<script>
 	{literal}
 		location="/my/login.php";
 	{/literal}
 	</script>
 	{/if}
 {/if}
 
   
 </h1>
 
 <div class="uploaddiv">
 <h2>{l t='Attach Picture'}: </h2>
 <input type="file" name="file" id="file" />
 <a href="javascript:$('#file').uploadifyUpload()" id="upload_btn"><img src="/theme/{$smarty.const._THEME_}/js/uploadify/upload_btn.gif" /></a>
 </div>
 
 
 
<div id="galleria"> 
		<!--loop-->
	    {foreach from=$var_pic item=i}
	    	<img src="../images/business/{$i.picurl}" /> 
	    {/foreach}
		<!--/loop-->
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