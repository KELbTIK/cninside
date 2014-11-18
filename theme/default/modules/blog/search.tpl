{include file="header.tpl"}
<link type="text/css" rel="stylesheet" href="/theme/{$get_theme}/css/event_search.css" />
{literal}
<script type="text/javascript" language="javascript">
function openCat()
{
document.getElementById('sele_cat_text').style.display='none';
$('#sele_cat').slideDown();
}
</script>
<script type="text/javascript">
function set(field,Pvalue)
{
if(field=='cat')
{
	$('#cat').val(Pvalue);
}
if(field=='time')
{
	$('#time').val(Pvalue);
}
if(field=='fsort')
{
	$('#fsort').val(Pvalue);
}
$('#page').val(1);
nav();
}
///////////////////////////////
function get(nothing,page)
{
$('#page').val(page);
nav();
}

///////////////////////////////
function nav()
{
var searchtext=$('#searchtext').val();
var cat=$('#cat').val();
var fsort=$('#fsort').val();
var city=$('#city').val();
var page=$('#page').val();
var time=$('#time').val();
location='?searchtext='+searchtext+'&cat='+cat+'&city='+city+'&page='+page+'&time='+time+'&fsort='+fsort;
}

</script>

{/literal}


<div id="main">
  <div class="content" style=" float:left; width:97%; display:inline;">
    <div class="left">

<div  class="box blue">
        <span class="coner c1b"></span>
        <span class="coner c2b"></span>
        <span class="coner c3b"></span>
        <span class="coner c4b"></span>
      <h1>{l t='Events Search'}</h1>
        <form>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
              <tr>
                <td width="190">{l t='Keywords'}
                  <input type="hidden" name="cat" id="cat" value="{$var_search.catid}" />
                  <input name="page" type="hidden" id="page" value="{$var_search.page}" />
                  <input name="time" type="hidden" id="time" value="{$var_search.time}" />
                  <input name="fsort" type="hidden" id="fsort" value="{$var_search.fsort}" />
                  <input name="cat" type="hidden" id="cat" value="{$var_search.cat}" />
                  </td>
<td width="165">{l t='Near'}</td>
<td>{l t='Category'}</td>
</tr>
              <tr>
                <td><label>
                  <input size="25" name="searchtext" id="searchtext" value="{$var_search.searchtext}" />
                </label></td>
<td><select id="city" name="city">
<option value="0" selected="selected">{l t='ALL'}</option>
        {$get_getcitylist}
        </select></td>


<td width="308"><span id="sele_cat_text"><strong><span style="color:#900">{$var_search.catname}</span></strong> <a href="javascript:;" onclick="openCat()">{l t='Change'} &dArr;</a></span></td>
                                        <td width="97" align="center"><em>
                                          <input type="submit" onclick="nav()" value="{l t='Search'}" name="Submit" />
                                        </em></td>
</tr>
                                      <tr>
                                        <td height="20"><em>{l t='(e.g. Music Festival)'}</em></td>
                                        <td height="20" colspan="3">&nbsp;</td>
</tr>
                                    </tbody>
                                </table>
                                </form>
            <div  class="nb sele" id="sele_cat" style="background:#FFC; float:left; width:95%; border:1px solid #ccc; overflow:hidden; padding-top:5px; padding-left:5px; margin-left:10px;">
            <ul>
                            {l t='Category'}:<br />
   			  <li style="font-weight:bold; color:#600" onclick="this.className='SitemS';set('cat','0')" class="Sitem">{l t='ALL'}</li>
                         {$var_search.catlistli}
              </ul>
          </div></div>
          <script type="text/javascript" language="javascript">
		  document.getElementById('sele_cat').style.display='none';
		  </script>
            <div class="con nb" style="padding-bottom:0; border-bottom:0;">
                        <ul>
                        <span style="float:left; padding-top:3px;">{l t='Narrow by Time:'} </span>
                          <li style="border:0;" class="{if $var_search.time=='all'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','all')">{l t='ALL'}</li>
                          <li class="{if $var_search.time=='today'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','today')">{l t='Today'}</li>
                          <li class="{if $var_search.time=='tomorrow'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','tomorrow')">{l t='Tomorrow'}</li>
                          <li class="{if $var_search.time=='thisweekend'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','thisweekend')">{l t='This Weekend'}</li>
                          <li class="{if $var_search.time=='thisweek'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','thisweek')">{l t='This Week'}</li>
                          <li class="{if $var_search.time=='nextweek'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','nextweek')">{l t='Next Week'}</li>
                          <li class="{if $var_search.time=='thismonth'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('time','thismonth')">{l t='This Month'}</li></ul>
                        <ul id="clear">
                        	<span style="float:left; padding-top:3px;">{l t='Sort by:'}  </span>
                          <li style="border:0;"class="{if $var_search.fsort=='date'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','date')">{l t=' Date '}</li>
                          <li class="{if $var_search.fsort=='mostpopular'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','mostpopular')">{l t='Most Popular'}</li>
                          <li class="{if $var_search.fsort=='recentlyadded'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','recentlyadded')">{l t='Recently Added'}</li>
                          <li class="{if $var_search.fsort=='free'}SitemS{else}Sitem{/if}" onclick="this.className='SitemS';set('fsort','free')">{l t='Free'}</li>
                        </ul>

                  </div>
                       <div class="con" style="border:0; padding-top:0;">


<!--loop-->
 {foreach from=$var_list item=i}
      <div class="incon">
          <div style="padding-top:8px; float:left; width:21%;"><div class="photoBox" style=" overflow:hidden; width:84px; height:84px; text-align:center;"><span class="photoBox" style=" overflow:hidden; width:84px; height:84px; text-align:center;"><img src="../images/event/{$i.picurl}_80x80" /></span></div>
        </div>
          <div style="float:left; width:78%;">
            <h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>
            {$i.date}<br />{$i.catname}<br />{$i.where}<br />
             <h4>{$i.whatwhy}</h4>
              <div style="float:left;"><em>{$i.reviewnum} {l t='reviews'}</em></div><div style="float:right"><em>{l t='Submitted by:'}<a href="../my/?id={$i.userid}" target="_blank">{$i.username}</a></em></div>
        </div>
      </div>
{/foreach}
<!--/loop-->

{if $var_lists.found==''}
		 <br/><br/><br><br><center>{l t='No result found'}.</center><br><br><br>
	 	{else}
                <div style=" float:left; padding-top:20px; padding-left:20px;">{l t='Show'} {$var_lists.limitfrom} {l t='to'} {$var_lists.limitto} / {$var_lists.itemsnum} {l t='items'}.</div>
             {$var_lists.pager}
         {/if}


<div class="incon">
                        		<div style="float:left; padding-top:20px;"><a href="new.php" class="Bbtn">{l t='Add Event'}</a></div>
                        		<div style="float:right; padding-top:10px;">
            			</div>
                      </div>
                    </div>
                </div>
				<div class="right" >
                  <div class="con box" style="height:auto; padding-top:10px;text-align:center;">
                  <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                  <a href="new.php" class="Bbtn">{l t='Add Event'}</a>             </div>
                  <div class="con box">
                  <span class="coner c1"></span>
        <span class="coner c2"></span>
        <span class="coner c3"></span>
        <span class="coner c4"></span>
                  <h2>{l t='Recently Added Events'}</h2>
<!--loop-->
 {foreach from=$var_new item=i}
        <div id="clear"></div>
              <div class="item">
                      <div class="pic"><div class="photoBox"><img src="../images/event/{$i.picurl}_40x40" width="40" height="40" /></div></div>
                      <div class="t"><h3><a href="detail.php?id={$i.id}">{$i.name}</a></h3>Begin: {$i.date} <br />{$i.whatwhy}</div>
              </div>
{/foreach}
<!--/loop-->

                  </div>
                  <div class="con" style="text-align:center; border:0;">

                  <p align="center">
 	{$ads->getAdCode(9)}

</p>

                  </div>
                  <div id="clear"></div>
          </div>
        </div>
 </div>
 <!--Main End-->
 {include file="footer.tpl"}