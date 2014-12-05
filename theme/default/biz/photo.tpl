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
.uploaddiv{ display:none;}
.uploaddiv h2{ margin:8px; float:left;}
.uploaddiv .uploadifyQueue{ float:left; margin:9px;}
.uploaddiv .cancel{ float:right; margin:0 10px;}
.uploaddiv .percentage{ color:red;}
#upload_btn{ display:none;}
#galleria{min-height:100px;}
-->
 </style>
{/literal}

<!--Main Start-->
<div id="main">
    <div class="content container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">{l t='Photos for %s' r=$var_biz.bizname}</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <a href="/{$smarty.const._BIZ_DIR_}/{$var_biz.permalink}" class="btn btn-primary btn-block">{l t='Return to %s' r=$var_biz.bizname}</a>
                    </div>
                    <div class="visible-xs col-xs-12">
                        &nbsp;
                    </div>

                    {if $var_me.user_id}
                            <div class="col-md-offset-6 col-sm-offset-4 col-md-3 col-sm-4 col-xs-12 profile-rating text-right" >
                                <a href="javascript:void(0)" onclick="$('.uploaddiv').slideDown()" class="button btn btn-block btn-primary">{l t='Upload photo for %s' r=$var_biz.bizname} &dArr;</a>
                            </div>

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

                        <div class="col-md-offset-6 col-sm-offset-4 col-md-3 col-sm-4 col-xs-12">
                            <a href="/my/login.php" class="btn btn-primary btn-block">{l t='Login to upload photo &raquo;'}</a>
                        </div>
                        {if $smarty.get.f == 'addphoto'}
                            <script>
                                {literal}
                                location="/my/login.php";
                                {/literal}
                            </script>
                        {/if}
                    {/if}
                </div>
                <div class="clearfix"></div>
                <br/>
                    <div class="col-xs-12">
                        <div class="uploaddiv alert alert-warning">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <h2>{l t='Attach Picture'}: </h2>
                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  type="file" name="file" id="file" />
                            </div>

                            <div class="col-md-3 col-sm-3 col-xs-12 for_padding_button">
                                <a class="btn btn-primary btn-block" href="javascript:$('#file').uploadifyUpload()" id="upload_btn">
                                    {l t='Start upload'}
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                <div class="clearfix"></div>
                <br/>
                <div >

                    <ul id="galleria" class="bxslider">
                        <!--loop-->
                        {foreach from=$var_pic item=i}
                            <li><img src="../images/business/{$i.picurl}" /></li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>


<script>
    // Load the classic theme
    {*Galleria.loadTheme('/theme/{$smarty.const._THEME_}/js/jquery.galleria.classic.js');*}
    // Initialize Galleria
//    $('#galleria').galleria();
</script>
{literal}
<script>
    $('.bxslider').bxSlider({
        mode: 'fade'
    });
</script>
{/literal}
<!--Main End-->
{include file="footer.tpl"}