{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/my.css" />

 {if $is=='home'}
 {literal}
 <style>
#main .content .mid { margin-left:0px; float:left;  width:425px; padding-right:10px;}
</style>
{/literal}
{/if}


 <script>
 //basic infos
 var id='{$var_user.id}';
 var pagetext='{$var_page.pagetext}';
 </script>
 {literal}
<script language="javascript" type="text/javascript">
function sele_item(a,orderby){
for(var i=0;i<document.getElementsByTagName("span").length;i++){
if(document.getElementsByTagName("span")[i].id=="itemid"){
document.getElementsByTagName("span")[i].className='Sitem';
document.getElementById("sortby").value=orderby;
}
}
a.className='SitemS';
set('',orderby)
}
/////////////////////////////////
function set(field,Pvalue)
{
    document.form1.order.value=Pvalue;
nav();
}
///////////////////////////////
function get(nothing,page,opt)
{
    if(!opt)
    {document.form1.page.value=page;
    nav();}
    else
    {
        $('#cmt').animate({'opacity':0.3},"fast",function(){
        $.get("./comment.php", { page: page, id:id},function(data){
                           $('#cmt').empty();
                           $('#cmt').append(data);
                           $('#cmt').animate({'opacity':1},"fast");
                                                             });
        });
    }
}

///////////////////////////////
function nav()
{
var d=document.form1;
var searchtext=d.searchtext.value;
var page=d.page.value;
var order=d.order.value;
var f=d.f.value;
var id=d.id.value;

location='?searchtext='+searchtext+'&order='+order+'&page='+page+'&f='+f+'&id='+id;
}

/////////////////////////////
{/literal}
var cmttext="{l t='Click to comment'}";
{literal}
function commentclick(who){
                                 if(who.value==cmttext)
                                 {
                                who.value='';
                                who.style.color='#000';
                                 $('#commentbtn').removeAttr('disabled');
                                 }}
function commentblur(who){
                                if(who.value=='')
                                {
                                if (!( $.browser.msie && parseInt($.browser.version)==6 ))
                                $('#commentbtn').attr('disabled','disabled');
                                who.value=cmttext;
                                who.style.color='#999';
                                }}
function CommentInit()
{
get('',1,1);
}
function CommentSend()
{
    var d=document.getElementById('commenttext');
    var comment=d.value;
    if(d.value!=cmttext){
          d.value='';
          commentblur(d);
          
              $('#cmt').animate({'opacity':0.3},"fast",function(){
                  $.get("./comment.php", { page: 1, id:id, comment:comment},function(data){
                      $('#cmt').empty();
                      $('#cmt').append(data);
                     $('#cmt').animate({'opacity':1});
                      });
                                                                });

      }
}

function item_hover(who)
{
$(who).addClass('comment_item_hover');
}
function item_out()
{
$('.comment_item').removeClass('comment_item_hover');    
}
function item_click(text)
{
$('#commenttext').focus();
var d=document.getElementById('commenttext');
d.value='To '+text+': ';
d.style.color='#000';
timeoutflash(9);
$('#commentbtn').removeAttr('disabled');
}
function timeoutflash(i)
{
    if (i>=0)
    {
    timeoutflash_turn(i);
    i-=1;
    var starTimer=setTimeout("timeoutflash("+i+")", 100);
    }
}
function timeoutflash_turn(i)
{
if (i%2==0)
$('#commenttext').css('backgroundColor','');
else
{
$('#commenttext').css('backgroundColor','#FAA');
}
}

</script>
{/literal}
 <!--Main Start-->  
 
 <div id="main"> 
{if $var_get.id==''}
<div id="tabsB">
<ul>
        <!-- CSS Tabs -->
          <li id="{if $is=='home'}current{/if}"><a href="./"><span>{l t='Profile Home'} </span></a></li>
          <li id="{if $is=='payments'}current{/if}"><a href="./?f=Payments"><span>{l t='Payments'}</span></a></li>
          <li id="{if $is=='list'}current{/if}"><a href="./?f=Lists"><span>{l t='Lists'}</span></a></li>
          <li id="{if $is=='review'}current{/if}"><a href="./?f=Reviews"><span>{l t='Reviews'}</span></a></li>
          <li id="{if $is=='compliment'}current{/if}"><a href="./?f=Compliments"><span>{l t='Compliments'}</span></a></li>
          <li id="{if $is=='friend'}current{/if}"><a href="./?f=Friends"><span>{l t='Friends'}</span></a></li>
          <li id="{if $is=='bookmark'}current{/if}"><a href="./?f=Bookmarks"><span>{l t='Bookmarks'}</span></a></li>
          <li id="{if $is=='event'}current{/if}"><a href="./?f=Events"><span>{l t='Event'}</span></a></li>
          <li id="{if $is=='favorite'}current{/if}"><a href="./?f=Favorites"><span>{l t='Favorites'}</span></a></li>
</ul>
</div>
{/if}
        <div class="content">
                <div class="left">
                     <div class="blue">
    <span class="coner c1"></span>
    <span class="coner c2"></span>
    <span class="coner c3"></span>
    <span class="coner c4"></span>
                  <h1>{l t='Profile'}</h1>
                             <div><img src="../images/photos/{$var_user.picurl}_100x100" />
                             </div>
                       <div class="t" >
                                  <h3><a href="./?id={$var_user.id}">{$var_user.name}</a></h3>
                                  
<h4><img src="../theme/{$get_theme}/images/friends.gif" style="vertical-align:bottom"  /> {if $num_friends >0}{$num_friends} {/if} <a href="./?f=Friends&id={$var_user.id}">{l t='Friends'}</a></h4>
<h4><img src="../theme/{$get_theme}/images/reviews.gif" style="vertical-align:bottom"  /> {if $num_reviews >0}{$num_reviews} {/if} <a href="./?f=Reviews&id={$var_user.id}">{l t='Reviews'}</a></h4>
<h4><img src="../theme/{$get_theme}/images/lists.gif" style="vertical-align:bottom"  /> {if $num_lists >0}{$num_lists} {/if} <a href="./?f=Lists&id={$var_user.id}">{l t='Lists'}</a></h4>
<h4><img src="../theme/{$get_theme}/images/gallery.gif" style="vertical-align:bottom"  /> {if $num_gallery >0}{$num_gallery} {/if} <a href="gallery_listing.php?id={$var_user.id}">{l t='Photos'}</a></h4>

<br />
                                  
                                 {if $var_get.id==''}<h4><img src="../theme/{$get_theme}/images/mail.gif" style="vertical-align:bottom" /> <a href="./msg.php?f=inbox"><span style="color:red; font-weight:bold;">{$var_user.newmsgnum}</span> {l t='New Messages'}</a><br/></h4>
                                 
                                  <h4><img src="../theme/{$get_theme}/images/edit.gif" style="vertical-align:bottom" /> <a href="edit.php">{l t='Edit Profile'}</a></h4>


{else}


           <h4><img src="../theme/{$get_theme}/images/mail.gif" style="vertical-align:bottom"  /> <a href="./msg.php?f=new&id={$var_user.id}">{l t='Write a Message'}</a></h4>
            {if !$var_user.isfriend}
            <h4><img src="../theme/{$get_theme}/images/friend.gif" style="vertical-align:bottom"  /> <a href="func.php?f=addfriend&id={$var_user.id}">{l t='Add as Friend'}</a></h4>
            {/if}
          
{/if}

{if $var_me.id!=$var_user.id}
            {if !$var_user.iscool} 
            <h4><img src="../theme/{$get_theme}/images/comp1.gif" style="vertical-align:bottom" /> <a href=func.php?f=coolperson&id={$var_user.id}>{l t='Give Cool Person Compliment'}</a></h4>
            {/if}
            {if !$var_user.isfunny}
            <h4><img src="../theme/{$get_theme}/images/comp2.gif" style="vertical-align:bottom"  /> <a href=func.php?f=funnyperson&id={$var_user.id}>{l t='Give Funny Person Compliment'}</a></h4>
            {/if}
{/if}

</div>



</div>
                          <div class="box change">
                        <h2>{l t='Latest Comment'}:</h2>
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
<div id="cmt"></div>
<dt><input type="text" name="comment" id="commenttext" value="{l t='Click to comment'}" style=" color:#999; border:1px #ccc solid; vertical-align:middle;" onfocus="commentclick(this)" onblur="commentblur(this)"><input type="button" id="commentbtn" value="{l t='Send'}&raquo;" disabled="disabled" onclick="CommentSend()" style="vertical-align:middle;" /></dt>
<script type="text/javascript">CommentInit();</script>
</div>
                        
                        
      <div class="box">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                         <h3>{l t='Compliments'}:</h3>
                                &nbsp;&nbsp;&nbsp;&nbsp;{l t='Cool person'} <span style="color:#FF8408">({$var_user.coolnum})</span><br />
                                &nbsp;&nbsp;&nbsp;&nbsp;{l t='Funny person'} <span style="color:#FF8408">({$var_user.funnynum})</span>
                                <br /><br />
                           <h3>{l t='Location'}: </h3>
                                  <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.location}</h4><br />
                                <h3>{l t='User Since'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.regdate}</h4><br />
                                <h3>{l t='Tagline'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.headline}</h4><br />
                                <h3>{l t='Where You Can Find Me'}:</h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.find_me_in}</h4><br />
                                <h3>{l t='Hometown'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.hometown}</h4><br />
                                <h3>{l t='Blog Or Website'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.blog_url}</h4><br />
                                <h3>{l t='When Not Golfing'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.not_planet}</h4><br />
                                <h3>{l t='Why My Reviews Are Good'}:</h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.review_comment}</h4><br />
                                <h3>{l t='Favorite Website'}:</h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.fav_web}</h4><br />
                                <h3>{l t='Favorite Vacation Spot'}:</h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.book}</h4><br />
                                <h3>{l t='First Concert'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.concert}</h4><br />
                                <h3>{l t='Favorite Movie'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.movie}</h4><br />
                                <h3>{l t='I Wish I Could'}:</h3>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.meal}</h4><br />
                                <h3>{l t='Favorite Course'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.do_not_tell}</h4><br />
                                <h3>{l t='Favorite Food'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.discovery}</h4><br />
                                <h3>{l t='Favorite Golfer'}:</h3>
                                <h4>&nbsp;&nbsp;&nbsp;&nbsp;{$var_user.current_crash}</h4></div>
                           {if $var_me.id==$var_user.id}
                                     <div class="box">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                                <h3><a href="edit.php">{l t='Update My Profile'}...</a></h3>
                     </div>{/if}
                </div>
                <div class="mid">
                        <div class="con" style="height:20px;">
                                <div style="float:left;"><h1 style="color:#000000">{if $var_me.id==$var_user.id}{l t='My'} {/if}{if $is=='home'}{l t='Recent Reviews'}{else}{$var_page.disp}{/if}</h1></div>
                                <div style="float:right; display:{if $is!='home'&&$is!='review'}none{/if}"><form action="javascript:nav()" method="post" id="form1" name="form1"> 
<table width="10px" border="0">
  <tr>
    <td><input type="hidden" name="f" id="f" value="{$var_page.title}" />
      <input name="page" type="hidden" id="page" value="{$var_search.page}" />
      <input name="id" type="hidden" id="id" value="{$var_get.id}" />
      <input name="order" type="hidden" id="order" value="{$var_search.order}" />
      <input name="searchtext" id="searchtext" style=" font-size:12px; color:#666;border:1px #ccc solid;" value="{$var_search.searchtext}" /></td>
    <td><input type="image" name="imageField" id="imageField" src="../theme/{$get_theme}/images/search_icon.gif" /></td>
  </tr>
</table>
                     </form>
                          </div>
                        </div>
                        <div class="con" style="border-bottom:0;">
                        {if $is=='review'||$is=='home'}<div style="float:left;"><h5>
                                            <span style="float:left; padding:3px;">{l t='Sort by'}: </span>
                                            <span id="itemid" class="{if $var_search.order!='rating'}SitemS{else}Sitem{/if}" onclick="sele_item(this,'time')">{l t='Time'}</span>
                                            <span id="itemid" class="{if $var_search.order=='rating'}SitemS{else}Sitem{/if}" onclick="sele_item(this,'rating')">{l t='Rating'}</span>
                                            <span id="itemid" class="Sitem" onclick="sele_item(this,'vote')" style="display:none;">{l t='Vote'}</span>
                                                <input name="sortby" type="hidden" id="sortby" value="time" /></h5></div>
                         {/if}
                          
                         {if $is=='list'}
                         <div style="float:right"><a href="list/new.php"><img src="../theme/{$get_theme}/images/pro_create_lists.gif" border="0" /></a></div>
                         {/if}
                     </div>
                        <div id="clear"></div>
                        
                         

{if $is=='list'}
<!--loop-->
{foreach from=$var_listlist item=i}
    <div class="con">
            <div>
              <div style="float:left"><h3><a href="list/detail.php?id={$i.id}">{$i.name}</a> &nbsp; &nbsp; <em>{$i.itemnum} {l t='items'}</em></h3></div>
                            <div style="float:right; ">
                              <h5>{l t='Established'}: {$i.date}</h5>
                            </div>
              </div>
            <div id="clear"></div>
                    <div>{$i.desc}<br /><br />
                      [ <a href="list/detail.php?id={$i.id}">{l t='See Full List'}</a> ]  [ <a href="list/select.php?id={$i.id}">{l t='Edit This List'}</a> ]  [ <a href="list/del.php?id={$i.id}">{l t='Delete This List'}</a> ]                                </div>
    </div>
{/foreach}
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_listlists.limitfrom} {l t='to'} {$var_listlists.limitto} / {$var_listlists.itemsnum} {l t='items'}.</div>
        {if !$var_listlists.found}
        <br id="clear"/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
        {else}
            {$var_listlists.pager}
        {/if}
{/if}


{* -------- list end -- friend start -------*}

{if $is=='friend'}
<!--loop-->
{foreach from=$var_friendlist item=i}
      <div class="con" >
                  <div>
                       <div class="photoBox" style="margin-top:7px;"><img src="../images/photos/{$i.picurl}_40x40"  width="40" height="40"/></div>
                        <div style="float:left;margin-left:10px;"><h3><a href="./?id={$i.id}">{$i.name}</a> {if $i.pending==1}&nbsp;&nbsp;({l t='Pending'}){/if}</h3>{l t='City'}: {$i.location}<br /> 
                        [ <a href="./?id={$i.id}">{l t='See Detail'}</a> ] [ <a href="./msg.php?f=new&id={$i.id}">{l t='Send Message'}</a> ] [ <a href="./func.php?f=delfriend&id={$i.id}">{l t='Delete'}</a> ] [ <a href="./func.php?f=addfav&id={$i.id}">{l t='Add to Favorite'}</a> ]</div>
                    </div>
                  <div id="clear"></div>
          </div>
{/foreach}
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_friendlists.limitfrom} {l t='to'} {$var_friendlists.limitto} / {$var_friendlists.itemsnum} {l t='items'}.</div>
        {if !$var_friendlists.found}
        <br id="clear"/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
        {else}
            {$var_friendlists.pager}
        {/if}
{/if}

{* -------- friend end -- event start -------*}

{if $is=='event'}
{$var_eventlists.selector}
{if $var_eventlists.a=='event_in'}
<!--loop-->
{foreach from=$var_eventlist item=i}
        <div class="con" >
                                <div>
                                     <div class="photoBox" style="margin-top:7px;"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div>
                                      <div style="float:left;margin-left:10px;" ><h3><a href="../event/detail.php?id={$i.id}" target="_blank">{$i.name} </a></h3>{$i.date}<br /><h5>[<a href="func.php?f=delin&id={$i.id}">{l t='Delete'}</a>]</h5></div>
                                  </div>
          <div id="clear"></div>
  </div>
{/foreach}
<!--/loop--> 
{/if}
{if $var_eventlists.a=='event_cool'}
<!--loop-->
{foreach from=$var_eventlist item=i}
<div class="con" >
        <div>
             <div class="photoBox" style="margin-top:7px;"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div>
              <div style="float:left;margin-left:10px;" ><h3><a href="../event/detail.php?id={$i.id}" target="_blank">{$i.name} </a></h3>{$i.date}<br /><h5>[<a href="func.php?f=delcool&id={$i.id}">{l t='Delete'}</a>]</h5></div>
          </div>
        <div id="clear"></div>
</div>
{/foreach}
<!--/loop--> 
{/if}
{if $var_eventlists.a!='event_cool' && $var_eventlists.a!='event_in'}
<!--loop-->
{foreach from=$var_eventlist item=i}
 <div class="con" >
                                <div>
                                     <div class="photoBox" style="margin-top:7px;"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div>
                                      <div style="float:left;margin-left:10px;" ><h3><a href="../event/detail.php?id={$i.id}" target="_blank">{$i.name} </a></h3>{$i.datebrief}</div>
                                  </div>
                                <div id="clear"></div>
                        </div>
{/foreach}
<!--/loop--> 
{/if}
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_eventlists.limitfrom} {l t='to'} {$var_eventlists.limitto} / {$var_eventlists.itemsnum} {l t='items'}.</div>
        {if !$var_eventlists.found}
        <br id="clear"/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
        {else}
            {$var_eventlists.pager}
        {/if}
{/if}

{* -------- event end -- compliment start -------*}
{if $is=='compliment'}
<!--loop-->
{foreach from=$var_complimentlist item=i}
<div class="con" >
              <div>
                <div style="float:left"><h3><a href="./?id={$i.id}" target="_blank">{$i.name}</a> {l t='gave me a'} {$i.type} {l t='compliment'}</h3></div>
                            <div style="float:right">
                              <h4><img src="../theme/{$get_theme}/images/thanks_plain.gif" /></h4>
                            </div>
              </div>
            <div id="clear"></div>
</div>
{/foreach}
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_complimentlists.limitfrom} {l t='to'} {$var_complimentlists.limitto} / {$var_complimentlists.itemsnum} {l t='items'}.</div>
        {if !$var_complimentlists.found}
        <br id="clear"/><br/><br><br><center>
          {l t='No result found'}.</center><br><br><br>
        {else}
            {$var_complimentlists.pager}
        {/if}
{/if}
{* -------- compliment end -- payment start -------*}

{if $is=='payment'}
<!--loop-->
<table class="listing1"><tr class="header">
    <th align="center">{l t='ID'}</td>
    <th align="center">{l t='Business ID'}</td>
    <th align="center">{l t='Description'}</td>
    <th align="center">{l t='Amount'}</td>
    <th align="center">{l t='Paid Date'}</td>
</tr>
{foreach from=$var_paymentlist item=i}
<tr><td>{$i.txn_txn_id}</td>
<td>{$i.txn_business_id}</td>
<td>{$i.txn_description}</td>
<td>{l t='$'}{$i.txn_amount_paid}</td>
<td>{$i.txn_date}</td>
 </tr>
{/foreach}
</table>
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_paymentlists.limitfrom} {l t='to'} {$var_paymentlists.limitto} / {$var_paymentlists.itemsnum} {l t='items'}.</div>
        {if !$var_paymentlists.found}
        <br id="clear"/><br/><br><br><center>
          {l t='No result found'}.</center><br><br><br>
        {else}
            {$var_paymentlists.pager}
        {/if}
{/if}
{* -------- payemnt end -- bookmark start -------*}
{if $is=='bookmark'}
<!--loop-->
{foreach from=$var_bookmarklist item=i}
<div class="con" >
              <div>
                <div style="float:left"><h2><a href="../{$smarty.const._BIZ_DIR_}/detail.php?id={$i.id}" target="_blank">{$i.name}</a></h2></div>
                            <div style="float:right">
                             <h5><em>{l t='Business Rating'}:</em> <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span> &nbsp; <img src="../theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /></h5>
                            </div>
              </div>
            <div id="clear"></div>
            <div>
            <h5>{l t='Category'}: {$i.catname} / {$i.subcatname}</h5>
            <h5>{l t='City'}: {$i.location}</h5>
            </div>
            <div id="clear"></div>
            <div>
                        <img height="8" src="../theme/{$get_theme}/images/icons/mail.gif" width="15" /> <a href="../{$smarty.const._BIZ_DIR_}/detail.php?id={$i.id}" target="_blank">{l t='See business detail'}</a>    <img height="10" src="../theme/{$get_theme}/images/icons/remove.gif" width="10" /> <a href="./func.php?f=delbookmark&id={$i.id}">{l t='Remove'}</a>
             </div>
</div>
{/foreach}
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_bookmarklists.limitfrom} {l t='to'} {$var_bookmarklists.limitto} / {$var_bookmarklists.itemsnum} {l t='items'}.</div>
        {if !$var_bookmarklists.found}
        <br id="clear"/><br/><br><br><center>
          {l t='No result found'}.
        </center><br><br><br>
        {else}
            {$var_bookmarklists.pager}
        {/if}
{/if}
{* -------- bookmark end -- favorite start -------*}
{if $is=='favorite'}
<!--loop-->
{foreach from=$var_favoritelist item=i}
  <div class="con" >
              <div>
                   <div class="photoBox" style="margin-top:7px;"><img src="../images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>
                    <div style="float:left;margin-left:10px;"><h3><a href="./?id={$i.id}">{$i.name}</a></h3>
                    {l t='City'}: {$i.location}<br /> 
                    [ <a href="./?id={$i.id}">{l t='See Detail'}</a> ] [ <a href="./msg.php?f=new&id={$i.id}">{l t='Send Message'}</a> ] [ <a href="./func.php?f=delfav&id={$i.id}">{l t='Delete'}</a> ]</div>
                </div>
              <div id="clear"></div>
      </div>
{/foreach}
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_favoritelists.limitfrom} {l t='to'} {$var_favoritelists.limitto} / {$var_favoritelists.itemsnum} {l t='items'}.</div>
        {if !$var_favoritelists.found}
        <br id="clear"/><br/><br><br><center>
          {l t='No result found'}.
        </center><br><br><br>
        {else}
            {$var_favoritelists.pager}
        {/if}
{/if}
{* -------- favorite end -- homepage/review start -------*}
{if $is=='home' || $is=='' || $is=='review'}
<!--loop-->
{foreach from=$var_reviewlist item=i}
<div class="con" >
          <div>
            <div style="float:left; "><h2><a href="../{$smarty.const._BIZ_DIR_}/detail.php?id={$i.id}" target="_blank">{$i.name}</a></h2></div>
                        <div style="clear:both;text-align:right;">
                          <nobr>
                          <h5><em>{l t='Business Rating'}:</em> <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span> &nbsp; <img src="../theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /> &nbsp; <em>{l t='Your Rating'}:</em> <span style="color:red; font-size:14px; font-weight:bold;">{$i.myrating}</span> &nbsp; <img src="../theme/{$get_theme}/images/star/stars_{$i.myratingmod}.gif" width="74" height="15" /></h5></nobr>
                        </div>
          </div>
        <div id="clear"></div>
        <div>
                <div style="float:left; color:#600">
   <h5>{l t='Category'}: {$i.catname} / {$i.subcatname}</h5></div>
                 <div style="float:right; color:#600"><h5>{$i.date}</h5></div>
        </div>
        <div id="clear"></div>
                <div style="overflow:hidden;">
                {$i.desc}</h4>
                 </div>
        <div id="clear"></div>
</div>
{/foreach}
<!--/loop--> 
        <div style="float:left; margin-top:20px;">{l t='Show'} {$var_reviewlists.limitfrom} {l t='to'} {$var_reviewlists.limitto} / {$var_reviewlists.itemsnum} {l t='items'}.</div>
        {if !$var_reviewlists.found}
        <br id="clear"/><br/><br><br><center>
          {l t='No result found'}.
        </center><br><br><br>
        {else}
            {$var_reviewlists.pager}
        {/if}
{/if}
{* --------- homepage/review end -------*}
 </div>
           
<!-- Right Side Start -->

{if $is=='home'}
                <div class="right">
                      <div class="box" style="margin-top:10px;">
        <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                              <h2> {l t='Friends'}</h2>
                             <div style="text-align:center;" id="clear">
<!--loop-->
{foreach from=$var_friend item=i}
           <dt id="clear" style="margin-bottom:5px; float:left; width:100%;"><div class="photoBox" style="float:left"><img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" /></div><div style="float:left; padding-left:7px; padding-top:3px; font:Arial;"><a href="./?id={$i.id}">{$i.name}</a>  {if $i.pending==1}&nbsp;&nbsp;({l t='Pending'}){elseif $i.pending==2 && $i.verifycode}&nbsp;&nbsp;[ <a href="/my/func.php?f=verifyfriend&code={$i.verifycode}".$code">Approve</a> ]{/if}</div></dt>
{/foreach}
<!--/loop--> 
        {if !$var_friends.found}
        <dt><img src="../theme/{$get_theme}/images/empty_network.gif" width="70" height="70" /><br />
        {l t='No Friend'}</dt>
        {else}
            {if $var_get.id==''}
            <dt id="clear"><br>
            <a href="./?f=Friends&id={$var_get.id}">{l t='All Friends'}...</a></dt>
            {/if}
        {/if}
     {if $var_get.id==''}<h3 align="center" id="clear"><br />
     <a href="membersearch.php">{l t='Add new friend'}>></a></h3>{/if}
                            </div>
                      </div>
                      <div class="box">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                              <h2>{l t='Compliments'}</h2>
                             <div style="text-align:center;">
<!--loop-->
{foreach from=$var_compliment item=i}
           <dt id="clear" style="margin-bottom:5px; float:left; width:100%;"><div class="photoBox" style="float:left"><img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" /></div><div style="float:left; padding-left:7px; padding-top:3px; font:Arial; text-align:left"><a href="./?id={$i.id}" target="_blank">{$i.name}</a><br />
           {l t='gave %s compliment' r=$i.type}</div></dt>
{/foreach}
<!--/loop--> 
        {if !$var_compliments.found}
         <dt><img src="../theme/{$get_theme}/images/empty_thanks.gif" /><br />
         {l t='No Compliment'}</dt>
        {else}
            {if $var_get.id==''}
            <dt id="clear"><br>
            <a href="./?f=Compliments&id={$var_get.id}">{l t='All Compliments'}...</a></dt>
            {/if}
        {/if}
                            </div>
                      </div>
                      <div class="box">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                              <h2> {l t='Lists'}</h2>
                             <div style="text-align:center;">
<!--loop-->
{foreach from=$var_sidelist item=i}
           <dt id="clear" style="margin-bottom:5px; float:left; width:100%;"><div style="float:left; padding-left:7px; padding-top:3px; font:Arial; text-align:left"><h3><a  href="list/detail.php?id={$i.id}">{$i.name}</a></h3>{$i.desc}</div></dt>
{/foreach}
<!--/loop--> 
        {if !$var_sidelists.found}
        <dt><img src="../theme/{$get_theme}/images/empty_lists.gif" /><br />
        {l t='No List'}</dt>
        {else}
            {if $var_get.id==''}
            <dt id="clear"><br><a href="./?f=Lists&id={$var_get.id}">{l t='All Lists'}...</a></dt>
            {/if}
        {/if}
</div>
                      </div>  
                      <div class="box">
                    <span class="coner c1"></span>
                    <span class="coner c2"></span>
                    <span class="coner c3"></span>
                    <span class="coner c4"></span>
                       <!-- START 160x600 .com Code -->
<p align="center">
     {$ads->getAdCode(3)}
</p>
<!-- END Code -->
                        </div> 
                </div>
{/if}
        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}