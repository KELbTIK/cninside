{include file="header.tpl"}
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
{/literal}

<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left">{l t='%s\'s Gallery' r=$var_user.nameORemail}</h3>
                        <div id="btns" class="pull-right">
                            <a href="./?id={$var_user.user_id}" class="button"><i class="fa fa-caret-left"></i> &nbsp;{l t='Back to Profile'}</a>
                            {if $var_me.user_id==$var_user.user_id}
                                &nbsp;&nbsp;<a href="javascript:void(0)" onclick="deletePhoto(current_photo_url)" class="button"><i class="fa fa-times"></i> {l t='Delete'}</a> &nbsp;&nbsp;
                                <a href="javascript:void(0)"onclick="setAvatar(current_photo_url)"  class="button"><i class="fa fa-picture-o"></i> {l t='Set as Profile Photo'}</a> &nbsp;&nbsp;
                                <a href="new_photo.php" class="button"><i class="fa fa-upload"></i> {l t='Upload Photo'}</a>
                            {/if}
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <div id="galleria">
                            <!--loop-->
                            {foreach from=$var_photos item=i}
                                <img class="img-responsive" src="/images/photos/p_{$i.photo_url}" />
                            {/foreach}
                            <!--/loop-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 hidden-xs">
                <div class="text-center">
                    <p align="center">
                        {$ads->getAdCode(3)}
                    </p>
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
