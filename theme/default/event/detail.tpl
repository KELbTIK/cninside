{include file="header.tpl"}
 
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/event_detail.css" />
<link rel="stylesheet" href="/theme/{$get_theme}/js/fancy/jquery.fancybox.css" media="screen" type="text/css" /> 
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.easing.1.3.js"></script>
<script language="javascript" type="text/javascript" src="/theme/{$get_theme}/js/jquery.fancybox-1.2.1.pack.js"></script>
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
	document.getElementById("map_canvas").innerHTML="<br /><br /><br /><br /><br /><center>No Map</center>";
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
        
        <div class="content">
                <div class="detail blue">
               
        <h1>{l t='Event detail for'} {$var_biz.bizname} {if $var_biz.edit_btn}&nbsp;&nbsp;<a href="/mgt/body/event_edit.php?id={$var_biz.id}" class="iframe Bbtn">{l t='Edit'}</a> &nbsp;&nbsp;<a href="javascript:del_event('eventm', 'id',{$var_biz.id})" class="Bbtn">{l t='Delete'}</a>{/if}
        </h1>
                		<div class="first">
                   		 <div class="title">
                                 <h2>
						   {$var_biz.bizname}
                          </h2>
                   		    <table width="100%" border="0" cellspacing="3">
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
{$var_biz.link1} {$var_biz.link2} </td>
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
                                <td colspan="2"><div class="photoBox"><img style="WIDTH: 20px; HEIGHT: 20px"  src="../images/photos/{$var_author.picurl}_20x20" /> </div><div  style="padding-top:5px; padding-left:5px; float:left"><a href="../my/?id={$var_author.id}" target="_blank">{$var_author.name}</a></div> </td>
</tr>
                              <tr>
                                <td valign="top">{l t='What/Why:'} </td>
                                <td colspan="2" valign="top">&nbsp;</td>
</tr>
                              <tr>
                                <td colspan="3"><dl>
                                  <dd id="event_description">{$var_biz.whatwhy}</dd>
                                </dl>                                      </td>
                              </tr>
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

<!-- AddThis Button END --></td>
</tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
              <td>{l t='Reviews:'}</td>
              <td>{$var_biz.reviewnum}</td>
                    <td>&nbsp;&nbsp;<a href="#reply" id="replyBtn" class="Bbtn">{l t='Write a Review'}</a></td>
              </tr>
                            </table>
                          </div>
                                </div>
						<div class="other">
						<div class="photoBox" style=" overflow:hidden; width:199px; height:240px; text-align:center;"><a href="photo.php?id={$var_biz.id}"><img src="../images/event/{$var_biz.picurl}_195x180" border="0"/></a><br /><a href="photo.php?id={$var_biz.id}">{l t='Browse more'} ({$var_ps} {l t='pics'})...</a><br /><a href="new_photo.php?id={$var_biz.id}">{l t='Add a photo'}&raquo;</a>  </div> </div>
				  {if $smarty.const._GOOGLE_MAP_ENABLED_}
				  <div class="map"><div id="map_canvas" style="width: 220px; height: 260px; overflow:hidden; border:1px #ccc solid;"><br /><br /><br /><br /><br /><center>Please wait..</center></div></div>
				  {/if}
                </div>
                <div id="clear"></div>
				<div class="info">
						<div class="left">
                        		<div class="con"  style="float:left">
                    		  </div>
<!--loop review-->
 {foreach from=$var_reply item=i}
<div class="con" style="width:100%">
<div class="pic">
<div style="float:left" id="pv"><img src="../theme/{$get_theme}/images/ico_map1.gif" width="14" height="10" title="Friends Number" alt="Friends Number" />{$i.friendsnum}<br />
<img src="../theme/{$get_theme}/images/ico_map2.gif" width="11" height="11"  title="Reviews Number" alt="Reviews Number" /> {$i.reviewsnum}</div>
<div class="photoBox" style="float:right; margin-right:5px;"><img src="../images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>

</div>	
<div class="t">
<div style="float:left"><a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a> {l t='says'}:</div>
<div style="float:right">
{if $i.edit_btn}
<a href="/mgt/func/select.php?sheet=event_discuss&where=event_discuss_id&equal={$i.comment_id}&field=event_discuss_id,event_id,user_id,event_desc,reply_date&text=Review ID,Event ID,Reviewer ID,Review Content,Review Date(YYYYMMDDHHIISS)" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="Edit" title="Edit" border="0" align="top" /></a>
<a href="javascript:del('event_discuss','event_discuss_id','{$i.comment_id}')" class="ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_del.png" alt="Delete" title="Delete" border="0" align="top" /></a>
{/if}

{$i.date}</div>
<h4 id="clear" style="padding-top:10px;">{$i.message}</h4>
</div> </div>
<div id="clear"></div>
{/foreach}
<!--/loop-->                   


        {if !$var_lists.found}
        <div class='con' style='width:100%;border:0'><br/><br><br><center>{l t='No result found'}.</center><br><br><br></div>
        {else}
		    {$var_lists.pager}
        {/if}
                    			<div id="clear"></div>
                                <form action="?f=reply&id={$var_biz.id}" method="post">
        <div class="con box change" style="width:100%; background-position:0 -150px" id="replyTitle">
    
          <table width="100%" border="0" align="right">
  <tr>
    <td width="17%" rowspan="2" align="center" valign="top"> <h1>{l t='Reply'}</h1></td>
    <td width="44%" rowspan="2"><textarea name="event_desc" style="width:370px; height:70px;" id="event_desc" onfocus="check_login(this)" ></textarea></td>
    <td width="24%" align="center" valign="bottom"><h3><a href="#top" id="topBtn">{l t='Page Top'} &uArr;</a></h3></td>
  </tr>
  <tr>
    <td align="center" valign="bottom"><input type="submit" name="button2"  id="button2" value="  {l t='Submit'} »  " style="height:30px;" onClick="this.disabled=true; submit()"/></td>
  </tr>
</table>
        </div>
								</form>
       		      </div>
                  {literal}
                  <script type="text/javascript" language="javascript">
                  	$('#replyBtn').click(function(){
							$('#replyTitle').ScrollTo(800)
							return false;
							});
					$('#topBtn').click(function(){
							$('#container').ScrollTo(800)
							return false;
							});
                  </script>
                  {/literal}
						<div class="right">
                        <div class="con box" style="width:100%;">
                        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                            <h2>{l t='Are You Interested?'}</h2>
                           <center>&nbsp;<br /><a href="../my/func.php?f=addin&amp;id={$var_biz.id}" class="Bbtn">{l t="I'm In"}</a> &nbsp; <a href="../my/func.php?f=addcool&amp;id={$var_biz.id}" class="Bbtn">{l t='Sounds Cool'}</a><br />&nbsp;</center>
            </div>
            
            <div class="con box" style="width:100%;">
   
            <h2>{l t='Who is in?'} <em>{$var_ins.num}{l t=' users'}</em></h2> 

<!--loop in-->
{foreach from=$var_in item=i}
                            <dt id="clear" style="margin-top:5px; float:left; width:90%; overflow:hidden; margin-left:10px;"><div class="photoBox" style="float:left"><img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" /></div><div style="float:left; padding-left:7px; padding-top:3px; font:Arial;"><a href="../my/?id={$i.userid}">{$i.username}</a></div></dt>
{/foreach}
<!--/loop-->
            </div> <div class="con box" style="width:100%;">
   
            <h2>{l t='Sounds Cool'} <em>{$var_cools.num}{l t=' users'}</em></h2>
<!--loop cool-->
{foreach from=$var_cool item=i}
                            <dt id="clear" style="margin-top:5px; float:left; width:90%; overflow:hidden; margin-left:10px;"><div class="photoBox" style="float:left"><img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" /></div><div style="float:left; padding-left:7px; padding-top:3px; font:Arial;"><a href="../my/?id={$i.userid}">{$i.username}</a></div></dt>
{/foreach}
<!--/loop-->
  </div><div id="clear"></div>
    <div id="clear"></div>
        <div class="con box" style="width:100%;"><h2>{l t='Recently Added Events'}</h2>
   <!--loop cool-->
{foreach from=$var_new item=i}
          <div id="clear"></div>
                <div class="item">
                        <div class="pic"><div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div></div>
                        <div class="t"><h3><a href="?id={$i.id}">{$i.name}</a>
                         {if $i.edit_btn}&nbsp;&nbsp;<a href="/mgt/body/event_edit.php?id={$i.id}" class="fancybox iframe ctlbtn"><img src="/theme/{$get_theme}/mgt/body/images/b_edit.png" alt="{l t='Edit'}" title="{l t='Edit'}" border="0" align="top" /></a> {/if}
                        
                        </h3>{l t='Begin'}: {$i.date} <br />{$i.whatwhy}</div>
                </div>
{/foreach}
<!--/loop-->
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