{include file="header.tpl"}

<script language="javascript" type="text/javascript" src="/theme/default/js/star.js"></script>
<script language="javascript" type="text/javascript" src="/theme/default/js/link.js"></script>

{if $admin_type}
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/mgt/body/js/common.js"></script>
{/if}
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/frontend.js"></script>
<script type="text/javascript">
//program global values
var temp='{$var_me.email}';
var biz_id='{$var_biz.id}';

var zoom={$var_biz.zoom};
var mapy='{$var_biz.mapy}';
var mapx='{$var_biz.mapx}';
var y='{$var_biz.y}';
var x='{$var_biz.x}';

var t_loginfirst="{l t='Please login to review!'}";


{literal}
function check_login(who)
{
    if(!temp)
    {
		alert(t_loginfirst);
    	who.blur();
	}
}

</script>


<script type="text/javascript">
 $(document).ready(function() {
	 {/literal}

{if $smarty.const._GOOGLE_MAP_ENABLED_}
	 initialize();
{/if}
	 {literal}

	  });

function get(nothing,page)
{
var id=biz_id;
location='?page='+page+'&id='+id;
}

 function initialize() {
var tmp=zoom;
if(tmp=='0')
{
	document.getElementById("map_canvas").innerHTML="<br /><br /><br /><br /><br /><div class='text-center'>No Map</div>";
}
else
{

    var myLatlng = new google.maps.LatLng(y,x);
    var myOptions = {
      zoom: zoom,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title:"Map"
    });

    }}
    </script>
    {/literal}
 <!--Main Start-->
<div id="main">
    <div class="content container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {l t='Event detail for'} {$var_biz.bizname}
                            {if $var_biz.edit_btn}
                            <span class="pull-right">
                                <a href="/mgt/body/event_edit.php?id={$var_biz.id}" class="fancybox fancybox.iframe btn button-blue">{l t='Edit'}</a>
                                &nbsp;&nbsp;
                                <a href="javascript:del_event('eventm', 'id',{$var_biz.id})" class="btn button-blue">{l t='Delete'}</a>
                            </span>
                            {/if}
                            <div class="clearfix"></div>
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="{if $smarty.const._GOOGLE_MAP_ENABLED_}col-md-4 col-sm-4 {else} col-md-6 col-sm-6 {/if} col-xs-12">
                                <div class="">
                                    <h2>
                                        {$var_biz.bizname}
                                    </h2>
                                    <table class="table">
                                        <tr>
                                            <td width="30%" valign="top">{l t='Category:'} </td>
                                            <td width="70" colspan="2" valign="top">{$var_biz.catname}</td>
                                        </tr>
                                        <tr>
                                            <td valign="top">{l t='When:'} </td>
                                            <td colspan="2" valign="top">{$var_biz.when}</td>
                                        </tr>
                                        <tr>
                                            <td valign="top">{l t='Where:'} </td>
                                            <td colspan="2" valign="top">{$var_biz.where}
                                                {if $var_biz.location}
                                                    {$var_biz.location}, {$var_biz.province}
                                                {/if}
                                                {if $var_biz.zip}
                                                    , {$var_biz.zip}
                                                {/if}
                                                {if $var_biz.country && $var_biz.province != $var_biz.country}
                                                    , {$var_biz.country}
                                                {/if}

                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">{l t='How:'} </td>
                                            <td colspan="2" valign="top">
                                                {$var_biz.link1} {$var_biz.link2}
                                            </td>
                                        </tr>
                                        {if $var_biz.related_biz}
                                            <tr>
                                                <td valign="top">{l t='Related Business:'} </td>
                                                <td colspan="2" valign="top"><a href="{$var_biz.related_biz_url}">{$var_biz.related_biz}</a></td>
                                            </tr>
                                        {/if}

                                        <tr>
                                            <td valign="top">{l t='Cost:'} </td>
                                            <td colspan="2" valign="top">{$var_biz.price}</td>
                                        </tr>
                                        <tr>
                                            <td>{l t='Submitted by:'}</td>
                                            <td colspan="2">
                                                <div class="photoBox">
                                                    <img width="20px" height="20px" class="img-responsive" src="../images/photos/{$var_author.picurl}_20x20" />
                                                </div>
                                                <div><a href="../my/?id={$var_author.id}" target="_blank">{$var_author.name}</a></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">{l t='What/Why:'} </td>
                                            <td colspan="2" valign="top">&nbsp;</td>
                                        </tr>
                                        {if $var_biz.whatwhy}
                                            <tr>
                                                <td colspan="3">
                                                    <dl>
                                                        <dd id="event_description">{$var_biz.whatwhy}</dd>
                                                    </dl>
                                                </td>
                                            </tr>
                                        {/if}
                                        <tr>
                                            <td>{l t='Share Listing:'}</td>
                                            <td colspan="2">
                                                <!-- AddThis Button BEGIN -->
                                                <div class="addthis_toolbox addthis_default_style">
                                                    <a class="addthis_button_facebook"></a>
                                                    <a class="addthis_button_twitter"></a>
                                                    <a class="addthis_button_myspace"></a>
                                                    <a class="addthis_button_stumbleupon"></a>
                                                    <a class="addthis_button_bebo"></a>
                                                    <a class="addthis_button_digg"></a>
                                                    <a class="addthis_button_mixx"></a>
                                                    <a class="addthis_button_delicious"></a>
                                                </div>
                                                <!-- AddThis Button END -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>{l t='Reviews:'}</td>
                                            <td>{$var_biz.reviewnum}</td>
                                            <td>&nbsp;&nbsp;<a href="#reply" id="replyBtn" class="btn button-blue">{l t='Write a Review'}</a></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="{if $smarty.const._GOOGLE_MAP_ENABLED_}col-md-4 col-sm-4 {else} col-md-6 col-sm-6 {/if} col-xs-12">
                                <div class="photoBox text-center">
                                    <a href="photo.php?id={$var_biz.id}">
                                        <img class="img-responsive img-thumbnail" src="../images/event/{$var_biz.picurl}_195x180" border="0"/>
                                    </a>
                                    <br />
                                    <a href="photo.php?id={$var_biz.id}">{l t='Browse more'} ({$var_ps} {l t='pics'})...</a>
                                    <br />
                                    <a href="new_photo.php?id={$var_biz.id}">{l t='Add a photo'}&raquo;</a>
                                </div>
                            </div>
                            {if $smarty.const._GOOGLE_MAP_ENABLED_}
                                <div class="map col-md-4 col-sm-4 col-xs-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div id="map_canvas">Please wait..</div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>

            <div class="info">
                <div class="col-sm-8 col-xs-12">
                    <!--loop review-->
                    <div class="panel panel-default">
                        <!-- List group -->
                        <ul class="list-group">
                            {foreach from=$var_reply item=i}
                                <li class="list-group-item">
                                    <div class="pic">
                                        <div class="pull-left" id="pv">
                                            <i class="fa fa-male"></i> {$i.friendsnum}
                                            <br />
                                            <i class="fa fa-star"></i> {$i.reviewsnum}
                                        </div>
                                        <div class="photoBox pull-right">
                                            <img src="../images/photos/{$i.picurl}_40x40" width="40" height="40" />
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="t">
                                        <div class="pull-left">
                                            <a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a> {l t='says'}:
                                            <h4>{$i.message}</h4>
                                        </div>
                                        <div class="pull-right">
                                            {if $i.edit_btn}
                                                <a href="/mgt/func/select.php?sheet=event_discuss&where=event_discuss_id&equal={$i.comment_id}&field=event_discuss_id,event_id,user_id,event_desc,reply_date&text=Review ID,Event ID,Reviewer ID,Review Content,Review Date(YYYYMMDDHHIISS)" class="fancybox fancybox.iframe ctlbtn">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </a>
                                                <a href="javascript:del('event_discuss','event_discuss_id','{$i.comment_id}')" class="ctlbtn">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            {/if}
                                            {$i.date}
                                        </div>

                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            {/foreach}
                            <!--/loop-->
                        </ul>
                    </div>

                    {if !$var_lists.found}
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                {l t='No result found'}.
                            </div>
                        </div>
                    {else}
                        <div class="col-xs-12 text-right text-xs-right">{$var_lists.pager}</div>
                    {/if}

                    <div class="clearfix"></div>

                    <form action="?f=reply&id={$var_biz.id}" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">{l t='Reply'}</h3>
                            </div>
                            <div class="panel-body" id="replyTitle">
                                <div class="form-group">
                                    <textarea class="form-control" rows="5" name="event_desc" id="event_desc" onfocus="check_login(this)" ></textarea>
                                </div>
                                <h3 class="pull-right"><a href="#top" id="topBtn">{l t='Page Top'} &uArr;</a></h3>
                                <input type="submit" class="btn button-blue" name="button2"  id="button2" value="  {l t='Submit'} »  " onClick="this.disabled=true; submit()"/>
                            </div>
                        </div>
                    </form>
                </div>

                {literal}
                    <script type="text/javascript" language="javascript">
                        $('#replyBtn').click(function(){
                            $('#replyTitle').ScrollTo(800);
                            return false;
                        });
                        $('#topBtn').click(function(){
                            $('#container').ScrollTo(800);
                            return false;
                        });
                    </script>
                {/literal}

                <div class="col-sm-4 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Are You Interested?'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <a href="../my/func.php?f=addin&amp;id={$var_biz.id}" class="btn button-blue">{l t="I'm In"}</a>
                                &nbsp;
                                <a href="../my/func.php?f=addcool&amp;id={$var_biz.id}" class="btn button-blue">{l t='Sounds Cool'}</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Who is in?'} <em>{$var_ins.num}{l t=' users'}</em></h3>
                        </div>
                        <div class="panel-body">
                            <!--loop in-->
                            {foreach from=$var_in item=i}
                                <div class="photoBox pull-left">
                                    <img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" /> &nbsp;
                                </div>
                                <div class="pull-left">
                                    <a href="../my/?id={$i.userid}">{$i.username}</a>
                                </div>
                                <div class="clearfix"></div>
                            {/foreach}
                            <!--/loop-->
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Recently Added Events'}</h3>
                        </div>
                        <div class="panel-body">
                            <!--loop cool-->
                            {foreach from=$var_new item=i}
                                <div class="clearfix"></div>
                                <div class="item">
                                    <div class="pic">
                                        <div class="photoBox">
                                            <img src="../images/event/{$i.picurl}_40x40" width="40" height="40" />
                                        </div>
                                    </div>
                                    <div class="t">
                                        <h3>
                                            <a href="?id={$i.id}">{$i.name}</a>
                                            {if $i.edit_btn}
                                                &nbsp;
                                                <a href="/mgt/body/event_edit.php?id={$i.id}" class="fancybox fancybox.iframe ctlbtn">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </a>
                                            {/if}
                                        </h3>{l t='Begin'}: {$i.date} <br />{$i.whatwhy}
                                    </div>
                                </div>
                            {/foreach}
                            <!--/loop-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Main End-->
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4b594c017ff94751"></script>
{if $smarty.const._GOOGLE_MAP_ENABLED_}
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
{/if}
{include file="footer.tpl"}