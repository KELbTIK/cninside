{include file="header.tpl"}

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
.galleria-images{left:0!important}
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

{/literal}


<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {l t='%s\'s Photos' r=$var_user.nameORemail}
                            <div id="btns" class="pull-right">
                                <a href="./?id={$var_user.user_id}" class="button"><i class="fa fa-caret-left"></i> &nbsp;{l t='Back to Profile'}</a>

                            </div>
                            <div class="clearfix"></div>
                        </h3>
                    </div>
                    <div class="panel-body">


                        <div id="galleria">
                            <!--loop-->
                            {foreach from=$var_photos item=i}
                                <img class="img-reasponsive" src="/images/business/b_{$i.photo_url}" alt="<a href='/{$smarty.const._BIZ_DIR_}/{$i.permalink}' target='new'>{$i.business_name}</a><br>{l t='Uploaded'} {$i.datetime}" />
                            {/foreach}
                            <!--/loop-->
                        </div>
                    </div>
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
