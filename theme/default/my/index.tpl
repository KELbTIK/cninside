{include file="header.tpl"}

 <script>
     //basic infos
     var id='{$var_user.id}';
     var pagetext='{$var_page.pagetext}';
 </script>
 {literal}
<script type="text/javascript">
function sele_item(a,orderby){
    for(var i=0;i<document.getElementsByTagName("button").length;i++){
    if(document.getElementsByTagName("button")[i].id=="itemid"){
        document.getElementsByTagName("button")[i].className='btn btn-default';
        document.getElementById("sortby").value=orderby;
    }
}
    a.className='btn btn-default active';
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
    <div class="content container">
        <div class="row">
            {if $var_get.id==''}
                <div class="col-xs-12" id="tabsB">
                    <ul class="nav nav-pills nav-profile">
                        <!-- CSS Tabs -->
                        <li class="{if $is=='home'}active{/if}"><a href="./"><span>{l t='Profile Home'} </span></a></li>
                        <li class="{if $is=='payment'}active{/if}"><a href="./?f=Payments"><span>{l t='Payments'}</span></a></li>
                        <li class="{if $is=='list'}active{/if}"><a href="./?f=Lists"><span>{l t='Lists'}</span></a></li>
                        <li class="{if $is=='review'}active{/if}"><a href="./?f=Reviews"><span>{l t='Reviews'}</span></a></li>
                        <li class="{if $is=='compliment'}active{/if}"><a href="./?f=Compliments"><span>{l t='Compliments'}</span></a></li>
                        <li class="{if $is=='friend'}active{/if}"><a href="./?f=Friends"><span>{l t='Friends'}</span></a></li>
                        <li class="{if $is=='bookmark'}active{/if}"><a href="./?f=Bookmarks"><span>{l t='Bookmarks'}</span></a></li>
                        <li class="{if $is=='event'}active{/if}"><a href="./?f=Events"><span>{l t='Event'}</span></a></li>
                        <li class="{if $is=='favorite'}active{/if}"><a href="./?f=Favorites"><span>{l t='Favorites'}</span></a></li>
                    </ul>
                </div>
            {/if}
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Profile'}</h3>
                    </div>
                    <div class="panel-body">
                        <img class="img-responsive" src="../images/photos/{$var_user.picurl}_100x100" />
                        <div class="t" >
                            <h3><a href="./?id={$var_user.id}">{$var_user.name}</a></h3>

                            <h4><i class="fa fa-male"></i> {if $num_friends >0}{$num_friends} {/if} <a href="./?f=Friends&id={$var_user.id}">{l t='Friends'}</a></h4>
                            <h4><i class="fa fa-star"></i> {if $num_reviews >0}{$num_reviews} {/if} <a href="./?f=Reviews&id={$var_user.id}">{l t='Reviews'}</a></h4>
                            <h4><i class="fa fa-list-alt"></i> {if $num_lists >0}{$num_lists} {/if} <a href="./?f=Lists&id={$var_user.id}">{l t='Lists'}</a></h4>
                            <h4><i class="fa fa-camera"></i> {if $num_gallery >0}{$num_gallery} {/if} <a href="gallery_listing.php?id={$var_user.id}">{l t='Photos'}</a></h4>

                            <br />

                            {if $var_get.id==''}
                                <h4><i class="fa fa-envelope"></i> <a href="./msg.php?f=inbox"><span style="color:red; font-weight:bold;">{$var_user.newmsgnum}</span> {l t='New Messages'}</a><br/></h4>
                                <h4><i class="fa fa-pencil-square-o"></i> <a href="edit.php">{l t='Edit Profile'}</a></h4>
                            {else}
                                <h4><i class="fa fa-envelope"></i> <a href="./msg.php?f=new&id={$var_user.id}">{l t='Write a Message'}</a></h4>
                                {if !$var_user.isfriend}
                                    <h4><i class="fa fa-male"></i> <a href="func.php?f=addfriend&id={$var_user.id}">{l t='Add as Friend'}</a></h4>
                                {/if}
                            {/if}
                            {if $var_me.id!=$var_user.id}
                                {if !$var_user.iscool}
                                    <h4><i class="fa fa-thumbs-up"></i> <a href=func.php?f=coolperson&id={$var_user.id}>{l t='Give Cool Person Compliment'}</a></h4>
                                {/if}
                                {if !$var_user.isfunny}
                                    <h4><i class="fa fa-smile-o"></i> <a href=func.php?f=funnyperson&id={$var_user.id}>{l t='Give Funny Person Compliment'}</a></h4>
                                {/if}
                            {/if}
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">{l t='Latest Comment'}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div id="cmt" class="form-group"></div>
                            <div class="col-md-8 col-sm-12 col-xs-12">
                                <input class="form-control" type="text" name="comment" id="commenttext" value="{l t='Click to comment'}" onfocus="commentclick(this)" onblur="commentblur(this)">
                            </div>
                            <div class="clearfix form-group visible-sm visible-xs"></div>
                            <div class="col-md-4 col-sm-12 col-xs-4">
                                <input class="btn button-blue" type="button" id="commentbtn" value="{l t='Send'}" disabled="disabled" onclick="CommentSend()" />
                            </div>
                            <script type="text/javascript">CommentInit();</script>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h3>{l t='Compliments'}:</h3>
                            {l t='Cool person'} <span style="color:#FF8408">({$var_user.coolnum})</span><br />
                            {l t='Funny person'} <span style="color:#FF8408">({$var_user.funnynum})</span>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Location'}: </h3>
                            <h4>{$var_user.location}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='User Since'}:</h3>
                            <h4>{$var_user.regdate}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Tagline'}:</h3>
                            <h4>{$var_user.headline}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Where You Can Find Me'}:</h3>
                            <h4>{$var_user.find_me_in}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Hometown'}:</h3>
                            <h4>{$var_user.hometown}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Blog Or Website'}:</h3>
                            <h4>{$var_user.blog_url}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='When Not Golfing'}:</h3>
                            <h4>{$var_user.not_planet}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Why My Reviews Are Good'}:</h3>
                            <h4>{$var_user.review_comment}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Favorite Website'}:</h3>
                            <h4>{$var_user.fav_web}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Favorite Vacation Spot'}:</h3>
                            <h4>{$var_user.book}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='First Concert'}:</h3>
                            <h4>{$var_user.concert}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Favorite Movie'}:</h3>
                            <h4>{$var_user.movie}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='I Wish I Could'}:</h3>
                            <h4>{$var_user.meal}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Favorite Course'}:</h3>
                            <h4>{$var_user.do_not_tell}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Favorite Food'}:</h3>
                            <h4>{$var_user.discovery}</h4>
                        </li>
                        <li class="list-group-item">
                            <h3>{l t='Favorite Golfer'}:</h3>
                            <h4>{$var_user.current_crash}</h4>
                        </li>
                    </ul>
                </div>
                {if $var_me.id==$var_user.id}
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3><a href="edit.php">{l t='Update My Profile'}...</a></h3>
                        </div>
                    </div>
                {/if}
            </div>
            <div class="{if $is=='home'}col-md-6 col-sm-6{else}col-md-9 col-sm-9{/if} col-xs-12">
                <div class="">
                    <div class="pull-left">
                        <h1 style="color:#000000">{if $var_me.id==$var_user.id}{l t='My'} {/if}{if $is=='home'}{l t='Recent Reviews'}{else}{$var_page.disp}{/if}</h1>
                    </div>
                    <div class="pull-right {if $is!='home'&&$is!='review'}hidden{/if}">
                        <form action="javascript:nav()" method="post" id="form1" name="form1">
                            <div class="form-group">
                                <div class="input-group">
                                    <input name="searchtext" id="searchtext" class="form-control" value="{$var_search.searchtext}" />
                                    <span class="input-group-btn"><button class="btn btn-primary" type="submit">&nbsp;<i class="fa fa-search"></i>&nbsp;</button></span>
                                </div>
                            </div>
                            <input type="hidden" name="f" id="f" value="{$var_page.title}" />
                            <input name="page" type="hidden" id="page" value="{$var_search.page}" />
                            <input name="id" type="hidden" id="id" value="{$var_get.id}" />
                            <input name="order" type="hidden" id="order" value="{$var_search.order}" />
                            {*<input type="image" name="imageField" id="imageField" src="../theme/{$get_theme}/images/search_icon.gif" />*}
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="">
                    {if $is=='review'||$is=='home'}
                        <div class="form-group">
                            <span>{l t='Sort by'}: </span>
                            <div class="btn-group btn-group-sm">
                                <button id="itemid" class="btn btn-default {if $var_search.order!='rating'}active{/if}" onclick="sele_item(this,'time')">{l t='Time'}</button>
                                <button id="itemid" class="btn btn-default {if $var_search.order=='rating'}active{/if}" onclick="sele_item(this,'rating')">{l t='Rating'}</button>
                            </div>
                            <button id="itemid" class="btn btn-default Sitem" onclick="sele_item(this,'vote')" style="display:none;">{l t='Vote'}</button>
                            <input name="sortby" type="hidden" id="sortby" value="time" />
                        </div>
                    {/if}

                    {if $is=='list'}
                        <div class="pull-right"><a class="btn btn-info" style="color: #fff" href="list/new.php">{l t='Create List'}</a></div>
                    {/if}
                </div>
                <div class="clearfix"></div>
                <br/>
                {if $is=='list'}
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_listlist item=i}
                            <li class="list-group-item">
                                <div>
                                    <div class="pull-left">
                                        <h3><a href="list/detail.php?id={$i.id}">{$i.name}</a> &nbsp; &nbsp; <em>{$i.itemnum} {l t='items'}</em></h3>
                                    </div>
                                    <div class="pull-right">
                                        <h5>{l t='Established'}: {$i.date}</h5>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div>
                                    {$i.desc}<br /><br />
                                    [ <a href="list/detail.php?id={$i.id}">{l t='See Full List'}</a> ]  [ <a href="list/select.php?id={$i.id}">{l t='Edit This List'}</a> ]  [ <a href="list/del.php?id={$i.id}">{l t='Delete This List'}</a> ]
                                </div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                    <!--/loop-->
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_listlists.limitfrom} {l t='to'} {$var_listlists.limitto} / {$var_listlists.itemsnum} {l t='items'}.</div>
                        {if !$var_listlists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_listlists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- list end -- friend start -------*}

                {if $is=='friend'}
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_friendlist item=i}
                            <li class="list-group-item" >
                                <div>
                                    <div class="photoBox"><img src="../images/photos/{$i.picurl}_40x40"  width="40" height="40"/></div>
                                    <div class="pull-left"><h3><a href="./?id={$i.id}">{$i.name}</a> {if $i.pending==1}&nbsp;&nbsp;({l t='Pending'}){/if}</h3>{l t='City'}: {$i.location}<br />
                                        [ <a href="./?id={$i.id}">{l t='See Detail'}</a> ] [ <a href="./msg.php?f=new&id={$i.id}">{l t='Send Message'}</a> ] [ <a href="./func.php?f=delfriend&id={$i.id}">{l t='Delete'}</a> ] [ <a href="./func.php?f=addfav&id={$i.id}">{l t='Add to Favorite'}</a> ]
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_friendlists.limitfrom} {l t='to'} {$var_friendlists.limitto} / {$var_friendlists.itemsnum} {l t='items'}.</div>
                        {if !$var_friendlists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_friendlists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- friend end -- event start -------*}

                {if $is=='event'}
                    {$var_eventlists.selector}
                    {if $var_eventlists.a=='event_in'}
                        <ul class="list-group">
                            <!--loop-->
                            {foreach from=$var_eventlist item=i}
                                <li class="list-group-item" >
                                    <div>
                                        <div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div>
                                        <div class="pull-left"><h3><a href="../event/detail.php?id={$i.id}" target="_blank">{$i.name} </a></h3>{$i.date}<br /><h5>[<a href="func.php?f=delin&id={$i.id}">{l t='Delete'}</a>]</h5></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            {/foreach}
                            <!--/loop-->
                        </ul>
                    {/if}

                    {if $var_eventlists.a=='event_cool'}
                        <ul class="list-group">
                            <!--loop-->
                            {foreach from=$var_eventlist item=i}
                                <li class="list-group-item" >
                                    <div>
                                        <div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div>
                                        <div class="pull-left"><h3><a href="../event/detail.php?id={$i.id}" target="_blank">{$i.name} </a></h3>{$i.date}<br /><h5>[<a href="func.php?f=delcool&id={$i.id}">{l t='Delete'}</a>]</h5></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            {/foreach}
                            <!--/loop-->
                        </ul>
                    {/if}

                    {if $var_eventlists.a!='event_cool' && $var_eventlists.a!='event_in'}
                        <ul class="list-group">
                            <!--loop-->
                            {foreach from=$var_eventlist item=i}
                                <li class="list-group-item" >
                                    <div>
                                        <div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div>
                                        <div class="pull-left"><h3><a href="../event/detail.php?id={$i.id}" target="_blank">{$i.name} </a></h3>{$i.datebrief}</div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            {/foreach}
                            <!--/loop-->
                        </ul>
                    {/if}
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_eventlists.limitfrom} {l t='to'} {$var_eventlists.limitto} / {$var_eventlists.itemsnum} {l t='items'}.</div>
                        {if !$var_eventlists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_eventlists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- event end -- compliment start -------*}

                {if $is=='compliment'}
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_complimentlist item=i}
                            <li class="list-group-item" >
                                <div>
                                    <div class="pull-left"><h3><a href="./?id={$i.id}" target="_blank">{$i.name}</a> {l t='gave me a'} {$i.type} {l t='compliment'}</h3></div>
                                    <div class="pull-right">
                                        <h4><img src="../theme/{$get_theme}/images/thanks_plain.gif" /></h4>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        {/foreach}
                    </ul>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_complimentlists.limitfrom} {l t='to'} {$var_complimentlists.limitto} / {$var_complimentlists.itemsnum} {l t='items'}.</div>
                        {if !$var_complimentlists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_complimentlists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- compliment end -- payment start -------*}

                {if $is=='payment'}
                    <!--loop-->
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr class="header">
                            <th align="center">{l t='ID'}</th>
                            <th align="center">{l t='Business ID'}</th>
                            <th align="center">{l t='Description'}</th>
                            <th align="center">{l t='Amount'}</th>
                            <th align="center">{l t='Paid Date'}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach from=$var_paymentlist item=i}
                            <tr>
                                <td>{$i.txn_txn_id}</td>
                                <td>{$i.txn_business_id}</td>
                                <td>{$i.txn_description}</td>
                                <td>{l t='$'}{$i.txn_amount_paid}</td>
                                <td>{$i.txn_date}</td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                    <!--/loop-->
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_paymentlists.limitfrom} {l t='to'} {$var_paymentlists.limitto} / {$var_paymentlists.itemsnum} {l t='items'}.</div>
                        {if !$var_paymentlists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_paymentlists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- payemnt end -- bookmark start -------*}

                {if $is=='bookmark'}
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_bookmarklist item=i}
                            <li class="list-group-item" >
                                <div>
                                    <div class="pull-left"><h2><a href="../{$smarty.const._BIZ_DIR_}/detail.php?id={$i.id}" target="_blank">{$i.name}</a></h2></div>
                                    <div class="pull-right">
                                        <h5><em>{l t='Business Rating'}:</em> <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span> &nbsp; <img src="../theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" /></h5>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div>
                                    <h5>{l t='Category'}: {$i.catname} / {$i.subcatname}</h5>
                                    <h5>{l t='City'}: {$i.location}</h5>
                                </div>
                                <div class="clearfix"></div>
                                <div>
                                    <i class="fa fa-envelope"></i>
                                    <a href="../{$smarty.const._BIZ_DIR_}/detail.php?id={$i.id}" target="_blank">{l t='See business detail'}</a> &nbsp;
                                    <i class="fa fa-times"></i> <a href="./func.php?f=delbookmark&id={$i.id}">{l t='Remove'}</a>
                                </div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_bookmarklists.limitfrom} {l t='to'} {$var_bookmarklists.limitto} / {$var_bookmarklists.itemsnum} {l t='items'}.</div>
                        {if !$var_bookmarklists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_bookmarklists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- bookmark end -- favorite start -------*}

                {if $is=='favorite'}
                    <ul class="list-group">
                        <!--loop-->
                        {foreach from=$var_favoritelist item=i}
                            <li class="list-group-item" >
                                <div>
                                    <div class="photoBox"><img src="../images/photos/{$i.picurl}_40x40" width="40" height="40" /></div>
                                    <div class="pull-left">
                                        <h3><a href="./?id={$i.id}">{$i.name}</a></h3>
                                        {l t='City'}: {$i.location}<br />
                                        [ <a href="./?id={$i.id}">{l t='See Detail'}</a> ] [ <a href="./msg.php?f=new&id={$i.id}">{l t='Send Message'}</a> ] [ <a href="./func.php?f=delfav&id={$i.id}">{l t='Delete'}</a> ]
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                        {/foreach}
                        <!--/loop-->
                    </ul>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_favoritelists.limitfrom} {l t='to'} {$var_favoritelists.limitto} / {$var_favoritelists.itemsnum} {l t='items'}.</div>
                        {if !$var_favoritelists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_favoritelists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* -------- favorite end -- homepage/review start -------*}

                {if $is=='home' || $is=='' || $is=='review'}
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <!-- List group -->
                        <ul class="list-group">
                            <!--loop-->
                            {foreach from=$var_reviewlist item=i}
                                <li class="list-group-item" >
                                    <div>
                                        <div class="pull-left"><h2><a href="../{$smarty.const._BIZ_DIR_}/detail.php?id={$i.id}" target="_blank">{$i.name}</a></h2></div>
                                        <div class="clearfix"></div>
                                        <div class="row">
                                            <h5>
                                                <span class="col-md-6 col-sm-6 col-xs-12">
                                                    <em>{l t='Business Rating'}:</em>
                                                    <span style="color:red; font-size:14px; font-weight:bold;">{$i.rating}</span>
                                                    &nbsp; <img src="../theme/{$get_theme}/images/star/stars_{$i.ratingmod}.gif" width="74" height="15" />
                                                </span>
                                                <span class="col-md-6 col-sm-6 col-xs-12 text-right profile-rating">
                                                    <em>{l t='Your Rating'}:</em>
                                                    <span style="color:red; font-size:14px; font-weight:bold;">{$i.myrating}</span>
                                                    &nbsp; <img src="../theme/{$get_theme}/images/star/stars_{$i.myratingmod}.gif" width="74" height="15" />
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div>
                                        <div class="pull-left" style="color:#600">
                                            <h5>{l t='Category'}: {$i.catname} / {$i.subcatname}</h5></div>
                                        <div class="pull-right" style="color:#600"><h5>{$i.date}</h5></div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <p></p>
                                    <p>
                                        {$i.desc}
                                    </p>
                                    <div class="clearfix"></div>
                                </li>
                            {/foreach}
                            <!--/loop-->
                        </ul>
                    </div>
                    <!--/loop-->
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 page_number">{l t='Show'} {$var_reviewlists.limitfrom} {l t='to'} {$var_reviewlists.limitto} / {$var_reviewlists.itemsnum} {l t='items'}.</div>
                        {if !$var_reviewlists.found}
                            <div class="clearfix"></div>
                            <div class="col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="text-center">{l t='No result found'}.</div>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="col-sm-6 col-xs-12 text-right text-xs-right">{$var_reviewlists.pager}</div>
                        {/if}
                    </div>
                {/if}
                {* --------- homepage/review end -------*}
            </div>

            <!-- Right Side Start -->

            {if $is=='home'}
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Friends'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <!--loop-->
                                {foreach from=$var_friend item=i}
                                    <div>
                                        <div class="photoBox pull-left"><img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" /></div>
                                        <div class="pull-left">
                                            <a href="./?id={$i.id}">{$i.name}</a>
                                            {if $i.pending==1}
                                                &nbsp;&nbsp;({l t='Pending'})
                                            {elseif $i.pending==2 && $i.verifycode}
                                                &nbsp;&nbsp;[ <a href="/my/func.php?f=verifyfriend&code={$i.verifycode}".$code">Approve</a> ]
                                            {/if}
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                {/foreach}
                                <!--/loop-->
                                {if !$var_friends.found}
                                    <div>
                                        <img class="img-responsive" src="../theme/{$get_theme}/images/empty_network.gif" width="70" height="70" />
                                        <br />
                                        {l t='No Friend'}
                                    </div>
                                {else}
                                    {if $var_get.id==''}
                                        <div class="clearfix"></div>
                                        <div>
                                            <br>
                                            <a href="./?f=Friends&id={$var_get.id}">{l t='All Friends'}...</a>
                                        </div>
                                    {/if}
                                {/if}

                                {if $var_get.id==''}
                                    <div class="clearfix"></div>
                                    <h3 align="center">
                                        <br />
                                        <a href="membersearch.php">{l t='Add new friend'}</a>
                                    </h3>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Compliments'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <!--loop-->
                                {foreach from=$var_compliment item=i}
                                    <div>
                                        <div class="photoBox pull-left">
                                            <img src="../images/photos/{$i.picurl}_16x16" width="16" height="16" />
                                        </div>
                                        <div class="pull-left text-left">
                                            <a href="./?id={$i.id}" target="_blank">{$i.name}</a><br />
                                            {l t='gave %s compliment' r=$i.type}
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                {/foreach}
                                <!--/loop-->
                                {if !$var_compliments.found}
                                    <div>
                                        <img class="img-responsive" src="../theme/{$get_theme}/images/empty_thanks.gif" /><br />
                                        {l t='No Compliment'}
                                    </div>
                                {else}
                                    {if $var_get.id==''}
                                        <div class="clearfix"></div>
                                        <div>
                                            <br>
                                            <a href="./?f=Compliments&id={$var_get.id}">{l t='All Compliments'}...</a>
                                        </div>
                                    {/if}
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{l t='Lists'}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <!--loop-->
                                {foreach from=$var_sidelist item=i}
                                    <div class="pull-left text-left">
                                        <h3><a  href="list/detail.php?id={$i.id}">{$i.name}</a></h3>
                                        {$i.desc}
                                    </div>
                                    <div class="clearfix"></div>
                                {/foreach}
                                <!--/loop-->
                                {if !$var_sidelists.found}
                                    <div>
                                        <img class="img-responsive" src="../theme/{$get_theme}/images/empty_lists.gif" /><br />
                                        {l t='No List'}
                                    </div>
                                {else}
                                    {if $var_get.id==''}
                                        <div class="clearfix"></div>
                                        <div><a href="./?f=Lists&id={$var_get.id}">{l t='All Lists'}...</a></div>
                                    {/if}
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default hidden-xs">
                        <div class="panel-body">
                            <!-- START 160x600 .com Code -->
                            <div class="text-center">
                                {$ads->getAdCode(3)}
                            </div>
                            <!-- END Code -->
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>
<!--Main End-->
{include file="footer.tpl"}